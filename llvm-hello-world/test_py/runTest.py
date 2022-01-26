from operator import imod
import sys
import subprocess
import os
import pathlib
import glob
import re

# python3 runTest.py hello.cpp HelloWorld hello-legacy 

if __name__ == "__main__":
    src_fullpath = sys.argv[1]
    pass_subdir = sys.argv[2]
    pass_option = sys.argv[3]

    src_file_name, src_file_extension = os.path.splitext(src_fullpath)
    if src_file_extension == ".cpp":
        cxx = "clang++"
    elif src_file_extension == ".c":
        cxx = "clang"
    else:
        print("ERROR: file extension wrong.")
        exit(1)
    
    bc_fullpath = src_file_name + ".bc"
    if not os.path.isfile(bc_fullpath):
        print("Compiling...")
        # compile the source code to bytecode (check -S by clang --help, it only compile without linking????)
        #   https://github.com/banach-space/llvm-tutor#helloworld-your-first-pass
        subprocess.run([cxx, "-S", "-emit-llvm", src_fullpath, "-o", bc_fullpath])

    # load passes 
    pass_rootpath = pathlib.Path(__file__).parent.parent
    pass_dir_fullpath = str(pathlib.Path.joinpath(pass_rootpath, "build", pass_subdir))

    # 
    print("Use opt to run the pass....")
    pass_file = ""
    for file in os.listdir(pass_dir_fullpath):
        if re.match('.*\.dylib|.*\.so', file):
            pass_file = file
            break
    if len(pass_file) == 0:
        print("The pass does not exist....")
        exit(1)
    
    pass_fullpath = os.path.join(pass_dir_fullpath, pass_file)
    # print(pass_fullpath)

    # load the pass (use the legacy PM)
    #   https://github.com/banach-space/llvm-tutor/blob/main/test/hello.ll
    subprocess.run(["opt", "-enable-new-pm=0", "-load", pass_fullpath, "-"+pass_option, bc_fullpath, "-disable-output"])

    



