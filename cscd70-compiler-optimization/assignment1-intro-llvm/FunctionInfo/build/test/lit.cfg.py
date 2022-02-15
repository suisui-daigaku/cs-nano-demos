# *lit* is the LLVM integrated tester. Please visit
# 
#     https://llvm.org/docs/CommandGuide/lit.html
# 
# for its documentation.
import lit
import lit.llvm

lit.llvm.initialize(lit_config, config)

from lit.llvm import llvm_config

# Using LLVM LIT Out-Of-Tree
# https://medium.com/@mshockwave/using-llvm-lit-out-of-tree-5cddada85a78
config.name = 'FunctionInfo'
config.test_format = lit.formats.ShTest()
                     # The ShTest files contain some number of shell-like
                     # command pipelines, along with assertions about what
                     # should be in the output.
config.test_source_root = "/Users/haohua/Documents/GitHub/cs-nano-projects/cscd70-compiler-optimization/assignment1-intro-llvm/FunctionInfo/test"
config.test_exec_root   = "/Users/haohua/Documents/GitHub/cs-nano-projects/cscd70-compiler-optimization/assignment1-intro-llvm/FunctionInfo/test"
config.suffixes = ['.c', '.ll']
config.substitutions.append((r'%dylibdir', "/Users/haohua/Documents/GitHub/cs-nano-projects/cscd70-compiler-optimization/assignment1-intro-llvm/FunctionInfo/lib"))

# Extra config attribute for tool substitutions.
# FileCheck is not in the default executable path, therefore we need to add it manually.
config.llvm_config_bindir =  "/usr/local/bin/"
config.llvm_tools_dir = "/usr/local/bin/"
llvm_config.add_tool_substitutions(
        ["clang", "opt", "FileCheck"],
        config.llvm_config_bindir)
