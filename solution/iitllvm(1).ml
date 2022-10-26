(* MiniIITRAN to LLVM Compiler *)
(* IIT CS 443, Fall 2022 *)
(* Project 2 *)
(* SOLUTIONS *)

open IITRAN.Ast
module L = LLVM.Ast

exception CompileError of string * loc

let result_var = L.Local "result"
let itype = L.TInteger 64
let btype = L.TInteger 1

let compile_typ =
  function TInteger | TCharacter -> itype
           | TLogical -> btype

let ctr = ref 0
let new_temp () =
  ctr := !ctr + 1;
  L.Local ("temp" ^ (string_of_int !ctr))

let lctr = ref 0
let new_label () =
  lctr := !lctr + 1;
  "label" ^ (string_of_int !lctr)

let compile_var s = L.Var (L.Local s)

let move (dest: L.var) (typ: L.typ) (value: L.value) =
  L.ISet (dest, typ, value)
  
let rec compile_binop (dest: L.var) (b: bop) (e1: t_exp) (e2: t_exp) :
          L.inst list =
  match b with
  | BAnd ->
     let continue_lbl = new_label () in
     let short_lbl = new_label () in
     let join_lbl = new_label () in
     let is = compile_branch_exp e1 continue_lbl short_lbl in
     is @ [L.ILabel short_lbl; move dest btype (L.Const 0); L.IBr join_lbl]
     @ [L.ILabel continue_lbl] @ (compile_exp dest e2)
     @ [L.IBr join_lbl; L.ILabel join_lbl];
  | BOr ->
     let continue_lbl = new_label () in
     let short_lbl = new_label () in
     let join_lbl = new_label () in
     let is = compile_branch_exp e1 short_lbl continue_lbl in
     is @ [L.ILabel short_lbl; move dest btype (L.Const 1); L.IBr join_lbl]
     @ [L.ILabel continue_lbl] @ (compile_exp dest e2)
     @ [L.IBr join_lbl; L.ILabel join_lbl];
  | _ ->
  let dest1 = new_temp () in
  let dest2 = new_temp () in
  let is1 = compile_exp dest1 e1 in
  let is2 = compile_exp dest2 e2 in
  is1 @ is2 @
    (match b with
     | BAdd -> [L.IBinop (dest, L.BAdd, itype, L.Var dest1, L.Var dest2)]
     | BSub -> [L.IBinop (dest, L.BSub, itype, L.Var dest1, L.Var dest2)]
     | BMul -> [L.IBinop (dest, L.BMul, itype, L.Var dest1, L.Var dest2)]
     | BDiv -> [L.IBinop (dest, L.BDiv, itype, L.Var dest1, L.Var dest2)]
     | BAnd -> [L.IBinop (dest, L.BAnd, btype, L.Var dest1, L.Var dest2)]
     | BOr -> [L.IBinop (dest, L.BOr, btype, L.Var dest1, L.Var dest2)]
     | BGt -> [L.ICmp (dest, L.CSGt, itype, L.Var dest1, L.Var dest2)]
     | BGe -> [L.ICmp (dest, L.CSGe, itype, L.Var dest1, L.Var dest2)]
     | BLt -> [L.ICmp (dest, L.CSLt, itype, L.Var dest1, L.Var dest2)]
     | BLe -> [L.ICmp (dest, L.CSLe, itype, L.Var dest1, L.Var dest2)]
     | BNe -> [L.ICmp (dest, L.CNe, itype, L.Var dest1, L.Var dest2)]
     | BEq -> [L.ICmp (dest, L.CEq, itype, L.Var dest1, L.Var dest2)]
    )
and compile_unop (dest: L.var) (u: unop) (e: t_exp) : L.inst list =
  let dest1 = new_temp () in
  let is = compile_exp dest1 e in
  let ety = compile_typ e.einfo
  in
  is @
    (match u with
     | UNeg -> [L.IBinop (dest, L.BSub, itype, L.Const 0, L.Var dest1)]
     | UNot -> [L.IBinop (dest, L.BXor, btype, L.Const 1, L.Var dest1)]
     | UChar | UInt ->
        if ety = btype then
          [L.ICast (dest, L.CZext, btype, L.Var dest1, itype)]
        else [move dest itype (L.Var dest1)]
     | ULog -> [L.ICmp (dest, L.CSGt, ety, L.Var dest1, L.Const 0)]
    )
and compile_branch_exp (e: t_exp) tlabel flabel : L.inst list =
  let dest = new_temp () in
  let is = compile_exp dest e in
  is @ [L.ICondBr (L.Var dest, tlabel, flabel)]
and compile_exp (dest: L.var) (e: t_exp) : L.inst list =
  match e.edesc with
  | EConst (CChar c) -> [move dest itype (L.Const (Char.code c))]
  | EConst (CInt i) -> [move dest itype (L.Const i)]
  | EVar v -> [move dest (compile_typ e.einfo) (compile_var v)]
  | EBinop (b, e1, e2) -> compile_binop dest b e1 e2
  | EAssign ({edesc = EVar v}, e2) ->
     (compile_exp (L.Local v) e2) @
       [move dest (compile_typ e2.einfo) (compile_var v)]
  | EAssign _ -> raise (CompileError ("LHS of assign isn't a var", e.eloc))
  | EUnop (u, e) -> compile_unop dest u e
and compile_stmt (s: t_stmt) : L.inst list =
  match s.sdesc with
  | SDecl _ -> []
  | SDo ss -> List.concat (List.map compile_stmt ss)
  | SExp e -> compile_exp (new_temp ()) e
  | SIf (e, if_branch, maybe_else_branch) ->
     let iflabel = new_label () in
     let elselabel = new_label () in
     let outlabel = new_label () in
     let ifis = compile_stmt if_branch in
     let elseis = (match maybe_else_branch with
                   | Some s -> compile_stmt s
                   | None -> [])
     in
     (compile_branch_exp e iflabel elselabel)
     @ [L.ILabel iflabel]
     @ ifis
     @ [L.IBr outlabel; L.ILabel elselabel]
     @ elseis
     @ [L.IBr outlabel; L.ILabel outlabel]
  | SWhile (e, body) ->
     let testlabel = new_label () in
     let bodylabel = new_label () in
     let outlabel = new_label () in
     let bodyis = compile_stmt body in
     [L.IBr testlabel; L.ILabel testlabel]
     @ (compile_branch_exp e bodylabel outlabel)
     @ [L.ILabel bodylabel]
     @ bodyis
     @ [L.IBr testlabel; L.ILabel outlabel]
  | SStop -> [L.IRet (Some (itype, L.Var result_var))]

let compile_prog (p: t_stmt list) : L.prog =
  [L.make_func "main" itype []
     ((L.ILabel "main__entry")::
        (List.concat (List.map compile_stmt p))
      @ [L.IRet (Some (itype, L.Var result_var))]
  )]
