# Rocketchip
## Interrupts
在rocketchip中加新的控制异常，似乎也不是难事，一个是异常的编号，一个是异常触发条件，这些都可以参考其他异常的处理逻辑来写，也包括异常代理。但目前我还没写过riscv-linux上的异常处理程序，没法做测试。

## Rocket之添加指令
[Adding custom instruction to RISCV ISA and running it on gem5 and spike](https://nitish2112.github.io/post/adding-instruction-riscv/)
### Rocket Chip
* 添加指令：`rocket-chip/src/main/scala/rocket/Instructions.scala`
```
object Instructions {
	...
	def QIHAO              = BitPat("b0000000??????????000?????1010111")
	...
}
```
* 译码信号：`rocket-chip/src/main/scala/rocket/IDecode.scala`
```
class IDecode() {
	table {
	    ...
	    QIHAO->       List(Y,N,N,N,N,N,Y,Y,A2_RS2, A1_RS1, IMM_X, DW_XPR,FN_SOR,   	N,M_X,        MT_X, N,N,N,N,N,N,Y,CSR.N,N,N,N,N),
	    ...
	}
}
```
* ALU：`rocket-chip/src/main/scala/rocket/ALU.scala`
```
object ALU {
	...
	def FN_SOR  = UInt(8)
	...
}

class ALU {
	...
    val out = Mux(io.fn === FN_SOR, ~(io.in1 ^ io.in2), Mux(io.fn === FN_ADD || io.fn === FN_SUB, io.adder_out, shift_logic))
	...
}
```