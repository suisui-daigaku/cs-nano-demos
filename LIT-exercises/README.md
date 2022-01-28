# LTI 测试
- LLVM 的测试工具
	- 需要 FileCheck 的支持
- 貌似大部分测试工具都是 Python ，毕竟性能不重要的话，那就是效率更重要。

#### 参考资料
[LLVM_02.pptx (gonnord.org)](http://laure.gonnord.org/pro/research/ER03_2015/TestsLLVM.pdf)
[Test_Infrastructure_Tutorial_Review (llvm.org)](https://llvm.org/devmtg/2019-10/slides/Homerding-Kruse-LLVMTestingInfrastructureTutorial.pdf)

**编程界第一个法则** 
> ***Don't Invent Wheel*** 

但是你可以看轮子的制造结构。

### Tools and Frameworks 
- Unit Tests 
	- Google Test 
- Regression Tests 
	- FileCheck 
	- **Lit** 
- Debug Info Tests 
- Whole Program Tests 
	- Google Benchmark 
- LNT 
- Build Bots 





