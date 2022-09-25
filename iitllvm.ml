(* MiniIITRAN to LLVM Compiler *)
(* IIT CS 443, Fall 2022 *)
(* Project 2 *)
(* My Dinh *)

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

exception Unimplemented

(* You should probably define some other functions here *)
exception RuntimeError of string * loc

let val_of_const = function
    | CChar c -> Char.code c
    | CInt n -> n
    | CLog true -> 1
    | CLog false -> 0

let map_iit_bop_to_llvm_bop = function
    | BAdd -> L.BAdd
    | BSub -> L.BSub
    | BMul -> L.BMul
    | BDiv -> L.BDiv
    | BAnd -> L.BAnd
    | BOr -> L.BOr
    | _ -> failwith "IITRAN binary operation cannot be converted to LLVM binary arithmetic operation"

let map_iit_bop_to_llvm_cmp = function
    | BGt -> L.CSGt
    | BGe -> L.CSGe
    | BLt -> L.CSLt
    | BLe -> L.CSLe
    | BNe -> L.CNe
    | BEq -> L.CEq
    | _ -> failwith "IITRAN binary operation cannot be converted to LLVM binary comparison operation"

let rec compile_exp (dest: L.var) (e: t_exp) : L.inst list =
    let t = compile_typ e.einfo in
    match e.edesc with
    | EConst c -> [move dest t (Const (val_of_const c))]
    | EVar v -> [move dest t (compile_var v)]
    | EBinop (op, e1, e2) -> compile_binop dest op e1 e2
    | EUnop (op, e) -> compile_unop dest op e
    | EAssign ({edesc = EVar v}, e') -> (compile_exp (L.Local v) e') @ [move dest t (compile_var v)]
    | EAssign (_, _) -> raise (RuntimeError ("Left side of assignment is not a variable", e.eloc))

and compile_nested_exp (e: t_exp) : L.inst list * L.value =
    match e.edesc with
    | EVar v -> ([], compile_var v)
    | EConst c -> ([], L.Const (val_of_const c))
    | _ ->
            let d = new_temp () in
            let il = compile_exp d e in
            (il, L.Var d)

and compile_binop (dest: L.var) (b: bop) (e1: t_exp) (e2: t_exp) : L.inst list =
    let t = compile_typ e1.einfo in
    match b with
    | BAdd | BSub | BMul | BDiv ->
            let (il1, d1) = compile_nested_exp e1 in
            let (il2, d2) = compile_nested_exp e2 in
            il1 @ il2 @ [L.IBinop (dest, map_iit_bop_to_llvm_bop b, t, d1, d2)]
    | BGt | BGe | BLt | BLe | BNe | BEq ->
            let (il1, d1) = compile_nested_exp e1 in
            let (il2, d2) = compile_nested_exp e2 in
            il1 @ il2 @ [L.ICmp (dest, map_iit_bop_to_llvm_cmp b, t, d1, d2)]
    | BAnd ->
            let tdest = new_label () in
            let fdest = new_label () in
            let e1true = new_label () in
            let ldone = new_label () in
            (compile_branch_exp e1 e1true fdest)
            @ [L.ILabel e1true] @ (compile_branch_exp e2 tdest fdest)
            @ [L.ILabel tdest; move dest btype (L.Const 1)] @ [L.IBr ldone]
            @ [L.ILabel fdest; move dest btype (L.Const 0)] @ [L.IBr ldone]
            @ [L.ILabel ldone]
    | BOr ->
            let tdest = new_label () in
            let fdest = new_label () in
            let e1false = new_label () in
            let ldone = new_label () in
            (compile_branch_exp e1 tdest e1false)
            @ [L.ILabel e1false] @ (compile_branch_exp e2 tdest fdest)
            @ [L.ILabel tdest; move dest btype (L.Const 1)] @ [L.IBr ldone]
            @ [L.ILabel fdest; move dest (compile_typ TLogical) (L.Const 0)] @ [L.IBr ldone]
            @ [L.ILabel ldone]

and compile_unop (dest: L.var)  (u: unop) (e: t_exp) : L.inst list =
    let t = compile_typ e.einfo in
    let (il, d) = compile_nested_exp e in
    let il' =
        (match u with
        | UNeg -> [L.IBinop (dest, L.BSub, t, L.Const 0, d)]
        | UNot -> [L.IBinop (dest, L.BXor, t, d, L.Const 1)]
        | UChar ->
                (match e.einfo with
                | TCharacter -> []
                | TInteger -> [L.ICast (dest, L.CBitcast, t, d, itype)]
                | TLogical -> [L.ICast (dest, L.CZext, t, d, itype)])
        | UInt ->
                (match e.einfo with
                | TInteger -> []
                | TCharacter -> [L.ICast (dest, L.CBitcast, t, d, itype)]
                | TLogical -> [L.ICast (dest, L.CZext, t, d, itype)])
        | ULog ->
                (match e.einfo with
                | TLogical -> []
                | TInteger | TCharacter -> [L.ICast (dest, L.CTrunc, t, d, btype)]))
    in il @ il'

and compile_branch_exp (e: t_exp) (tlabel: L.label) (flabel: L.label) : L.inst list =
    let (il, d) = compile_nested_exp e in
    il @ [L.ICondBr (d, tlabel, flabel)]


let rec compile_stmt (s: t_stmt) : L.inst list =
    match s.sdesc with
    | SDecl (t, vl) -> []
    | SDo sl -> List.fold_left (fun acc s -> acc @ (compile_stmt s)) [] sl
    | SExp e ->
            (match e.edesc with
            | EAssign ({edesc = EVar v}, e') -> (compile_exp (L.Local v) e')
            | EAssign (_, _) -> raise (RuntimeError ("Left side of assignment is not a variable", e.eloc))
            | _ -> compile_exp (new_temp ()) e)
    | SIf (e, s, None) ->
            let l1 = new_label () in
            let l2 = new_label () in
            (compile_branch_exp e l1 l2)
            @ [L.ILabel l1] @ compile_stmt s @ [L.IBr l2]
            @ [L.ILabel l2]
    | SIf (e, s1, Some s2) ->
            let l1 = new_label () in
            let l2 = new_label () in
            let l3 = new_label () in
            (compile_branch_exp e l1 l2)
            @ [L.ILabel l1] @ compile_stmt s1 @ [L.IBr l3]
            @ [L.ILabel l2] @ compile_stmt s2 @ [L.IBr l3]
            @ [L.ILabel l3]
    | SWhile (e, s) ->
            let ltest = new_label () in
            let lbody = new_label () in
            let ldone = new_label () in
            [L.IBr ltest] @ [L.ILabel ltest] @ (compile_branch_exp e lbody ldone)
            @ [L.ILabel lbody] @ (compile_stmt s) @ [L.IBr ltest]
            @ [L.ILabel ldone]
    | SStop -> [L.IRet (Some (itype, L.Var result_var))]

let compile_prog (p: t_stmt list) : L.prog =
  [L.make_func "main" itype []
     ((L.ILabel "main__entry")::
        (List.concat (List.map compile_stmt p))
      @ [L.IRet (Some (itype, L.Var result_var))]
  )]
