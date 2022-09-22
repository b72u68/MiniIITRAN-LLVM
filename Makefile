IIT_FILES=iitran/iit_ast.ml iitran/iit_parser.mli iitran/iit_lexer.ml iitran/iit_parser.ml iitran/iit_print.mli iitran/iit_print.ml iitran/iit_typecheck.ml iitran/IITRAN.ml

LLVM_FILES=llvm/llvm_ast.ml llvm/llvm_print.mli llvm/llvm_print.ml llvm/llvm_interp.mli llvm/llvm_interp.ml llvm/llvm_utils.ml llvm/llvm_bbcfg.ml llvm/llvm_typecheck.ml llvm/llvm_ssa.ml llvm/LLVM.ml

UTILS_FILES=utils/varmap.ml utils/graph.ml

OTHER_FILES=iitllvm.ml main.ml

INCLUDES=-I iitran/ -I llvm/ -I utils/

BINS=main runtest

all:
	ocamlopt -g -o main $(INCLUDES) $(UTILS_FILES) $(IIT_FILES) $(LLVM_FILES) $(OTHER_FILES)

test:
	@ocamlfind ocamlc -o runtest -linkpkg -package unix -package stdio runtest.ml
	@./runtest

clean:
	rm -f *~
	rm -f *.cmo
	rm -f *.cmi
	rm -f *.cmx
	rm -f *.o
	rm -f $(BINS)
	cd llvm && rm -f *~ *.cmo *.cmi *.cmx *.o
	cd iitran && rm -f *~ *.cmo *.cmi *.cmx *.o
	cd utils && rm -f *~ *.cmo *.cmi *.cmx *.o
	cd tests && rm -f *.ll
