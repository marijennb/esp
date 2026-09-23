
./socs/xilinx-vc707-xc7vx485t/soft-build/ibex/drivers/mmult_vivado/baremetal/mmult.exe:     file format elf32-littleriscv


Disassembly of section .text.init:

80000000 <_start>:
80000000:	4081                	li	ra,0
80000002:	4101                	li	sp,0
80000004:	4181                	li	gp,0
80000006:	4201                	li	tp,0
80000008:	4281                	li	t0,0
8000000a:	4301                	li	t1,0
8000000c:	4381                	li	t2,0
8000000e:	4401                	li	s0,0
80000010:	4481                	li	s1,0
80000012:	4501                	li	a0,0
80000014:	4581                	li	a1,0
80000016:	4601                	li	a2,0
80000018:	4681                	li	a3,0
8000001a:	4701                	li	a4,0
8000001c:	4781                	li	a5,0
8000001e:	4801                	li	a6,0
80000020:	4881                	li	a7,0
80000022:	4901                	li	s2,0
80000024:	4981                	li	s3,0
80000026:	4a01                	li	s4,0
80000028:	4a81                	li	s5,0
8000002a:	4b01                	li	s6,0
8000002c:	4b81                	li	s7,0
8000002e:	4c01                	li	s8,0
80000030:	4c81                	li	s9,0
80000032:	4d01                	li	s10,0
80000034:	4d81                	li	s11,0
80000036:	4e01                	li	t3,0
80000038:	4e81                	li	t4,0
8000003a:	4f01                	li	t5,0
8000003c:	4f81                	li	t6,0
8000003e:	62f9                	lui	t0,0x1e
80000040:	3002a073          	csrs	mstatus,t0
80000044:	4285                	li	t0,1
80000046:	02fe                	slli	t0,t0,0x1f
80000048:	0002c863          	bltz	t0,80000058 <_start+0x58>
8000004c:	4505                	li	a0,1
8000004e:	00001297          	auipc	t0,0x1
80000052:	faa2a923          	sw	a0,-78(t0) # 80001000 <tohost>
80000056:	bfdd                	j	8000004c <_start+0x4c>
80000058:	00000297          	auipc	t0,0x0
8000005c:	03828293          	addi	t0,t0,56 # 80000090 <trap_entry>
80000060:	30529073          	csrw	mtvec,t0
80000064:	00004197          	auipc	gp,0x4
80000068:	44018193          	addi	gp,gp,1088 # 800044a4 <__global_pointer$>
8000006c:	85b18213          	addi	tp,gp,-1957 # 80003cff <_end+0x3f>
80000070:	fc027213          	andi	tp,tp,-64
80000074:	f1402573          	csrr	a0,mhartid
80000078:	4585                	li	a1,1
8000007a:	00b57063          	bgeu	a0,a1,8000007a <_start+0x7a>
8000007e:	01151613          	slli	a2,a0,0x11
80000082:	9232                	add	tp,tp,a2
80000084:	00150113          	addi	sp,a0,1
80000088:	0146                	slli	sp,sp,0x11
8000008a:	9112                	add	sp,sp,tp
8000008c:	5920106f          	j	8000161e <_init>

80000090 <trap_entry>:
80000090:	716d                	addi	sp,sp,-272
80000092:	c206                	sw	ra,4(sp)
80000094:	c40a                	sw	sp,8(sp)
80000096:	c60e                	sw	gp,12(sp)
80000098:	c812                	sw	tp,16(sp)
8000009a:	ca16                	sw	t0,20(sp)
8000009c:	cc1a                	sw	t1,24(sp)
8000009e:	ce1e                	sw	t2,28(sp)
800000a0:	d022                	sw	s0,32(sp)
800000a2:	d226                	sw	s1,36(sp)
800000a4:	d42a                	sw	a0,40(sp)
800000a6:	d62e                	sw	a1,44(sp)
800000a8:	d832                	sw	a2,48(sp)
800000aa:	da36                	sw	a3,52(sp)
800000ac:	dc3a                	sw	a4,56(sp)
800000ae:	de3e                	sw	a5,60(sp)
800000b0:	c0c2                	sw	a6,64(sp)
800000b2:	c2c6                	sw	a7,68(sp)
800000b4:	c4ca                	sw	s2,72(sp)
800000b6:	c6ce                	sw	s3,76(sp)
800000b8:	c8d2                	sw	s4,80(sp)
800000ba:	cad6                	sw	s5,84(sp)
800000bc:	ccda                	sw	s6,88(sp)
800000be:	cede                	sw	s7,92(sp)
800000c0:	d0e2                	sw	s8,96(sp)
800000c2:	d2e6                	sw	s9,100(sp)
800000c4:	d4ea                	sw	s10,104(sp)
800000c6:	d6ee                	sw	s11,108(sp)
800000c8:	d8f2                	sw	t3,112(sp)
800000ca:	daf6                	sw	t4,116(sp)
800000cc:	dcfa                	sw	t5,120(sp)
800000ce:	defe                	sw	t6,124(sp)
800000d0:	34202573          	csrr	a0,mcause
800000d4:	341025f3          	csrr	a1,mepc
800000d8:	860a                	mv	a2,sp
800000da:	3c8010ef          	jal	ra,800014a2 <handle_trap>
800000de:	34151073          	csrw	mepc,a0
800000e2:	000022b7          	lui	t0,0x2
800000e6:	80028293          	addi	t0,t0,-2048 # 1800 <_tbss_end+0x17bc>
800000ea:	3002a073          	csrs	mstatus,t0
800000ee:	4092                	lw	ra,4(sp)
800000f0:	4122                	lw	sp,8(sp)
800000f2:	41b2                	lw	gp,12(sp)
800000f4:	4242                	lw	tp,16(sp)
800000f6:	42d2                	lw	t0,20(sp)
800000f8:	4362                	lw	t1,24(sp)
800000fa:	43f2                	lw	t2,28(sp)
800000fc:	5402                	lw	s0,32(sp)
800000fe:	5492                	lw	s1,36(sp)
80000100:	5522                	lw	a0,40(sp)
80000102:	55b2                	lw	a1,44(sp)
80000104:	5642                	lw	a2,48(sp)
80000106:	56d2                	lw	a3,52(sp)
80000108:	5762                	lw	a4,56(sp)
8000010a:	57f2                	lw	a5,60(sp)
8000010c:	4806                	lw	a6,64(sp)
8000010e:	4896                	lw	a7,68(sp)
80000110:	4926                	lw	s2,72(sp)
80000112:	49b6                	lw	s3,76(sp)
80000114:	4a46                	lw	s4,80(sp)
80000116:	4ad6                	lw	s5,84(sp)
80000118:	4b66                	lw	s6,88(sp)
8000011a:	4bf6                	lw	s7,92(sp)
8000011c:	5c06                	lw	s8,96(sp)
8000011e:	5c96                	lw	s9,100(sp)
80000120:	5d26                	lw	s10,104(sp)
80000122:	5db6                	lw	s11,108(sp)
80000124:	5e46                	lw	t3,112(sp)
80000126:	5ed6                	lw	t4,116(sp)
80000128:	5f66                	lw	t5,120(sp)
8000012a:	5ff6                	lw	t6,124(sp)
8000012c:	6151                	addi	sp,sp,272
8000012e:	30200073          	mret

Disassembly of section .text:

80001048 <vprintfmt>:
80001048:	714d                	addi	sp,sp,-336
8000104a:	13a12023          	sw	s10,288(sp)
8000104e:	40000d37          	lui	s10,0x40000
80001052:	fffd0793          	addi	a5,s10,-1 # 3fffffff <_tbss_end+0x3fffffbb>
80001056:	14812423          	sw	s0,328(sp)
8000105a:	14912223          	sw	s1,324(sp)
8000105e:	15212023          	sw	s2,320(sp)
80001062:	14112623          	sw	ra,332(sp)
80001066:	13312e23          	sw	s3,316(sp)
8000106a:	13412c23          	sw	s4,312(sp)
8000106e:	13512a23          	sw	s5,308(sp)
80001072:	13612823          	sw	s6,304(sp)
80001076:	13712623          	sw	s7,300(sp)
8000107a:	13812423          	sw	s8,296(sp)
8000107e:	13912223          	sw	s9,292(sp)
80001082:	11b12e23          	sw	s11,284(sp)
80001086:	892a                	mv	s2,a0
80001088:	84ae                	mv	s1,a1
8000108a:	8432                	mv	s0,a2
8000108c:	c436                	sw	a3,8(sp)
8000108e:	c63e                	sw	a5,12(sp)
80001090:	00044503          	lbu	a0,0(s0)
80001094:	02500793          	li	a5,37
80001098:	00f50e63          	beq	a0,a5,800010b4 <vprintfmt+0x6c>
8000109c:	c931                	beqz	a0,800010f0 <vprintfmt+0xa8>
8000109e:	02500993          	li	s3,37
800010a2:	a011                	j	800010a6 <vprintfmt+0x5e>
800010a4:	c531                	beqz	a0,800010f0 <vprintfmt+0xa8>
800010a6:	85a6                	mv	a1,s1
800010a8:	0405                	addi	s0,s0,1
800010aa:	9902                	jalr	s2
800010ac:	00044503          	lbu	a0,0(s0)
800010b0:	ff351ae3          	bne	a0,s3,800010a4 <vprintfmt+0x5c>
800010b4:	00144683          	lbu	a3,1(s0)
800010b8:	00140a93          	addi	s5,s0,1
800010bc:	8756                	mv	a4,s5
800010be:	02000b13          	li	s6,32
800010c2:	59fd                	li	s3,-1
800010c4:	5a7d                	li	s4,-1
800010c6:	4581                	li	a1,0
800010c8:	05500513          	li	a0,85
800010cc:	4825                	li	a6,9
800010ce:	fdd68793          	addi	a5,a3,-35
800010d2:	0ff7f793          	andi	a5,a5,255
800010d6:	00170413          	addi	s0,a4,1
800010da:	24f56863          	bltu	a0,a5,8000132a <vprintfmt+0x2e2>
800010de:	00003617          	auipc	a2,0x3
800010e2:	8fa60613          	addi	a2,a2,-1798 # 800039d8 <main+0xae6>
800010e6:	078a                	slli	a5,a5,0x2
800010e8:	97b2                	add	a5,a5,a2
800010ea:	439c                	lw	a5,0(a5)
800010ec:	97b2                	add	a5,a5,a2
800010ee:	8782                	jr	a5
800010f0:	14c12083          	lw	ra,332(sp)
800010f4:	14812403          	lw	s0,328(sp)
800010f8:	14412483          	lw	s1,324(sp)
800010fc:	14012903          	lw	s2,320(sp)
80001100:	13c12983          	lw	s3,316(sp)
80001104:	13812a03          	lw	s4,312(sp)
80001108:	13412a83          	lw	s5,308(sp)
8000110c:	13012b03          	lw	s6,304(sp)
80001110:	12c12b83          	lw	s7,300(sp)
80001114:	12812c03          	lw	s8,296(sp)
80001118:	12412c83          	lw	s9,292(sp)
8000111c:	12012d03          	lw	s10,288(sp)
80001120:	11c12d83          	lw	s11,284(sp)
80001124:	6171                	addi	sp,sp,336
80001126:	8082                	ret
80001128:	8b36                	mv	s6,a3
8000112a:	00174683          	lbu	a3,1(a4)
8000112e:	8722                	mv	a4,s0
80001130:	bf79                	j	800010ce <vprintfmt+0x86>
80001132:	4aa1                	li	s5,8
80001134:	c202                	sw	zero,4(sp)
80001136:	4785                	li	a5,1
80001138:	0ab7ce63          	blt	a5,a1,800011f4 <vprintfmt+0x1ac>
8000113c:	47a2                	lw	a5,8(sp)
8000113e:	00478693          	addi	a3,a5,4
80001142:	47a2                	lw	a5,8(sp)
80001144:	4d81                	li	s11,0
80001146:	0007ab83          	lw	s7,0(a5)
8000114a:	c436                	sw	a3,8(sp)
8000114c:	8656                	mv	a2,s5
8000114e:	4681                	li	a3,0
80001150:	855e                	mv	a0,s7
80001152:	85ee                	mv	a1,s11
80001154:	6e1000ef          	jal	ra,80002034 <__umoddi3>
80001158:	c82a                	sw	a0,16(sp)
8000115a:	4781                	li	a5,0
8000115c:	8d2a                	mv	s10,a0
8000115e:	21b78c63          	beq	a5,s11,80001376 <vprintfmt+0x32e>
80001162:	01410c13          	addi	s8,sp,20
80001166:	4985                	li	s3,1
80001168:	8656                	mv	a2,s5
8000116a:	4681                	li	a3,0
8000116c:	855e                	mv	a0,s7
8000116e:	85ee                	mv	a1,s11
80001170:	291000ef          	jal	ra,80001c00 <__udivdi3>
80001174:	8656                	mv	a2,s5
80001176:	4681                	li	a3,0
80001178:	8baa                	mv	s7,a0
8000117a:	8dae                	mv	s11,a1
8000117c:	6b9000ef          	jal	ra,80002034 <__umoddi3>
80001180:	4792                	lw	a5,4(sp)
80001182:	00ac2023          	sw	a0,0(s8)
80001186:	8d2a                	mv	s10,a0
80001188:	00198c93          	addi	s9,s3,1
8000118c:	0c11                	addi	s8,s8,4
8000118e:	01b78463          	beq	a5,s11,80001196 <vprintfmt+0x14e>
80001192:	89e6                	mv	s3,s9
80001194:	bfd1                	j	80001168 <vprintfmt+0x120>
80001196:	ff5bfee3          	bgeu	s7,s5,80001192 <vprintfmt+0x14a>
8000119a:	014cd863          	bge	s9,s4,800011aa <vprintfmt+0x162>
8000119e:	1a7d                	addi	s4,s4,-1
800011a0:	85a6                	mv	a1,s1
800011a2:	855a                	mv	a0,s6
800011a4:	9902                	jalr	s2
800011a6:	ff4ccce3          	blt	s9,s4,8000119e <vprintfmt+0x156>
800011aa:	47b2                	lw	a5,12(sp)
800011ac:	4a25                	li	s4,9
800011ae:	99be                	add	s3,s3,a5
800011b0:	098a                	slli	s3,s3,0x2
800011b2:	081c                	addi	a5,sp,16
800011b4:	99be                	add	s3,s3,a5
800011b6:	a021                	j	800011be <vprintfmt+0x176>
800011b8:	0009ad03          	lw	s10,0(s3)
800011bc:	19f1                	addi	s3,s3,-4
800011be:	05700513          	li	a0,87
800011c2:	01aa6463          	bltu	s4,s10,800011ca <vprintfmt+0x182>
800011c6:	03000513          	li	a0,48
800011ca:	85a6                	mv	a1,s1
800011cc:	956a                	add	a0,a0,s10
800011ce:	9902                	jalr	s2
800011d0:	007c                	addi	a5,sp,12
800011d2:	ff3793e3          	bne	a5,s3,800011b8 <vprintfmt+0x170>
800011d6:	bd6d                	j	80001090 <vprintfmt+0x48>
800011d8:	fffa4793          	not	a5,s4
800011dc:	87fd                	srai	a5,a5,0x1f
800011de:	00174683          	lbu	a3,1(a4)
800011e2:	00fa7a33          	and	s4,s4,a5
800011e6:	8722                	mv	a4,s0
800011e8:	b5dd                	j	800010ce <vprintfmt+0x86>
800011ea:	c202                	sw	zero,4(sp)
800011ec:	4785                	li	a5,1
800011ee:	4ac1                	li	s5,16
800011f0:	f4b7d6e3          	bge	a5,a1,8000113c <vprintfmt+0xf4>
800011f4:	47a2                	lw	a5,8(sp)
800011f6:	079d                	addi	a5,a5,7
800011f8:	9be1                	andi	a5,a5,-8
800011fa:	00878713          	addi	a4,a5,8
800011fe:	c43a                	sw	a4,8(sp)
80001200:	0007ab83          	lw	s7,0(a5)
80001204:	0047ad83          	lw	s11,4(a5)
80001208:	b791                	j	8000114c <vprintfmt+0x104>
8000120a:	00174603          	lbu	a2,1(a4)
8000120e:	fd068993          	addi	s3,a3,-48
80001212:	8722                	mv	a4,s0
80001214:	fd060793          	addi	a5,a2,-48
80001218:	86b2                	mv	a3,a2
8000121a:	02f86163          	bltu	a6,a5,8000123c <vprintfmt+0x1f4>
8000121e:	00299793          	slli	a5,s3,0x2
80001222:	99be                	add	s3,s3,a5
80001224:	0705                	addi	a4,a4,1
80001226:	0986                	slli	s3,s3,0x1
80001228:	99b2                	add	s3,s3,a2
8000122a:	00074603          	lbu	a2,0(a4)
8000122e:	fd098993          	addi	s3,s3,-48
80001232:	fd060793          	addi	a5,a2,-48
80001236:	86b2                	mv	a3,a2
80001238:	fef873e3          	bgeu	a6,a5,8000121e <vprintfmt+0x1d6>
8000123c:	e80a59e3          	bgez	s4,800010ce <vprintfmt+0x86>
80001240:	8a4e                	mv	s4,s3
80001242:	59fd                	li	s3,-1
80001244:	b569                	j	800010ce <vprintfmt+0x86>
80001246:	47a2                	lw	a5,8(sp)
80001248:	85a6                	mv	a1,s1
8000124a:	4388                	lw	a0,0(a5)
8000124c:	00478c93          	addi	s9,a5,4
80001250:	9902                	jalr	s2
80001252:	c466                	sw	s9,8(sp)
80001254:	bd35                	j	80001090 <vprintfmt+0x48>
80001256:	47a2                	lw	a5,8(sp)
80001258:	0007aa83          	lw	s5,0(a5)
8000125c:	00478c93          	addi	s9,a5,4
80001260:	140a8063          	beqz	s5,800013a0 <vprintfmt+0x358>
80001264:	11405463          	blez	s4,8000136c <vprintfmt+0x324>
80001268:	02d00793          	li	a5,45
8000126c:	0cfb1963          	bne	s6,a5,8000133e <vprintfmt+0x2f6>
80001270:	000ac503          	lbu	a0,0(s5)
80001274:	c105                	beqz	a0,80001294 <vprintfmt+0x24c>
80001276:	5b7d                	li	s6,-1
80001278:	0009c563          	bltz	s3,80001282 <vprintfmt+0x23a>
8000127c:	19fd                	addi	s3,s3,-1
8000127e:	01698963          	beq	s3,s6,80001290 <vprintfmt+0x248>
80001282:	85a6                	mv	a1,s1
80001284:	0a85                	addi	s5,s5,1
80001286:	9902                	jalr	s2
80001288:	000ac503          	lbu	a0,0(s5)
8000128c:	1a7d                	addi	s4,s4,-1
8000128e:	f56d                	bnez	a0,80001278 <vprintfmt+0x230>
80001290:	01405963          	blez	s4,800012a2 <vprintfmt+0x25a>
80001294:	1a7d                	addi	s4,s4,-1
80001296:	85a6                	mv	a1,s1
80001298:	02000513          	li	a0,32
8000129c:	9902                	jalr	s2
8000129e:	fe0a1be3          	bnez	s4,80001294 <vprintfmt+0x24c>
800012a2:	c466                	sw	s9,8(sp)
800012a4:	b3f5                	j	80001090 <vprintfmt+0x48>
800012a6:	4aa9                	li	s5,10
800012a8:	c202                	sw	zero,4(sp)
800012aa:	b571                	j	80001136 <vprintfmt+0xee>
800012ac:	85a6                	mv	a1,s1
800012ae:	02500513          	li	a0,37
800012b2:	9902                	jalr	s2
800012b4:	bbf1                	j	80001090 <vprintfmt+0x48>
800012b6:	47a2                	lw	a5,8(sp)
800012b8:	00174683          	lbu	a3,1(a4)
800012bc:	8722                	mv	a4,s0
800012be:	0007a983          	lw	s3,0(a5)
800012c2:	0791                	addi	a5,a5,4
800012c4:	c43e                	sw	a5,8(sp)
800012c6:	bf9d                	j	8000123c <vprintfmt+0x1f4>
800012c8:	00174683          	lbu	a3,1(a4)
800012cc:	0585                	addi	a1,a1,1
800012ce:	8722                	mv	a4,s0
800012d0:	bbfd                	j	800010ce <vprintfmt+0x86>
800012d2:	4785                	li	a5,1
800012d4:	0ab7c963          	blt	a5,a1,80001386 <vprintfmt+0x33e>
800012d8:	4722                	lw	a4,8(sp)
800012da:	00470793          	addi	a5,a4,4
800012de:	cddd                	beqz	a1,8000139c <vprintfmt+0x354>
800012e0:	00072b83          	lw	s7,0(a4)
800012e4:	c43e                	sw	a5,8(sp)
800012e6:	41fbdd93          	srai	s11,s7,0x1f
800012ea:	000ddf63          	bgez	s11,80001308 <vprintfmt+0x2c0>
800012ee:	85a6                	mv	a1,s1
800012f0:	02d00513          	li	a0,45
800012f4:	9902                	jalr	s2
800012f6:	41700733          	neg	a4,s7
800012fa:	00e036b3          	snez	a3,a4
800012fe:	41b007b3          	neg	a5,s11
80001302:	8bba                	mv	s7,a4
80001304:	40d78db3          	sub	s11,a5,a3
80001308:	4aa9                	li	s5,10
8000130a:	c202                	sw	zero,4(sp)
8000130c:	b581                	j	8000114c <vprintfmt+0x104>
8000130e:	03000513          	li	a0,48
80001312:	85a6                	mv	a1,s1
80001314:	9902                	jalr	s2
80001316:	85a6                	mv	a1,s1
80001318:	07800513          	li	a0,120
8000131c:	9902                	jalr	s2
8000131e:	47a2                	lw	a5,8(sp)
80001320:	4ac1                	li	s5,16
80001322:	c202                	sw	zero,4(sp)
80001324:	00478693          	addi	a3,a5,4
80001328:	bd29                	j	80001142 <vprintfmt+0xfa>
8000132a:	85a6                	mv	a1,s1
8000132c:	02500513          	li	a0,37
80001330:	9902                	jalr	s2
80001332:	8456                	mv	s0,s5
80001334:	bbb1                	j	80001090 <vprintfmt+0x48>
80001336:	00002a97          	auipc	s5,0x2
8000133a:	4e6a8a93          	addi	s5,s5,1254 # 8000381c <main+0x92a>
8000133e:	06098f63          	beqz	s3,800013bc <vprintfmt+0x374>
80001342:	000ac783          	lbu	a5,0(s5)
80001346:	cbbd                	beqz	a5,800013bc <vprintfmt+0x374>
80001348:	001a8793          	addi	a5,s5,1
8000134c:	013a8633          	add	a2,s5,s3
80001350:	a029                	j	8000135a <vprintfmt+0x312>
80001352:	0785                	addi	a5,a5,1
80001354:	fff7c703          	lbu	a4,-1(a5)
80001358:	cf3d                	beqz	a4,800013d6 <vprintfmt+0x38e>
8000135a:	86be                	mv	a3,a5
8000135c:	fef61be3          	bne	a2,a5,80001352 <vprintfmt+0x30a>
80001360:	415606b3          	sub	a3,a2,s5
80001364:	40da0a33          	sub	s4,s4,a3
80001368:	05404a63          	bgtz	s4,800013bc <vprintfmt+0x374>
8000136c:	000ac503          	lbu	a0,0(s5)
80001370:	d90d                	beqz	a0,800012a2 <vprintfmt+0x25a>
80001372:	5b7d                	li	s6,-1
80001374:	b711                	j	80001278 <vprintfmt+0x230>
80001376:	df5bf6e3          	bgeu	s7,s5,80001162 <vprintfmt+0x11a>
8000137a:	4785                	li	a5,1
8000137c:	4981                	li	s3,0
8000137e:	4c85                	li	s9,1
80001380:	e147cfe3          	blt	a5,s4,8000119e <vprintfmt+0x156>
80001384:	b51d                	j	800011aa <vprintfmt+0x162>
80001386:	47a2                	lw	a5,8(sp)
80001388:	079d                	addi	a5,a5,7
8000138a:	9be1                	andi	a5,a5,-8
8000138c:	00878713          	addi	a4,a5,8
80001390:	c43a                	sw	a4,8(sp)
80001392:	0007ab83          	lw	s7,0(a5)
80001396:	0047ad83          	lw	s11,4(a5)
8000139a:	bf81                	j	800012ea <vprintfmt+0x2a2>
8000139c:	4722                	lw	a4,8(sp)
8000139e:	b789                	j	800012e0 <vprintfmt+0x298>
800013a0:	01405663          	blez	s4,800013ac <vprintfmt+0x364>
800013a4:	02d00793          	li	a5,45
800013a8:	f8fb17e3          	bne	s6,a5,80001336 <vprintfmt+0x2ee>
800013ac:	00002a97          	auipc	s5,0x2
800013b0:	470a8a93          	addi	s5,s5,1136 # 8000381c <main+0x92a>
800013b4:	02800513          	li	a0,40
800013b8:	5b7d                	li	s6,-1
800013ba:	bd7d                	j	80001278 <vprintfmt+0x230>
800013bc:	1a7d                	addi	s4,s4,-1
800013be:	85a6                	mv	a1,s1
800013c0:	855a                	mv	a0,s6
800013c2:	9902                	jalr	s2
800013c4:	fa0a04e3          	beqz	s4,8000136c <vprintfmt+0x324>
800013c8:	1a7d                	addi	s4,s4,-1
800013ca:	85a6                	mv	a1,s1
800013cc:	855a                	mv	a0,s6
800013ce:	9902                	jalr	s2
800013d0:	fe0a16e3          	bnez	s4,800013bc <vprintfmt+0x374>
800013d4:	bf61                	j	8000136c <vprintfmt+0x324>
800013d6:	415686b3          	sub	a3,a3,s5
800013da:	b769                	j	80001364 <vprintfmt+0x31c>

800013dc <sprintf_putch.3107>:
800013dc:	419c                	lw	a5,0(a1)
800013de:	00a78023          	sb	a0,0(a5)
800013e2:	419c                	lw	a5,0(a1)
800013e4:	0785                	addi	a5,a5,1
800013e6:	c19c                	sw	a5,0(a1)
800013e8:	8082                	ret

800013ea <putchar>:
800013ea:	1141                	addi	sp,sp,-16
800013ec:	c422                	sw	s0,8(sp)
800013ee:	04022583          	lw	a1,64(tp) # 40 <buflen.2993>
800013f2:	00020793          	mv	a5,tp
800013f6:	c606                	sw	ra,12(sp)
800013f8:	97ae                	add	a5,a5,a1
800013fa:	00158693          	addi	a3,a1,1
800013fe:	00a78023          	sb	a0,0(a5)
80001402:	04d22023          	sw	a3,64(tp) # 40 <buflen.2993>
80001406:	47a9                	li	a5,10
80001408:	00f50b63          	beq	a0,a5,8000141e <putchar+0x34>
8000140c:	03f00793          	li	a5,63
80001410:	00f68763          	beq	a3,a5,8000141e <putchar+0x34>
80001414:	40b2                	lw	ra,12(sp)
80001416:	4422                	lw	s0,8(sp)
80001418:	4501                	li	a0,0
8000141a:	0141                	addi	sp,sp,16
8000141c:	8082                	ret
8000141e:	00020793          	mv	a5,tp
80001422:	96be                	add	a3,a3,a5
80001424:	00020513          	mv	a0,tp
80001428:	00068023          	sb	zero,0(a3)
8000142c:	4da010ef          	jal	ra,80002906 <print_uart>
80001430:	04022023          	sw	zero,64(tp) # 40 <buflen.2993>
80001434:	40b2                	lw	ra,12(sp)
80001436:	4422                	lw	s0,8(sp)
80001438:	4501                	li	a0,0
8000143a:	0141                	addi	sp,sp,16
8000143c:	8082                	ret

8000143e <setStats>:
8000143e:	b00027f3          	csrr	a5,mcycle
80001442:	00003717          	auipc	a4,0x3
80001446:	87270713          	addi	a4,a4,-1934 # 80003cb4 <counters>
8000144a:	e919                	bnez	a0,80001460 <setStats+0x22>
8000144c:	4314                	lw	a3,0(a4)
8000144e:	00002617          	auipc	a2,0x2
80001452:	3d660613          	addi	a2,a2,982 # 80003824 <main+0x932>
80001456:	00003597          	auipc	a1,0x3
8000145a:	84c5ab23          	sw	a2,-1962(a1) # 80003cac <counter_names>
8000145e:	8f95                	sub	a5,a5,a3
80001460:	00003697          	auipc	a3,0x3
80001464:	84f6aa23          	sw	a5,-1964(a3) # 80003cb4 <counters>
80001468:	b02027f3          	csrr	a5,minstret
8000146c:	e919                	bnez	a0,80001482 <setStats+0x44>
8000146e:	4358                	lw	a4,4(a4)
80001470:	00002697          	auipc	a3,0x2
80001474:	3bc68693          	addi	a3,a3,956 # 8000382c <main+0x93a>
80001478:	00003617          	auipc	a2,0x3
8000147c:	82d62c23          	sw	a3,-1992(a2) # 80003cb0 <counter_names+0x4>
80001480:	8f99                	sub	a5,a5,a4
80001482:	00003717          	auipc	a4,0x3
80001486:	82f72b23          	sw	a5,-1994(a4) # 80003cb8 <counters+0x4>
8000148a:	8082                	ret

8000148c <tohost_exit>:
8000148c:	0506                	slli	a0,a0,0x1
8000148e:	00000697          	auipc	a3,0x0
80001492:	b7268693          	addi	a3,a3,-1166 # 80001000 <tohost>
80001496:	00156713          	ori	a4,a0,1
8000149a:	4781                	li	a5,0
8000149c:	c298                	sw	a4,0(a3)
8000149e:	c2dc                	sw	a5,4(a3)
800014a0:	a001                	j	800014a0 <tohost_exit+0x14>

800014a2 <handle_trap>:
800014a2:	6605                	lui	a2,0x1
800014a4:	00000797          	auipc	a5,0x0
800014a8:	b5c78793          	addi	a5,a5,-1188 # 80001000 <tohost>
800014ac:	a7360613          	addi	a2,a2,-1421 # a73 <_tbss_end+0xa2f>
800014b0:	4681                	li	a3,0
800014b2:	c390                	sw	a2,0(a5)
800014b4:	c3d4                	sw	a3,4(a5)
800014b6:	a001                	j	800014b6 <handle_trap+0x14>

800014b8 <exit>:
800014b8:	1141                	addi	sp,sp,-16
800014ba:	c606                	sw	ra,12(sp)
800014bc:	3fc1                	jal	8000148c <tohost_exit>

800014be <abort>:
800014be:	00000797          	auipc	a5,0x0
800014c2:	b4278793          	addi	a5,a5,-1214 # 80001000 <tohost>
800014c6:	10d00613          	li	a2,269
800014ca:	4681                	li	a3,0
800014cc:	c390                	sw	a2,0(a5)
800014ce:	c3d4                	sw	a3,4(a5)
800014d0:	a001                	j	800014d0 <abort+0x12>

800014d2 <printstr>:
800014d2:	4340106f          	j	80002906 <print_uart>

800014d6 <thread_entry>:
800014d6:	c111                	beqz	a0,800014da <thread_entry+0x4>
800014d8:	a001                	j	800014d8 <thread_entry+0x2>
800014da:	8082                	ret

800014dc <printhex>:
800014dc:	7179                	addi	sp,sp,-48
800014de:	87aa                	mv	a5,a0
800014e0:	d606                	sw	ra,44(sp)
800014e2:	0068                	addi	a0,sp,12
800014e4:	01b10693          	addi	a3,sp,27
800014e8:	4325                	li	t1,9
800014ea:	a011                	j	800014ee <printhex+0x12>
800014ec:	86ba                	mv	a3,a4
800014ee:	00f7f613          	andi	a2,a5,15
800014f2:	01c59893          	slli	a7,a1,0x1c
800014f6:	8391                	srli	a5,a5,0x4
800014f8:	05700813          	li	a6,87
800014fc:	0ff67713          	andi	a4,a2,255
80001500:	00c36463          	bltu	t1,a2,80001508 <printhex+0x2c>
80001504:	03000813          	li	a6,48
80001508:	9742                	add	a4,a4,a6
8000150a:	00e68023          	sb	a4,0(a3)
8000150e:	00f8e7b3          	or	a5,a7,a5
80001512:	fff68713          	addi	a4,a3,-1
80001516:	8191                	srli	a1,a1,0x4
80001518:	fcd51ae3          	bne	a0,a3,800014ec <printhex+0x10>
8000151c:	00010e23          	sb	zero,28(sp)
80001520:	3e6010ef          	jal	ra,80002906 <print_uart>
80001524:	50b2                	lw	ra,44(sp)
80001526:	6145                	addi	sp,sp,48
80001528:	8082                	ret

8000152a <printf>:
8000152a:	7139                	addi	sp,sp,-64
8000152c:	02410313          	addi	t1,sp,36
80001530:	d22e                	sw	a1,36(sp)
80001532:	d432                	sw	a2,40(sp)
80001534:	d636                	sw	a3,44(sp)
80001536:	862a                	mv	a2,a0
80001538:	869a                	mv	a3,t1
8000153a:	00000517          	auipc	a0,0x0
8000153e:	eb050513          	addi	a0,a0,-336 # 800013ea <putchar>
80001542:	4581                	li	a1,0
80001544:	ce06                	sw	ra,28(sp)
80001546:	d83a                	sw	a4,48(sp)
80001548:	da3e                	sw	a5,52(sp)
8000154a:	dc42                	sw	a6,56(sp)
8000154c:	de46                	sw	a7,60(sp)
8000154e:	c61a                	sw	t1,12(sp)
80001550:	3ce5                	jal	80001048 <vprintfmt>
80001552:	40f2                	lw	ra,28(sp)
80001554:	4501                	li	a0,0
80001556:	6121                	addi	sp,sp,64
80001558:	8082                	ret

8000155a <sprintf>:
8000155a:	715d                	addi	sp,sp,-80
8000155c:	03810313          	addi	t1,sp,56
80001560:	d422                	sw	s0,40(sp)
80001562:	c62a                	sw	a0,12(sp)
80001564:	dc32                	sw	a2,56(sp)
80001566:	de36                	sw	a3,60(sp)
80001568:	842a                	mv	s0,a0
8000156a:	862e                	mv	a2,a1
8000156c:	00000517          	auipc	a0,0x0
80001570:	e7050513          	addi	a0,a0,-400 # 800013dc <sprintf_putch.3107>
80001574:	006c                	addi	a1,sp,12
80001576:	869a                	mv	a3,t1
80001578:	d606                	sw	ra,44(sp)
8000157a:	c2be                	sw	a5,68(sp)
8000157c:	c0ba                	sw	a4,64(sp)
8000157e:	c4c2                	sw	a6,72(sp)
80001580:	c6c6                	sw	a7,76(sp)
80001582:	ce1a                	sw	t1,28(sp)
80001584:	34d1                	jal	80001048 <vprintfmt>
80001586:	47b2                	lw	a5,12(sp)
80001588:	00078023          	sb	zero,0(a5)
8000158c:	4532                	lw	a0,12(sp)
8000158e:	50b2                	lw	ra,44(sp)
80001590:	8d01                	sub	a0,a0,s0
80001592:	5422                	lw	s0,40(sp)
80001594:	6161                	addi	sp,sp,80
80001596:	8082                	ret

80001598 <memcpy>:
80001598:	00c5e7b3          	or	a5,a1,a2
8000159c:	8fc9                	or	a5,a5,a0
8000159e:	8b8d                	andi	a5,a5,3
800015a0:	00c506b3          	add	a3,a0,a2
800015a4:	cf91                	beqz	a5,800015c0 <memcpy+0x28>
800015a6:	962e                	add	a2,a2,a1
800015a8:	87aa                	mv	a5,a0
800015aa:	02d57763          	bgeu	a0,a3,800015d8 <memcpy+0x40>
800015ae:	0585                	addi	a1,a1,1
800015b0:	fff5c703          	lbu	a4,-1(a1)
800015b4:	0785                	addi	a5,a5,1
800015b6:	fee78fa3          	sb	a4,-1(a5)
800015ba:	feb61ae3          	bne	a2,a1,800015ae <memcpy+0x16>
800015be:	8082                	ret
800015c0:	fed57fe3          	bgeu	a0,a3,800015be <memcpy+0x26>
800015c4:	87aa                	mv	a5,a0
800015c6:	0591                	addi	a1,a1,4
800015c8:	ffc5a703          	lw	a4,-4(a1)
800015cc:	0791                	addi	a5,a5,4
800015ce:	fee7ae23          	sw	a4,-4(a5)
800015d2:	fed7eae3          	bltu	a5,a3,800015c6 <memcpy+0x2e>
800015d6:	8082                	ret
800015d8:	8082                	ret

800015da <memset>:
800015da:	00c567b3          	or	a5,a0,a2
800015de:	8b8d                	andi	a5,a5,3
800015e0:	962a                	add	a2,a2,a0
800015e2:	cf81                	beqz	a5,800015fa <memset+0x20>
800015e4:	0ff5f593          	andi	a1,a1,255
800015e8:	87aa                	mv	a5,a0
800015ea:	02c57963          	bgeu	a0,a2,8000161c <memset+0x42>
800015ee:	0785                	addi	a5,a5,1
800015f0:	feb78fa3          	sb	a1,-1(a5)
800015f4:	fef61de3          	bne	a2,a5,800015ee <memset+0x14>
800015f8:	8082                	ret
800015fa:	0ff5f593          	andi	a1,a1,255
800015fe:	00859713          	slli	a4,a1,0x8
80001602:	8f4d                	or	a4,a4,a1
80001604:	01071793          	slli	a5,a4,0x10
80001608:	8f5d                	or	a4,a4,a5
8000160a:	fec577e3          	bgeu	a0,a2,800015f8 <memset+0x1e>
8000160e:	87aa                	mv	a5,a0
80001610:	0791                	addi	a5,a5,4
80001612:	fee7ae23          	sw	a4,-4(a5)
80001616:	fec7ede3          	bltu	a5,a2,80001610 <memset+0x36>
8000161a:	8082                	ret
8000161c:	8082                	ret

8000161e <_init>:
8000161e:	7135                	addi	sp,sp,-160
80001620:	cd22                	sw	s0,152(sp)
80001622:	cb26                	sw	s1,148(sp)
80001624:	00020493          	mv	s1,tp
80001628:	00020413          	mv	s0,tp
8000162c:	40848433          	sub	s0,s1,s0
80001630:	8622                	mv	a2,s0
80001632:	c74e                	sw	s3,140(sp)
80001634:	c552                	sw	s4,136(sp)
80001636:	89aa                	mv	s3,a0
80001638:	8a2e                	mv	s4,a1
8000163a:	8512                	mv	a0,tp
8000163c:	81c18593          	addi	a1,gp,-2020 # 80003cc0 <_end>
80001640:	cf06                	sw	ra,156(sp)
80001642:	c94a                	sw	s2,144(sp)
80001644:	c356                	sw	s5,132(sp)
80001646:	8a92                	mv	s5,tp
80001648:	3f81                	jal	80001598 <memcpy>
8000164a:	04420613          	addi	a2,tp,68 # 44 <_tbss_end>
8000164e:	8e05                	sub	a2,a2,s1
80001650:	4581                	li	a1,0
80001652:	008a8533          	add	a0,s5,s0
80001656:	3751                	jal	800015da <memset>
80001658:	85d2                	mv	a1,s4
8000165a:	854e                	mv	a0,s3
8000165c:	3dad                	jal	800014d6 <thread_entry>
8000165e:	4581                	li	a1,0
80001660:	4501                	li	a0,0
80001662:	091010ef          	jal	ra,80002ef2 <main>
80001666:	00002417          	auipc	s0,0x2
8000166a:	64e40413          	addi	s0,s0,1614 # 80003cb4 <counters>
8000166e:	4014                	lw	a3,0(s0)
80001670:	03f10913          	addi	s2,sp,63
80001674:	fc097913          	andi	s2,s2,-64
80001678:	84aa                	mv	s1,a0
8000167a:	ea8d                	bnez	a3,800016ac <_init+0x8e>
8000167c:	4054                	lw	a3,4(s0)
8000167e:	e299                	bnez	a3,80001684 <_init+0x66>
80001680:	8526                	mv	a0,s1
80001682:	3529                	jal	8000148c <tohost_exit>
80001684:	844a                	mv	s0,s2
80001686:	00002997          	auipc	s3,0x2
8000168a:	62698993          	addi	s3,s3,1574 # 80003cac <counter_names>
8000168e:	0049a603          	lw	a2,4(s3)
80001692:	8522                	mv	a0,s0
80001694:	00002597          	auipc	a1,0x2
80001698:	1bc58593          	addi	a1,a1,444 # 80003850 <main+0x95e>
8000169c:	3d7d                	jal	8000155a <sprintf>
8000169e:	942a                	add	s0,s0,a0
800016a0:	fe8900e3          	beq	s2,s0,80001680 <_init+0x62>
800016a4:	854a                	mv	a0,s2
800016a6:	260010ef          	jal	ra,80002906 <print_uart>
800016aa:	bfd9                	j	80001680 <_init+0x62>
800016ac:	00002997          	auipc	s3,0x2
800016b0:	60098993          	addi	s3,s3,1536 # 80003cac <counter_names>
800016b4:	0009a603          	lw	a2,0(s3)
800016b8:	00002597          	auipc	a1,0x2
800016bc:	19858593          	addi	a1,a1,408 # 80003850 <main+0x95e>
800016c0:	854a                	mv	a0,s2
800016c2:	3d61                	jal	8000155a <sprintf>
800016c4:	4054                	lw	a3,4(s0)
800016c6:	00a90433          	add	s0,s2,a0
800016ca:	daf9                	beqz	a3,800016a0 <_init+0x82>
800016cc:	b7c9                	j	8000168e <_init+0x70>

800016ce <strlen>:
800016ce:	00054783          	lbu	a5,0(a0)
800016d2:	cb89                	beqz	a5,800016e4 <strlen+0x16>
800016d4:	87aa                	mv	a5,a0
800016d6:	0785                	addi	a5,a5,1
800016d8:	0007c703          	lbu	a4,0(a5)
800016dc:	ff6d                	bnez	a4,800016d6 <strlen+0x8>
800016de:	40a78533          	sub	a0,a5,a0
800016e2:	8082                	ret
800016e4:	4501                	li	a0,0
800016e6:	8082                	ret

800016e8 <strnlen>:
800016e8:	cd91                	beqz	a1,80001704 <strnlen+0x1c>
800016ea:	00054783          	lbu	a5,0(a0)
800016ee:	c38d                	beqz	a5,80001710 <strnlen+0x28>
800016f0:	00b506b3          	add	a3,a0,a1
800016f4:	87aa                	mv	a5,a0
800016f6:	a021                	j	800016fe <strnlen+0x16>
800016f8:	0007c703          	lbu	a4,0(a5)
800016fc:	c711                	beqz	a4,80001708 <strnlen+0x20>
800016fe:	0785                	addi	a5,a5,1
80001700:	fed79ce3          	bne	a5,a3,800016f8 <strnlen+0x10>
80001704:	852e                	mv	a0,a1
80001706:	8082                	ret
80001708:	40a785b3          	sub	a1,a5,a0
8000170c:	852e                	mv	a0,a1
8000170e:	8082                	ret
80001710:	4581                	li	a1,0
80001712:	bfcd                	j	80001704 <strnlen+0x1c>

80001714 <strcmp>:
80001714:	0505                	addi	a0,a0,1
80001716:	fff54783          	lbu	a5,-1(a0)
8000171a:	0585                	addi	a1,a1,1
8000171c:	fff5c703          	lbu	a4,-1(a1)
80001720:	c791                	beqz	a5,8000172c <strcmp+0x18>
80001722:	fee789e3          	beq	a5,a4,80001714 <strcmp>
80001726:	40e78533          	sub	a0,a5,a4
8000172a:	8082                	ret
8000172c:	4781                	li	a5,0
8000172e:	bfe5                	j	80001726 <strcmp+0x12>

80001730 <strcpy>:
80001730:	87aa                	mv	a5,a0
80001732:	0585                	addi	a1,a1,1
80001734:	fff5c703          	lbu	a4,-1(a1)
80001738:	0785                	addi	a5,a5,1
8000173a:	fee78fa3          	sb	a4,-1(a5)
8000173e:	fb75                	bnez	a4,80001732 <strcpy+0x2>
80001740:	8082                	ret

80001742 <atol>:
80001742:	00054783          	lbu	a5,0(a0)
80001746:	02000713          	li	a4,32
8000174a:	00e79763          	bne	a5,a4,80001758 <atol+0x16>
8000174e:	0505                	addi	a0,a0,1
80001750:	00054783          	lbu	a5,0(a0)
80001754:	fee78de3          	beq	a5,a4,8000174e <atol+0xc>
80001758:	fd578713          	addi	a4,a5,-43
8000175c:	0fd77713          	andi	a4,a4,253
80001760:	c715                	beqz	a4,8000178c <atol+0x4a>
80001762:	00054683          	lbu	a3,0(a0)
80001766:	87aa                	mv	a5,a0
80001768:	4601                	li	a2,0
8000176a:	ce85                	beqz	a3,800017a2 <atol+0x60>
8000176c:	4501                	li	a0,0
8000176e:	0785                	addi	a5,a5,1
80001770:	fd068593          	addi	a1,a3,-48
80001774:	00251713          	slli	a4,a0,0x2
80001778:	0007c683          	lbu	a3,0(a5)
8000177c:	953a                	add	a0,a0,a4
8000177e:	0506                	slli	a0,a0,0x1
80001780:	952e                	add	a0,a0,a1
80001782:	f6f5                	bnez	a3,8000176e <atol+0x2c>
80001784:	c219                	beqz	a2,8000178a <atol+0x48>
80001786:	40a00533          	neg	a0,a0
8000178a:	8082                	ret
8000178c:	00154683          	lbu	a3,1(a0)
80001790:	fd378793          	addi	a5,a5,-45
80001794:	0017b613          	seqz	a2,a5
80001798:	00150793          	addi	a5,a0,1
8000179c:	fae1                	bnez	a3,8000176c <atol+0x2a>
8000179e:	4501                	li	a0,0
800017a0:	b7d5                	j	80001784 <atol+0x42>
800017a2:	4501                	li	a0,0
800017a4:	8082                	ret
	...

800017a8 <__moddi3>:
800017a8:	00000893          	li	a7,0
800017ac:	0005dc63          	bgez	a1,800017c4 <__moddi3+0x1c>
800017b0:	40a00533          	neg	a0,a0
800017b4:	00a037b3          	snez	a5,a0
800017b8:	40b005b3          	neg	a1,a1
800017bc:	40f585b3          	sub	a1,a1,a5
800017c0:	fff00893          	li	a7,-1
800017c4:	0006da63          	bgez	a3,800017d8 <__moddi3+0x30>
800017c8:	40c00633          	neg	a2,a2
800017cc:	00c037b3          	snez	a5,a2
800017d0:	40d006b3          	neg	a3,a3
800017d4:	40f686b3          	sub	a3,a3,a5
800017d8:	00060313          	mv	t1,a2
800017dc:	00068713          	mv	a4,a3
800017e0:	00050793          	mv	a5,a0
800017e4:	00058813          	mv	a6,a1
800017e8:	24069863          	bnez	a3,80001a38 <__moddi3+0x290>
800017ec:	800046b7          	lui	a3,0x80004
800017f0:	b3068693          	addi	a3,a3,-1232 # 80003b30 <__global_pointer$+0xfffff68c>
800017f4:	0ec5f863          	bgeu	a1,a2,800018e4 <__moddi3+0x13c>
800017f8:	00010e37          	lui	t3,0x10
800017fc:	0dc67a63          	bgeu	a2,t3,800018d0 <__moddi3+0x128>
80001800:	0ff00e13          	li	t3,255
80001804:	00ce7463          	bgeu	t3,a2,8000180c <__moddi3+0x64>
80001808:	00800713          	li	a4,8
8000180c:	00e65e33          	srl	t3,a2,a4
80001810:	01c686b3          	add	a3,a3,t3
80001814:	0006ce83          	lbu	t4,0(a3)
80001818:	02000e13          	li	t3,32
8000181c:	00ee8eb3          	add	t4,t4,a4
80001820:	41de0e33          	sub	t3,t3,t4
80001824:	000e0c63          	beqz	t3,8000183c <__moddi3+0x94>
80001828:	01c595b3          	sll	a1,a1,t3
8000182c:	01d55eb3          	srl	t4,a0,t4
80001830:	01c61333          	sll	t1,a2,t3
80001834:	00bee833          	or	a6,t4,a1
80001838:	01c517b3          	sll	a5,a0,t3
8000183c:	01035613          	srli	a2,t1,0x10
80001840:	02c876b3          	remu	a3,a6,a2
80001844:	01031513          	slli	a0,t1,0x10
80001848:	01055513          	srli	a0,a0,0x10
8000184c:	0107d713          	srli	a4,a5,0x10
80001850:	02c85833          	divu	a6,a6,a2
80001854:	01069693          	slli	a3,a3,0x10
80001858:	00e6e733          	or	a4,a3,a4
8000185c:	03050833          	mul	a6,a0,a6
80001860:	01077a63          	bgeu	a4,a6,80001874 <__moddi3+0xcc>
80001864:	00670733          	add	a4,a4,t1
80001868:	00676663          	bltu	a4,t1,80001874 <__moddi3+0xcc>
8000186c:	01077463          	bgeu	a4,a6,80001874 <__moddi3+0xcc>
80001870:	00670733          	add	a4,a4,t1
80001874:	41070733          	sub	a4,a4,a6
80001878:	02c776b3          	remu	a3,a4,a2
8000187c:	01079793          	slli	a5,a5,0x10
80001880:	0107d793          	srli	a5,a5,0x10
80001884:	02c75733          	divu	a4,a4,a2
80001888:	02e50733          	mul	a4,a0,a4
8000188c:	01069513          	slli	a0,a3,0x10
80001890:	00f567b3          	or	a5,a0,a5
80001894:	00e7fa63          	bgeu	a5,a4,800018a8 <__moddi3+0x100>
80001898:	006787b3          	add	a5,a5,t1
8000189c:	0067e663          	bltu	a5,t1,800018a8 <__moddi3+0x100>
800018a0:	00e7f463          	bgeu	a5,a4,800018a8 <__moddi3+0x100>
800018a4:	006787b3          	add	a5,a5,t1
800018a8:	40e787b3          	sub	a5,a5,a4
800018ac:	01c7d533          	srl	a0,a5,t3
800018b0:	00000593          	li	a1,0
800018b4:	00088c63          	beqz	a7,800018cc <__moddi3+0x124>
800018b8:	40a007b3          	neg	a5,a0
800018bc:	00f03733          	snez	a4,a5
800018c0:	40b005b3          	neg	a1,a1
800018c4:	00078513          	mv	a0,a5
800018c8:	40e585b3          	sub	a1,a1,a4
800018cc:	00008067          	ret
800018d0:	01000e37          	lui	t3,0x1000
800018d4:	01000713          	li	a4,16
800018d8:	f3c66ae3          	bltu	a2,t3,8000180c <__moddi3+0x64>
800018dc:	01800713          	li	a4,24
800018e0:	f2dff06f          	j	8000180c <__moddi3+0x64>
800018e4:	00061663          	bnez	a2,800018f0 <__moddi3+0x148>
800018e8:	00100313          	li	t1,1
800018ec:	02e35333          	divu	t1,t1,a4
800018f0:	00010637          	lui	a2,0x10
800018f4:	0ac37263          	bgeu	t1,a2,80001998 <__moddi3+0x1f0>
800018f8:	0ff00613          	li	a2,255
800018fc:	00667463          	bgeu	a2,t1,80001904 <__moddi3+0x15c>
80001900:	00800713          	li	a4,8
80001904:	00e35633          	srl	a2,t1,a4
80001908:	00c686b3          	add	a3,a3,a2
8000190c:	0006ce83          	lbu	t4,0(a3)
80001910:	02000e13          	li	t3,32
80001914:	00ee8eb3          	add	t4,t4,a4
80001918:	41de0e33          	sub	t3,t3,t4
8000191c:	080e1863          	bnez	t3,800019ac <__moddi3+0x204>
80001920:	406585b3          	sub	a1,a1,t1
80001924:	01035693          	srli	a3,t1,0x10
80001928:	01031513          	slli	a0,t1,0x10
8000192c:	01055513          	srli	a0,a0,0x10
80001930:	0107d613          	srli	a2,a5,0x10
80001934:	02d5f733          	remu	a4,a1,a3
80001938:	02d5d5b3          	divu	a1,a1,a3
8000193c:	01071713          	slli	a4,a4,0x10
80001940:	00c76733          	or	a4,a4,a2
80001944:	02b505b3          	mul	a1,a0,a1
80001948:	00b77a63          	bgeu	a4,a1,8000195c <__moddi3+0x1b4>
8000194c:	00670733          	add	a4,a4,t1
80001950:	00676663          	bltu	a4,t1,8000195c <__moddi3+0x1b4>
80001954:	00b77463          	bgeu	a4,a1,8000195c <__moddi3+0x1b4>
80001958:	00670733          	add	a4,a4,t1
8000195c:	40b705b3          	sub	a1,a4,a1
80001960:	02d5f733          	remu	a4,a1,a3
80001964:	01079793          	slli	a5,a5,0x10
80001968:	0107d793          	srli	a5,a5,0x10
8000196c:	02d5d5b3          	divu	a1,a1,a3
80001970:	02b505b3          	mul	a1,a0,a1
80001974:	01071513          	slli	a0,a4,0x10
80001978:	00f567b3          	or	a5,a0,a5
8000197c:	00b7fa63          	bgeu	a5,a1,80001990 <__moddi3+0x1e8>
80001980:	006787b3          	add	a5,a5,t1
80001984:	0067e663          	bltu	a5,t1,80001990 <__moddi3+0x1e8>
80001988:	00b7f463          	bgeu	a5,a1,80001990 <__moddi3+0x1e8>
8000198c:	006787b3          	add	a5,a5,t1
80001990:	40b787b3          	sub	a5,a5,a1
80001994:	f19ff06f          	j	800018ac <__moddi3+0x104>
80001998:	01000637          	lui	a2,0x1000
8000199c:	01000713          	li	a4,16
800019a0:	f6c362e3          	bltu	t1,a2,80001904 <__moddi3+0x15c>
800019a4:	01800713          	li	a4,24
800019a8:	f5dff06f          	j	80001904 <__moddi3+0x15c>
800019ac:	01c31333          	sll	t1,t1,t3
800019b0:	01d5df33          	srl	t5,a1,t4
800019b4:	01c517b3          	sll	a5,a0,t3
800019b8:	01d55eb3          	srl	t4,a0,t4
800019bc:	01035513          	srli	a0,t1,0x10
800019c0:	02af56b3          	divu	a3,t5,a0
800019c4:	01c595b3          	sll	a1,a1,t3
800019c8:	00beeeb3          	or	t4,t4,a1
800019cc:	01031593          	slli	a1,t1,0x10
800019d0:	0105d593          	srli	a1,a1,0x10
800019d4:	010ed613          	srli	a2,t4,0x10
800019d8:	02af7733          	remu	a4,t5,a0
800019dc:	02d586b3          	mul	a3,a1,a3
800019e0:	01071713          	slli	a4,a4,0x10
800019e4:	00c76733          	or	a4,a4,a2
800019e8:	00d77a63          	bgeu	a4,a3,800019fc <__moddi3+0x254>
800019ec:	00670733          	add	a4,a4,t1
800019f0:	00676663          	bltu	a4,t1,800019fc <__moddi3+0x254>
800019f4:	00d77463          	bgeu	a4,a3,800019fc <__moddi3+0x254>
800019f8:	00670733          	add	a4,a4,t1
800019fc:	40d70633          	sub	a2,a4,a3
80001a00:	02a67733          	remu	a4,a2,a0
80001a04:	010e9e93          	slli	t4,t4,0x10
80001a08:	010ede93          	srli	t4,t4,0x10
80001a0c:	02a65633          	divu	a2,a2,a0
80001a10:	01071713          	slli	a4,a4,0x10
80001a14:	02c58633          	mul	a2,a1,a2
80001a18:	01d765b3          	or	a1,a4,t4
80001a1c:	00c5fa63          	bgeu	a1,a2,80001a30 <__moddi3+0x288>
80001a20:	006585b3          	add	a1,a1,t1
80001a24:	0065e663          	bltu	a1,t1,80001a30 <__moddi3+0x288>
80001a28:	00c5f463          	bgeu	a1,a2,80001a30 <__moddi3+0x288>
80001a2c:	006585b3          	add	a1,a1,t1
80001a30:	40c585b3          	sub	a1,a1,a2
80001a34:	ef1ff06f          	j	80001924 <__moddi3+0x17c>
80001a38:	e6d5eee3          	bltu	a1,a3,800018b4 <__moddi3+0x10c>
80001a3c:	00010737          	lui	a4,0x10
80001a40:	04e6fc63          	bgeu	a3,a4,80001a98 <__moddi3+0x2f0>
80001a44:	0ff00f13          	li	t5,255
80001a48:	00df3733          	sltu	a4,t5,a3
80001a4c:	00371713          	slli	a4,a4,0x3
80001a50:	80004e37          	lui	t3,0x80004
80001a54:	00e6d333          	srl	t1,a3,a4
80001a58:	b30e0e13          	addi	t3,t3,-1232 # 80003b30 <__global_pointer$+0xfffff68c>
80001a5c:	01c30333          	add	t1,t1,t3
80001a60:	00034f03          	lbu	t5,0(t1)
80001a64:	02000e93          	li	t4,32
80001a68:	00ef0f33          	add	t5,t5,a4
80001a6c:	41ee8eb3          	sub	t4,t4,t5
80001a70:	020e9e63          	bnez	t4,80001aac <__moddi3+0x304>
80001a74:	00b6e463          	bltu	a3,a1,80001a7c <__moddi3+0x2d4>
80001a78:	00c56a63          	bltu	a0,a2,80001a8c <__moddi3+0x2e4>
80001a7c:	40c507b3          	sub	a5,a0,a2
80001a80:	40d586b3          	sub	a3,a1,a3
80001a84:	00f53533          	sltu	a0,a0,a5
80001a88:	40a68833          	sub	a6,a3,a0
80001a8c:	00078513          	mv	a0,a5
80001a90:	00080593          	mv	a1,a6
80001a94:	e21ff06f          	j	800018b4 <__moddi3+0x10c>
80001a98:	01000337          	lui	t1,0x1000
80001a9c:	01000713          	li	a4,16
80001aa0:	fa66e8e3          	bltu	a3,t1,80001a50 <__moddi3+0x2a8>
80001aa4:	01800713          	li	a4,24
80001aa8:	fa9ff06f          	j	80001a50 <__moddi3+0x2a8>
80001aac:	01e65733          	srl	a4,a2,t5
80001ab0:	01d696b3          	sll	a3,a3,t4
80001ab4:	00d766b3          	or	a3,a4,a3
80001ab8:	01e5d7b3          	srl	a5,a1,t5
80001abc:	0106d713          	srli	a4,a3,0x10
80001ac0:	02e7fe33          	remu	t3,a5,a4
80001ac4:	01d595b3          	sll	a1,a1,t4
80001ac8:	01e55833          	srl	a6,a0,t5
80001acc:	00b86833          	or	a6,a6,a1
80001ad0:	01069593          	slli	a1,a3,0x10
80001ad4:	0105d593          	srli	a1,a1,0x10
80001ad8:	01085313          	srli	t1,a6,0x10
80001adc:	01d61633          	sll	a2,a2,t4
80001ae0:	01d51533          	sll	a0,a0,t4
80001ae4:	02e7d7b3          	divu	a5,a5,a4
80001ae8:	010e1e13          	slli	t3,t3,0x10
80001aec:	006e6333          	or	t1,t3,t1
80001af0:	02f58fb3          	mul	t6,a1,a5
80001af4:	00078e13          	mv	t3,a5
80001af8:	01f37e63          	bgeu	t1,t6,80001b14 <__moddi3+0x36c>
80001afc:	00d30333          	add	t1,t1,a3
80001b00:	fff78e13          	addi	t3,a5,-1
80001b04:	00d36863          	bltu	t1,a3,80001b14 <__moddi3+0x36c>
80001b08:	01f37663          	bgeu	t1,t6,80001b14 <__moddi3+0x36c>
80001b0c:	ffe78e13          	addi	t3,a5,-2
80001b10:	00d30333          	add	t1,t1,a3
80001b14:	41f30333          	sub	t1,t1,t6
80001b18:	02e37fb3          	remu	t6,t1,a4
80001b1c:	01081813          	slli	a6,a6,0x10
80001b20:	01085813          	srli	a6,a6,0x10
80001b24:	02e35333          	divu	t1,t1,a4
80001b28:	010f9f93          	slli	t6,t6,0x10
80001b2c:	010fefb3          	or	t6,t6,a6
80001b30:	026585b3          	mul	a1,a1,t1
80001b34:	00030793          	mv	a5,t1
80001b38:	00bffe63          	bgeu	t6,a1,80001b54 <__moddi3+0x3ac>
80001b3c:	00df8fb3          	add	t6,t6,a3
80001b40:	fff30793          	addi	a5,t1,-1 # ffffff <_tbss_end+0xffffbb>
80001b44:	00dfe863          	bltu	t6,a3,80001b54 <__moddi3+0x3ac>
80001b48:	00bff663          	bgeu	t6,a1,80001b54 <__moddi3+0x3ac>
80001b4c:	ffe30793          	addi	a5,t1,-2
80001b50:	00df8fb3          	add	t6,t6,a3
80001b54:	40bf85b3          	sub	a1,t6,a1
80001b58:	010e1e13          	slli	t3,t3,0x10
80001b5c:	00010fb7          	lui	t6,0x10
80001b60:	00fe6e33          	or	t3,t3,a5
80001b64:	ffff8793          	addi	a5,t6,-1 # ffff <_tbss_end+0xffbb>
80001b68:	00fe7333          	and	t1,t3,a5
80001b6c:	01065813          	srli	a6,a2,0x10
80001b70:	010e5e13          	srli	t3,t3,0x10
80001b74:	00f677b3          	and	a5,a2,a5
80001b78:	02f30733          	mul	a4,t1,a5
80001b7c:	02fe07b3          	mul	a5,t3,a5
80001b80:	03030333          	mul	t1,t1,a6
80001b84:	030e0e33          	mul	t3,t3,a6
80001b88:	00f30333          	add	t1,t1,a5
80001b8c:	01075813          	srli	a6,a4,0x10
80001b90:	00680833          	add	a6,a6,t1
80001b94:	00f87463          	bgeu	a6,a5,80001b9c <__moddi3+0x3f4>
80001b98:	01fe0e33          	add	t3,t3,t6
80001b9c:	01085793          	srli	a5,a6,0x10
80001ba0:	01c78e33          	add	t3,a5,t3
80001ba4:	000107b7          	lui	a5,0x10
80001ba8:	fff78793          	addi	a5,a5,-1 # ffff <_tbss_end+0xffbb>
80001bac:	00f87833          	and	a6,a6,a5
80001bb0:	01081813          	slli	a6,a6,0x10
80001bb4:	00f77733          	and	a4,a4,a5
80001bb8:	00e80733          	add	a4,a6,a4
80001bbc:	01c5e663          	bltu	a1,t3,80001bc8 <__moddi3+0x420>
80001bc0:	01c59e63          	bne	a1,t3,80001bdc <__moddi3+0x434>
80001bc4:	00e57c63          	bgeu	a0,a4,80001bdc <__moddi3+0x434>
80001bc8:	40c70633          	sub	a2,a4,a2
80001bcc:	00c73733          	sltu	a4,a4,a2
80001bd0:	00d70733          	add	a4,a4,a3
80001bd4:	40ee0e33          	sub	t3,t3,a4
80001bd8:	00060713          	mv	a4,a2
80001bdc:	40e50733          	sub	a4,a0,a4
80001be0:	00e53533          	sltu	a0,a0,a4
80001be4:	41c585b3          	sub	a1,a1,t3
80001be8:	40a585b3          	sub	a1,a1,a0
80001bec:	01e597b3          	sll	a5,a1,t5
80001bf0:	01d75733          	srl	a4,a4,t4
80001bf4:	00e7e533          	or	a0,a5,a4
80001bf8:	01d5d5b3          	srl	a1,a1,t4
80001bfc:	cb9ff06f          	j	800018b4 <__moddi3+0x10c>

80001c00 <__udivdi3>:
80001c00:	00058793          	mv	a5,a1
80001c04:	00060813          	mv	a6,a2
80001c08:	00068893          	mv	a7,a3
80001c0c:	00050313          	mv	t1,a0
80001c10:	28069663          	bnez	a3,80001e9c <__udivdi3+0x29c>
80001c14:	80004737          	lui	a4,0x80004
80001c18:	b3070713          	addi	a4,a4,-1232 # 80003b30 <__global_pointer$+0xfffff68c>
80001c1c:	0ec5f663          	bgeu	a1,a2,80001d08 <__udivdi3+0x108>
80001c20:	000106b7          	lui	a3,0x10
80001c24:	0cd67863          	bgeu	a2,a3,80001cf4 <__udivdi3+0xf4>
80001c28:	0ff00693          	li	a3,255
80001c2c:	00c6b6b3          	sltu	a3,a3,a2
80001c30:	00369693          	slli	a3,a3,0x3
80001c34:	00d658b3          	srl	a7,a2,a3
80001c38:	01170733          	add	a4,a4,a7
80001c3c:	00074703          	lbu	a4,0(a4)
80001c40:	00d706b3          	add	a3,a4,a3
80001c44:	02000713          	li	a4,32
80001c48:	40d70733          	sub	a4,a4,a3
80001c4c:	00070c63          	beqz	a4,80001c64 <__udivdi3+0x64>
80001c50:	00e797b3          	sll	a5,a5,a4
80001c54:	00d556b3          	srl	a3,a0,a3
80001c58:	00e61833          	sll	a6,a2,a4
80001c5c:	00f6e5b3          	or	a1,a3,a5
80001c60:	00e51333          	sll	t1,a0,a4
80001c64:	01085513          	srli	a0,a6,0x10
80001c68:	02a5f733          	remu	a4,a1,a0
80001c6c:	01081613          	slli	a2,a6,0x10
80001c70:	01065613          	srli	a2,a2,0x10
80001c74:	01035693          	srli	a3,t1,0x10
80001c78:	02a5d5b3          	divu	a1,a1,a0
80001c7c:	01071713          	slli	a4,a4,0x10
80001c80:	00d766b3          	or	a3,a4,a3
80001c84:	02b607b3          	mul	a5,a2,a1
80001c88:	00058713          	mv	a4,a1
80001c8c:	00f6fe63          	bgeu	a3,a5,80001ca8 <__udivdi3+0xa8>
80001c90:	010686b3          	add	a3,a3,a6
80001c94:	fff58713          	addi	a4,a1,-1
80001c98:	0106e863          	bltu	a3,a6,80001ca8 <__udivdi3+0xa8>
80001c9c:	00f6f663          	bgeu	a3,a5,80001ca8 <__udivdi3+0xa8>
80001ca0:	ffe58713          	addi	a4,a1,-2
80001ca4:	010686b3          	add	a3,a3,a6
80001ca8:	40f686b3          	sub	a3,a3,a5
80001cac:	02a6f7b3          	remu	a5,a3,a0
80001cb0:	01031313          	slli	t1,t1,0x10
80001cb4:	01035313          	srli	t1,t1,0x10
80001cb8:	02a6d6b3          	divu	a3,a3,a0
80001cbc:	01079793          	slli	a5,a5,0x10
80001cc0:	0067e333          	or	t1,a5,t1
80001cc4:	02d605b3          	mul	a1,a2,a3
80001cc8:	00068513          	mv	a0,a3
80001ccc:	00b37c63          	bgeu	t1,a1,80001ce4 <__udivdi3+0xe4>
80001cd0:	00680333          	add	t1,a6,t1
80001cd4:	fff68513          	addi	a0,a3,-1 # ffff <_tbss_end+0xffbb>
80001cd8:	01036663          	bltu	t1,a6,80001ce4 <__udivdi3+0xe4>
80001cdc:	00b37463          	bgeu	t1,a1,80001ce4 <__udivdi3+0xe4>
80001ce0:	ffe68513          	addi	a0,a3,-2
80001ce4:	01071713          	slli	a4,a4,0x10
80001ce8:	00a76733          	or	a4,a4,a0
80001cec:	00000593          	li	a1,0
80001cf0:	0e40006f          	j	80001dd4 <__udivdi3+0x1d4>
80001cf4:	010008b7          	lui	a7,0x1000
80001cf8:	01000693          	li	a3,16
80001cfc:	f3166ce3          	bltu	a2,a7,80001c34 <__udivdi3+0x34>
80001d00:	01800693          	li	a3,24
80001d04:	f31ff06f          	j	80001c34 <__udivdi3+0x34>
80001d08:	00061663          	bnez	a2,80001d14 <__udivdi3+0x114>
80001d0c:	00100693          	li	a3,1
80001d10:	02c6d833          	divu	a6,a3,a2
80001d14:	000106b7          	lui	a3,0x10
80001d18:	0cd87263          	bgeu	a6,a3,80001ddc <__udivdi3+0x1dc>
80001d1c:	0ff00693          	li	a3,255
80001d20:	0106f463          	bgeu	a3,a6,80001d28 <__udivdi3+0x128>
80001d24:	00800893          	li	a7,8
80001d28:	011856b3          	srl	a3,a6,a7
80001d2c:	00d70733          	add	a4,a4,a3
80001d30:	00074683          	lbu	a3,0(a4)
80001d34:	02000713          	li	a4,32
80001d38:	011686b3          	add	a3,a3,a7
80001d3c:	40d70733          	sub	a4,a4,a3
80001d40:	0a071863          	bnez	a4,80001df0 <__udivdi3+0x1f0>
80001d44:	410787b3          	sub	a5,a5,a6
80001d48:	00100593          	li	a1,1
80001d4c:	01085613          	srli	a2,a6,0x10
80001d50:	01081893          	slli	a7,a6,0x10
80001d54:	0108d893          	srli	a7,a7,0x10
80001d58:	01035693          	srli	a3,t1,0x10
80001d5c:	02c7f733          	remu	a4,a5,a2
80001d60:	02c7d7b3          	divu	a5,a5,a2
80001d64:	01071713          	slli	a4,a4,0x10
80001d68:	00d766b3          	or	a3,a4,a3
80001d6c:	02f88533          	mul	a0,a7,a5
80001d70:	00078713          	mv	a4,a5
80001d74:	00a6fe63          	bgeu	a3,a0,80001d90 <__udivdi3+0x190>
80001d78:	010686b3          	add	a3,a3,a6
80001d7c:	fff78713          	addi	a4,a5,-1
80001d80:	0106e863          	bltu	a3,a6,80001d90 <__udivdi3+0x190>
80001d84:	00a6f663          	bgeu	a3,a0,80001d90 <__udivdi3+0x190>
80001d88:	ffe78713          	addi	a4,a5,-2
80001d8c:	010686b3          	add	a3,a3,a6
80001d90:	40a686b3          	sub	a3,a3,a0
80001d94:	02c6f7b3          	remu	a5,a3,a2
80001d98:	01031313          	slli	t1,t1,0x10
80001d9c:	01035313          	srli	t1,t1,0x10
80001da0:	02c6d6b3          	divu	a3,a3,a2
80001da4:	01079793          	slli	a5,a5,0x10
80001da8:	0067e333          	or	t1,a5,t1
80001dac:	02d888b3          	mul	a7,a7,a3
80001db0:	00068513          	mv	a0,a3
80001db4:	01137c63          	bgeu	t1,a7,80001dcc <__udivdi3+0x1cc>
80001db8:	00680333          	add	t1,a6,t1
80001dbc:	fff68513          	addi	a0,a3,-1 # ffff <_tbss_end+0xffbb>
80001dc0:	01036663          	bltu	t1,a6,80001dcc <__udivdi3+0x1cc>
80001dc4:	01137463          	bgeu	t1,a7,80001dcc <__udivdi3+0x1cc>
80001dc8:	ffe68513          	addi	a0,a3,-2
80001dcc:	01071713          	slli	a4,a4,0x10
80001dd0:	00a76733          	or	a4,a4,a0
80001dd4:	00070513          	mv	a0,a4
80001dd8:	00008067          	ret
80001ddc:	010006b7          	lui	a3,0x1000
80001de0:	01000893          	li	a7,16
80001de4:	f4d862e3          	bltu	a6,a3,80001d28 <__udivdi3+0x128>
80001de8:	01800893          	li	a7,24
80001dec:	f3dff06f          	j	80001d28 <__udivdi3+0x128>
80001df0:	00e81833          	sll	a6,a6,a4
80001df4:	00d7d5b3          	srl	a1,a5,a3
80001df8:	00e51333          	sll	t1,a0,a4
80001dfc:	00d556b3          	srl	a3,a0,a3
80001e00:	01085513          	srli	a0,a6,0x10
80001e04:	00e797b3          	sll	a5,a5,a4
80001e08:	02a5f733          	remu	a4,a1,a0
80001e0c:	00f6e8b3          	or	a7,a3,a5
80001e10:	01081793          	slli	a5,a6,0x10
80001e14:	0107d793          	srli	a5,a5,0x10
80001e18:	0108d613          	srli	a2,a7,0x10
80001e1c:	02a5d5b3          	divu	a1,a1,a0
80001e20:	01071713          	slli	a4,a4,0x10
80001e24:	00c76733          	or	a4,a4,a2
80001e28:	02b786b3          	mul	a3,a5,a1
80001e2c:	00058613          	mv	a2,a1
80001e30:	00d77e63          	bgeu	a4,a3,80001e4c <__udivdi3+0x24c>
80001e34:	01070733          	add	a4,a4,a6
80001e38:	fff58613          	addi	a2,a1,-1
80001e3c:	01076863          	bltu	a4,a6,80001e4c <__udivdi3+0x24c>
80001e40:	00d77663          	bgeu	a4,a3,80001e4c <__udivdi3+0x24c>
80001e44:	ffe58613          	addi	a2,a1,-2
80001e48:	01070733          	add	a4,a4,a6
80001e4c:	40d706b3          	sub	a3,a4,a3
80001e50:	02a6f733          	remu	a4,a3,a0
80001e54:	01089893          	slli	a7,a7,0x10
80001e58:	0108d893          	srli	a7,a7,0x10
80001e5c:	02a6d6b3          	divu	a3,a3,a0
80001e60:	01071713          	slli	a4,a4,0x10
80001e64:	02d785b3          	mul	a1,a5,a3
80001e68:	011767b3          	or	a5,a4,a7
80001e6c:	00068713          	mv	a4,a3
80001e70:	00b7fe63          	bgeu	a5,a1,80001e8c <__udivdi3+0x28c>
80001e74:	010787b3          	add	a5,a5,a6
80001e78:	fff68713          	addi	a4,a3,-1 # ffffff <_tbss_end+0xffffbb>
80001e7c:	0107e863          	bltu	a5,a6,80001e8c <__udivdi3+0x28c>
80001e80:	00b7f663          	bgeu	a5,a1,80001e8c <__udivdi3+0x28c>
80001e84:	ffe68713          	addi	a4,a3,-2
80001e88:	010787b3          	add	a5,a5,a6
80001e8c:	40b787b3          	sub	a5,a5,a1
80001e90:	01061593          	slli	a1,a2,0x10
80001e94:	00e5e5b3          	or	a1,a1,a4
80001e98:	eb5ff06f          	j	80001d4c <__udivdi3+0x14c>
80001e9c:	18d5e663          	bltu	a1,a3,80002028 <__udivdi3+0x428>
80001ea0:	00010737          	lui	a4,0x10
80001ea4:	04e6f463          	bgeu	a3,a4,80001eec <__udivdi3+0x2ec>
80001ea8:	0ff00813          	li	a6,255
80001eac:	00d83733          	sltu	a4,a6,a3
80001eb0:	00371713          	slli	a4,a4,0x3
80001eb4:	80004837          	lui	a6,0x80004
80001eb8:	b3080813          	addi	a6,a6,-1232 # 80003b30 <__global_pointer$+0xfffff68c>
80001ebc:	00e6d5b3          	srl	a1,a3,a4
80001ec0:	010585b3          	add	a1,a1,a6
80001ec4:	0005c803          	lbu	a6,0(a1)
80001ec8:	02000593          	li	a1,32
80001ecc:	00e80833          	add	a6,a6,a4
80001ed0:	410585b3          	sub	a1,a1,a6
80001ed4:	02059663          	bnez	a1,80001f00 <__udivdi3+0x300>
80001ed8:	00100713          	li	a4,1
80001edc:	eef6ece3          	bltu	a3,a5,80001dd4 <__udivdi3+0x1d4>
80001ee0:	00c53533          	sltu	a0,a0,a2
80001ee4:	00154713          	xori	a4,a0,1
80001ee8:	eedff06f          	j	80001dd4 <__udivdi3+0x1d4>
80001eec:	010005b7          	lui	a1,0x1000
80001ef0:	01000713          	li	a4,16
80001ef4:	fcb6e0e3          	bltu	a3,a1,80001eb4 <__udivdi3+0x2b4>
80001ef8:	01800713          	li	a4,24
80001efc:	fb9ff06f          	j	80001eb4 <__udivdi3+0x2b4>
80001f00:	01065733          	srl	a4,a2,a6
80001f04:	00b696b3          	sll	a3,a3,a1
80001f08:	00d766b3          	or	a3,a4,a3
80001f0c:	0106de93          	srli	t4,a3,0x10
80001f10:	0107d733          	srl	a4,a5,a6
80001f14:	03d778b3          	remu	a7,a4,t4
80001f18:	00b797b3          	sll	a5,a5,a1
80001f1c:	01055833          	srl	a6,a0,a6
80001f20:	00f86333          	or	t1,a6,a5
80001f24:	01069793          	slli	a5,a3,0x10
80001f28:	0107d793          	srli	a5,a5,0x10
80001f2c:	01035813          	srli	a6,t1,0x10
80001f30:	00b61633          	sll	a2,a2,a1
80001f34:	03d75733          	divu	a4,a4,t4
80001f38:	01089893          	slli	a7,a7,0x10
80001f3c:	0108e833          	or	a6,a7,a6
80001f40:	02e78f33          	mul	t5,a5,a4
80001f44:	00070e13          	mv	t3,a4
80001f48:	01e87e63          	bgeu	a6,t5,80001f64 <__udivdi3+0x364>
80001f4c:	00d80833          	add	a6,a6,a3
80001f50:	fff70e13          	addi	t3,a4,-1 # ffff <_tbss_end+0xffbb>
80001f54:	00d86863          	bltu	a6,a3,80001f64 <__udivdi3+0x364>
80001f58:	01e87663          	bgeu	a6,t5,80001f64 <__udivdi3+0x364>
80001f5c:	ffe70e13          	addi	t3,a4,-2
80001f60:	00d80833          	add	a6,a6,a3
80001f64:	41e80833          	sub	a6,a6,t5
80001f68:	03d878b3          	remu	a7,a6,t4
80001f6c:	03d85833          	divu	a6,a6,t4
80001f70:	01089893          	slli	a7,a7,0x10
80001f74:	03078eb3          	mul	t4,a5,a6
80001f78:	01031793          	slli	a5,t1,0x10
80001f7c:	0107d793          	srli	a5,a5,0x10
80001f80:	00f8e7b3          	or	a5,a7,a5
80001f84:	00080713          	mv	a4,a6
80001f88:	01d7fe63          	bgeu	a5,t4,80001fa4 <__udivdi3+0x3a4>
80001f8c:	00d787b3          	add	a5,a5,a3
80001f90:	fff80713          	addi	a4,a6,-1
80001f94:	00d7e863          	bltu	a5,a3,80001fa4 <__udivdi3+0x3a4>
80001f98:	01d7f663          	bgeu	a5,t4,80001fa4 <__udivdi3+0x3a4>
80001f9c:	ffe80713          	addi	a4,a6,-2
80001fa0:	00d787b3          	add	a5,a5,a3
80001fa4:	010e1e13          	slli	t3,t3,0x10
80001fa8:	41d787b3          	sub	a5,a5,t4
80001fac:	00010eb7          	lui	t4,0x10
80001fb0:	00ee6733          	or	a4,t3,a4
80001fb4:	fffe8813          	addi	a6,t4,-1 # ffff <_tbss_end+0xffbb>
80001fb8:	01077333          	and	t1,a4,a6
80001fbc:	01075893          	srli	a7,a4,0x10
80001fc0:	01067833          	and	a6,a2,a6
80001fc4:	01065613          	srli	a2,a2,0x10
80001fc8:	03030e33          	mul	t3,t1,a6
80001fcc:	03088833          	mul	a6,a7,a6
80001fd0:	010e5693          	srli	a3,t3,0x10
80001fd4:	02c30333          	mul	t1,t1,a2
80001fd8:	01030333          	add	t1,t1,a6
80001fdc:	006686b3          	add	a3,a3,t1
80001fe0:	02c888b3          	mul	a7,a7,a2
80001fe4:	0106f463          	bgeu	a3,a6,80001fec <__udivdi3+0x3ec>
80001fe8:	01d888b3          	add	a7,a7,t4
80001fec:	0106d613          	srli	a2,a3,0x10
80001ff0:	011608b3          	add	a7,a2,a7
80001ff4:	0317e663          	bltu	a5,a7,80002020 <__udivdi3+0x420>
80001ff8:	cf179ae3          	bne	a5,a7,80001cec <__udivdi3+0xec>
80001ffc:	000107b7          	lui	a5,0x10
80002000:	fff78793          	addi	a5,a5,-1 # ffff <_tbss_end+0xffbb>
80002004:	00f6f6b3          	and	a3,a3,a5
80002008:	01069693          	slli	a3,a3,0x10
8000200c:	00fe7e33          	and	t3,t3,a5
80002010:	00b51533          	sll	a0,a0,a1
80002014:	01c686b3          	add	a3,a3,t3
80002018:	00000593          	li	a1,0
8000201c:	dad57ce3          	bgeu	a0,a3,80001dd4 <__udivdi3+0x1d4>
80002020:	fff70713          	addi	a4,a4,-1
80002024:	cc9ff06f          	j	80001cec <__udivdi3+0xec>
80002028:	00000593          	li	a1,0
8000202c:	00000713          	li	a4,0
80002030:	da5ff06f          	j	80001dd4 <__udivdi3+0x1d4>

80002034 <__umoddi3>:
80002034:	00060893          	mv	a7,a2
80002038:	00068713          	mv	a4,a3
8000203c:	00050793          	mv	a5,a0
80002040:	00058813          	mv	a6,a1
80002044:	22069c63          	bnez	a3,8000227c <__umoddi3+0x248>
80002048:	800046b7          	lui	a3,0x80004
8000204c:	b3068693          	addi	a3,a3,-1232 # 80003b30 <__global_pointer$+0xfffff68c>
80002050:	0cc5fc63          	bgeu	a1,a2,80002128 <__umoddi3+0xf4>
80002054:	00010337          	lui	t1,0x10
80002058:	0a667e63          	bgeu	a2,t1,80002114 <__umoddi3+0xe0>
8000205c:	0ff00313          	li	t1,255
80002060:	00c37463          	bgeu	t1,a2,80002068 <__umoddi3+0x34>
80002064:	00800713          	li	a4,8
80002068:	00e65333          	srl	t1,a2,a4
8000206c:	006686b3          	add	a3,a3,t1
80002070:	0006ce03          	lbu	t3,0(a3)
80002074:	02000313          	li	t1,32
80002078:	00ee0e33          	add	t3,t3,a4
8000207c:	41c30333          	sub	t1,t1,t3
80002080:	00030c63          	beqz	t1,80002098 <__umoddi3+0x64>
80002084:	006595b3          	sll	a1,a1,t1
80002088:	01c55e33          	srl	t3,a0,t3
8000208c:	006618b3          	sll	a7,a2,t1
80002090:	00be6833          	or	a6,t3,a1
80002094:	006517b3          	sll	a5,a0,t1
80002098:	0108d613          	srli	a2,a7,0x10
8000209c:	02c87733          	remu	a4,a6,a2
800020a0:	01089513          	slli	a0,a7,0x10
800020a4:	01055513          	srli	a0,a0,0x10
800020a8:	0107d693          	srli	a3,a5,0x10
800020ac:	02c85833          	divu	a6,a6,a2
800020b0:	01071713          	slli	a4,a4,0x10
800020b4:	00d766b3          	or	a3,a4,a3
800020b8:	03050833          	mul	a6,a0,a6
800020bc:	0106fa63          	bgeu	a3,a6,800020d0 <__umoddi3+0x9c>
800020c0:	011686b3          	add	a3,a3,a7
800020c4:	0116e663          	bltu	a3,a7,800020d0 <__umoddi3+0x9c>
800020c8:	0106f463          	bgeu	a3,a6,800020d0 <__umoddi3+0x9c>
800020cc:	011686b3          	add	a3,a3,a7
800020d0:	410686b3          	sub	a3,a3,a6
800020d4:	02c6f733          	remu	a4,a3,a2
800020d8:	01079793          	slli	a5,a5,0x10
800020dc:	0107d793          	srli	a5,a5,0x10
800020e0:	02c6d6b3          	divu	a3,a3,a2
800020e4:	02d506b3          	mul	a3,a0,a3
800020e8:	01071513          	slli	a0,a4,0x10
800020ec:	00f567b3          	or	a5,a0,a5
800020f0:	00d7fa63          	bgeu	a5,a3,80002104 <__umoddi3+0xd0>
800020f4:	011787b3          	add	a5,a5,a7
800020f8:	0117e663          	bltu	a5,a7,80002104 <__umoddi3+0xd0>
800020fc:	00d7f463          	bgeu	a5,a3,80002104 <__umoddi3+0xd0>
80002100:	011787b3          	add	a5,a5,a7
80002104:	40d787b3          	sub	a5,a5,a3
80002108:	0067d533          	srl	a0,a5,t1
8000210c:	00000593          	li	a1,0
80002110:	00008067          	ret
80002114:	01000337          	lui	t1,0x1000
80002118:	01000713          	li	a4,16
8000211c:	f46666e3          	bltu	a2,t1,80002068 <__umoddi3+0x34>
80002120:	01800713          	li	a4,24
80002124:	f45ff06f          	j	80002068 <__umoddi3+0x34>
80002128:	00061663          	bnez	a2,80002134 <__umoddi3+0x100>
8000212c:	00100613          	li	a2,1
80002130:	031658b3          	divu	a7,a2,a7
80002134:	00010637          	lui	a2,0x10
80002138:	0ac8f263          	bgeu	a7,a2,800021dc <__umoddi3+0x1a8>
8000213c:	0ff00613          	li	a2,255
80002140:	01167463          	bgeu	a2,a7,80002148 <__umoddi3+0x114>
80002144:	00800713          	li	a4,8
80002148:	00e8d633          	srl	a2,a7,a4
8000214c:	00c686b3          	add	a3,a3,a2
80002150:	0006ce03          	lbu	t3,0(a3)
80002154:	02000313          	li	t1,32
80002158:	00ee0e33          	add	t3,t3,a4
8000215c:	41c30333          	sub	t1,t1,t3
80002160:	08031863          	bnez	t1,800021f0 <__umoddi3+0x1bc>
80002164:	411585b3          	sub	a1,a1,a7
80002168:	0108d713          	srli	a4,a7,0x10
8000216c:	01089513          	slli	a0,a7,0x10
80002170:	01055513          	srli	a0,a0,0x10
80002174:	0107d613          	srli	a2,a5,0x10
80002178:	02e5f6b3          	remu	a3,a1,a4
8000217c:	02e5d5b3          	divu	a1,a1,a4
80002180:	01069693          	slli	a3,a3,0x10
80002184:	00c6e6b3          	or	a3,a3,a2
80002188:	02b505b3          	mul	a1,a0,a1
8000218c:	00b6fa63          	bgeu	a3,a1,800021a0 <__umoddi3+0x16c>
80002190:	011686b3          	add	a3,a3,a7
80002194:	0116e663          	bltu	a3,a7,800021a0 <__umoddi3+0x16c>
80002198:	00b6f463          	bgeu	a3,a1,800021a0 <__umoddi3+0x16c>
8000219c:	011686b3          	add	a3,a3,a7
800021a0:	40b685b3          	sub	a1,a3,a1
800021a4:	02e5f6b3          	remu	a3,a1,a4
800021a8:	01079793          	slli	a5,a5,0x10
800021ac:	0107d793          	srli	a5,a5,0x10
800021b0:	02e5d5b3          	divu	a1,a1,a4
800021b4:	02b505b3          	mul	a1,a0,a1
800021b8:	01069513          	slli	a0,a3,0x10
800021bc:	00f567b3          	or	a5,a0,a5
800021c0:	00b7fa63          	bgeu	a5,a1,800021d4 <__umoddi3+0x1a0>
800021c4:	011787b3          	add	a5,a5,a7
800021c8:	0117e663          	bltu	a5,a7,800021d4 <__umoddi3+0x1a0>
800021cc:	00b7f463          	bgeu	a5,a1,800021d4 <__umoddi3+0x1a0>
800021d0:	011787b3          	add	a5,a5,a7
800021d4:	40b787b3          	sub	a5,a5,a1
800021d8:	f31ff06f          	j	80002108 <__umoddi3+0xd4>
800021dc:	01000637          	lui	a2,0x1000
800021e0:	01000713          	li	a4,16
800021e4:	f6c8e2e3          	bltu	a7,a2,80002148 <__umoddi3+0x114>
800021e8:	01800713          	li	a4,24
800021ec:	f5dff06f          	j	80002148 <__umoddi3+0x114>
800021f0:	006898b3          	sll	a7,a7,t1
800021f4:	01c5d733          	srl	a4,a1,t3
800021f8:	006517b3          	sll	a5,a0,t1
800021fc:	01c55e33          	srl	t3,a0,t3
80002200:	0108d513          	srli	a0,a7,0x10
80002204:	02a776b3          	remu	a3,a4,a0
80002208:	006595b3          	sll	a1,a1,t1
8000220c:	00be6e33          	or	t3,t3,a1
80002210:	01089593          	slli	a1,a7,0x10
80002214:	0105d593          	srli	a1,a1,0x10
80002218:	010e5613          	srli	a2,t3,0x10
8000221c:	02a75733          	divu	a4,a4,a0
80002220:	01069693          	slli	a3,a3,0x10
80002224:	00c6e6b3          	or	a3,a3,a2
80002228:	02e58733          	mul	a4,a1,a4
8000222c:	00e6fa63          	bgeu	a3,a4,80002240 <__umoddi3+0x20c>
80002230:	011686b3          	add	a3,a3,a7
80002234:	0116e663          	bltu	a3,a7,80002240 <__umoddi3+0x20c>
80002238:	00e6f463          	bgeu	a3,a4,80002240 <__umoddi3+0x20c>
8000223c:	011686b3          	add	a3,a3,a7
80002240:	40e68633          	sub	a2,a3,a4
80002244:	02a676b3          	remu	a3,a2,a0
80002248:	010e1e13          	slli	t3,t3,0x10
8000224c:	010e5e13          	srli	t3,t3,0x10
80002250:	02a65633          	divu	a2,a2,a0
80002254:	01069693          	slli	a3,a3,0x10
80002258:	02c58633          	mul	a2,a1,a2
8000225c:	01c6e5b3          	or	a1,a3,t3
80002260:	00c5fa63          	bgeu	a1,a2,80002274 <__umoddi3+0x240>
80002264:	011585b3          	add	a1,a1,a7
80002268:	0115e663          	bltu	a1,a7,80002274 <__umoddi3+0x240>
8000226c:	00c5f463          	bgeu	a1,a2,80002274 <__umoddi3+0x240>
80002270:	011585b3          	add	a1,a1,a7
80002274:	40c585b3          	sub	a1,a1,a2
80002278:	ef1ff06f          	j	80002168 <__umoddi3+0x134>
8000227c:	e8d5eae3          	bltu	a1,a3,80002110 <__umoddi3+0xdc>
80002280:	00010737          	lui	a4,0x10
80002284:	04e6fc63          	bgeu	a3,a4,800022dc <__umoddi3+0x2a8>
80002288:	0ff00e93          	li	t4,255
8000228c:	00deb733          	sltu	a4,t4,a3
80002290:	00371713          	slli	a4,a4,0x3
80002294:	80004337          	lui	t1,0x80004
80002298:	00e6d8b3          	srl	a7,a3,a4
8000229c:	b3030313          	addi	t1,t1,-1232 # 80003b30 <__global_pointer$+0xfffff68c>
800022a0:	006888b3          	add	a7,a7,t1
800022a4:	0008ce83          	lbu	t4,0(a7) # 1000000 <_tbss_end+0xffffbc>
800022a8:	02000e13          	li	t3,32
800022ac:	00ee8eb3          	add	t4,t4,a4
800022b0:	41de0e33          	sub	t3,t3,t4
800022b4:	020e1e63          	bnez	t3,800022f0 <__umoddi3+0x2bc>
800022b8:	00b6e463          	bltu	a3,a1,800022c0 <__umoddi3+0x28c>
800022bc:	00c56a63          	bltu	a0,a2,800022d0 <__umoddi3+0x29c>
800022c0:	40c507b3          	sub	a5,a0,a2
800022c4:	40d585b3          	sub	a1,a1,a3
800022c8:	00f53533          	sltu	a0,a0,a5
800022cc:	40a58833          	sub	a6,a1,a0
800022d0:	00078513          	mv	a0,a5
800022d4:	00080593          	mv	a1,a6
800022d8:	e39ff06f          	j	80002110 <__umoddi3+0xdc>
800022dc:	010008b7          	lui	a7,0x1000
800022e0:	01000713          	li	a4,16
800022e4:	fb16e8e3          	bltu	a3,a7,80002294 <__umoddi3+0x260>
800022e8:	01800713          	li	a4,24
800022ec:	fa9ff06f          	j	80002294 <__umoddi3+0x260>
800022f0:	01d65733          	srl	a4,a2,t4
800022f4:	01c696b3          	sll	a3,a3,t3
800022f8:	00d766b3          	or	a3,a4,a3
800022fc:	0106d813          	srli	a6,a3,0x10
80002300:	01d5d733          	srl	a4,a1,t4
80002304:	03077333          	remu	t1,a4,a6
80002308:	01c595b3          	sll	a1,a1,t3
8000230c:	01d557b3          	srl	a5,a0,t4
80002310:	00b7e7b3          	or	a5,a5,a1
80002314:	01069593          	slli	a1,a3,0x10
80002318:	0105d593          	srli	a1,a1,0x10
8000231c:	0107d893          	srli	a7,a5,0x10
80002320:	01c61633          	sll	a2,a2,t3
80002324:	01c51533          	sll	a0,a0,t3
80002328:	03075733          	divu	a4,a4,a6
8000232c:	01031313          	slli	t1,t1,0x10
80002330:	011368b3          	or	a7,t1,a7
80002334:	02e58f33          	mul	t5,a1,a4
80002338:	00070313          	mv	t1,a4
8000233c:	01e8fe63          	bgeu	a7,t5,80002358 <__umoddi3+0x324>
80002340:	00d888b3          	add	a7,a7,a3
80002344:	fff70313          	addi	t1,a4,-1 # ffff <_tbss_end+0xffbb>
80002348:	00d8e863          	bltu	a7,a3,80002358 <__umoddi3+0x324>
8000234c:	01e8f663          	bgeu	a7,t5,80002358 <__umoddi3+0x324>
80002350:	ffe70313          	addi	t1,a4,-2
80002354:	00d888b3          	add	a7,a7,a3
80002358:	41e888b3          	sub	a7,a7,t5
8000235c:	0308ff33          	remu	t5,a7,a6
80002360:	0308d8b3          	divu	a7,a7,a6
80002364:	010f1f13          	slli	t5,t5,0x10
80002368:	03158833          	mul	a6,a1,a7
8000236c:	01079593          	slli	a1,a5,0x10
80002370:	0105d593          	srli	a1,a1,0x10
80002374:	00bf65b3          	or	a1,t5,a1
80002378:	00088793          	mv	a5,a7
8000237c:	0105fe63          	bgeu	a1,a6,80002398 <__umoddi3+0x364>
80002380:	00d585b3          	add	a1,a1,a3
80002384:	fff88793          	addi	a5,a7,-1 # ffffff <_tbss_end+0xffffbb>
80002388:	00d5e863          	bltu	a1,a3,80002398 <__umoddi3+0x364>
8000238c:	0105f663          	bgeu	a1,a6,80002398 <__umoddi3+0x364>
80002390:	ffe88793          	addi	a5,a7,-2
80002394:	00d585b3          	add	a1,a1,a3
80002398:	01031313          	slli	t1,t1,0x10
8000239c:	00010f37          	lui	t5,0x10
800023a0:	00f36333          	or	t1,t1,a5
800023a4:	ffff0793          	addi	a5,t5,-1 # ffff <_tbss_end+0xffbb>
800023a8:	00f378b3          	and	a7,t1,a5
800023ac:	410585b3          	sub	a1,a1,a6
800023b0:	01035313          	srli	t1,t1,0x10
800023b4:	01065813          	srli	a6,a2,0x10
800023b8:	00f677b3          	and	a5,a2,a5
800023bc:	02f88733          	mul	a4,a7,a5
800023c0:	02f307b3          	mul	a5,t1,a5
800023c4:	030888b3          	mul	a7,a7,a6
800023c8:	03030333          	mul	t1,t1,a6
800023cc:	00f888b3          	add	a7,a7,a5
800023d0:	01075813          	srli	a6,a4,0x10
800023d4:	01180833          	add	a6,a6,a7
800023d8:	00f87463          	bgeu	a6,a5,800023e0 <__umoddi3+0x3ac>
800023dc:	01e30333          	add	t1,t1,t5
800023e0:	01085793          	srli	a5,a6,0x10
800023e4:	00678333          	add	t1,a5,t1
800023e8:	000107b7          	lui	a5,0x10
800023ec:	fff78793          	addi	a5,a5,-1 # ffff <_tbss_end+0xffbb>
800023f0:	00f87833          	and	a6,a6,a5
800023f4:	01081813          	slli	a6,a6,0x10
800023f8:	00f77733          	and	a4,a4,a5
800023fc:	00e80733          	add	a4,a6,a4
80002400:	0065e663          	bltu	a1,t1,8000240c <__umoddi3+0x3d8>
80002404:	00659e63          	bne	a1,t1,80002420 <__umoddi3+0x3ec>
80002408:	00e57c63          	bgeu	a0,a4,80002420 <__umoddi3+0x3ec>
8000240c:	40c70633          	sub	a2,a4,a2
80002410:	00c73733          	sltu	a4,a4,a2
80002414:	00d70733          	add	a4,a4,a3
80002418:	40e30333          	sub	t1,t1,a4
8000241c:	00060713          	mv	a4,a2
80002420:	40e50733          	sub	a4,a0,a4
80002424:	00e53533          	sltu	a0,a0,a4
80002428:	406585b3          	sub	a1,a1,t1
8000242c:	40a585b3          	sub	a1,a1,a0
80002430:	01d597b3          	sll	a5,a1,t4
80002434:	01c75733          	srl	a4,a4,t3
80002438:	00e7e533          	or	a0,a5,a4
8000243c:	01c5d5b3          	srl	a1,a1,t3
80002440:	cd1ff06f          	j	80002110 <__umoddi3+0xdc>

80002444 <esp_open>:
80002444:	8082                	ret

80002446 <esp_done>:
80002446:	1141                	addi	sp,sp,-16
80002448:	c04a                	sw	s2,0(sp)
8000244a:	00002917          	auipc	s2,0x2
8000244e:	87290913          	addi	s2,s2,-1934 # 80003cbc <ndev>
80002452:	00092603          	lw	a2,0(s2)
80002456:	4198                	lw	a4,0(a1)
80002458:	c606                	sw	ra,12(sp)
8000245a:	00661793          	slli	a5,a2,0x6
8000245e:	97ba                	add	a5,a5,a4
80002460:	4f9c                	lw	a5,24(a5)
80002462:	c422                	sw	s0,8(sp)
80002464:	c226                	sw	s1,4(sp)
80002466:	e799                	bnez	a5,80002474 <esp_done+0x2e>
80002468:	40b2                	lw	ra,12(sp)
8000246a:	4422                	lw	s0,8(sp)
8000246c:	4492                	lw	s1,4(sp)
8000246e:	4902                	lw	s2,0(sp)
80002470:	0141                	addi	sp,sp,16
80002472:	8082                	ret
80002474:	01c70493          	addi	s1,a4,28
80002478:	842e                	mv	s0,a1
8000247a:	00001517          	auipc	a0,0x1
8000247e:	3e250513          	addi	a0,a0,994 # 8000385c <main+0x96a>
80002482:	85a6                	mv	a1,s1
80002484:	8a6ff0ef          	jal	ra,8000152a <printf>
80002488:	00092703          	lw	a4,0(s2)
8000248c:	401c                	lw	a5,0(s0)
8000248e:	00001517          	auipc	a0,0x1
80002492:	3ea50513          	addi	a0,a0,1002 # 80003878 <main+0x986>
80002496:	071a                	slli	a4,a4,0x6
80002498:	97ba                	add	a5,a5,a4
8000249a:	4b8c                	lw	a1,16(a5)
8000249c:	88eff0ef          	jal	ra,8000152a <printf>
800024a0:	00092703          	lw	a4,0(s2)
800024a4:	401c                	lw	a5,0(s0)
800024a6:	00001517          	auipc	a0,0x1
800024aa:	3ea50513          	addi	a0,a0,1002 # 80003890 <main+0x99e>
800024ae:	071a                	slli	a4,a4,0x6
800024b0:	97ba                	add	a5,a5,a4
800024b2:	47cc                	lw	a1,12(a5)
800024b4:	876ff0ef          	jal	ra,8000152a <printf>
800024b8:	00092783          	lw	a5,0(s2)
800024bc:	4008                	lw	a0,0(s0)
800024be:	4422                	lw	s0,8(sp)
800024c0:	0785                	addi	a5,a5,1
800024c2:	00679713          	slli	a4,a5,0x6
800024c6:	953a                	add	a0,a0,a4
800024c8:	40b2                	lw	ra,12(sp)
800024ca:	4902                	lw	s2,0(sp)
800024cc:	85a6                	mv	a1,s1
800024ce:	4492                	lw	s1,4(sp)
800024d0:	c51c                	sw	a5,8(a0)
800024d2:	00052c23          	sw	zero,24(a0)
800024d6:	00001717          	auipc	a4,0x1
800024da:	7ef72323          	sw	a5,2022(a4) # 80003cbc <ndev>
800024de:	0571                	addi	a0,a0,28
800024e0:	0141                	addi	sp,sp,16
800024e2:	a4eff06f          	j	80001730 <strcpy>

800024e6 <esp_prop>:
800024e6:	1141                	addi	sp,sp,-16
800024e8:	c422                	sw	s0,8(sp)
800024ea:	4140                	lw	s0,4(a0)
800024ec:	c226                	sw	s1,4(sp)
800024ee:	c04a                	sw	s2,0(sp)
800024f0:	84aa                	mv	s1,a0
800024f2:	0005a903          	lw	s2,0(a1) # 1000000 <_tbss_end+0xffffbc>
800024f6:	8522                	mv	a0,s0
800024f8:	00001597          	auipc	a1,0x1
800024fc:	3ac58593          	addi	a1,a1,940 # 800038a4 <main+0x9b2>
80002500:	c606                	sw	ra,12(sp)
80002502:	a12ff0ef          	jal	ra,80001714 <strcmp>
80002506:	e519                	bnez	a0,80002514 <esp_prop+0x2e>
80002508:	4488                	lw	a0,8(s1)
8000250a:	01c90593          	addi	a1,s2,28
8000250e:	a06ff0ef          	jal	ra,80001714 <strcmp>
80002512:	c51d                	beqz	a0,80002540 <esp_prop+0x5a>
80002514:	00001597          	auipc	a1,0x1
80002518:	39c58593          	addi	a1,a1,924 # 800038b0 <main+0x9be>
8000251c:	8522                	mv	a0,s0
8000251e:	9f6ff0ef          	jal	ra,80001714 <strcmp>
80002522:	cd1d                	beqz	a0,80002560 <esp_prop+0x7a>
80002524:	00001597          	auipc	a1,0x1
80002528:	39058593          	addi	a1,a1,912 # 800038b4 <main+0x9c2>
8000252c:	8522                	mv	a0,s0
8000252e:	9e6ff0ef          	jal	ra,80001714 <strcmp>
80002532:	c929                	beqz	a0,80002584 <esp_prop+0x9e>
80002534:	40b2                	lw	ra,12(sp)
80002536:	4422                	lw	s0,8(sp)
80002538:	4492                	lw	s1,4(sp)
8000253a:	4902                	lw	s2,0(sp)
8000253c:	0141                	addi	sp,sp,16
8000253e:	8082                	ret
80002540:	00001797          	auipc	a5,0x1
80002544:	77c78793          	addi	a5,a5,1916 # 80003cbc <ndev>
80002548:	4390                	lw	a2,0(a5)
8000254a:	40b2                	lw	ra,12(sp)
8000254c:	4422                	lw	s0,8(sp)
8000254e:	061a                	slli	a2,a2,0x6
80002550:	9932                	add	s2,s2,a2
80002552:	4785                	li	a5,1
80002554:	00f92c23          	sw	a5,24(s2)
80002558:	4492                	lw	s1,4(sp)
8000255a:	4902                	lw	s2,0(sp)
8000255c:	0141                	addi	sp,sp,16
8000255e:	8082                	ret
80002560:	00001797          	auipc	a5,0x1
80002564:	75c78793          	addi	a5,a5,1884 # 80003cbc <ndev>
80002568:	4390                	lw	a2,0(a5)
8000256a:	409c                	lw	a5,0(s1)
8000256c:	4422                	lw	s0,8(sp)
8000256e:	061a                	slli	a2,a2,0x6
80002570:	448c                	lw	a1,8(s1)
80002572:	964a                	add	a2,a2,s2
80002574:	40b2                	lw	ra,12(sp)
80002576:	4492                	lw	s1,4(sp)
80002578:	4902                	lw	s2,0(sp)
8000257a:	4388                	lw	a0,0(a5)
8000257c:	0641                	addi	a2,a2,16
8000257e:	0141                	addi	sp,sp,16
80002580:	02b0006f          	j	80002daa <fdt_get_address>
80002584:	00001797          	auipc	a5,0x1
80002588:	73878793          	addi	a5,a5,1848 # 80003cbc <ndev>
8000258c:	4390                	lw	a2,0(a5)
8000258e:	8526                	mv	a0,s1
80002590:	4581                	li	a1,0
80002592:	061a                	slli	a2,a2,0x6
80002594:	9932                	add	s2,s2,a2
80002596:	0d1000ef          	jal	ra,80002e66 <fdt_get_value>
8000259a:	40b2                	lw	ra,12(sp)
8000259c:	4422                	lw	s0,8(sp)
8000259e:	00a92623          	sw	a0,12(s2)
800025a2:	4492                	lw	s1,4(sp)
800025a4:	4902                	lw	s2,0(sp)
800025a6:	0141                	addi	sp,sp,16
800025a8:	8082                	ret

800025aa <get_pid>:
800025aa:	f1402573          	csrr	a0,mhartid
800025ae:	8082                	ret

800025b0 <aligned_malloc>:
800025b0:	00001697          	auipc	a3,0x1
800025b4:	6f468693          	addi	a3,a3,1780 # 80003ca4 <uncached_area_ptr>
800025b8:	4298                	lw	a4,0(a3)
800025ba:	01470793          	addi	a5,a4,20
800025be:	00a78633          	add	a2,a5,a0
800025c2:	ff07f513          	andi	a0,a5,-16
800025c6:	c290                	sw	a2,0(a3)
800025c8:	fee52e23          	sw	a4,-4(a0)
800025cc:	8082                	ret

800025ce <aligned_free>:
800025ce:	8082                	ret

800025d0 <probe>:
800025d0:	00001717          	auipc	a4,0x1
800025d4:	6d470713          	addi	a4,a4,1748 # 80003ca4 <uncached_area_ptr>
800025d8:	431c                	lw	a5,0(a4)
800025da:	7139                	addi	sp,sp,-64
800025dc:	dc22                	sw	s0,56(sp)
800025de:	842a                	mv	s0,a0
800025e0:	01478513          	addi	a0,a5,20
800025e4:	de06                	sw	ra,60(sp)
800025e6:	da26                	sw	s1,52(sp)
800025e8:	d84a                	sw	s2,48(sp)
800025ea:	d64e                	sw	s3,44(sp)
800025ec:	d452                	sw	s4,40(sp)
800025ee:	680d                	lui	a6,0x3
800025f0:	9941                	andi	a0,a0,-16
800025f2:	61480893          	addi	a7,a6,1556 # 3614 <_tbss_end+0x35d0>
800025f6:	fef52e23          	sw	a5,-4(a0)
800025fa:	89ae                	mv	s3,a1
800025fc:	97c6                	add	a5,a5,a7
800025fe:	8932                	mv	s2,a2
80002600:	00001497          	auipc	s1,0x1
80002604:	6bc48493          	addi	s1,s1,1724 # 80003cbc <ndev>
80002608:	60080613          	addi	a2,a6,1536
8000260c:	4581                	li	a1,0
8000260e:	c008                	sw	a0,0(s0)
80002610:	8a36                	mv	s4,a3
80002612:	c31c                	sw	a5,0(a4)
80002614:	0004a023          	sw	zero,0(s1)
80002618:	fc3fe0ef          	jal	ra,800015da <memset>
8000261c:	4008                	lw	a0,0(s0)
8000261e:	85d2                	mv	a1,s4
80002620:	01352023          	sw	s3,0(a0)
80002624:	01252223          	sw	s2,4(a0)
80002628:	00052423          	sw	zero,8(a0)
8000262c:	00052c23          	sw	zero,24(a0)
80002630:	0571                	addi	a0,a0,28
80002632:	8feff0ef          	jal	ra,80001730 <strcpy>
80002636:	00001797          	auipc	a5,0x1
8000263a:	67278793          	addi	a5,a5,1650 # 80003ca8 <dtb>
8000263e:	4388                	lw	a0,0(a5)
80002640:	00000797          	auipc	a5,0x0
80002644:	e0478793          	addi	a5,a5,-508 # 80002444 <esp_open>
80002648:	c63e                	sw	a5,12(sp)
8000264a:	00000797          	auipc	a5,0x0
8000264e:	e9c78793          	addi	a5,a5,-356 # 800024e6 <esp_prop>
80002652:	c83e                	sw	a5,16(sp)
80002654:	006c                	addi	a1,sp,12
80002656:	00000797          	auipc	a5,0x0
8000265a:	df078793          	addi	a5,a5,-528 # 80002446 <esp_done>
8000265e:	ce22                	sw	s0,28(sp)
80002660:	cc02                	sw	zero,24(sp)
80002662:	ca3e                	sw	a5,20(sp)
80002664:	2d3d                	jal	80002ca2 <fdt_scan>
80002666:	50f2                	lw	ra,60(sp)
80002668:	5462                	lw	s0,56(sp)
8000266a:	4088                	lw	a0,0(s1)
8000266c:	5942                	lw	s2,48(sp)
8000266e:	54d2                	lw	s1,52(sp)
80002670:	59b2                	lw	s3,44(sp)
80002672:	5a22                	lw	s4,40(sp)
80002674:	6121                	addi	sp,sp,64
80002676:	8082                	ret

80002678 <esp_flush>:
80002678:	1101                	addi	sp,sp,-32
8000267a:	ce06                	sw	ra,28(sp)
8000267c:	cc22                	sw	s0,24(sp)
8000267e:	ca26                	sw	s1,20(sp)
80002680:	c402                	sw	zero,8(sp)
80002682:	c602                	sw	zero,12(sp)
80002684:	f14024f3          	csrr	s1,mhartid
80002688:	4785                	li	a5,1
8000268a:	0ef50463          	beq	a0,a5,80002772 <esp_flush+0xfa>
8000268e:	02a7d363          	bge	a5,a0,800026b4 <esp_flush+0x3c>
80002692:	4789                	li	a5,2
80002694:	10f50363          	beq	a0,a5,8000279a <esp_flush+0x122>
80002698:	478d                	li	a5,3
8000269a:	0cf51463          	bne	a0,a5,80002762 <esp_flush+0xea>
8000269e:	00001517          	auipc	a0,0x1
800026a2:	28650513          	addi	a0,a0,646 # 80003924 <main+0xa32>
800026a6:	e85fe0ef          	jal	ra,8000152a <printf>
800026aa:	40f2                	lw	ra,28(sp)
800026ac:	4462                	lw	s0,24(sp)
800026ae:	44d2                	lw	s1,20(sp)
800026b0:	6105                	addi	sp,sp,32
800026b2:	8082                	ret
800026b4:	e55d                	bnez	a0,80002762 <esp_flush+0xea>
800026b6:	00001517          	auipc	a0,0x1
800026ba:	20a50513          	addi	a0,a0,522 # 800038c0 <main+0x9ce>
800026be:	e6dfe0ef          	jal	ra,8000152a <printf>
800026c2:	00001697          	auipc	a3,0x1
800026c6:	21668693          	addi	a3,a3,534 # 800038d8 <main+0x9e6>
800026ca:	02100613          	li	a2,33
800026ce:	0eb00593          	li	a1,235
800026d2:	0028                	addi	a0,sp,8
800026d4:	3df5                	jal	800025d0 <probe>
800026d6:	842a                	mv	s0,a0
800026d8:	00001697          	auipc	a3,0x1
800026dc:	21068693          	addi	a3,a3,528 # 800038e8 <main+0x9f6>
800026e0:	02000613          	li	a2,32
800026e4:	0eb00593          	li	a1,235
800026e8:	0068                	addi	a0,sp,12
800026ea:	35dd                	jal	800025d0 <probe>
800026ec:	02a05c63          	blez	a0,80002724 <esp_flush+0xac>
800026f0:	4832                	lw	a6,12(sp)
800026f2:	4681                	li	a3,0
800026f4:	01080613          	addi	a2,a6,16
800026f8:	4218                	lw	a4,0(a2)
800026fa:	0685                	addi	a3,a3,1
800026fc:	04060613          	addi	a2,a2,64 # 1000040 <_tbss_end+0xfffffc>
80002700:	435c                	lw	a5,4(a4)
80002702:	00470593          	addi	a1,a4,4
80002706:	83f1                	srli	a5,a5,0x1c
80002708:	0a978463          	beq	a5,s1,800027b0 <esp_flush+0x138>
8000270c:	fea6c6e3          	blt	a3,a0,800026f8 <esp_flush+0x80>
80002710:	069a                	slli	a3,a3,0x6
80002712:	96c2                	add	a3,a3,a6
80002714:	4a98                	lw	a4,16(a3)
80002716:	00470593          	addi	a1,a4,4
8000271a:	419c                	lw	a5,0(a1)
8000271c:	8b85                	andi	a5,a5,1
8000271e:	dff5                	beqz	a5,8000271a <esp_flush+0xa2>
80002720:	00072023          	sw	zero,0(a4)
80002724:	f88053e3          	blez	s0,800026aa <esp_flush+0x32>
80002728:	46a2                	lw	a3,8(sp)
8000272a:	00641593          	slli	a1,s0,0x6
8000272e:	4609                	li	a2,2
80002730:	95b6                	add	a1,a1,a3
80002732:	87b6                	mv	a5,a3
80002734:	4b98                	lw	a4,16(a5)
80002736:	04078793          	addi	a5,a5,64
8000273a:	c310                	sw	a2,0(a4)
8000273c:	fef59ce3          	bne	a1,a5,80002734 <esp_flush+0xbc>
80002740:	4a90                	lw	a2,16(a3)
80002742:	00460713          	addi	a4,a2,4
80002746:	431c                	lw	a5,0(a4)
80002748:	8b85                	andi	a5,a5,1
8000274a:	dff5                	beqz	a5,80002746 <esp_flush+0xce>
8000274c:	00062023          	sw	zero,0(a2)
80002750:	04068693          	addi	a3,a3,64
80002754:	fed596e3          	bne	a1,a3,80002740 <esp_flush+0xc8>
80002758:	40f2                	lw	ra,28(sp)
8000275a:	4462                	lw	s0,24(sp)
8000275c:	44d2                	lw	s1,20(sp)
8000275e:	6105                	addi	sp,sp,32
80002760:	8082                	ret
80002762:	4785                	li	a5,1
80002764:	00a7dd63          	bge	a5,a0,8000277e <esp_flush+0x106>
80002768:	40f2                	lw	ra,28(sp)
8000276a:	4462                	lw	s0,24(sp)
8000276c:	44d2                	lw	s1,20(sp)
8000276e:	6105                	addi	sp,sp,32
80002770:	8082                	ret
80002772:	00001517          	auipc	a0,0x1
80002776:	18650513          	addi	a0,a0,390 # 800038f8 <main+0xa06>
8000277a:	db1fe0ef          	jal	ra,8000152a <printf>
8000277e:	00001697          	auipc	a3,0x1
80002782:	16a68693          	addi	a3,a3,362 # 800038e8 <main+0x9f6>
80002786:	02000613          	li	a2,32
8000278a:	0eb00593          	li	a1,235
8000278e:	0068                	addi	a0,sp,12
80002790:	3581                	jal	800025d0 <probe>
80002792:	4401                	li	s0,0
80002794:	f4a04ee3          	bgtz	a0,800026f0 <esp_flush+0x78>
80002798:	bf09                	j	800026aa <esp_flush+0x32>
8000279a:	00001517          	auipc	a0,0x1
8000279e:	17650513          	addi	a0,a0,374 # 80003910 <main+0xa1e>
800027a2:	d89fe0ef          	jal	ra,8000152a <printf>
800027a6:	40f2                	lw	ra,28(sp)
800027a8:	4462                	lw	s0,24(sp)
800027aa:	44d2                	lw	s1,20(sp)
800027ac:	6105                	addi	sp,sp,32
800027ae:	8082                	ret
800027b0:	4789                	li	a5,2
800027b2:	c31c                	sw	a5,0(a4)
800027b4:	b79d                	j	8000271a <esp_flush+0xa2>

800027b6 <ioread32>:
800027b6:	491c                	lw	a5,16(a0)
800027b8:	95be                	add	a1,a1,a5
800027ba:	4188                	lw	a0,0(a1)
800027bc:	8082                	ret

800027be <iowrite32>:
800027be:	491c                	lw	a5,16(a0)
800027c0:	95be                	add	a1,a1,a5
800027c2:	c190                	sw	a2,0(a1)
800027c4:	8082                	ret

800027c6 <esp_p2p_init>:
800027c6:	491c                	lw	a5,16(a0)
800027c8:	fff60713          	addi	a4,a2,-1
800027cc:	8b0d                	andi	a4,a4,3
800027ce:	0207a223          	sw	zero,36(a5)
800027d2:	53d4                	lw	a3,36(a5)
800027d4:	0046e693          	ori	a3,a3,4
800027d8:	d3d4                	sw	a3,36(a5)
800027da:	53c8                	lw	a0,36(a5)
800027dc:	02478693          	addi	a3,a5,36
800027e0:	8f49                	or	a4,a4,a0
800027e2:	d3d8                	sw	a4,36(a5)
800027e4:	c631                	beqz	a2,80002830 <esp_p2p_init+0x6a>
800027e6:	061a                	slli	a2,a2,0x6
800027e8:	00c588b3          	add	a7,a1,a2
800027ec:	461d                	li	a2,7
800027ee:	4998                	lw	a4,16(a1)
800027f0:	ffd60513          	addi	a0,a2,-3
800027f4:	04058593          	addi	a1,a1,64
800027f8:	535c                	lw	a5,36(a4)
800027fa:	0087e793          	ori	a5,a5,8
800027fe:	d35c                	sw	a5,36(a4)
80002800:	0006a803          	lw	a6,0(a3)
80002804:	18072783          	lw	a5,384(a4)
80002808:	838d                	srli	a5,a5,0x3
8000280a:	8b9d                	andi	a5,a5,7
8000280c:	00c797b3          	sll	a5,a5,a2
80002810:	0107e7b3          	or	a5,a5,a6
80002814:	c29c                	sw	a5,0(a3)
80002816:	0006a803          	lw	a6,0(a3)
8000281a:	18072703          	lw	a4,384(a4)
8000281e:	0619                	addi	a2,a2,6
80002820:	8b1d                	andi	a4,a4,7
80002822:	00a717b3          	sll	a5,a4,a0
80002826:	0107e7b3          	or	a5,a5,a6
8000282a:	c29c                	sw	a5,0(a3)
8000282c:	fcb891e3          	bne	a7,a1,800027ee <esp_p2p_init+0x28>
80002830:	8082                	ret

80002832 <esp_set_acc_yx_table>:
80002832:	ce39                	beqz	a2,80002890 <esp_set_acc_yx_table+0x5e>
80002834:	01052e03          	lw	t3,16(a0)
80002838:	05c1                	addi	a1,a1,16
8000283a:	0605                	addi	a2,a2,1
8000283c:	4505                	li	a0,1
8000283e:	0005a803          	lw	a6,0(a1)
80002842:	ffc57713          	andi	a4,a0,-4
80002846:	18070713          	addi	a4,a4,384
8000284a:	9772                	add	a4,a4,t3
8000284c:	00072303          	lw	t1,0(a4)
80002850:	00357893          	andi	a7,a0,3
80002854:	18082783          	lw	a5,384(a6)
80002858:	00189693          	slli	a3,a7,0x1
8000285c:	96c6                	add	a3,a3,a7
8000285e:	0686                	slli	a3,a3,0x1
80002860:	838d                	srli	a5,a5,0x3
80002862:	00368893          	addi	a7,a3,3
80002866:	8b9d                	andi	a5,a5,7
80002868:	011797b3          	sll	a5,a5,a7
8000286c:	0067e7b3          	or	a5,a5,t1
80002870:	c31c                	sw	a5,0(a4)
80002872:	00072883          	lw	a7,0(a4)
80002876:	18082783          	lw	a5,384(a6)
8000287a:	0505                	addi	a0,a0,1
8000287c:	04058593          	addi	a1,a1,64
80002880:	8b9d                	andi	a5,a5,7
80002882:	00d797b3          	sll	a5,a5,a3
80002886:	0117e7b3          	or	a5,a5,a7
8000288a:	c31c                	sw	a5,0(a4)
8000288c:	fac519e3          	bne	a0,a2,8000283e <esp_set_acc_yx_table+0xc>
80002890:	8082                	ret

80002892 <write_reg_u32>:
80002892:	c10c                	sw	a1,0(a0)
80002894:	8082                	ret

80002896 <read_reg_u32>:
80002896:	4108                	lw	a0,0(a0)
80002898:	8082                	ret

8000289a <is_transmit_empty>:
8000289a:	600007b7          	lui	a5,0x60000
8000289e:	1047a503          	lw	a0,260(a5) # 60000104 <_tbss_end+0x600000c0>
800028a2:	8911                	andi	a0,a0,4
800028a4:	8082                	ret

800028a6 <wait_uart_tx>:
800028a6:	60000737          	lui	a4,0x60000
800028aa:	10472783          	lw	a5,260(a4) # 60000104 <_tbss_end+0x600000c0>
800028ae:	8b91                	andi	a5,a5,4
800028b0:	dfed                	beqz	a5,800028aa <wait_uart_tx+0x4>
800028b2:	8082                	ret

800028b4 <write_serial>:
800028b4:	47a9                	li	a5,10
800028b6:	60000737          	lui	a4,0x60000
800028ba:	00f50f63          	beq	a0,a5,800028d8 <write_serial+0x24>
800028be:	10472783          	lw	a5,260(a4) # 60000104 <_tbss_end+0x600000c0>
800028c2:	8b91                	andi	a5,a5,4
800028c4:	dfed                	beqz	a5,800028be <write_serial+0xa>
800028c6:	10a72023          	sw	a0,256(a4)
800028ca:	60000737          	lui	a4,0x60000
800028ce:	10472783          	lw	a5,260(a4) # 60000104 <_tbss_end+0x600000c0>
800028d2:	8b91                	andi	a5,a5,4
800028d4:	dfed                	beqz	a5,800028ce <write_serial+0x1a>
800028d6:	8082                	ret
800028d8:	10472783          	lw	a5,260(a4)
800028dc:	8b91                	andi	a5,a5,4
800028de:	dfed                	beqz	a5,800028d8 <write_serial+0x24>
800028e0:	47a9                	li	a5,10
800028e2:	10f72023          	sw	a5,256(a4)
800028e6:	60000737          	lui	a4,0x60000
800028ea:	10472783          	lw	a5,260(a4) # 60000104 <_tbss_end+0x600000c0>
800028ee:	8b91                	andi	a5,a5,4
800028f0:	dfed                	beqz	a5,800028ea <write_serial+0x36>
800028f2:	47b5                	li	a5,13
800028f4:	10f72023          	sw	a5,256(a4)
800028f8:	60000737          	lui	a4,0x60000
800028fc:	10472783          	lw	a5,260(a4) # 60000104 <_tbss_end+0x600000c0>
80002900:	8b91                	andi	a5,a5,4
80002902:	dfed                	beqz	a5,800028fc <write_serial+0x48>
80002904:	8082                	ret

80002906 <print_uart>:
80002906:	1141                	addi	sp,sp,-16
80002908:	c422                	sw	s0,8(sp)
8000290a:	c606                	sw	ra,12(sp)
8000290c:	842a                	mv	s0,a0
8000290e:	00054503          	lbu	a0,0(a0)
80002912:	c511                	beqz	a0,8000291e <print_uart+0x18>
80002914:	0405                	addi	s0,s0,1
80002916:	3f79                	jal	800028b4 <write_serial>
80002918:	00044503          	lbu	a0,0(s0)
8000291c:	fd65                	bnez	a0,80002914 <print_uart+0xe>
8000291e:	40b2                	lw	ra,12(sp)
80002920:	4422                	lw	s0,8(sp)
80002922:	0141                	addi	sp,sp,16
80002924:	8082                	ret

80002926 <init_uart>:
80002926:	1141                	addi	sp,sp,-16
80002928:	c422                	sw	s0,8(sp)
8000292a:	c226                	sw	s1,4(sp)
8000292c:	c606                	sw	ra,12(sp)
8000292e:	60000737          	lui	a4,0x60000
80002932:	0a200793          	li	a5,162
80002936:	10f72623          	sw	a5,268(a4) # 6000010c <_tbss_end+0x600000c8>
8000293a:	800007b7          	lui	a5,0x80000
8000293e:	078d                	addi	a5,a5,3
80002940:	10f72423          	sw	a5,264(a4)
80002944:	05300493          	li	s1,83
80002948:	00001417          	auipc	s0,0x1
8000294c:	05040413          	addi	s0,s0,80 # 80003998 <main+0xaa6>
80002950:	04500513          	li	a0,69
80002954:	a021                	j	8000295c <init_uart+0x36>
80002956:	8526                	mv	a0,s1
80002958:	00144483          	lbu	s1,1(s0)
8000295c:	3fa1                	jal	800028b4 <write_serial>
8000295e:	0405                	addi	s0,s0,1
80002960:	f8fd                	bnez	s1,80002956 <init_uart+0x30>
80002962:	40b2                	lw	ra,12(sp)
80002964:	4422                	lw	s0,8(sp)
80002966:	4492                	lw	s1,4(sp)
80002968:	0141                	addi	sp,sp,16
8000296a:	8082                	ret

8000296c <bin_to_hex>:
8000296c:	00001797          	auipc	a5,0x1
80002970:	32878793          	addi	a5,a5,808 # 80003c94 <bin_to_hex_table>
80002974:	00f57713          	andi	a4,a0,15
80002978:	973e                	add	a4,a4,a5
8000297a:	00074703          	lbu	a4,0(a4)
8000297e:	8111                	srli	a0,a0,0x4
80002980:	97aa                	add	a5,a5,a0
80002982:	00e580a3          	sb	a4,1(a1)
80002986:	0007c783          	lbu	a5,0(a5)
8000298a:	00f58023          	sb	a5,0(a1)
8000298e:	8082                	ret

80002990 <print_uart_int>:
80002990:	1101                	addi	sp,sp,-32
80002992:	cc22                	sw	s0,24(sp)
80002994:	ca26                	sw	s1,20(sp)
80002996:	c64e                	sw	s3,12(sp)
80002998:	c452                	sw	s4,8(sp)
8000299a:	ce06                	sw	ra,28(sp)
8000299c:	c84a                	sw	s2,16(sp)
8000299e:	8a2a                	mv	s4,a0
800029a0:	4461                	li	s0,24
800029a2:	00001497          	auipc	s1,0x1
800029a6:	2f248493          	addi	s1,s1,754 # 80003c94 <bin_to_hex_table>
800029aa:	59e1                	li	s3,-8
800029ac:	008a57b3          	srl	a5,s4,s0
800029b0:	0ff7f793          	andi	a5,a5,255
800029b4:	00f7f713          	andi	a4,a5,15
800029b8:	8391                	srli	a5,a5,0x4
800029ba:	97a6                	add	a5,a5,s1
800029bc:	9726                	add	a4,a4,s1
800029be:	0007c503          	lbu	a0,0(a5)
800029c2:	00074903          	lbu	s2,0(a4)
800029c6:	1461                	addi	s0,s0,-8
800029c8:	35f5                	jal	800028b4 <write_serial>
800029ca:	854a                	mv	a0,s2
800029cc:	35e5                	jal	800028b4 <write_serial>
800029ce:	fd341fe3          	bne	s0,s3,800029ac <print_uart_int+0x1c>
800029d2:	40f2                	lw	ra,28(sp)
800029d4:	4462                	lw	s0,24(sp)
800029d6:	44d2                	lw	s1,20(sp)
800029d8:	4942                	lw	s2,16(sp)
800029da:	49b2                	lw	s3,12(sp)
800029dc:	4a22                	lw	s4,8(sp)
800029de:	6105                	addi	sp,sp,32
800029e0:	8082                	ret

800029e2 <print_uart_addr>:
800029e2:	7179                	addi	sp,sp,-48
800029e4:	d422                	sw	s0,40(sp)
800029e6:	d226                	sw	s1,36(sp)
800029e8:	d04a                	sw	s2,32(sp)
800029ea:	ce4e                	sw	s3,28(sp)
800029ec:	cc52                	sw	s4,24(sp)
800029ee:	ca56                	sw	s5,20(sp)
800029f0:	c85a                	sw	s6,16(sp)
800029f2:	d606                	sw	ra,44(sp)
800029f4:	c65e                	sw	s7,12(sp)
800029f6:	8aae                	mv	s5,a1
800029f8:	8a2a                	mv	s4,a0
800029fa:	03800413          	li	s0,56
800029fe:	00001b17          	auipc	s6,0x1
80002a02:	296b0b13          	addi	s6,s6,662 # 80003c94 <bin_to_hex_table>
80002a06:	00159993          	slli	s3,a1,0x1
80002a0a:	497d                	li	s2,31
80002a0c:	54e1                	li	s1,-8
80002a0e:	408907b3          	sub	a5,s2,s0
80002a12:	00f99733          	sll	a4,s3,a5
80002a16:	fe040693          	addi	a3,s0,-32
80002a1a:	008a57b3          	srl	a5,s4,s0
80002a1e:	8fd9                	or	a5,a5,a4
80002a20:	0006c463          	bltz	a3,80002a28 <print_uart_addr+0x46>
80002a24:	00dad7b3          	srl	a5,s5,a3
80002a28:	0ff7f793          	andi	a5,a5,255
80002a2c:	00f7f713          	andi	a4,a5,15
80002a30:	8391                	srli	a5,a5,0x4
80002a32:	97da                	add	a5,a5,s6
80002a34:	975a                	add	a4,a4,s6
80002a36:	0007c503          	lbu	a0,0(a5)
80002a3a:	00074b83          	lbu	s7,0(a4)
80002a3e:	1461                	addi	s0,s0,-8
80002a40:	3d95                	jal	800028b4 <write_serial>
80002a42:	855e                	mv	a0,s7
80002a44:	3d85                	jal	800028b4 <write_serial>
80002a46:	fc9414e3          	bne	s0,s1,80002a0e <print_uart_addr+0x2c>
80002a4a:	50b2                	lw	ra,44(sp)
80002a4c:	5422                	lw	s0,40(sp)
80002a4e:	5492                	lw	s1,36(sp)
80002a50:	5902                	lw	s2,32(sp)
80002a52:	49f2                	lw	s3,28(sp)
80002a54:	4a62                	lw	s4,24(sp)
80002a56:	4ad2                	lw	s5,20(sp)
80002a58:	4b42                	lw	s6,16(sp)
80002a5a:	4bb2                	lw	s7,12(sp)
80002a5c:	6145                	addi	sp,sp,48
80002a5e:	8082                	ret

80002a60 <print_uart_int64>:
80002a60:	b749                	j	800029e2 <print_uart_addr>

80002a62 <print_uart_byte>:
80002a62:	1141                	addi	sp,sp,-16
80002a64:	00001797          	auipc	a5,0x1
80002a68:	23078793          	addi	a5,a5,560 # 80003c94 <bin_to_hex_table>
80002a6c:	00f57713          	andi	a4,a0,15
80002a70:	8111                	srli	a0,a0,0x4
80002a72:	c606                	sw	ra,12(sp)
80002a74:	c422                	sw	s0,8(sp)
80002a76:	973e                	add	a4,a4,a5
80002a78:	97aa                	add	a5,a5,a0
80002a7a:	0007c503          	lbu	a0,0(a5)
80002a7e:	00074403          	lbu	s0,0(a4)
80002a82:	3d0d                	jal	800028b4 <write_serial>
80002a84:	8522                	mv	a0,s0
80002a86:	4422                	lw	s0,8(sp)
80002a88:	40b2                	lw	ra,12(sp)
80002a8a:	0141                	addi	sp,sp,16
80002a8c:	b525                	j	800028b4 <write_serial>

80002a8e <fdt_scan_helper>:
80002a8e:	7159                	addi	sp,sp,-112
80002a90:	4789                	li	a5,2
80002a92:	d4a2                	sw	s0,104(sp)
80002a94:	d2a6                	sw	s1,100(sp)
80002a96:	cc3e                	sw	a5,24(sp)
80002a98:	00ff04b7          	lui	s1,0xff0
80002a9c:	4785                	li	a5,1
80002a9e:	ff010437          	lui	s0,0xff010
80002aa2:	d0ca                	sw	s2,96(sp)
80002aa4:	cece                	sw	s3,92(sp)
80002aa6:	ccd2                	sw	s4,88(sp)
80002aa8:	cad6                	sw	s5,84(sp)
80002aaa:	c8da                	sw	s6,80(sp)
80002aac:	c6de                	sw	s7,76(sp)
80002aae:	c4e2                	sw	s8,72(sp)
80002ab0:	c0ea                	sw	s10,64(sp)
80002ab2:	de6e                	sw	s11,60(sp)
80002ab4:	d686                	sw	ra,108(sp)
80002ab6:	c2e6                	sw	s9,68(sp)
80002ab8:	89b2                	mv	s3,a2
80002aba:	8c2a                	mv	s8,a0
80002abc:	8aae                	mv	s5,a1
80002abe:	8936                	mv	s2,a3
80002ac0:	c832                	sw	a2,16(sp)
80002ac2:	ce3e                	sw	a5,28(sp)
80002ac4:	d032                	sw	a2,32(sp)
80002ac6:	4d81                	li	s11,0
80002ac8:	0ff48493          	addi	s1,s1,255 # ff00ff <_tbss_end+0xff00bb>
80002acc:	f0040413          	addi	s0,s0,-256 # ff00ff00 <__global_pointer$+0x7f00ba5c>
80002ad0:	4d09                	li	s10,2
80002ad2:	4a0d                	li	s4,3
80002ad4:	00001b97          	auipc	s7,0x1
80002ad8:	ee8b8b93          	addi	s7,s7,-280 # 800039bc <main+0xaca>
80002adc:	00001b17          	auipc	s6,0x1
80002ae0:	ef0b0b13          	addi	s6,s6,-272 # 800039cc <main+0xada>
80002ae4:	000c2703          	lw	a4,0(s8)
80002ae8:	00875793          	srli	a5,a4,0x8
80002aec:	0722                	slli	a4,a4,0x8
80002aee:	8f61                	and	a4,a4,s0
80002af0:	8fe5                	and	a5,a5,s1
80002af2:	8fd9                	or	a5,a5,a4
80002af4:	01079713          	slli	a4,a5,0x10
80002af8:	83c1                	srli	a5,a5,0x10
80002afa:	8fd9                	or	a5,a5,a4
80002afc:	07a78b63          	beq	a5,s10,80002b72 <fdt_scan_helper+0xe4>
80002b00:	00fd7963          	bgeu	s10,a5,80002b12 <fdt_scan_helper+0x84>
80002b04:	0b478663          	beq	a5,s4,80002bb0 <fdt_scan_helper+0x122>
80002b08:	4711                	li	a4,4
80002b0a:	08e79763          	bne	a5,a4,80002b98 <fdt_scan_helper+0x10a>
80002b0e:	0c11                	addi	s8,s8,4
80002b10:	bfd1                	j	80002ae4 <fdt_scan_helper+0x56>
80002b12:	4705                	li	a4,1
80002b14:	08e79263          	bne	a5,a4,80002b98 <fdt_scan_helper+0x10a>
80002b18:	000d9b63          	bnez	s11,80002b2e <fdt_scan_helper+0xa0>
80002b1c:	00098963          	beqz	s3,80002b2e <fdt_scan_helper+0xa0>
80002b20:	00892783          	lw	a5,8(s2)
80002b24:	c789                	beqz	a5,80002b2e <fdt_scan_helper+0xa0>
80002b26:	01092583          	lw	a1,16(s2)
80002b2a:	854e                	mv	a0,s3
80002b2c:	9782                	jalr	a5
80002b2e:	00092783          	lw	a5,0(s2)
80002b32:	004c0513          	addi	a0,s8,4
80002b36:	ca2a                	sw	a0,20(sp)
80002b38:	c791                	beqz	a5,80002b44 <fdt_scan_helper+0xb6>
80002b3a:	01092583          	lw	a1,16(s2)
80002b3e:	0808                	addi	a0,sp,16
80002b40:	9782                	jalr	a5
80002b42:	4552                	lw	a0,20(sp)
80002b44:	b8bfe0ef          	jal	ra,800016ce <strlen>
80002b48:	9971                	andi	a0,a0,-4
80002b4a:	0521                	addi	a0,a0,8
80002b4c:	86ca                	mv	a3,s2
80002b4e:	0810                	addi	a2,sp,16
80002b50:	85d6                	mv	a1,s5
80002b52:	9562                	add	a0,a0,s8
80002b54:	3f2d                	jal	80002a8e <fdt_scan_helper>
80002b56:	00c92783          	lw	a5,12(s2)
80002b5a:	8caa                	mv	s9,a0
80002b5c:	cb81                	beqz	a5,80002b6c <fdt_scan_helper+0xde>
80002b5e:	01092583          	lw	a1,16(s2)
80002b62:	0808                	addi	a0,sp,16
80002b64:	9782                	jalr	a5
80002b66:	57fd                	li	a5,-1
80002b68:	10f50963          	beq	a0,a5,80002c7a <fdt_scan_helper+0x1ec>
80002b6c:	8c66                	mv	s8,s9
80002b6e:	4d85                	li	s11,1
80002b70:	bf95                	j	80002ae4 <fdt_scan_helper+0x56>
80002b72:	0e0d8a63          	beqz	s11,80002c66 <fdt_scan_helper+0x1d8>
80002b76:	0c11                	addi	s8,s8,4
80002b78:	50b6                	lw	ra,108(sp)
80002b7a:	5426                	lw	s0,104(sp)
80002b7c:	8562                	mv	a0,s8
80002b7e:	5496                	lw	s1,100(sp)
80002b80:	5906                	lw	s2,96(sp)
80002b82:	49f6                	lw	s3,92(sp)
80002b84:	4a66                	lw	s4,88(sp)
80002b86:	4ad6                	lw	s5,84(sp)
80002b88:	4b46                	lw	s6,80(sp)
80002b8a:	4bb6                	lw	s7,76(sp)
80002b8c:	4c26                	lw	s8,72(sp)
80002b8e:	4c96                	lw	s9,68(sp)
80002b90:	4d06                	lw	s10,64(sp)
80002b92:	5df2                	lw	s11,60(sp)
80002b94:	6165                	addi	sp,sp,112
80002b96:	8082                	ret
80002b98:	fe0d90e3          	bnez	s11,80002b78 <fdt_scan_helper+0xea>
80002b9c:	fc098ee3          	beqz	s3,80002b78 <fdt_scan_helper+0xea>
80002ba0:	00892783          	lw	a5,8(s2)
80002ba4:	dbf1                	beqz	a5,80002b78 <fdt_scan_helper+0xea>
80002ba6:	01092583          	lw	a1,16(s2)
80002baa:	854e                	mv	a0,s3
80002bac:	9782                	jalr	a5
80002bae:	b7e9                	j	80002b78 <fdt_scan_helper+0xea>
80002bb0:	008c2683          	lw	a3,8(s8)
80002bb4:	004c2703          	lw	a4,4(s8)
80002bb8:	00cc0613          	addi	a2,s8,12
80002bbc:	00869793          	slli	a5,a3,0x8
80002bc0:	82a1                	srli	a3,a3,0x8
80002bc2:	00871c93          	slli	s9,a4,0x8
80002bc6:	8fe1                	and	a5,a5,s0
80002bc8:	8ee5                	and	a3,a3,s1
80002bca:	8321                	srli	a4,a4,0x8
80002bcc:	8fd5                	or	a5,a5,a3
80002bce:	8f65                	and	a4,a4,s1
80002bd0:	008cfcb3          	and	s9,s9,s0
80002bd4:	00ececb3          	or	s9,s9,a4
80002bd8:	01079713          	slli	a4,a5,0x10
80002bdc:	83c1                	srli	a5,a5,0x10
80002bde:	8fd9                	or	a5,a5,a4
80002be0:	010c9713          	slli	a4,s9,0x10
80002be4:	010cdc93          	srli	s9,s9,0x10
80002be8:	97d6                	add	a5,a5,s5
80002bea:	00ececb3          	or	s9,s9,a4
80002bee:	d23e                	sw	a5,36(sp)
80002bf0:	d666                	sw	s9,44(sp)
80002bf2:	d432                	sw	a2,40(sp)
80002bf4:	04098a63          	beqz	s3,80002c48 <fdt_scan_helper+0x1ba>
80002bf8:	853e                	mv	a0,a5
80002bfa:	85de                	mv	a1,s7
80002bfc:	c63e                	sw	a5,12(sp)
80002bfe:	b17fe0ef          	jal	ra,80001714 <strcmp>
80002c02:	47b2                	lw	a5,12(sp)
80002c04:	ed19                	bnez	a0,80002c22 <fdt_scan_helper+0x194>
80002c06:	00cc2683          	lw	a3,12(s8)
80002c0a:	00869713          	slli	a4,a3,0x8
80002c0e:	82a1                	srli	a3,a3,0x8
80002c10:	8ee5                	and	a3,a3,s1
80002c12:	8f61                	and	a4,a4,s0
80002c14:	8f55                	or	a4,a4,a3
80002c16:	01071693          	slli	a3,a4,0x10
80002c1a:	8341                	srli	a4,a4,0x10
80002c1c:	8f55                	or	a4,a4,a3
80002c1e:	00e9a423          	sw	a4,8(s3)
80002c22:	85da                	mv	a1,s6
80002c24:	853e                	mv	a0,a5
80002c26:	aeffe0ef          	jal	ra,80001714 <strcmp>
80002c2a:	ed19                	bnez	a0,80002c48 <fdt_scan_helper+0x1ba>
80002c2c:	00cc2703          	lw	a4,12(s8)
80002c30:	00871793          	slli	a5,a4,0x8
80002c34:	8321                	srli	a4,a4,0x8
80002c36:	8f65                	and	a4,a4,s1
80002c38:	8fe1                	and	a5,a5,s0
80002c3a:	8fd9                	or	a5,a5,a4
80002c3c:	01079713          	slli	a4,a5,0x10
80002c40:	83c1                	srli	a5,a5,0x10
80002c42:	8fd9                	or	a5,a5,a4
80002c44:	00f9a623          	sw	a5,12(s3)
80002c48:	0c8d                	addi	s9,s9,3
80002c4a:	41fcd793          	srai	a5,s9,0x1f
80002c4e:	8b8d                	andi	a5,a5,3
80002c50:	97e6                	add	a5,a5,s9
80002c52:	00492703          	lw	a4,4(s2)
80002c56:	01092583          	lw	a1,16(s2)
80002c5a:	9bf1                	andi	a5,a5,-4
80002c5c:	07b1                	addi	a5,a5,12
80002c5e:	1008                	addi	a0,sp,32
80002c60:	9c3e                	add	s8,s8,a5
80002c62:	9702                	jalr	a4
80002c64:	b541                	j	80002ae4 <fdt_scan_helper+0x56>
80002c66:	f00988e3          	beqz	s3,80002b76 <fdt_scan_helper+0xe8>
80002c6a:	00892783          	lw	a5,8(s2)
80002c6e:	d781                	beqz	a5,80002b76 <fdt_scan_helper+0xe8>
80002c70:	01092583          	lw	a1,16(s2)
80002c74:	854e                	mv	a0,s3
80002c76:	9782                	jalr	a5
80002c78:	bdfd                	j	80002b76 <fdt_scan_helper+0xe8>
80002c7a:	039c0263          	beq	s8,s9,80002c9e <fdt_scan_helper+0x210>
80002c7e:	87e2                	mv	a5,s8
80002c80:	04000737          	lui	a4,0x4000
80002c84:	0791                	addi	a5,a5,4
80002c86:	fee7ae23          	sw	a4,-4(a5)
80002c8a:	fefc9de3          	bne	s9,a5,80002c84 <fdt_scan_helper+0x1f6>
80002c8e:	418c87b3          	sub	a5,s9,s8
80002c92:	17f1                	addi	a5,a5,-4
80002c94:	9bf1                	andi	a5,a5,-4
80002c96:	0791                	addi	a5,a5,4
80002c98:	9c3e                	add	s8,s8,a5
80002c9a:	4d85                	li	s11,1
80002c9c:	b5a1                	j	80002ae4 <fdt_scan_helper+0x56>
80002c9e:	4d85                	li	s11,1
80002ca0:	b591                	j	80002ae4 <fdt_scan_helper+0x56>

80002ca2 <fdt_scan>:
80002ca2:	4118                	lw	a4,0(a0)
80002ca4:	00ff0637          	lui	a2,0xff0
80002ca8:	ff010837          	lui	a6,0xff010
80002cac:	00875793          	srli	a5,a4,0x8
80002cb0:	0ff60613          	addi	a2,a2,255 # ff00ff <_tbss_end+0xff00bb>
80002cb4:	0722                	slli	a4,a4,0x8
80002cb6:	f0080813          	addi	a6,a6,-256 # ff00ff00 <__global_pointer$+0x7f00ba5c>
80002cba:	01077733          	and	a4,a4,a6
80002cbe:	8ff1                	and	a5,a5,a2
80002cc0:	8fd9                	or	a5,a5,a4
80002cc2:	01079713          	slli	a4,a5,0x10
80002cc6:	83c1                	srli	a5,a5,0x10
80002cc8:	8fd9                	or	a5,a5,a4
80002cca:	d00e0737          	lui	a4,0xd00e0
80002cce:	eed70713          	addi	a4,a4,-275 # d00dfeed <__global_pointer$+0x500dba49>
80002cd2:	02e79163          	bne	a5,a4,80002cf4 <fdt_scan+0x52>
80002cd6:	4d18                	lw	a4,24(a0)
80002cd8:	46c5                	li	a3,17
80002cda:	00871793          	slli	a5,a4,0x8
80002cde:	8321                	srli	a4,a4,0x8
80002ce0:	8f71                	and	a4,a4,a2
80002ce2:	0107f7b3          	and	a5,a5,a6
80002ce6:	8fd9                	or	a5,a5,a4
80002ce8:	01079713          	slli	a4,a5,0x10
80002cec:	83c1                	srli	a5,a5,0x10
80002cee:	8fd9                	or	a5,a5,a4
80002cf0:	00f6f363          	bgeu	a3,a5,80002cf6 <fdt_scan+0x54>
80002cf4:	8082                	ret
80002cf6:	455c                	lw	a5,12(a0)
80002cf8:	4518                	lw	a4,8(a0)
80002cfa:	86ae                	mv	a3,a1
80002cfc:	0087d893          	srli	a7,a5,0x8
80002d00:	00879593          	slli	a1,a5,0x8
80002d04:	00871793          	slli	a5,a4,0x8
80002d08:	8321                	srli	a4,a4,0x8
80002d0a:	0105f5b3          	and	a1,a1,a6
80002d0e:	00c8f8b3          	and	a7,a7,a2
80002d12:	0107f833          	and	a6,a5,a6
80002d16:	8e79                	and	a2,a2,a4
80002d18:	0115e7b3          	or	a5,a1,a7
80002d1c:	00c86633          	or	a2,a6,a2
80002d20:	01079593          	slli	a1,a5,0x10
80002d24:	01061813          	slli	a6,a2,0x10
80002d28:	83c1                	srli	a5,a5,0x10
80002d2a:	8241                	srli	a2,a2,0x10
80002d2c:	00c86833          	or	a6,a6,a2
80002d30:	8ddd                	or	a1,a1,a5
80002d32:	95aa                	add	a1,a1,a0
80002d34:	4601                	li	a2,0
80002d36:	9542                	add	a0,a0,a6
80002d38:	bb99                	j	80002a8e <fdt_scan_helper>

80002d3a <fdt_size>:
80002d3a:	4118                	lw	a4,0(a0)
80002d3c:	ff010637          	lui	a2,0xff010
80002d40:	00ff06b7          	lui	a3,0xff0
80002d44:	00871793          	slli	a5,a4,0x8
80002d48:	f0060613          	addi	a2,a2,-256 # ff00ff00 <__global_pointer$+0x7f00ba5c>
80002d4c:	8321                	srli	a4,a4,0x8
80002d4e:	0ff68693          	addi	a3,a3,255 # ff00ff <_tbss_end+0xff00bb>
80002d52:	8f75                	and	a4,a4,a3
80002d54:	8ff1                	and	a5,a5,a2
80002d56:	8fd9                	or	a5,a5,a4
80002d58:	01079713          	slli	a4,a5,0x10
80002d5c:	83c1                	srli	a5,a5,0x10
80002d5e:	8fd9                	or	a5,a5,a4
80002d60:	d00e0737          	lui	a4,0xd00e0
80002d64:	eed70713          	addi	a4,a4,-275 # d00dfeed <__global_pointer$+0x500dba49>
80002d68:	02e79e63          	bne	a5,a4,80002da4 <fdt_size+0x6a>
80002d6c:	4d0c                	lw	a1,24(a0)
80002d6e:	4845                	li	a6,17
80002d70:	4781                	li	a5,0
80002d72:	00859713          	slli	a4,a1,0x8
80002d76:	81a1                	srli	a1,a1,0x8
80002d78:	8df5                	and	a1,a1,a3
80002d7a:	8f71                	and	a4,a4,a2
80002d7c:	8f4d                	or	a4,a4,a1
80002d7e:	01071593          	slli	a1,a4,0x10
80002d82:	8341                	srli	a4,a4,0x10
80002d84:	8f4d                	or	a4,a4,a1
80002d86:	00e86d63          	bltu	a6,a4,80002da0 <fdt_size+0x66>
80002d8a:	4158                	lw	a4,4(a0)
80002d8c:	00871793          	slli	a5,a4,0x8
80002d90:	8321                	srli	a4,a4,0x8
80002d92:	8ef9                	and	a3,a3,a4
80002d94:	8ff1                	and	a5,a5,a2
80002d96:	8fd5                	or	a5,a5,a3
80002d98:	01079713          	slli	a4,a5,0x10
80002d9c:	83c1                	srli	a5,a5,0x10
80002d9e:	8fd9                	or	a5,a5,a4
80002da0:	853e                	mv	a0,a5
80002da2:	8082                	ret
80002da4:	4781                	li	a5,0
80002da6:	853e                	mv	a0,a5
80002da8:	8082                	ret

80002daa <fdt_get_address>:
80002daa:	00852e83          	lw	t4,8(a0)
80002dae:	4781                	li	a5,0
80002db0:	4801                	li	a6,0
80002db2:	c21c                	sw	a5,0(a2)
80002db4:	01062223          	sw	a6,4(a2)
80002db8:	05d05663          	blez	t4,80002e04 <fdt_get_address+0x5a>
80002dbc:	ff010337          	lui	t1,0xff010
80002dc0:	00ff08b7          	lui	a7,0xff0
80002dc4:	8876                	mv	a6,t4
80002dc6:	86ae                	mv	a3,a1
80002dc8:	f0030313          	addi	t1,t1,-256 # ff00ff00 <__global_pointer$+0x7f00ba5c>
80002dcc:	0ff88893          	addi	a7,a7,255 # ff00ff <_tbss_end+0xff00bb>
80002dd0:	0691                	addi	a3,a3,4
80002dd2:	ffc6a703          	lw	a4,-4(a3)
80002dd6:	8e3e                	mv	t3,a5
80002dd8:	187d                	addi	a6,a6,-1
80002dda:	00871793          	slli	a5,a4,0x8
80002dde:	8321                	srli	a4,a4,0x8
80002de0:	01177733          	and	a4,a4,a7
80002de4:	0067f7b3          	and	a5,a5,t1
80002de8:	8fd9                	or	a5,a5,a4
80002dea:	01079713          	slli	a4,a5,0x10
80002dee:	83c1                	srli	a5,a5,0x10
80002df0:	8fd9                	or	a5,a5,a4
80002df2:	fc081fe3          	bnez	a6,80002dd0 <fdt_get_address+0x26>
80002df6:	0e8a                	slli	t4,t4,0x2
80002df8:	01d58533          	add	a0,a1,t4
80002dfc:	c21c                	sw	a5,0(a2)
80002dfe:	01c62223          	sw	t3,4(a2)
80002e02:	8082                	ret
80002e04:	852e                	mv	a0,a1
80002e06:	8082                	ret

80002e08 <fdt_get_size>:
80002e08:	00c52e83          	lw	t4,12(a0)
80002e0c:	4781                	li	a5,0
80002e0e:	4801                	li	a6,0
80002e10:	c21c                	sw	a5,0(a2)
80002e12:	01062223          	sw	a6,4(a2)
80002e16:	05d05663          	blez	t4,80002e62 <fdt_get_size+0x5a>
80002e1a:	ff010337          	lui	t1,0xff010
80002e1e:	00ff08b7          	lui	a7,0xff0
80002e22:	8876                	mv	a6,t4
80002e24:	86ae                	mv	a3,a1
80002e26:	f0030313          	addi	t1,t1,-256 # ff00ff00 <__global_pointer$+0x7f00ba5c>
80002e2a:	0ff88893          	addi	a7,a7,255 # ff00ff <_tbss_end+0xff00bb>
80002e2e:	0691                	addi	a3,a3,4
80002e30:	ffc6a703          	lw	a4,-4(a3)
80002e34:	8e3e                	mv	t3,a5
80002e36:	187d                	addi	a6,a6,-1
80002e38:	00871793          	slli	a5,a4,0x8
80002e3c:	8321                	srli	a4,a4,0x8
80002e3e:	01177733          	and	a4,a4,a7
80002e42:	0067f7b3          	and	a5,a5,t1
80002e46:	8fd9                	or	a5,a5,a4
80002e48:	01079713          	slli	a4,a5,0x10
80002e4c:	83c1                	srli	a5,a5,0x10
80002e4e:	8fd9                	or	a5,a5,a4
80002e50:	fc081fe3          	bnez	a6,80002e2e <fdt_get_size+0x26>
80002e54:	0e8a                	slli	t4,t4,0x2
80002e56:	01d58533          	add	a0,a1,t4
80002e5a:	c21c                	sw	a5,0(a2)
80002e5c:	01c62223          	sw	t3,4(a2)
80002e60:	8082                	ret
80002e62:	852e                	mv	a0,a1
80002e64:	8082                	ret

80002e66 <fdt_get_value>:
80002e66:	451c                	lw	a5,8(a0)
80002e68:	058a                	slli	a1,a1,0x2
80002e6a:	ff010737          	lui	a4,0xff010
80002e6e:	97ae                	add	a5,a5,a1
80002e70:	4388                	lw	a0,0(a5)
80002e72:	f0070713          	addi	a4,a4,-256 # ff00ff00 <__global_pointer$+0x7f00ba5c>
80002e76:	00851793          	slli	a5,a0,0x8
80002e7a:	8ff9                	and	a5,a5,a4
80002e7c:	00ff0737          	lui	a4,0xff0
80002e80:	0ff70713          	addi	a4,a4,255 # ff00ff <_tbss_end+0xff00bb>
80002e84:	8121                	srli	a0,a0,0x8
80002e86:	8d79                	and	a0,a0,a4
80002e88:	8fc9                	or	a5,a5,a0
80002e8a:	01079513          	slli	a0,a5,0x10
80002e8e:	83c1                	srli	a5,a5,0x10
80002e90:	8d5d                	or	a0,a0,a5
80002e92:	8082                	ret

80002e94 <fdt_string_list_index>:
80002e94:	1101                	addi	sp,sp,-32
80002e96:	cc22                	sw	s0,24(sp)
80002e98:	455c                	lw	a5,12(a0)
80002e9a:	4500                	lw	s0,8(a0)
80002e9c:	c64e                	sw	s3,12(sp)
80002e9e:	ce06                	sw	ra,28(sp)
80002ea0:	ca26                	sw	s1,20(sp)
80002ea2:	c84a                	sw	s2,16(sp)
80002ea4:	00f409b3          	add	s3,s0,a5
80002ea8:	02f05c63          	blez	a5,80002ee0 <fdt_string_list_index+0x4c>
80002eac:	892e                	mv	s2,a1
80002eae:	4481                	li	s1,0
80002eb0:	a819                	j	80002ec6 <fdt_string_list_index+0x32>
80002eb2:	8522                	mv	a0,s0
80002eb4:	81bfe0ef          	jal	ra,800016ce <strlen>
80002eb8:	0505                	addi	a0,a0,1
80002eba:	942a                	add	s0,s0,a0
80002ebc:	408987b3          	sub	a5,s3,s0
80002ec0:	0485                	addi	s1,s1,1
80002ec2:	00f05f63          	blez	a5,80002ee0 <fdt_string_list_index+0x4c>
80002ec6:	85ca                	mv	a1,s2
80002ec8:	8522                	mv	a0,s0
80002eca:	84bfe0ef          	jal	ra,80001714 <strcmp>
80002ece:	f175                	bnez	a0,80002eb2 <fdt_string_list_index+0x1e>
80002ed0:	40f2                	lw	ra,28(sp)
80002ed2:	4462                	lw	s0,24(sp)
80002ed4:	8526                	mv	a0,s1
80002ed6:	4942                	lw	s2,16(sp)
80002ed8:	44d2                	lw	s1,20(sp)
80002eda:	49b2                	lw	s3,12(sp)
80002edc:	6105                	addi	sp,sp,32
80002ede:	8082                	ret
80002ee0:	40f2                	lw	ra,28(sp)
80002ee2:	4462                	lw	s0,24(sp)
80002ee4:	54fd                	li	s1,-1
80002ee6:	8526                	mv	a0,s1
80002ee8:	4942                	lw	s2,16(sp)
80002eea:	44d2                	lw	s1,20(sp)
80002eec:	49b2                	lw	s3,12(sp)
80002eee:	6105                	addi	sp,sp,32
80002ef0:	8082                	ret

Disassembly of section .text.startup:

80002ef2 <main>:
80002ef2:	711d                	addi	sp,sp,-96
80002ef4:	00001517          	auipc	a0,0x1
80002ef8:	85c50513          	addi	a0,a0,-1956 # 80003750 <main+0x85e>
80002efc:	ce86                	sw	ra,92(sp)
80002efe:	c8ca                	sw	s2,80(sp)
80002f00:	cca2                	sw	s0,88(sp)
80002f02:	caa6                	sw	s1,84(sp)
80002f04:	c6ce                	sw	s3,76(sp)
80002f06:	c4d2                	sw	s4,72(sp)
80002f08:	c2d6                	sw	s5,68(sp)
80002f0a:	c0da                	sw	s6,64(sp)
80002f0c:	de5e                	sw	s7,60(sp)
80002f0e:	dc62                	sw	s8,56(sp)
80002f10:	da66                	sw	s9,52(sp)
80002f12:	d86a                	sw	s10,48(sp)
80002f14:	d66e                	sw	s11,44(sp)
80002f16:	e14fe0ef          	jal	ra,8000152a <printf>
80002f1a:	00000517          	auipc	a0,0x0
80002f1e:	57250513          	addi	a0,a0,1394 # 8000348c <main+0x59a>
80002f22:	e08fe0ef          	jal	ra,8000152a <printf>
80002f26:	00000517          	auipc	a0,0x0
80002f2a:	59250513          	addi	a0,a0,1426 # 800034b8 <main+0x5c6>
80002f2e:	dfcfe0ef          	jal	ra,8000152a <printf>
80002f32:	02000593          	li	a1,32
80002f36:	00000517          	auipc	a0,0x0
80002f3a:	59e50513          	addi	a0,a0,1438 # 800034d4 <main+0x5e2>
80002f3e:	decfe0ef          	jal	ra,8000152a <printf>
80002f42:	45a1                	li	a1,8
80002f44:	00000517          	auipc	a0,0x0
80002f48:	5a050513          	addi	a0,a0,1440 # 800034e4 <main+0x5f2>
80002f4c:	ddefe0ef          	jal	ra,8000152a <printf>
80002f50:	00000517          	auipc	a0,0x0
80002f54:	53c50513          	addi	a0,a0,1340 # 8000348c <main+0x59a>
80002f58:	dd2fe0ef          	jal	ra,8000152a <printf>
80002f5c:	65c1                	lui	a1,0x10
80002f5e:	00000517          	auipc	a0,0x0
80002f62:	59650513          	addi	a0,a0,1430 # 800034f4 <main+0x602>
80002f66:	dc4fe0ef          	jal	ra,8000152a <printf>
80002f6a:	65c1                	lui	a1,0x10
80002f6c:	00000517          	auipc	a0,0x0
80002f70:	5a050513          	addi	a0,a0,1440 # 8000350c <main+0x61a>
80002f74:	db6fe0ef          	jal	ra,8000152a <printf>
80002f78:	40000593          	li	a1,1024
80002f7c:	00000517          	auipc	a0,0x0
80002f80:	5a850513          	addi	a0,a0,1448 # 80003524 <main+0x632>
80002f84:	da6fe0ef          	jal	ra,8000152a <printf>
80002f88:	40000593          	li	a1,1024
80002f8c:	00000517          	auipc	a0,0x0
80002f90:	5b050513          	addi	a0,a0,1456 # 8000353c <main+0x64a>
80002f94:	d96fe0ef          	jal	ra,8000152a <printf>
80002f98:	6941                	lui	s2,0x10
80002f9a:	40090593          	addi	a1,s2,1024 # 10400 <_tbss_end+0x103bc>
80002f9e:	00000517          	auipc	a0,0x0
80002fa2:	5b650513          	addi	a0,a0,1462 # 80003554 <main+0x662>
80002fa6:	d84fe0ef          	jal	ra,8000152a <printf>
80002faa:	40000593          	li	a1,1024
80002fae:	00000517          	auipc	a0,0x0
80002fb2:	5be50513          	addi	a0,a0,1470 # 8000356c <main+0x67a>
80002fb6:	d74fe0ef          	jal	ra,8000152a <printf>
80002fba:	04000593          	li	a1,64
80002fbe:	00000517          	auipc	a0,0x0
80002fc2:	5c650513          	addi	a0,a0,1478 # 80003584 <main+0x692>
80002fc6:	d64fe0ef          	jal	ra,8000152a <printf>
80002fca:	45c1                	li	a1,16
80002fcc:	00000517          	auipc	a0,0x0
80002fd0:	5d050513          	addi	a0,a0,1488 # 8000359c <main+0x6aa>
80002fd4:	d56fe0ef          	jal	ra,8000152a <printf>
80002fd8:	00000517          	auipc	a0,0x0
80002fdc:	5dc50513          	addi	a0,a0,1500 # 800035b4 <main+0x6c2>
80002fe0:	d4afe0ef          	jal	ra,8000152a <printf>
80002fe4:	00000697          	auipc	a3,0x0
80002fe8:	5ec68693          	addi	a3,a3,1516 # 800035d0 <main+0x6de>
80002fec:	04a00613          	li	a2,74
80002ff0:	0eb00593          	li	a1,235
80002ff4:	0868                	addi	a0,sp,28
80002ff6:	ddaff0ef          	jal	ra,800025d0 <probe>
80002ffa:	c545                	beqz	a0,800030a2 <main+0x1b0>
80002ffc:	85aa                	mv	a1,a0
80002ffe:	00000517          	auipc	a0,0x0
80003002:	60a50513          	addi	a0,a0,1546 # 80003608 <main+0x716>
80003006:	d24fe0ef          	jal	ra,8000152a <printf>
8000300a:	4472                	lw	s0,28(sp)
8000300c:	45e1                	li	a1,24
8000300e:	8522                	mv	a0,s0
80003010:	fa6ff0ef          	jal	ra,800027b6 <ioread32>
80003014:	c12d                	beqz	a0,80003076 <main+0x184>
80003016:	45e1                	li	a1,24
80003018:	8522                	mv	a0,s0
8000301a:	f9cff0ef          	jal	ra,800027b6 <ioread32>
8000301e:	c951                	beqz	a0,800030b2 <main+0x1c0>
80003020:	40090513          	addi	a0,s2,1024
80003024:	d8cff0ef          	jal	ra,800025b0 <aligned_malloc>
80003028:	c02a                	sw	a0,0(sp)
8000302a:	84aa                	mv	s1,a0
8000302c:	40000513          	li	a0,1024
80003030:	d80ff0ef          	jal	ra,800025b0 <aligned_malloc>
80003034:	c22a                	sw	a0,4(sp)
80003036:	89aa                	mv	s3,a0
80003038:	40000513          	li	a0,1024
8000303c:	d74ff0ef          	jal	ra,800025b0 <aligned_malloc>
80003040:	8d2a                	mv	s10,a0
80003042:	40000513          	li	a0,1024
80003046:	d6aff0ef          	jal	ra,800025b0 <aligned_malloc>
8000304a:	c42a                	sw	a0,8(sp)
8000304c:	8a2a                	mv	s4,a0
8000304e:	4511                	li	a0,4
80003050:	d60ff0ef          	jal	ra,800025b0 <aligned_malloc>
80003054:	c62a                	sw	a0,12(sp)
80003056:	c881                	beqz	s1,80003066 <main+0x174>
80003058:	00098763          	beqz	s3,80003066 <main+0x174>
8000305c:	000d0563          	beqz	s10,80003066 <main+0x174>
80003060:	000a0363          	beqz	s4,80003066 <main+0x174>
80003064:	ed39                	bnez	a0,800030c2 <main+0x1d0>
80003066:	00000517          	auipc	a0,0x0
8000306a:	60650513          	addi	a0,a0,1542 # 8000366c <main+0x77a>
8000306e:	cbcfe0ef          	jal	ra,8000152a <printf>
80003072:	4505                	li	a0,1
80003074:	a801                	j	80003084 <main+0x192>
80003076:	00000517          	auipc	a0,0x0
8000307a:	5b250513          	addi	a0,a0,1458 # 80003628 <main+0x736>
8000307e:	cacfe0ef          	jal	ra,8000152a <printf>
80003082:	4505                	li	a0,1
80003084:	40f6                	lw	ra,92(sp)
80003086:	4466                	lw	s0,88(sp)
80003088:	44d6                	lw	s1,84(sp)
8000308a:	4946                	lw	s2,80(sp)
8000308c:	49b6                	lw	s3,76(sp)
8000308e:	4a26                	lw	s4,72(sp)
80003090:	4a96                	lw	s5,68(sp)
80003092:	4b06                	lw	s6,64(sp)
80003094:	5bf2                	lw	s7,60(sp)
80003096:	5c62                	lw	s8,56(sp)
80003098:	5cd2                	lw	s9,52(sp)
8000309a:	5d42                	lw	s10,48(sp)
8000309c:	5db2                	lw	s11,44(sp)
8000309e:	6125                	addi	sp,sp,96
800030a0:	8082                	ret
800030a2:	00000517          	auipc	a0,0x0
800030a6:	54250513          	addi	a0,a0,1346 # 800035e4 <main+0x6f2>
800030aa:	c80fe0ef          	jal	ra,8000152a <printf>
800030ae:	4505                	li	a0,1
800030b0:	bfd1                	j	80003084 <main+0x192>
800030b2:	00000517          	auipc	a0,0x0
800030b6:	59a50513          	addi	a0,a0,1434 # 8000364c <main+0x75a>
800030ba:	c70fe0ef          	jal	ra,8000152a <printf>
800030be:	4505                	li	a0,1
800030c0:	b7d1                	j	80003084 <main+0x192>
800030c2:	4482                	lw	s1,0(sp)
800030c4:	00000517          	auipc	a0,0x0
800030c8:	5c850513          	addi	a0,a0,1480 # 8000368c <main+0x79a>
800030cc:	85a6                	mv	a1,s1
800030ce:	c5cfe0ef          	jal	ra,8000152a <printf>
800030d2:	9926                	add	s2,s2,s1
800030d4:	85ca                	mv	a1,s2
800030d6:	00000517          	auipc	a0,0x0
800030da:	5ca50513          	addi	a0,a0,1482 # 800036a0 <main+0x7ae>
800030de:	c4cfe0ef          	jal	ra,8000152a <printf>
800030e2:	47b2                	lw	a5,12(sp)
800030e4:	00000517          	auipc	a0,0x0
800030e8:	5d050513          	addi	a0,a0,1488 # 800036b4 <main+0x7c2>
800030ec:	85be                	mv	a1,a5
800030ee:	c384                	sw	s1,0(a5)
800030f0:	c3afe0ef          	jal	ra,8000152a <printf>
800030f4:	4585                	li	a1,1
800030f6:	00000517          	auipc	a0,0x0
800030fa:	5d250513          	addi	a0,a0,1490 # 800036c8 <main+0x7d6>
800030fe:	c2cfe0ef          	jal	ra,8000152a <printf>
80003102:	00000517          	auipc	a0,0x0
80003106:	5de50513          	addi	a0,a0,1502 # 800036e0 <main+0x7ee>
8000310a:	c20fe0ef          	jal	ra,8000152a <printf>
8000310e:	4812                	lw	a6,4(sp)
80003110:	88ea                	mv	a7,s10
80003112:	02000593          	li	a1,32
80003116:	8542                	mv	a0,a6
80003118:	431d                	li	t1,7
8000311a:	04000e13          	li	t3,64
8000311e:	fe058793          	addi	a5,a1,-32 # ffe0 <_tbss_end+0xff9c>
80003122:	0267e733          	rem	a4,a5,t1
80003126:	00f80633          	add	a2,a6,a5
8000312a:	00f886b3          	add	a3,a7,a5
8000312e:	00060023          	sb	zero,0(a2)
80003132:	0785                	addi	a5,a5,1
80003134:	0705                	addi	a4,a4,1
80003136:	0712                	slli	a4,a4,0x4
80003138:	00e68023          	sb	a4,0(a3)
8000313c:	feb793e3          	bne	a5,a1,80003122 <main+0x230>
80003140:	00178593          	addi	a1,a5,1
80003144:	087d                	addi	a6,a6,31
80003146:	08fd                	addi	a7,a7,31
80003148:	fdc59be3          	bne	a1,t3,8000311e <main+0x22c>
8000314c:	4792                	lw	a5,4(sp)
8000314e:	4741                	li	a4,16
80003150:	42078f13          	addi	t5,a5,1056
80003154:	00e78023          	sb	a4,0(a5)
80003158:	02178793          	addi	a5,a5,33
8000315c:	ffe79ce3          	bne	a5,t5,80003154 <main+0x262>
80003160:	4312                	lw	t1,4(sp)
80003162:	4782                	lw	a5,0(sp)
80003164:	6f85                	lui	t6,0x1
80003166:	02030893          	addi	a7,t1,32
8000316a:	02078e93          	addi	t4,a5,32
8000316e:	020d0e13          	addi	t3,s10,32
80003172:	800f8f93          	addi	t6,t6,-2048 # 800 <_tbss_end+0x7bc>
80003176:	86f6                	mv	a3,t4
80003178:	87ea                	mv	a5,s10
8000317a:	fe068613          	addi	a2,a3,-32
8000317e:	871a                	mv	a4,t1
80003180:	00070583          	lb	a1,0(a4)
80003184:	0605                	addi	a2,a2,1
80003186:	0705                	addi	a4,a4,1
80003188:	feb60fa3          	sb	a1,-1(a2)
8000318c:	ff171ae3          	bne	a4,a7,80003180 <main+0x28e>
80003190:	8636                	mv	a2,a3
80003192:	873e                	mv	a4,a5
80003194:	40078593          	addi	a1,a5,1024
80003198:	00070803          	lb	a6,0(a4)
8000319c:	0605                	addi	a2,a2,1
8000319e:	02070713          	addi	a4,a4,32
800031a2:	ff060fa3          	sb	a6,-1(a2)
800031a6:	feb719e3          	bne	a4,a1,80003198 <main+0x2a6>
800031aa:	0785                	addi	a5,a5,1
800031ac:	04068693          	addi	a3,a3,64
800031b0:	fcfe15e3          	bne	t3,a5,8000317a <main+0x288>
800031b4:	02088893          	addi	a7,a7,32
800031b8:	02030313          	addi	t1,t1,32
800031bc:	9efe                	add	t4,t4,t6
800031be:	fbe89ce3          	bne	a7,t5,80003176 <main+0x284>
800031c2:	4aa2                	lw	s5,8(sp)
800031c4:	400d0f93          	addi	t6,s10,1024
800031c8:	420d0e93          	addi	t4,s10,1056
800031cc:	400a8f13          	addi	t5,s5,1024
800031d0:	41aa88b3          	sub	a7,s5,s10
800031d4:	41af0f33          	sub	t5,t5,s10
800031d8:	07f00e13          	li	t3,127
800031dc:	f8000313          	li	t1,-128
800031e0:	877e                	mv	a4,t6
800031e2:	c0070693          	addi	a3,a4,-1024
800031e6:	862a                	mv	a2,a0
800031e8:	4781                	li	a5,0
800031ea:	00060583          	lb	a1,0(a2)
800031ee:	00068803          	lb	a6,0(a3)
800031f2:	02068693          	addi	a3,a3,32
800031f6:	0605                	addi	a2,a2,1
800031f8:	030585b3          	mul	a1,a1,a6
800031fc:	97ae                	add	a5,a5,a1
800031fe:	fed716e3          	bne	a4,a3,800031ea <main+0x2f8>
80003202:	87a1                	srai	a5,a5,0x8
80003204:	07f00693          	li	a3,127
80003208:	00fe4763          	blt	t3,a5,80003216 <main+0x324>
8000320c:	2267c263          	blt	a5,t1,80003430 <main+0x53e>
80003210:	01879693          	slli	a3,a5,0x18
80003214:	86e1                	srai	a3,a3,0x18
80003216:	00e887b3          	add	a5,a7,a4
8000321a:	c0d78023          	sb	a3,-1024(a5)
8000321e:	0705                	addi	a4,a4,1
80003220:	fcee91e3          	bne	t4,a4,800031e2 <main+0x2f0>
80003224:	02088893          	addi	a7,a7,32
80003228:	02050513          	addi	a0,a0,32
8000322c:	fb1f1ae3          	bne	t5,a7,800031e0 <main+0x2ee>
80003230:	4782                	lw	a5,0(sp)
80003232:	6741                	lui	a4,0x10
80003234:	40070713          	addi	a4,a4,1024 # 10400 <_tbss_end+0x103bc>
80003238:	973e                	add	a4,a4,a5
8000323a:	f9d00693          	li	a3,-99
8000323e:	87ca                	mv	a5,s2
80003240:	00d78023          	sb	a3,0(a5)
80003244:	0785                	addi	a5,a5,1
80003246:	fef71de3          	bne	a4,a5,80003240 <main+0x34e>
8000324a:	00000517          	auipc	a0,0x0
8000324e:	4b250513          	addi	a0,a0,1202 # 800036fc <main+0x80a>
80003252:	ad8fe0ef          	jal	ra,8000152a <printf>
80003256:	02000593          	li	a1,32
8000325a:	8522                	mv	a0,s0
8000325c:	4601                	li	a2,0
8000325e:	d60ff0ef          	jal	ra,800027be <iowrite32>
80003262:	4632                	lw	a2,12(sp)
80003264:	45b1                	li	a1,12
80003266:	8522                	mv	a0,s0
80003268:	d56ff0ef          	jal	ra,800027be <iowrite32>
8000326c:	4605                	li	a2,1
8000326e:	45c1                	li	a1,16
80003270:	8522                	mv	a0,s0
80003272:	d4cff0ef          	jal	ra,800027be <iowrite32>
80003276:	4651                	li	a2,20
80003278:	45d1                	li	a1,20
8000327a:	8522                	mv	a0,s0
8000327c:	d42ff0ef          	jal	ra,800027be <iowrite32>
80003280:	4601                	li	a2,0
80003282:	02800593          	li	a1,40
80003286:	8522                	mv	a0,s0
80003288:	d36ff0ef          	jal	ra,800027be <iowrite32>
8000328c:	4601                	li	a2,0
8000328e:	02c00593          	li	a1,44
80003292:	8522                	mv	a0,s0
80003294:	d2aff0ef          	jal	ra,800027be <iowrite32>
80003298:	4621                	li	a2,8
8000329a:	02000593          	li	a1,32
8000329e:	00000517          	auipc	a0,0x0
800032a2:	47650513          	addi	a0,a0,1142 # 80003714 <main+0x822>
800032a6:	a84fe0ef          	jal	ra,8000152a <printf>
800032aa:	02000613          	li	a2,32
800032ae:	04400593          	li	a1,68
800032b2:	8522                	mv	a0,s0
800032b4:	d0aff0ef          	jal	ra,800027be <iowrite32>
800032b8:	4621                	li	a2,8
800032ba:	04000593          	li	a1,64
800032be:	8522                	mv	a0,s0
800032c0:	cfeff0ef          	jal	ra,800027be <iowrite32>
800032c4:	4501                	li	a0,0
800032c6:	bb2ff0ef          	jal	ra,80002678 <esp_flush>
800032ca:	00000517          	auipc	a0,0x0
800032ce:	46250513          	addi	a0,a0,1122 # 8000372c <main+0x83a>
800032d2:	a58fe0ef          	jal	ra,8000152a <printf>
800032d6:	4605                	li	a2,1
800032d8:	4581                	li	a1,0
800032da:	8522                	mv	a0,s0
800032dc:	ce2ff0ef          	jal	ra,800027be <iowrite32>
800032e0:	4591                	li	a1,4
800032e2:	8522                	mv	a0,s0
800032e4:	cd2ff0ef          	jal	ra,800027b6 <ioread32>
800032e8:	8909                	andi	a0,a0,2
800032ea:	d97d                	beqz	a0,800032e0 <main+0x3ee>
800032ec:	4601                	li	a2,0
800032ee:	4581                	li	a1,0
800032f0:	8522                	mv	a0,s0
800032f2:	cccff0ef          	jal	ra,800027be <iowrite32>
800032f6:	00000517          	auipc	a0,0x0
800032fa:	44a50513          	addi	a0,a0,1098 # 80003740 <main+0x84e>
800032fe:	a2cfe0ef          	jal	ra,8000152a <printf>
80003302:	40000593          	li	a1,1024
80003306:	00000517          	auipc	a0,0x0
8000330a:	44e50513          	addi	a0,a0,1102 # 80003754 <main+0x862>
8000330e:	a1cfe0ef          	jal	ra,8000152a <printf>
80003312:	4a22                	lw	s4,8(sp)
80003314:	4982                	lw	s3,0(sp)
80003316:	4401                	li	s0,0
80003318:	4481                	li	s1,0
8000331a:	6cc1                	lui	s9,0x10
8000331c:	4c4d                	li	s8,19
8000331e:	00000b97          	auipc	s7,0x0
80003322:	452b8b93          	addi	s7,s7,1106 # 80003770 <main+0x87e>
80003326:	02000b13          	li	s6,32
8000332a:	4d81                	li	s11,0
8000332c:	019d86b3          	add	a3,s11,s9
80003330:	96ce                	add	a3,a3,s3
80003332:	01ba0733          	add	a4,s4,s11
80003336:	00068683          	lb	a3,0(a3)
8000333a:	00070703          	lb	a4,0(a4)
8000333e:	00e68563          	beq	a3,a4,80003348 <main+0x456>
80003342:	0e8c7163          	bgeu	s8,s0,80003424 <main+0x532>
80003346:	0405                	addi	s0,s0,1
80003348:	0d85                	addi	s11,s11,1
8000334a:	ff6d91e3          	bne	s11,s6,8000332c <main+0x43a>
8000334e:	0485                	addi	s1,s1,1
80003350:	02098993          	addi	s3,s3,32
80003354:	020a0a13          	addi	s4,s4,32
80003358:	fdb499e3          	bne	s1,s11,8000332a <main+0x438>
8000335c:	00000517          	auipc	a0,0x0
80003360:	3f450513          	addi	a0,a0,1012 # 80003750 <main+0x85e>
80003364:	0c041963          	bnez	s0,80003436 <main+0x544>
80003368:	9c2fe0ef          	jal	ra,8000152a <printf>
8000336c:	00000517          	auipc	a0,0x0
80003370:	42850513          	addi	a0,a0,1064 # 80003794 <main+0x8a2>
80003374:	9b6fe0ef          	jal	ra,8000152a <printf>
80003378:	00000517          	auipc	a0,0x0
8000337c:	43850513          	addi	a0,a0,1080 # 800037b0 <main+0x8be>
80003380:	9aafe0ef          	jal	ra,8000152a <printf>
80003384:	00000517          	auipc	a0,0x0
80003388:	41050513          	addi	a0,a0,1040 # 80003794 <main+0x8a2>
8000338c:	99efe0ef          	jal	ra,8000152a <printf>
80003390:	00000517          	auipc	a0,0x0
80003394:	45c50513          	addi	a0,a0,1116 # 800037ec <main+0x8fa>
80003398:	992fe0ef          	jal	ra,8000152a <printf>
8000339c:	4782                	lw	a5,0(sp)
8000339e:	64c1                	lui	s1,0x10
800033a0:	02048493          	addi	s1,s1,32 # 10020 <_tbss_end+0xffdc>
800033a4:	94be                	add	s1,s1,a5
800033a6:	00000997          	auipc	s3,0x0
800033aa:	45a98993          	addi	s3,s3,1114 # 80003800 <main+0x90e>
800033ae:	00090583          	lb	a1,0(s2)
800033b2:	854e                	mv	a0,s3
800033b4:	0905                	addi	s2,s2,1
800033b6:	974fe0ef          	jal	ra,8000152a <printf>
800033ba:	ff249ae3          	bne	s1,s2,800033ae <main+0x4bc>
800033be:	00000517          	auipc	a0,0x0
800033c2:	39250513          	addi	a0,a0,914 # 80003750 <main+0x85e>
800033c6:	964fe0ef          	jal	ra,8000152a <printf>
800033ca:	00000517          	auipc	a0,0x0
800033ce:	43a50513          	addi	a0,a0,1082 # 80003804 <main+0x912>
800033d2:	958fe0ef          	jal	ra,8000152a <printf>
800033d6:	47a2                	lw	a5,8(sp)
800033d8:	00000497          	auipc	s1,0x0
800033dc:	42848493          	addi	s1,s1,1064 # 80003800 <main+0x90e>
800033e0:	02078913          	addi	s2,a5,32
800033e4:	000a8583          	lb	a1,0(s5)
800033e8:	8526                	mv	a0,s1
800033ea:	0a85                	addi	s5,s5,1
800033ec:	93efe0ef          	jal	ra,8000152a <printf>
800033f0:	ff591ae3          	bne	s2,s5,800033e4 <main+0x4f2>
800033f4:	00000517          	auipc	a0,0x0
800033f8:	35c50513          	addi	a0,a0,860 # 80003750 <main+0x85e>
800033fc:	92efe0ef          	jal	ra,8000152a <printf>
80003400:	4532                	lw	a0,12(sp)
80003402:	9ccff0ef          	jal	ra,800025ce <aligned_free>
80003406:	4502                	lw	a0,0(sp)
80003408:	9c6ff0ef          	jal	ra,800025ce <aligned_free>
8000340c:	4512                	lw	a0,4(sp)
8000340e:	9c0ff0ef          	jal	ra,800025ce <aligned_free>
80003412:	856a                	mv	a0,s10
80003414:	9baff0ef          	jal	ra,800025ce <aligned_free>
80003418:	4522                	lw	a0,8(sp)
8000341a:	9b4ff0ef          	jal	ra,800025ce <aligned_free>
8000341e:	00803533          	snez	a0,s0
80003422:	b18d                	j	80003084 <main+0x192>
80003424:	866e                	mv	a2,s11
80003426:	85a6                	mv	a1,s1
80003428:	855e                	mv	a0,s7
8000342a:	900fe0ef          	jal	ra,8000152a <printf>
8000342e:	bf21                	j	80003346 <main+0x454>
80003430:	f8000693          	li	a3,-128
80003434:	b3cd                	j	80003216 <main+0x324>
80003436:	8f4fe0ef          	jal	ra,8000152a <printf>
8000343a:	00000517          	auipc	a0,0x0
8000343e:	35a50513          	addi	a0,a0,858 # 80003794 <main+0x8a2>
80003442:	8e8fe0ef          	jal	ra,8000152a <printf>
80003446:	00000517          	auipc	a0,0x0
8000344a:	37e50513          	addi	a0,a0,894 # 800037c4 <main+0x8d2>
8000344e:	8dcfe0ef          	jal	ra,8000152a <printf>
80003452:	40000613          	li	a2,1024
80003456:	85a2                	mv	a1,s0
80003458:	00000517          	auipc	a0,0x0
8000345c:	38050513          	addi	a0,a0,896 # 800037d8 <main+0x8e6>
80003460:	8cafe0ef          	jal	ra,8000152a <printf>
80003464:	00000517          	auipc	a0,0x0
80003468:	33050513          	addi	a0,a0,816 # 80003794 <main+0x8a2>
8000346c:	8befe0ef          	jal	ra,8000152a <printf>
80003470:	b705                	j	80003390 <main+0x49e>
80003472:	1141                	addi	sp,sp,-16
80003474:	00000517          	auipc	a0,0x0
80003478:	3c450513          	addi	a0,a0,964 # 80003838 <main+0x946>
8000347c:	c606                	sw	ra,12(sp)
8000347e:	c88ff0ef          	jal	ra,80002906 <print_uart>
80003482:	40b2                	lw	ra,12(sp)
80003484:	557d                	li	a0,-1
80003486:	0141                	addi	sp,sp,16
80003488:	8082                	ret
