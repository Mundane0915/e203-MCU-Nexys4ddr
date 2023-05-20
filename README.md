# e203-MCU-Nexys4ddr
> Porting the Hummingbird e203 kernel to the nexys4DDR development board

+ Nexys4DDR_Master.xdc: 用于写Nexys4的约束模板文件
+ Nexys4-DDR_rm.pdf: Nexys4DDR的官方文档
+ Nexys4-DDR_sch.pdf: Nexys4DDR的电路原理图
+ nexys4_ddr: 板载文件，需拷入Vivado路径中
+ divclk.v: 分频器代码
+ e203_hbirdv2-master: 蜂鸟e203源码
+ e203_mcu.xdc: 管脚约束文件
+ system.v: 顶层设计文件
