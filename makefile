languages = bash c cpp css go html javascript json lua markdown php python ruby rust
parsers = $(foreach language, $(languages), grammars/tree-sitter-$(language)/src/parser.c)

lib = tree-sitter/lib/src/lib.c
include = -I tree-sitter/lib/include -I tree-sitter/lib/src

all:
	cc $(lib) $(parsers) $(include) -fPIC -shared -o libtree-sitter-parsers.so

clean:
	rm -f libtree-sitter-parsers.so
