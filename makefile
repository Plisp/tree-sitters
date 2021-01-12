parsers = bash cpp css html javascript lua markdown php python ruby rust
noscanner = c go json

DIR = $(foreach parser, $(parsers), grammars/tree-sitter-$(parser)/src)
OBJ = $(foreach dir, $(DIR), $(dir)/parser.o $(dir)/scanner.o)
OBJ += $(foreach parser, $(noscanner), grammars/tree-sitter-$(parser)/src/parser.o)
OBJ += tree-sitter/lib/src/lib.o

LIB = libtree-sitter-parsers.so
CPPFLAGS = -fPIC -I tree-sitter/lib/src -I tree-sitter/lib/include

all: $(OBJ)
	$(CXX) $^ -shared -o $(LIB)

clean:
	rm -f $(OBJ) $(LIB)
