OPTIMIZER := Hello.so
OBJs := $(subst .cpp,.o,$(wildcard Hello/*.cpp))

LLVM_VERSION ?= 12
LLVM_VERSION_SUFFIX := -$(LLVM_VERSION)

CXXFLAGS := $(shell llvm-config --cxxflags) -fPIC

all: $(OPTIMIZER) 

$(OPTIMIZER): $(OBJs)
	$(CXX) -dylib -dynamiclib -undefined dynamic_lookup $^ -o $@

.PHONY: clean
clean:
	$(RM) $(OPTIMIZER) $(OBJs)
