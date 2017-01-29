0x106ff5000
0x9997FF
UIKit`-[UICollectionViewLayout prepareForCollectionViewUpdates:]:
    0x10798e7ff <+0>:    pushq  %rbp
    0x10798e800 <+1>:    movq   %rsp, %rbp
    0x10798e803 <+4>:    pushq  %r15
    0x10798e805 <+6>:    pushq  %r14
    0x10798e807 <+8>:    pushq  %r13
    0x10798e809 <+10>:   pushq  %r12
    0x10798e80b <+12>:   pushq  %rbx
    0x10798e80c <+13>:   subq   $0x4e8, %rsp              ; imm = 0x4E8 
    0x10798e813 <+20>:   movq   %rdi, %rbx
    0x10798e816 <+23>:   movq   %rbx, -0x420(%rbp)
    0x10798e81d <+30>:   movq   0x50d38c(%rip), %rax      ; (void *)0x0000000109967070: __stack_chk_guard
    0x10798e824 <+37>:   movq   (%rax), %rax
    0x10798e827 <+40>:   movq   %rax, -0x30(%rbp)
    0x10798e82b <+44>:   movq   %rdx, %rdi
    0x10798e82e <+47>:   callq  *0x50db6c(%rip)           ; (void *)0x0000000106593cb0: objc_retain
    0x10798e834 <+53>:   movq   %rax, -0x4c0(%rbp)
    0x10798e83b <+60>:   movq   0x829586(%rip), %r15      ; UICollectionViewLayout._collectionView
    0x10798e842 <+67>:   movq   (%rbx,%r15), %rdi
    0x10798e846 <+71>:   movq   0x80706b(%rip), %rsi      ; "_currentUpdate"
    0x10798e84d <+78>:   movq   0x50db3c(%rip), %r14      ; (void *)0x0000000106596ac0: objc_msgSend
    0x10798e854 <+85>:   callq  *%r14
    0x10798e857 <+88>:   movq   %rax, %rdi
    0x10798e85a <+91>:   callq  0x107c40b2c               ; symbol stub for: objc_retainAutoreleasedReturnValue
    0x10798e85f <+96>:   movq   %rax, -0x498(%rbp)
    0x10798e866 <+103>:  xorps  %xmm0, %xmm0
    0x10798e869 <+106>:  movaps %xmm0, -0x2c0(%rbp)
    0x10798e870 <+113>:  movaps %xmm0, -0x2d0(%rbp)
    0x10798e877 <+120>:  movaps %xmm0, -0x2e0(%rbp)
    0x10798e87e <+127>:  movaps %xmm0, -0x2f0(%rbp)
    0x10798e885 <+134>:  movq   (%rbx,%r15), %rdi
    0x10798e889 <+138>:  movq   0x806720(%rip), %rsi      ; "_visibleViews"
    0x10798e890 <+145>:  callq  *%r14
    0x10798e893 <+148>:  movq   %rax, %rdi
    0x10798e896 <+151>:  callq  0x107c40b2c               ; symbol stub for: objc_retainAutoreleasedReturnValue
    0x10798e89b <+156>:  movq   %rax, -0x480(%rbp)
    0x10798e8a2 <+163>:  movq   0x7d5397(%rip), %rsi      ; "countByEnumeratingWithState:objects:count:"
    0x10798e8a9 <+170>:  leaq   -0x2f0(%rbp), %rdx
    0x10798e8b0 <+177>:  leaq   -0xb0(%rbp), %rcx
    0x10798e8b7 <+184>:  movl   $0x10, %r8d
    0x10798e8bd <+190>:  movq   %rax, %rdi
    0x10798e8c0 <+193>:  callq  *%r14
    0x10798e8c3 <+196>:  movq   %rax, -0x418(%rbp)
    0x10798e8ca <+203>:  testq  %rax, %rax
    0x10798e8cd <+206>:  je     0x10798ec9a               ; <+1179>
    0x10798e8d3 <+212>:  movq   -0x2e0(%rbp), %rax
    0x10798e8da <+219>:  movq   (%rax), %rax
    0x10798e8dd <+222>:  movq   %rax, -0x448(%rbp)
    0x10798e8e4 <+229>:  movq   0x7d5355(%rip), %rax      ; "countByEnumeratingWithState:objects:count:"
    0x10798e8eb <+236>:  movq   %rax, -0x4b8(%rbp)
    0x10798e8f2 <+243>:  movq   0x7ec3a7(%rip), %rax      ; "_layoutAttributes"
    0x10798e8f9 <+250>:  movq   %rax, -0x428(%rbp)
    0x10798e900 <+257>:  movq   0x7d5819(%rip), %rax      ; "copy"
    0x10798e907 <+264>:  movq   %rax, -0x430(%rbp)
    0x10798e90e <+271>:  movq   0x80648b(%rip), %rax      ; "_isCell"
    0x10798e915 <+278>:  movq   %rax, -0x438(%rbp)
    0x10798e91c <+285>:  movq   0x7d61ed(%rip), %rax      ; "indexPath"
    0x10798e923 <+292>:  movq   %rax, -0x440(%rbp)
    0x10798e92a <+299>:  movq   0x804adf(%rip), %rax      ; "globalIndexForItemAtIndexPath:"
    0x10798e931 <+306>:  movq   %rax, -0x488(%rbp)
    0x10798e938 <+313>:  movq   0x806f81(%rip), %rax      ; "isGlobalIndexValid:"
    0x10798e93f <+320>:  movq   %rax, -0x4a8(%rbp)
    0x10798e946 <+327>:  movq   0x806c73(%rip), %rax      ; "indexPathForItemAtGlobalIndex:"
    0x10798e94d <+334>:  movq   %rax, -0x4b0(%rbp)
    0x10798e954 <+341>:  movq   0x7dfb05(%rip), %rax      ; "setIndexPath:"
    0x10798e95b <+348>:  movq   %rax, -0x478(%rbp)
    0x10798e962 <+355>:  movq   0x829467(%rip), %rax      ; UICollectionViewLayout._initialAnimationLayoutAttributesDict
    0x10798e969 <+362>:  movq   %rax, -0x460(%rbp)
    0x10798e970 <+369>:  movq   0x806f51(%rip), %rax      ; "collectionItemKeyForLayoutAttributes:"
    0x10798e977 <+376>:  movq   %rax, -0x468(%rbp)
    0x10798e97e <+383>:  movq   0x7d6923(%rip), %rax      ; "setObject:forKey:"
    0x10798e985 <+390>:  movq   %rax, -0x470(%rbp)
    0x10798e98c <+397>:  movq   0x7f581d(%rip), %rax      ; "_elementKind"
    0x10798e993 <+404>:  movq   %rax, -0x490(%rbp)
    0x10798e99a <+411>:  movq   0x806c4f(%rip), %rax      ; "newIndexPathForSupplementaryElementOfKind:oldIndexPath:"
    0x10798e9a1 <+418>:  movq   %rax, -0x4a0(%rbp)
    0x10798e9a8 <+425>:  xorl   %r15d, %r15d
    0x10798e9ab <+428>:  movq   -0x2e0(%rbp), %rax
    0x10798e9b2 <+435>:  movq   -0x448(%rbp), %rcx
    0x10798e9b9 <+442>:  cmpq   %rcx, (%rax)
    0x10798e9bc <+445>:  je     0x10798e9ca               ; <+459>
    0x10798e9be <+447>:  movq   -0x480(%rbp), %rdi
    0x10798e9c5 <+454>:  callq  0x107c40aba               ; symbol stub for: objc_enumerationMutation
    0x10798e9ca <+459>:  movq   -0x2e8(%rbp), %rax
    0x10798e9d1 <+466>:  movq   (%rax,%r15,8), %rdi
    0x10798e9d5 <+470>:  movq   -0x428(%rbp), %rsi
    0x10798e9dc <+477>:  movq   0x50d9ad(%rip), %r13      ; (void *)0x0000000106596ac0: objc_msgSend
    0x10798e9e3 <+484>:  callq  *%r13
    0x10798e9e6 <+487>:  movq   %rax, %rdi
    0x10798e9e9 <+490>:  callq  0x107c40b2c               ; symbol stub for: objc_retainAutoreleasedReturnValue
    0x10798e9ee <+495>:  movq   %rax, %rbx
    0x10798e9f1 <+498>:  movq   %rbx, %rdi
    0x10798e9f4 <+501>:  movq   -0x430(%rbp), %rsi
    0x10798e9fb <+508>:  callq  *%r13
    0x10798e9fe <+511>:  movq   %rax, %r12
    0x10798ea01 <+514>:  movq   %rbx, %rdi
    0x10798ea04 <+517>:  callq  *0x50d98e(%rip)           ; (void *)0x0000000106593d20: objc_release
    0x10798ea0a <+523>:  movq   %r12, %rdi
    0x10798ea0d <+526>:  movq   -0x438(%rbp), %rsi
    0x10798ea14 <+533>:  callq  *%r13
    0x10798ea17 <+536>:  testb  %al, %al
    0x10798ea19 <+538>:  je     0x10798eb66               ; <+871>
    0x10798ea1f <+544>:  leaq   0x8280ba(%rip), %rax      ; UICollectionViewUpdate._oldModel
    0x10798ea26 <+551>:  movq   (%rax), %rax
    0x10798ea29 <+554>:  movq   -0x498(%rbp), %rbx
    0x10798ea30 <+561>:  movq   (%rbx,%rax), %rax
    0x10798ea34 <+565>:  movq   %rax, -0x450(%rbp)
    0x10798ea3b <+572>:  movq   %r12, %rdi
    0x10798ea3e <+575>:  movq   -0x440(%rbp), %rsi
    0x10798ea45 <+582>:  callq  *%r13
    0x10798ea48 <+585>:  movq   %rax, %rdi
    0x10798ea4b <+588>:  callq  0x107c40b2c               ; symbol stub for: objc_retainAutoreleasedReturnValue
    0x10798ea50 <+593>:  movq   %rax, %r14
    0x10798ea53 <+596>:  movq   -0x450(%rbp), %rdi
    0x10798ea5a <+603>:  movq   -0x488(%rbp), %rsi
    0x10798ea61 <+610>:  movq   %r14, %rdx
    0x10798ea64 <+613>:  callq  *%r13
    0x10798ea67 <+616>:  leaq   0x8280a2(%rip), %rcx      ; UICollectionViewUpdate._oldGlobalItemMap
    0x10798ea6e <+623>:  movq   (%rcx), %rcx
    0x10798ea71 <+626>:  movq   (%rbx,%rcx), %rcx
    0x10798ea75 <+630>:  movq   (%rcx,%rax,8), %r13
    0x10798ea79 <+634>:  movq   %r14, %rdi
    0x10798ea7c <+637>:  callq  *0x50d916(%rip)           ; (void *)0x0000000106593d20: objc_release
    0x10798ea82 <+643>:  movabsq $0x7fffffffffffffff, %rax ; imm = 0x7FFFFFFFFFFFFFFF 
    0x10798ea8c <+653>:  cmpq   %rax, %r13
    0x10798ea8f <+656>:  je     0x10798ec49               ; <+1098>
    0x10798ea95 <+662>:  leaq   0x82804c(%rip), %rax      ; UICollectionViewUpdate._newModel
    0x10798ea9c <+669>:  movq   (%rax), %rax
    0x10798ea9f <+672>:  movq   -0x498(%rbp), %rcx
    0x10798eaa6 <+679>:  movq   (%rcx,%rax), %rdi
    0x10798eaaa <+683>:  movq   -0x4a8(%rbp), %rsi
    0x10798eab1 <+690>:  movq   %r13, %rdx
    0x10798eab4 <+693>:  callq  *0x50d8d6(%rip)           ; (void *)0x0000000106596ac0: objc_msgSend
    0x10798eaba <+699>:  testb  %al, %al
    0x10798eabc <+701>:  je     0x10798eb0c               ; <+781>
    0x10798eabe <+703>:  leaq   0x828023(%rip), %rax      ; UICollectionViewUpdate._newModel
    0x10798eac5 <+710>:  movq   (%rax), %rax
    0x10798eac8 <+713>:  movq   -0x498(%rbp), %rcx
    0x10798eacf <+720>:  movq   (%rcx,%rax), %rdi
    0x10798ead3 <+724>:  movq   -0x4b0(%rbp), %rsi
    0x10798eada <+731>:  movq   %r13, %rdx
    0x10798eadd <+734>:  movq   0x50d8ac(%rip), %rax      ; (void *)0x0000000106596ac0: objc_msgSend
    0x10798eae4 <+741>:  movq   %rax, %rbx
    0x10798eae7 <+744>:  callq  *%rbx
    0x10798eae9 <+746>:  movq   %rax, %rdi
    0x10798eaec <+749>:  callq  0x107c40b2c               ; symbol stub for: objc_retainAutoreleasedReturnValue
    0x10798eaf1 <+754>:  movq   %rax, %r14
    0x10798eaf4 <+757>:  movq   %r12, %rdi
    0x10798eaf7 <+760>:  movq   -0x478(%rbp), %rsi
    0x10798eafe <+767>:  movq   %r14, %rdx
    0x10798eb01 <+770>:  callq  *%rbx
    0x10798eb03 <+772>:  movq   %r14, %rdi
    0x10798eb06 <+775>:  callq  *0x50d88c(%rip)           ; (void *)0x0000000106593d20: objc_release
    0x10798eb0c <+781>:  movq   -0x420(%rbp), %rax
    0x10798eb13 <+788>:  movq   -0x460(%rbp), %rcx
    0x10798eb1a <+795>:  movq   (%rax,%rcx), %r14
    0x10798eb1e <+799>:  movq   0x813d6b(%rip), %rdi      ; (void *)0x00000001081db368: _UICollectionViewItemKey
    0x10798eb25 <+806>:  movq   -0x468(%rbp), %rsi
    0x10798eb2c <+813>:  movq   %r12, %rdx
    0x10798eb2f <+816>:  movq   0x50d85a(%rip), %rax      ; (void *)0x0000000106596ac0: objc_msgSend
    0x10798eb36 <+823>:  movq   %rax, %rbx
    0x10798eb39 <+826>:  callq  *%rbx
    0x10798eb3b <+828>:  movq   %rax, %rdi
    0x10798eb3e <+831>:  callq  0x107c40b2c               ; symbol stub for: objc_retainAutoreleasedReturnValue
    0x10798eb43 <+836>:  movq   %rax, %r13
    0x10798eb46 <+839>:  movq   %r14, %rdi
    0x10798eb49 <+842>:  movq   -0x470(%rbp), %rsi
    0x10798eb50 <+849>:  movq   %r12, %rdx
    0x10798eb53 <+852>:  movq   %r13, %rcx
    0x10798eb56 <+855>:  callq  *%rbx
    0x10798eb58 <+857>:  movq   %r13, %rdi
    0x10798eb5b <+860>:  callq  *0x50d837(%rip)           ; (void *)0x0000000106593d20: objc_release
    0x10798eb61 <+866>:  jmp    0x10798ec49               ; <+1098>
    0x10798eb66 <+871>:  movq   %r12, %rdi
    0x10798eb69 <+874>:  movq   -0x490(%rbp), %rsi
    0x10798eb70 <+881>:  callq  *%r13
    0x10798eb73 <+884>:  movq   %rax, %rdi
    0x10798eb76 <+887>:  callq  0x107c40b2c               ; symbol stub for: objc_retainAutoreleasedReturnValue
    0x10798eb7b <+892>:  movq   %rax, %rbx
    0x10798eb7e <+895>:  movq   %rbx, -0x450(%rbp)
    0x10798eb85 <+902>:  movq   %r12, %rdi
    0x10798eb88 <+905>:  movq   -0x440(%rbp), %rsi
    0x10798eb8f <+912>:  callq  *%r13
    0x10798eb92 <+915>:  movq   %rax, %rdi
    0x10798eb95 <+918>:  callq  0x107c40b2c               ; symbol stub for: objc_retainAutoreleasedReturnValue
    0x10798eb9a <+923>:  movq   %rax, -0x458(%rbp)
    0x10798eba1 <+930>:  movq   -0x498(%rbp), %rdi
    0x10798eba8 <+937>:  movq   -0x4a0(%rbp), %rsi
    0x10798ebaf <+944>:  movq   %rbx, %rdx
    0x10798ebb2 <+947>:  movq   %rax, %rcx
    0x10798ebb5 <+950>:  callq  *%r13
    0x10798ebb8 <+953>:  movq   %rax, %rdi
    0x10798ebbb <+956>:  callq  0x107c40b2c               ; symbol stub for: objc_retainAutoreleasedReturnValue
    0x10798ebc0 <+961>:  movq   %rax, %rbx
    0x10798ebc3 <+964>:  movq   %r12, %rdi
    0x10798ebc6 <+967>:  movq   -0x478(%rbp), %rsi
    0x10798ebcd <+974>:  movq   %rbx, %rdx
    0x10798ebd0 <+977>:  callq  *%r13
    0x10798ebd3 <+980>:  movq   %rbx, %rdi
    0x10798ebd6 <+983>:  movq   0x50d7bb(%rip), %r14      ; (void *)0x0000000106593d20: objc_release
    0x10798ebdd <+990>:  callq  *%r14
    0x10798ebe0 <+993>:  movq   -0x458(%rbp), %rdi
    0x10798ebe7 <+1000>: callq  *%r14
    0x10798ebea <+1003>: movq   -0x450(%rbp), %rdi
    0x10798ebf1 <+1010>: callq  *%r14
    0x10798ebf4 <+1013>: movq   -0x420(%rbp), %rax
    0x10798ebfb <+1020>: movq   -0x460(%rbp), %rcx
    0x10798ec02 <+1027>: movq   (%rax,%rcx), %rax
    0x10798ec06 <+1031>: movq   %rax, -0x450(%rbp)
    0x10798ec0d <+1038>: movq   0x813c7c(%rip), %rdi      ; (void *)0x00000001081db368: _UICollectionViewItemKey
    0x10798ec14 <+1045>: movq   -0x468(%rbp), %rsi
    0x10798ec1b <+1052>: movq   %r12, %rdx
    0x10798ec1e <+1055>: callq  *%r13
    0x10798ec21 <+1058>: movq   %rax, %rdi
    0x10798ec24 <+1061>: callq  0x107c40b2c               ; symbol stub for: objc_retainAutoreleasedReturnValue
    0x10798ec29 <+1066>: movq   %rax, %rbx
    0x10798ec2c <+1069>: movq   -0x450(%rbp), %rdi
    0x10798ec33 <+1076>: movq   -0x470(%rbp), %rsi
    0x10798ec3a <+1083>: movq   %r12, %rdx
    0x10798ec3d <+1086>: movq   %rbx, %rcx
    0x10798ec40 <+1089>: callq  *%r13
    0x10798ec43 <+1092>: movq   %rbx, %rdi
    0x10798ec46 <+1095>: callq  *%r14
    0x10798ec49 <+1098>: movq   %r12, %rdi
    0x10798ec4c <+1101>: callq  *0x50d746(%rip)           ; (void *)0x0000000106593d20: objc_release
    0x10798ec52 <+1107>: incq   %r15
    0x10798ec55 <+1110>: cmpq   -0x418(%rbp), %r15
    0x10798ec5c <+1117>: jb     0x10798e9ab               ; <+428>
    0x10798ec62 <+1123>: movl   $0x10, %r8d
    0x10798ec68 <+1129>: movq   -0x480(%rbp), %rdi
    0x10798ec6f <+1136>: movq   -0x4b8(%rbp), %rsi
    0x10798ec76 <+1143>: leaq   -0x2f0(%rbp), %rdx
    0x10798ec7d <+1150>: leaq   -0xb0(%rbp), %rcx
    0x10798ec84 <+1157>: callq  *0x50d706(%rip)           ; (void *)0x0000000106596ac0: objc_msgSend
    0x10798ec8a <+1163>: movq   %rax, -0x418(%rbp)
    0x10798ec91 <+1170>: testq  %rax, %rax
    0x10798ec94 <+1173>: jne    0x10798e8f2               ; <+243>
    0x10798ec9a <+1179>: movq   -0x480(%rbp), %rdi
    0x10798eca1 <+1186>: callq  *0x50d6f1(%rip)           ; (void *)0x0000000106593d20: objc_release
    0x10798eca7 <+1192>: xorps  %xmm0, %xmm0
    0x10798ecaa <+1195>: movaps %xmm0, -0x300(%rbp)
    0x10798ecb1 <+1202>: movaps %xmm0, -0x310(%rbp)
    0x10798ecb8 <+1209>: movaps %xmm0, -0x320(%rbp)
    0x10798ecbf <+1216>: movaps %xmm0, -0x330(%rbp)
    0x10798ecc6 <+1223>: movq   -0x420(%rbp), %r14
    0x10798eccd <+1230>: movq   0x8290f4(%rip), %rax      ; UICollectionViewLayout._collectionView
    0x10798ecd4 <+1237>: movq   %rax, %r15
    0x10798ecd7 <+1240>: movq   (%r14,%r15), %rdi
    0x10798ecdb <+1244>: movq   0x806a8e(%rip), %rsi      ; "_collectionViewData"
    0x10798ece2 <+1251>: callq  *0x50d6a8(%rip)           ; (void *)0x0000000106596ac0: objc_msgSend
    0x10798ece8 <+1257>: movq   %rax, %rdi
    0x10798eceb <+1260>: callq  0x107c40b2c               ; symbol stub for: objc_retainAutoreleasedReturnValue
    0x10798ecf0 <+1265>: movq   %rax, %rbx
    0x10798ecf3 <+1268>: movq   (%r14,%r15), %rsi
    0x10798ecf7 <+1272>: testq  %rsi, %rsi
    0x10798ecfa <+1275>: je     0x10798ed11               ; <+1298>
    0x10798ecfc <+1277>: movq   0x7df875(%rip), %rdx      ; "visibleBounds"
    0x10798ed03 <+1284>: leaq   -0x350(%rbp), %rdi
    0x10798ed0a <+1291>: callq  0x107c40b14               ; symbol stub for: objc_msgSend_stret
    0x10798ed0f <+1296>: jmp    0x10798ed22               ; <+1315>
    0x10798ed11 <+1298>: xorps  %xmm0, %xmm0
    0x10798ed14 <+1301>: movaps %xmm0, -0x340(%rbp)
    0x10798ed1b <+1308>: movaps %xmm0, -0x350(%rbp)
    0x10798ed22 <+1315>: movq   0x50d667(%rip), %r15      ; (void *)0x0000000106596ac0: objc_msgSend
    0x10798ed29 <+1322>: movq   0x7d5dd0(%rip), %rsi      ; "layoutAttributesForElementsInRect:"
    0x10798ed30 <+1329>: movq   -0x338(%rbp), %rax
    0x10798ed37 <+1336>: movq   %rax, 0x18(%rsp)
    0x10798ed3c <+1341>: movq   -0x340(%rbp), %rax
    0x10798ed43 <+1348>: movq   %rax, 0x10(%rsp)
    0x10798ed48 <+1353>: movq   -0x350(%rbp), %rax
    0x10798ed4f <+1360>: movq   -0x348(%rbp), %rcx
    0x10798ed56 <+1367>: movq   %rcx, 0x8(%rsp)
    0x10798ed5b <+1372>: movq   %rax, (%rsp)
    0x10798ed5f <+1376>: movq   %rbx, %rdi
    0x10798ed62 <+1379>: callq  *%r15
    0x10798ed65 <+1382>: movq   %rax, %rdi
    0x10798ed68 <+1385>: callq  0x107c40b2c               ; symbol stub for: objc_retainAutoreleasedReturnValue
    0x10798ed6d <+1390>: movq   %rax, %r14
    0x10798ed70 <+1393>: movq   %r14, -0x478(%rbp)
    0x10798ed77 <+1400>: movq   %rbx, %rdi
    0x10798ed7a <+1403>: callq  *0x50d618(%rip)           ; (void *)0x0000000106593d20: objc_release
    0x10798ed80 <+1409>: movq   0x7d4eb9(%rip), %rbx      ; "countByEnumeratingWithState:objects:count:"
    0x10798ed87 <+1416>: leaq   -0x330(%rbp), %rdx
    0x10798ed8e <+1423>: leaq   -0x130(%rbp), %rcx
    0x10798ed95 <+1430>: movl   $0x10, %r8d
    0x10798ed9b <+1436>: movq   %r14, %rdi
    0x10798ed9e <+1439>: movq   %rbx, %rsi
    0x10798eda1 <+1442>: callq  *%r15
    0x10798eda4 <+1445>: movq   %rax, -0x428(%rbp)
    0x10798edab <+1452>: testq  %rax, %rax
    0x10798edae <+1455>: je     0x10798f129               ; <+2346>
    0x10798edb4 <+1461>: movq   -0x320(%rbp), %rax
    0x10798edbb <+1468>: movq   (%rax), %rax
    0x10798edbe <+1471>: movq   %rax, -0x448(%rbp)
    0x10798edc5 <+1478>: movq   0x7d4e74(%rip), %rax      ; "countByEnumeratingWithState:objects:count:"
    0x10798edcc <+1485>: movq   %rax, -0x4a8(%rbp)
    0x10798edd3 <+1492>: movq   0x7d5346(%rip), %rax      ; "copy"
    0x10798edda <+1499>: movq   %rax, -0x430(%rbp)
    0x10798ede1 <+1506>: movq   0x805fb8(%rip), %rax      ; "_isCell"
    0x10798ede8 <+1513>: movq   %rax, -0x438(%rbp)
    0x10798edef <+1520>: movq   0x7d5d1a(%rip), %rax      ; "indexPath"
    0x10798edf6 <+1527>: movq   %rax, -0x440(%rbp)
    0x10798edfd <+1534>: movq   0x80460c(%rip), %rax      ; "globalIndexForItemAtIndexPath:"
    0x10798ee04 <+1541>: movq   %rax, -0x480(%rbp)
    0x10798ee0b <+1548>: movq   0x8067ae(%rip), %rax      ; "indexPathForItemAtGlobalIndex:"
    0x10798ee12 <+1555>: movq   %rax, -0x4a0(%rbp)
    0x10798ee19 <+1562>: movq   0x7df640(%rip), %rax      ; "setIndexPath:"
    0x10798ee20 <+1569>: movq   %rax, -0x458(%rbp)
    0x10798ee27 <+1576>: movq   0x828faa(%rip), %rax      ; UICollectionViewLayout._finalAnimationLayoutAttributesDict
    0x10798ee2e <+1583>: movq   %rax, -0x460(%rbp)
    0x10798ee35 <+1590>: movq   0x806a8c(%rip), %rax      ; "collectionItemKeyForLayoutAttributes:"
    0x10798ee3c <+1597>: movq   %rax, -0x468(%rbp)
    0x10798ee43 <+1604>: movq   0x7d645e(%rip), %rax      ; "setObject:forKey:"
    0x10798ee4a <+1611>: movq   %rax, -0x470(%rbp)
    0x10798ee51 <+1618>: movq   0x7f5358(%rip), %rax      ; "_elementKind"
    0x10798ee58 <+1625>: movq   %rax, -0x488(%rbp)
    0x10798ee5f <+1632>: movq   0x806a6a(%rip), %rax      ; "oldIndexPathForSupplementaryElementOfKind:newIndexPath:"
    0x10798ee66 <+1639>: movq   %rax, -0x490(%rbp)
    0x10798ee6d <+1646>: xorl   %r12d, %r12d
    0x10798ee70 <+1649>: movq   -0x320(%rbp), %rax
    0x10798ee77 <+1656>: movq   -0x448(%rbp), %rcx
    0x10798ee7e <+1663>: cmpq   %rcx, (%rax)
    0x10798ee81 <+1666>: je     0x10798ee8f               ; <+1680>
    0x10798ee83 <+1668>: movq   -0x478(%rbp), %rdi
    0x10798ee8a <+1675>: callq  0x107c40aba               ; symbol stub for: objc_enumerationMutation
    0x10798ee8f <+1680>: movq   -0x328(%rbp), %rax
    0x10798ee96 <+1687>: movq   (%rax,%r12,8), %rbx
    0x10798ee9a <+1691>: movq   %rbx, %rdi
    0x10798ee9d <+1694>: movq   -0x430(%rbp), %rsi
    0x10798eea4 <+1701>: callq  *%r15
    0x10798eea7 <+1704>: movq   %rax, %r13
    0x10798eeaa <+1707>: movq   %rbx, %rdi
    0x10798eead <+1710>: movq   -0x438(%rbp), %rsi
    0x10798eeb4 <+1717>: callq  *%r15
    0x10798eeb7 <+1720>: testb  %al, %al
    0x10798eeb9 <+1722>: je     0x10798efe0               ; <+2017>
    0x10798eebf <+1728>: leaq   0x827c22(%rip), %rax      ; UICollectionViewUpdate._newModel
    0x10798eec6 <+1735>: movq   (%rax), %rax
    0x10798eec9 <+1738>: movq   %r15, %rbx
    0x10798eecc <+1741>: movq   -0x498(%rbp), %r15
    0x10798eed3 <+1748>: movq   (%r15,%rax), %r14
    0x10798eed7 <+1752>: movq   %r13, %rdi
    0x10798eeda <+1755>: movq   %r13, -0x418(%rbp)
    0x10798eee1 <+1762>: movq   -0x440(%rbp), %rsi
    0x10798eee8 <+1769>: callq  *%rbx
    0x10798eeea <+1771>: movq   %rax, %rdi
    0x10798eeed <+1774>: callq  0x107c40b2c               ; symbol stub for: objc_retainAutoreleasedReturnValue
    0x10798eef2 <+1779>: movq   %rax, %r13
    0x10798eef5 <+1782>: movq   %r14, %rdi
    0x10798eef8 <+1785>: movq   -0x480(%rbp), %rsi
    0x10798eeff <+1792>: movq   %r13, %rdx
    0x10798ef02 <+1795>: callq  *%rbx
    0x10798ef04 <+1797>: movq   %rbx, %r14
    0x10798ef07 <+1800>: leaq   0x827c0a(%rip), %rcx      ; UICollectionViewUpdate._newGlobalItemMap
    0x10798ef0e <+1807>: movq   (%rcx), %rcx
    0x10798ef11 <+1810>: movq   (%r15,%rcx), %rcx
    0x10798ef15 <+1814>: movq   (%rcx,%rax,8), %r15
    0x10798ef19 <+1818>: movq   %r13, %rdi
    0x10798ef1c <+1821>: callq  *0x50d476(%rip)           ; (void *)0x0000000106593d20: objc_release
    0x10798ef22 <+1827>: movabsq $0x7fffffffffffffff, %rax ; imm = 0x7FFFFFFFFFFFFFFF 
    0x10798ef2c <+1837>: cmpq   %rax, %r15
    0x10798ef2f <+1840>: je     0x10798f0ce               ; <+2255>
    0x10798ef35 <+1846>: leaq   0x827ba4(%rip), %rax      ; UICollectionViewUpdate._oldModel
    0x10798ef3c <+1853>: movq   (%rax), %rax
    0x10798ef3f <+1856>: movq   -0x498(%rbp), %rcx
    0x10798ef46 <+1863>: movq   (%rcx,%rax), %rdi
    0x10798ef4a <+1867>: movq   -0x4a0(%rbp), %rsi
    0x10798ef51 <+1874>: movq   %r15, %rdx
    0x10798ef54 <+1877>: callq  *%r14
    0x10798ef57 <+1880>: movq   %rax, %rdi
    0x10798ef5a <+1883>: callq  0x107c40b2c               ; symbol stub for: objc_retainAutoreleasedReturnValue
    0x10798ef5f <+1888>: movq   %rax, %rbx
    0x10798ef62 <+1891>: movq   -0x418(%rbp), %r15
    0x10798ef69 <+1898>: movq   %r15, %rdi
    0x10798ef6c <+1901>: movq   -0x458(%rbp), %rsi
    0x10798ef73 <+1908>: movq   %rbx, %rdx
    0x10798ef76 <+1911>: callq  *%r14
    0x10798ef79 <+1914>: movq   %rbx, %rdi
    0x10798ef7c <+1917>: movq   0x50d415(%rip), %r13      ; (void *)0x0000000106593d20: objc_release
    0x10798ef83 <+1924>: callq  *%r13
    0x10798ef86 <+1927>: movq   -0x420(%rbp), %rax
    0x10798ef8d <+1934>: movq   -0x460(%rbp), %rcx
    0x10798ef94 <+1941>: movq   (%rax,%rcx), %rax
    0x10798ef98 <+1945>: movq   %rax, -0x450(%rbp)
    0x10798ef9f <+1952>: movq   0x8138ea(%rip), %rdi      ; (void *)0x00000001081db368: _UICollectionViewItemKey
    0x10798efa6 <+1959>: movq   -0x468(%rbp), %rsi
    0x10798efad <+1966>: movq   %r15, %rdx
    0x10798efb0 <+1969>: callq  *%r14
    0x10798efb3 <+1972>: movq   %rax, %rdi
    0x10798efb6 <+1975>: callq  0x107c40b2c               ; symbol stub for: objc_retainAutoreleasedReturnValue
    0x10798efbb <+1980>: movq   %rax, %rbx
    0x10798efbe <+1983>: movq   -0x450(%rbp), %rdi
    0x10798efc5 <+1990>: movq   -0x470(%rbp), %rsi
    0x10798efcc <+1997>: movq   %r15, %rdx
    0x10798efcf <+2000>: movq   %rbx, %rcx
    0x10798efd2 <+2003>: callq  *%r14
    0x10798efd5 <+2006>: movq   %rbx, %rdi
    0x10798efd8 <+2009>: callq  *%r13
    0x10798efdb <+2012>: jmp    0x10798f0ce               ; <+2255>
    0x10798efe0 <+2017>: movq   %r13, %rdi
    0x10798efe3 <+2020>: movq   -0x488(%rbp), %rsi
    0x10798efea <+2027>: callq  *%r15
    0x10798efed <+2030>: movq   %rax, %rdi
    0x10798eff0 <+2033>: callq  0x107c40b2c               ; symbol stub for: objc_retainAutoreleasedReturnValue
    0x10798eff5 <+2038>: movq   %rax, %r14
    0x10798eff8 <+2041>: movq   %r14, -0x450(%rbp)
    0x10798efff <+2048>: movq   %r13, %rdi
    0x10798f002 <+2051>: movq   -0x440(%rbp), %rsi
    0x10798f009 <+2058>: callq  *%r15
    0x10798f00c <+2061>: movq   %rax, %rdi
    0x10798f00f <+2064>: callq  0x107c40b2c               ; symbol stub for: objc_retainAutoreleasedReturnValue
    0x10798f014 <+2069>: movq   %r13, -0x418(%rbp)
    0x10798f01b <+2076>: movq   %r13, %rbx
    0x10798f01e <+2079>: movq   %rax, %r13
    0x10798f021 <+2082>: movq   -0x498(%rbp), %rdi
    0x10798f028 <+2089>: movq   -0x490(%rbp), %rsi
    0x10798f02f <+2096>: movq   %r14, %rdx
    0x10798f032 <+2099>: movq   %r13, %rcx
    0x10798f035 <+2102>: callq  *%r15
    0x10798f038 <+2105>: movq   %rax, %rdi
    0x10798f03b <+2108>: callq  0x107c40b2c               ; symbol stub for: objc_retainAutoreleasedReturnValue
    0x10798f040 <+2113>: movq   %rax, %r14
    0x10798f043 <+2116>: movq   %rbx, %rdi
    0x10798f046 <+2119>: movq   -0x458(%rbp), %rsi
    0x10798f04d <+2126>: movq   %r14, %rdx
    0x10798f050 <+2129>: callq  *%r15
    0x10798f053 <+2132>: movq   %r14, %rdi
    0x10798f056 <+2135>: movq   0x50d33b(%rip), %rax      ; (void *)0x0000000106593d20: objc_release
    0x10798f05d <+2142>: movq   %rax, %rbx
    0x10798f060 <+2145>: callq  *%rbx
    0x10798f062 <+2147>: movq   %r13, %rdi
    0x10798f065 <+2150>: callq  *%rbx
    0x10798f067 <+2152>: movq   -0x450(%rbp), %rdi
    0x10798f06e <+2159>: callq  *%rbx
    0x10798f070 <+2161>: movq   -0x420(%rbp), %rax
    0x10798f077 <+2168>: movq   -0x460(%rbp), %rcx
    0x10798f07e <+2175>: movq   (%rax,%rcx), %rax
    0x10798f082 <+2179>: movq   %rax, -0x450(%rbp)
    0x10798f089 <+2186>: movq   0x813800(%rip), %rdi      ; (void *)0x00000001081db368: _UICollectionViewItemKey
    0x10798f090 <+2193>: movq   -0x468(%rbp), %rsi
    0x10798f097 <+2200>: movq   -0x418(%rbp), %r14
    0x10798f09e <+2207>: movq   %r14, %rdx
    0x10798f0a1 <+2210>: callq  *%r15
    0x10798f0a4 <+2213>: movq   %rax, %rdi
    0x10798f0a7 <+2216>: callq  0x107c40b2c               ; symbol stub for: objc_retainAutoreleasedReturnValue
    0x10798f0ac <+2221>: movq   %rax, %r13
    0x10798f0af <+2224>: movq   -0x450(%rbp), %rdi
    0x10798f0b6 <+2231>: movq   -0x470(%rbp), %rsi
    0x10798f0bd <+2238>: movq   %r14, %rdx
    0x10798f0c0 <+2241>: movq   %r13, %rcx
    0x10798f0c3 <+2244>: callq  *%r15
    0x10798f0c6 <+2247>: movq   %r15, %r14
    0x10798f0c9 <+2250>: movq   %r13, %rdi
    0x10798f0cc <+2253>: callq  *%rbx
    0x10798f0ce <+2255>: movq   -0x418(%rbp), %rdi
    0x10798f0d5 <+2262>: callq  *0x50d2bd(%rip)           ; (void *)0x0000000106593d20: objc_release
    0x10798f0db <+2268>: incq   %r12
    0x10798f0de <+2271>: cmpq   -0x428(%rbp), %r12
    0x10798f0e5 <+2278>: movq   %r14, %r15
    0x10798f0e8 <+2281>: jb     0x10798ee70               ; <+1649>
    0x10798f0ee <+2287>: movl   $0x10, %r8d
    0x10798f0f4 <+2293>: movq   -0x478(%rbp), %rdi
    0x10798f0fb <+2300>: movq   -0x4a8(%rbp), %rbx
    0x10798f102 <+2307>: movq   %rbx, %rsi
    0x10798f105 <+2310>: leaq   -0x330(%rbp), %rdx
    0x10798f10c <+2317>: leaq   -0x130(%rbp), %rcx
    0x10798f113 <+2324>: callq  *0x50d277(%rip)           ; (void *)0x0000000106596ac0: objc_msgSend
    0x10798f119 <+2330>: movq   %rax, -0x428(%rbp)
    0x10798f120 <+2337>: testq  %rax, %rax
    0x10798f123 <+2340>: jne    0x10798edd3               ; <+1492>
    0x10798f129 <+2346>: movq   -0x478(%rbp), %rdi
    0x10798f130 <+2353>: callq  *0x50d262(%rip)           ; (void *)0x0000000106593d20: objc_release
    0x10798f136 <+2359>: xorps  %xmm0, %xmm0
    0x10798f139 <+2362>: movaps %xmm0, -0x360(%rbp)
    0x10798f140 <+2369>: movaps %xmm0, -0x370(%rbp)
    0x10798f147 <+2376>: movaps %xmm0, -0x380(%rbp)
    0x10798f14e <+2383>: movaps %xmm0, -0x390(%rbp)
    0x10798f155 <+2390>: movq   -0x4c0(%rbp), %rdi
    0x10798f15c <+2397>: callq  *0x50d23e(%rip)           ; (void *)0x0000000106593cb0: objc_retain
    0x10798f162 <+2403>: movq   %rax, -0x4a0(%rbp)
    0x10798f169 <+2410>: leaq   -0x390(%rbp), %rdx
    0x10798f170 <+2417>: leaq   -0x1b0(%rbp), %rcx
    0x10798f177 <+2424>: movl   $0x10, %r8d
    0x10798f17d <+2430>: movq   %rax, %rdi
    0x10798f180 <+2433>: movq   %rbx, %rsi
    0x10798f183 <+2436>: callq  *0x50d207(%rip)           ; (void *)0x0000000106596ac0: objc_msgSend
    0x10798f189 <+2442>: movq   %rax, -0x418(%rbp)
    0x10798f190 <+2449>: testq  %rax, %rax
    0x10798f193 <+2452>: je     0x10798f6a4               ; <+3749>

loc_99a199:
    0x10798f199 <+2458>: movq   -0x380(%rbp), %rax
    0x10798f1a0 <+2465>: movq   (%rax), %rax
    0x10798f1a3 <+2468>: movq   %rax, -0x438(%rbp)
    0x10798f1aa <+2475>: movq   0x7d4a8f(%rip), %rax      ; "countByEnumeratingWithState:objects:count:"
    0x10798f1b1 <+2482>: movq   %rax, -0x4f0(%rbp)
    0x10798f1b8 <+2489>: movq   0x806451(%rip), %rax      ; "updateAction"
    0x10798f1bf <+2496>: movq   %rax, -0x428(%rbp)
    0x10798f1c6 <+2503>: movq   0x80424b(%rip), %rax      ; "_isSectionOperation"
    0x10798f1cd <+2510>: movq   %rax, -0x430(%rbp)
    0x10798f1d4 <+2517>: movq   0x828c05(%rip), %rax      ; UICollectionViewLayout._deletedSectionsSet
    0x10798f1db <+2524>: movq   %rax, -0x480(%rbp)
    0x10798f1e2 <+2531>: movq   0x7de23f(%rip), %rax      ; "_indexPath"
    0x10798f1e9 <+2538>: movq   %rax, -0x488(%rbp)
    0x10798f1f0 <+2545>: movq   0x7d57d1(%rip), %rax      ; "section"
    0x10798f1f7 <+2552>: movq   %rax, -0x448(%rbp)
    0x10798f1fe <+2559>: movq   0x7d97fb(%rip), %rax      ; "addIndex:"
    0x10798f205 <+2566>: movq   %rax, -0x450(%rbp)
    0x10798f20c <+2573>: movq   0x828bd5(%rip), %rax      ; UICollectionViewLayout._insertedSectionsSet
    0x10798f213 <+2580>: movq   %rax, -0x490(%rbp)
    0x10798f21a <+2587>: movq   0x8066b7(%rip), %rax      ; "indexPathBeforeUpdate"
    0x10798f221 <+2594>: movq   %rax, -0x468(%rbp)
    0x10798f228 <+2601>: movq   0x8066b1(%rip), %rax      ; "indexPathAfterUpdate"
    0x10798f22f <+2608>: movq   %rax, -0x4a8(%rbp)
    0x10798f236 <+2615>: movq   0x8066ab(%rip), %rax      ; "collectionItemKeyForCellWithIndexPath:"
    0x10798f23d <+2622>: movq   %rax, -0x470(%rbp)
    0x10798f244 <+2629>: movq   0x828b7d(%rip), %rax      ; UICollectionViewLayout._collectionView
    0x10798f24b <+2636>: movq   %rax, -0x4b0(%rbp)
    0x10798f252 <+2643>: movq   0x80609f(%rip), %rax      ; "_visibleCellForIndexPath:"
    0x10798f259 <+2650>: movq   %rax, -0x4b8(%rbp)
    0x10798f260 <+2657>: movq   0x7eba39(%rip), %rax      ; "_layoutAttributes"
    0x10798f267 <+2664>: movq   %rax, -0x4c0(%rbp)
    0x10798f26e <+2671>: movq   0x7d4eab(%rip), %rax      ; "copy"
    0x10798f275 <+2678>: movq   %rax, -0x478(%rbp)
    0x10798f27c <+2685>: movq   0x7d4a85(%rip), %rax      ; "setAlpha:"
    0x10798f283 <+2692>: movq   %rax, -0x4c8(%rbp)
    0x10798f28a <+2699>: movq   0x828b47(%rip), %rax      ; UICollectionViewLayout._finalAnimationLayoutAttributesDict
    0x10798f291 <+2706>: movq   %rax, -0x4d8(%rbp)
    0x10798f298 <+2713>: movq   0x7d6009(%rip), %rax      ; "setObject:forKey:"
    0x10798f29f <+2720>: movq   %rax, -0x4d0(%rbp)
    0x10798f2a6 <+2727>: movq   0x7d5873(%rip), %rax      ; "layoutAttributesForItemAtIndexPath:"
    0x10798f2ad <+2734>: movq   %rax, -0x4e0(%rbp)
    0x10798f2b4 <+2741>: movq   0x828b15(%rip), %rax      ; UICollectionViewLayout._initialAnimationLayoutAttributesDict
    0x10798f2bb <+2748>: movq   %rax, -0x4e8(%rbp)
    0x10798f2c2 <+2755>: xorl   %r14d, %r14d
    0x10798f2c5 <+2758>: movq   -0x380(%rbp), %rax
    0x10798f2cc <+2765>: movq   -0x438(%rbp), %rcx
    0x10798f2d3 <+2772>: cmpq   %rcx, (%rax)
    0x10798f2d6 <+2775>: je     0x10798f2e4               ; <+2789>
    0x10798f2d8 <+2777>: movq   -0x4a0(%rbp), %rdi
    0x10798f2df <+2784>: callq  0x107c40aba               ; symbol stub for: objc_enumerationMutation
    0x10798f2e4 <+2789>: movq   -0x388(%rbp), %rax
    0x10798f2eb <+2796>: movq   (%rax,%r14,8), %r12
    0x10798f2ef <+2800>: movq   %r12, %rdi
    0x10798f2f2 <+2803>: movq   -0x428(%rbp), %rsi
    0x10798f2f9 <+2810>: callq  *%r15
    0x10798f2fc <+2813>: movq   %rax, %rbx
    0x10798f2ff <+2816>: movq   %r12, %rdi
    0x10798f302 <+2819>: movq   -0x430(%rbp), %rsi
    0x10798f309 <+2826>: callq  *%r15
    0x10798f30c <+2829>: testb  %al, %al
    0x10798f30e <+2831>: je     0x10798f346               ; <+2887>
    0x10798f310 <+2833>: testq  %rbx, %rbx
    0x10798f313 <+2836>: je     0x10798f5e6               ; <+3559>
    0x10798f319 <+2842>: movq   %r15, %r13
    0x10798f31c <+2845>: cmpq   $0x2, %rbx
    0x10798f320 <+2849>: je     0x10798f545               ; <+3398>
    0x10798f326 <+2855>: cmpq   $0x1, %rbx
    0x10798f32a <+2859>: movq   %r13, %r15
    0x10798f32d <+2862>: jne    0x10798f65c               ; <+3677>
    0x10798f333 <+2868>: movq   -0x420(%rbp), %rax
    0x10798f33a <+2875>: movq   -0x480(%rbp), %rcx
    0x10798f341 <+2882>: jmp    0x10798f5f4               ; <+3573>
    0x10798f346 <+2887>: leaq   -0x1(%rbx), %rax
    0x10798f34a <+2891>: cmpq   $0x1, %rax
    0x10798f34e <+2895>: ja     0x10798f476               ; <+3191>
    0x10798f354 <+2901>: movq   0x813535(%rip), %rax      ; (void *)0x00000001081db368: _UICollectionViewItemKey
    0x10798f35b <+2908>: movq   %rax, -0x440(%rbp)
    0x10798f362 <+2915>: movq   %r12, %rdi
    0x10798f365 <+2918>: movq   -0x468(%rbp), %rbx
    0x10798f36c <+2925>: movq   %rbx, %rsi
    0x10798f36f <+2928>: callq  *%r15
    0x10798f372 <+2931>: movq   %rax, %rdi
    0x10798f375 <+2934>: callq  0x107c40b2c               ; symbol stub for: objc_retainAutoreleasedReturnValue
    0x10798f37a <+2939>: movq   %r15, %r13
    0x10798f37d <+2942>: movq   %rax, %r15
    0x10798f380 <+2945>: movq   -0x440(%rbp), %rdi
    0x10798f387 <+2952>: movq   -0x470(%rbp), %rsi
    0x10798f38e <+2959>: movq   %r15, %rdx
    0x10798f391 <+2962>: callq  *%r13
    0x10798f394 <+2965>: movq   %rax, %rdi
    0x10798f397 <+2968>: callq  0x107c40b2c               ; symbol stub for: objc_retainAutoreleasedReturnValue
    0x10798f39c <+2973>: movq   %rax, -0x440(%rbp)
    0x10798f3a3 <+2980>: movq   %r15, %rdi
    0x10798f3a6 <+2983>: movq   0x50cfeb(%rip), %r15      ; (void *)0x0000000106593d20: objc_release
    0x10798f3ad <+2990>: callq  *%r15
    0x10798f3b0 <+2993>: movq   -0x4b0(%rbp), %rax
    0x10798f3b7 <+3000>: movq   -0x420(%rbp), %rcx
    0x10798f3be <+3007>: movq   (%rcx,%rax), %rax
    0x10798f3c2 <+3011>: movq   %rax, -0x460(%rbp)
    0x10798f3c9 <+3018>: movq   %r12, %rdi
    0x10798f3cc <+3021>: movq   %rbx, %rsi
    0x10798f3cf <+3024>: callq  *%r13
    0x10798f3d2 <+3027>: movq   %rax, %rdi
    0x10798f3d5 <+3030>: callq  0x107c40b2c               ; symbol stub for: objc_retainAutoreleasedReturnValue
    0x10798f3da <+3035>: movq   %rax, -0x458(%rbp)
    0x10798f3e1 <+3042>: movq   -0x460(%rbp), %rdi
    0x10798f3e8 <+3049>: movq   -0x4b8(%rbp), %rsi
    0x10798f3ef <+3056>: movq   %rax, %rdx
    0x10798f3f2 <+3059>: callq  *%r13
    0x10798f3f5 <+3062>: movq   %rax, %rdi
    0x10798f3f8 <+3065>: movq   -0x4c0(%rbp), %rsi
    0x10798f3ff <+3072>: callq  *%r13
    0x10798f402 <+3075>: movq   %rax, %rdi
    0x10798f405 <+3078>: callq  0x107c40b2c               ; symbol stub for: objc_retainAutoreleasedReturnValue
    0x10798f40a <+3083>: movq   %rax, %rbx
    0x10798f40d <+3086>: movq   %rbx, %rdi
    0x10798f410 <+3089>: movq   -0x478(%rbp), %rsi
    0x10798f417 <+3096>: callq  *%r13
    0x10798f41a <+3099>: movq   %rax, %r12
    0x10798f41d <+3102>: movq   %rbx, %rdi
    0x10798f420 <+3105>: callq  *%r15
    0x10798f423 <+3108>: movq   -0x458(%rbp), %rdi
    0x10798f42a <+3115>: callq  *%r15
    0x10798f42d <+3118>: movq   %r15, %rbx
    0x10798f430 <+3121>: testq  %r12, %r12
    0x10798f433 <+3124>: je     0x10798f46b               ; <+3180>
    0x10798f435 <+3126>: xorps  %xmm0, %xmm0
    0x10798f438 <+3129>: movq   %r12, %rdi
    0x10798f43b <+3132>: movq   -0x4c8(%rbp), %rsi
    0x10798f442 <+3139>: callq  *%r13
    0x10798f445 <+3142>: movq   -0x4d8(%rbp), %rax
    0x10798f44c <+3149>: movq   -0x420(%rbp), %rcx
    0x10798f453 <+3156>: movq   (%rcx,%rax), %rdi
    0x10798f457 <+3160>: movq   -0x4d0(%rbp), %rsi
    0x10798f45e <+3167>: movq   %r12, %rdx
    0x10798f461 <+3170>: movq   -0x440(%rbp), %rcx
    0x10798f468 <+3177>: callq  *%r13
    0x10798f46b <+3180>: movq   %r13, %r15
    0x10798f46e <+3183>: movq   %r12, %rdi
    0x10798f471 <+3186>: jmp    0x10798f651               ; <+3666>
    0x10798f476 <+3191>: orq    $0x2, %rbx
    0x10798f47a <+3195>: cmpq   $0x2, %rbx
    0x10798f47e <+3199>: jne    0x10798f65c               ; <+3677>
    0x10798f484 <+3205>: movq   %r12, %rdi
    0x10798f487 <+3208>: movq   -0x4a8(%rbp), %rsi
    0x10798f48e <+3215>: callq  *%r15
    0x10798f491 <+3218>: movq   %rax, %rdi
    0x10798f494 <+3221>: callq  0x107c40b2c               ; symbol stub for: objc_retainAutoreleasedReturnValue
    0x10798f499 <+3226>: movq   %rax, %rbx
    0x10798f49c <+3229>: movq   %rbx, -0x440(%rbp)
    0x10798f4a3 <+3236>: movq   0x8133e6(%rip), %rdi      ; (void *)0x00000001081db368: _UICollectionViewItemKey
    0x10798f4aa <+3243>: movq   -0x470(%rbp), %rsi
    0x10798f4b1 <+3250>: movq   %rbx, %rdx
    0x10798f4b4 <+3253>: callq  *%r15
    0x10798f4b7 <+3256>: movq   %rax, %rdi
    0x10798f4ba <+3259>: callq  0x107c40b2c               ; symbol stub for: objc_retainAutoreleasedReturnValue
    0x10798f4bf <+3264>: movq   %rax, -0x458(%rbp)
    0x10798f4c6 <+3271>: movq   -0x420(%rbp), %r13
    0x10798f4cd <+3278>: movq   %r13, %rdi
    0x10798f4d0 <+3281>: movq   -0x4e0(%rbp), %rsi
    0x10798f4d7 <+3288>: movq   %rbx, %rdx
    0x10798f4da <+3291>: callq  *%r15
    0x10798f4dd <+3294>: movq   %rax, %rdi
    0x10798f4e0 <+3297>: callq  0x107c40b2c               ; symbol stub for: objc_retainAutoreleasedReturnValue
    0x10798f4e5 <+3302>: movq   %rax, %rbx
    0x10798f4e8 <+3305>: movq   %rbx, %rdi
    0x10798f4eb <+3308>: movq   -0x478(%rbp), %rsi
    0x10798f4f2 <+3315>: callq  *%r15
    0x10798f4f5 <+3318>: movq   %rax, %r12
    0x10798f4f8 <+3321>: movq   %rbx, %rdi
    0x10798f4fb <+3324>: callq  *0x50ce97(%rip)           ; (void *)0x0000000106593d20: objc_release
    0x10798f501 <+3330>: testq  %r12, %r12
    0x10798f504 <+3333>: je     0x10798f638               ; <+3641>
    0x10798f50a <+3339>: xorps  %xmm0, %xmm0
    0x10798f50d <+3342>: movq   %r12, %rdi
    0x10798f510 <+3345>: movq   -0x4c8(%rbp), %rsi
    0x10798f517 <+3352>: callq  *%r15
    0x10798f51a <+3355>: movq   -0x4e8(%rbp), %rax
    0x10798f521 <+3362>: movq   (%r13,%rax), %rdi
    0x10798f526 <+3367>: movq   -0x4d0(%rbp), %rsi
    0x10798f52d <+3374>: movq   %r12, %rdx
    0x10798f530 <+3377>: movq   -0x458(%rbp), %rbx
    0x10798f537 <+3384>: movq   %rbx, %rcx
    0x10798f53a <+3387>: callq  *%r15
    0x10798f53d <+3390>: movq   %rbx, %r13
    0x10798f540 <+3393>: jmp    0x10798f63f               ; <+3648>
    0x10798f545 <+3398>: movq   -0x420(%rbp), %r15
    0x10798f54c <+3405>: movq   -0x480(%rbp), %rcx
    0x10798f553 <+3412>: movq   (%r15,%rcx), %rcx
    0x10798f557 <+3416>: movq   %rcx, -0x440(%rbp)
    0x10798f55e <+3423>: movq   %r12, %rdi
    0x10798f561 <+3426>: movq   -0x468(%rbp), %rsi
    0x10798f568 <+3433>: callq  *%r13
    0x10798f56b <+3436>: movq   %rax, %rdi
    0x10798f56e <+3439>: callq  0x107c40b2c               ; symbol stub for: objc_retainAutoreleasedReturnValue
    0x10798f573 <+3444>: movq   %rax, %rbx
    0x10798f576 <+3447>: movq   %rbx, %rdi
    0x10798f579 <+3450>: movq   -0x448(%rbp), %rsi
    0x10798f580 <+3457>: callq  *%r13
    0x10798f583 <+3460>: movq   -0x440(%rbp), %rdi
    0x10798f58a <+3467>: movq   -0x450(%rbp), %rsi
    0x10798f591 <+3474>: movq   %rax, %rdx
    0x10798f594 <+3477>: callq  *%r13
    0x10798f597 <+3480>: movq   %rbx, %rdi
    0x10798f59a <+3483>: movq   0x50cdf7(%rip), %rax      ; (void *)0x0000000106593d20: objc_release
    0x10798f5a1 <+3490>: callq  *%rax
    0x10798f5a3 <+3492>: movq   -0x490(%rbp), %rax
    0x10798f5aa <+3499>: movq   (%r15,%rax), %rax
    0x10798f5ae <+3503>: movq   %rax, -0x440(%rbp)
    0x10798f5b5 <+3510>: movq   %r13, %r15
    0x10798f5b8 <+3513>: movq   %r12, %rdi
    0x10798f5bb <+3516>: movq   -0x4a8(%rbp), %rsi
    0x10798f5c2 <+3523>: callq  *%r15
    0x10798f5c5 <+3526>: movq   %rax, %rdi
    0x10798f5c8 <+3529>: callq  0x107c40b2c               ; symbol stub for: objc_retainAutoreleasedReturnValue
    0x10798f5cd <+3534>: movq   %rax, %rbx
    0x10798f5d0 <+3537>: movq   %rbx, %rdi
    0x10798f5d3 <+3540>: movq   -0x448(%rbp), %rsi
    0x10798f5da <+3547>: callq  *%r15
    0x10798f5dd <+3550>: movq   -0x440(%rbp), %rdi
    0x10798f5e4 <+3557>: jmp    0x10798f620               ; <+3617>
    0x10798f5e6 <+3559>: movq   -0x420(%rbp), %rax
    0x10798f5ed <+3566>: movq   -0x490(%rbp), %rcx
    0x10798f5f4 <+3573>: movq   (%rax,%rcx), %r13
    0x10798f5f8 <+3577>: movq   %r12, %rdi
    0x10798f5fb <+3580>: movq   -0x488(%rbp), %rsi
    0x10798f602 <+3587>: callq  *%r15
    0x10798f605 <+3590>: movq   %rax, %rdi
    0x10798f608 <+3593>: callq  0x107c40b2c               ; symbol stub for: objc_retainAutoreleasedReturnValue
    0x10798f60d <+3598>: movq   %rax, %rbx
    0x10798f610 <+3601>: movq   %rbx, %rdi
    0x10798f613 <+3604>: movq   -0x448(%rbp), %rsi
    0x10798f61a <+3611>: callq  *%r15
    0x10798f61d <+3614>: movq   %r13, %rdi
    0x10798f620 <+3617>: movq   -0x450(%rbp), %rsi
    0x10798f627 <+3624>: movq   %rax, %rdx
    0x10798f62a <+3627>: callq  *%r15
    0x10798f62d <+3630>: movq   %rbx, %rdi
    0x10798f630 <+3633>: callq  *0x50cd62(%rip)           ; (void *)0x0000000106593d20: objc_release
    0x10798f636 <+3639>: jmp    0x10798f65c               ; <+3677>
    0x10798f638 <+3641>: movq   -0x458(%rbp), %r13
    0x10798f63f <+3648>: movq   %r12, %rdi
    0x10798f642 <+3651>: movq   0x50cd4f(%rip), %rax      ; (void *)0x0000000106593d20: objc_release
    0x10798f649 <+3658>: movq   %rax, %rbx
    0x10798f64c <+3661>: callq  *%rbx
    0x10798f64e <+3663>: movq   %r13, %rdi

// loc_99a651:
    0x10798f651 <+3666>: callq  *%rbx
    0x10798f653 <+3668>: movq   -0x440(%rbp), %rdi
    0x10798f65a <+3675>: callq  *%rbx
    0x10798f65c <+3677>: incq   %r14
    0x10798f65f <+3680>: cmpq   -0x418(%rbp), %r14
    0x10798f666 <+3687>: jb     0x10798f2c5               ; <+2758>
    0x10798f66c <+3693>: movl   $0x10, %r8d
    0x10798f672 <+3699>: movq   -0x4a0(%rbp), %rdi
    0x10798f679 <+3706>: movq   -0x4f0(%rbp), %rsi
    0x10798f680 <+3713>: leaq   -0x390(%rbp), %rdx
    0x10798f687 <+3720>: leaq   -0x1b0(%rbp), %rcx
    0x10798f68e <+3727>: callq  *0x50ccfc(%rip)           ; (void *)0x0000000106596ac0: objc_msgSend
    0x10798f694 <+3733>: movq   %rax, -0x418(%rbp)
    0x10798f69b <+3740>: testq  %rax, %rax
    0x10798f69e <+3743>: jne    0x10798f1b8               ; <+2489>
    0x10798f6a4 <+3749>: movq   -0x4a0(%rbp), %rdi
    0x10798f6ab <+3756>: callq  *0x50cce7(%rip)           ; (void *)0x0000000106593d20: objc_release
    0x10798f6b1 <+3762>: movq   0x828728(%rip), %rax      ; UICollectionViewLayout._deletedSectionsSet
    0x10798f6b8 <+3769>: movq   -0x420(%rbp), %r12
    0x10798f6bf <+3776>: movq   (%r12,%rax), %rdi
    0x10798f6c3 <+3780>: movq   0x7de83e(%rip), %rsi      ; "firstIndex"
    0x10798f6ca <+3787>: callq  *0x50ccc0(%rip)           ; (void *)0x0000000106596ac0: objc_msgSend
    0x10798f6d0 <+3793>: movq   %rax, %rbx
    0x10798f6d3 <+3796>: movabsq $0x7fffffffffffffff, %rax ; imm = 0x7FFFFFFFFFFFFFFF 
    0x10798f6dd <+3806>: cmpq   %rax, %rbx
    0x10798f6e0 <+3809>: je     0x10798fb66               ; <+4967>
    0x10798f6e6 <+3815>: movq   0x8286db(%rip), %rax      ; UICollectionViewLayout._collectionView
    0x10798f6ed <+3822>: movq   %rax, -0x4b8(%rbp)
    0x10798f6f4 <+3829>: movq   0x8061bd(%rip), %rax      ; "_currentUpdate"
    0x10798f6fb <+3836>: movq   %rax, -0x4c0(%rbp)
    0x10798f702 <+3843>: movq   0x805ebf(%rip), %rax      ; "existingSupplementaryLayoutAttributesInSection:"
    0x10798f709 <+3850>: movq   %rax, -0x4c8(%rbp)
    0x10798f710 <+3857>: movq   0x7d4529(%rip), %rax      ; "countByEnumeratingWithState:objects:count:"
    0x10798f717 <+3864>: movq   %rax, -0x4d0(%rbp)
    0x10798f71e <+3871>: movq   0x8286bb(%rip), %rax      ; UICollectionViewLayout._deletedSectionsSet
    0x10798f725 <+3878>: movq   %rax, -0x4d8(%rbp)
    0x10798f72c <+3885>: movq   0x7de7dd(%rip), %rax      ; "indexGreaterThanIndex:"
    0x10798f733 <+3892>: movq   %rax, -0x4e0(%rbp)
    0x10798f73a <+3899>: movq   %rbx, -0x4b0(%rbp)
    0x10798f741 <+3906>: xorps  %xmm0, %xmm0
    0x10798f744 <+3909>: movaps %xmm0, -0x3a0(%rbp)
    0x10798f74b <+3916>: movaps %xmm0, -0x3b0(%rbp)
    0x10798f752 <+3923>: movaps %xmm0, -0x3c0(%rbp)
    0x10798f759 <+3930>: movaps %xmm0, -0x3d0(%rbp)
    0x10798f760 <+3937>: movq   -0x4b8(%rbp), %rax
    0x10798f767 <+3944>: movq   (%r12,%rax), %rdi
    0x10798f76b <+3948>: movq   -0x4c0(%rbp), %rsi
    0x10798f772 <+3955>: callq  *%r15
    0x10798f775 <+3958>: movq   %rax, %rdi
    0x10798f778 <+3961>: callq  0x107c40b2c               ; symbol stub for: objc_retainAutoreleasedReturnValue
    0x10798f77d <+3966>: movq   %rax, %r14
    0x10798f780 <+3969>: leaq   0x827359(%rip), %rax      ; UICollectionViewUpdate._oldModel
    0x10798f787 <+3976>: movq   (%rax), %rax
    0x10798f78a <+3979>: movq   (%r14,%rax), %rdi
    0x10798f78e <+3983>: movq   -0x4c8(%rbp), %rsi
    0x10798f795 <+3990>: movq   %rbx, %rdx
    0x10798f798 <+3993>: callq  *%r15
    0x10798f79b <+3996>: movq   %rax, %rdi
    0x10798f79e <+3999>: callq  0x107c40b2c               ; symbol stub for: objc_retainAutoreleasedReturnValue
    0x10798f7a3 <+4004>: movq   %rax, %rbx
    0x10798f7a6 <+4007>: movq   %rbx, -0x470(%rbp)
    0x10798f7ad <+4014>: movq   %r14, %rdi
    0x10798f7b0 <+4017>: callq  *0x50cbe2(%rip)           ; (void *)0x0000000106593d20: objc_release
    0x10798f7b6 <+4023>: movl   $0x10, %r8d
    0x10798f7bc <+4029>: movq   %rbx, %rdi
    0x10798f7bf <+4032>: movq   -0x4d0(%rbp), %rsi
    0x10798f7c6 <+4039>: leaq   -0x3d0(%rbp), %rdx
    0x10798f7cd <+4046>: leaq   -0x230(%rbp), %rcx
    0x10798f7d4 <+4053>: callq  *%r15
    0x10798f7d7 <+4056>: movq   %rax, -0x428(%rbp)
    0x10798f7de <+4063>: testq  %rax, %rax
    0x10798f7e1 <+4066>: je     0x10798fb24               ; <+4901>
    0x10798f7e7 <+4072>: movq   -0x3c0(%rbp), %rax
    0x10798f7ee <+4079>: movq   (%rax), %rax
    0x10798f7f1 <+4082>: movq   %rax, -0x450(%rbp)
    0x10798f7f8 <+4089>: movq   0x7d4441(%rip), %rax      ; "countByEnumeratingWithState:objects:count:"
    0x10798f7ff <+4096>: movq   %rax, -0x4a8(%rbp)
    0x10798f806 <+4103>: movq   0x80598b(%rip), %rax      ; "_isDecorationView"
    0x10798f80d <+4110>: movq   %rax, -0x430(%rbp)
    0x10798f814 <+4117>: movq   0x8285d5(%rip), %rax      ; UICollectionViewLayout._deletedDecorationIndexPathsDict
    0x10798f81b <+4124>: movq   %rax, -0x460(%rbp)
    0x10798f822 <+4131>: movq   0x7f4987(%rip), %rax      ; "_elementKind"
    0x10798f829 <+4138>: movq   %rax, -0x418(%rbp)
    0x10798f830 <+4145>: movq   0x7d48b1(%rip), %rax      ; "objectForKeyedSubscript:"
    0x10798f837 <+4152>: movq   %rax, -0x438(%rbp)
    0x10798f83e <+4159>: movq   0x7d4083(%rip), %rax      ; "alloc"
    0x10798f845 <+4166>: movq   %rax, -0x478(%rbp)
    0x10798f84c <+4173>: movq   0x7d407d(%rip), %rax      ; "init"
    0x10798f853 <+4180>: movq   %rax, -0x480(%rbp)
    0x10798f85a <+4187>: movq   0x7d48b7(%rip), %rax      ; "setObject:forKeyedSubscript:"
    0x10798f861 <+4194>: movq   %rax, -0x488(%rbp)
    0x10798f868 <+4201>: movq   0x7d52a1(%rip), %rax      ; "indexPath"
    0x10798f86f <+4208>: movq   %rax, -0x440(%rbp)
    0x10798f876 <+4215>: movq   0x7d456b(%rip), %rax      ; "addObject:"
    0x10798f87d <+4222>: movq   %rax, -0x448(%rbp)
    0x10798f884 <+4229>: movq   0x82856d(%rip), %rax      ; UICollectionViewLayout._deletedSupplementaryIndexPathsDict
    0x10798f88b <+4236>: movq   %rax, -0x468(%rbp)
    0x10798f892 <+4243>: xorl   %r13d, %r13d
    0x10798f895 <+4246>: movq   -0x3c0(%rbp), %rax
    0x10798f89c <+4253>: movq   -0x450(%rbp), %rcx
    0x10798f8a3 <+4260>: cmpq   %rcx, (%rax)
    0x10798f8a6 <+4263>: je     0x10798f8b4               ; <+4277>
    0x10798f8a8 <+4265>: movq   -0x470(%rbp), %rdi
    0x10798f8af <+4272>: callq  0x107c40aba               ; symbol stub for: objc_enumerationMutation
    0x10798f8b4 <+4277>: movq   -0x3c8(%rbp), %rax
    0x10798f8bb <+4284>: movq   (%rax,%r13,8), %rbx
    0x10798f8bf <+4288>: movq   %rbx, %rdi
    0x10798f8c2 <+4291>: movq   -0x430(%rbp), %rsi
    0x10798f8c9 <+4298>: callq  *0x50cac1(%rip)           ; (void *)0x0000000106596ac0: objc_msgSend
    0x10798f8cf <+4304>: testb  %al, %al
    0x10798f8d1 <+4306>: je     0x10798f9b1               ; <+4530>
    0x10798f8d7 <+4312>: movq   -0x460(%rbp), %rax
    0x10798f8de <+4319>: movq   (%r12,%rax), %r14
    0x10798f8e2 <+4323>: movq   %rbx, %rdi
    0x10798f8e5 <+4326>: movq   -0x418(%rbp), %rsi
    0x10798f8ec <+4333>: callq  *%r15
    0x10798f8ef <+4336>: movq   %rax, %rdi
    0x10798f8f2 <+4339>: callq  0x107c40b2c               ; symbol stub for: objc_retainAutoreleasedReturnValue
    0x10798f8f7 <+4344>: movq   %rax, %r12
    0x10798f8fa <+4347>: movq   %r14, %rdi
    0x10798f8fd <+4350>: movq   -0x438(%rbp), %rsi
    0x10798f904 <+4357>: movq   %r12, %rdx
    0x10798f907 <+4360>: callq  *%r15
    0x10798f90a <+4363>: movq   %rax, %rdi
    0x10798f90d <+4366>: callq  0x107c40b2c               ; symbol stub for: objc_retainAutoreleasedReturnValue
    0x10798f912 <+4371>: movq   %rax, %r14
    0x10798f915 <+4374>: movq   %r12, %rdi
    0x10798f918 <+4377>: callq  *0x50ca7a(%rip)           ; (void *)0x0000000106593d20: objc_release
    0x10798f91e <+4383>: testq  %r14, %r14
    0x10798f921 <+4386>: jne    0x10798fa99               ; <+4762>
    0x10798f927 <+4392>: movq   0x80fb32(%rip), %rdi      ; (void *)0x0000000106ddae50: NSMutableArray
    0x10798f92e <+4399>: movq   -0x478(%rbp), %rsi
    0x10798f935 <+4406>: callq  *%r15
    0x10798f938 <+4409>: movq   %rax, %rdi
    0x10798f93b <+4412>: movq   -0x480(%rbp), %rsi
    0x10798f942 <+4419>: callq  *%r15
    0x10798f945 <+4422>: movq   %rax, %r12
    0x10798f948 <+4425>: movq   %r14, %rdi
    0x10798f94b <+4428>: movq   0x50ca46(%rip), %r14      ; (void *)0x0000000106593d20: objc_release
    0x10798f952 <+4435>: callq  *%r14
    0x10798f955 <+4438>: movq   -0x420(%rbp), %rax
    0x10798f95c <+4445>: movq   -0x460(%rbp), %rcx
    0x10798f963 <+4452>: movq   (%rax,%rcx), %rax
    0x10798f967 <+4456>: movq   %rax, -0x490(%rbp)
    0x10798f96e <+4463>: movq   %rbx, %rdi
    0x10798f971 <+4466>: movq   -0x418(%rbp), %rsi
    0x10798f978 <+4473>: callq  *%r15
    0x10798f97b <+4476>: movq   %rax, %rdi
    0x10798f97e <+4479>: callq  0x107c40b2c               ; symbol stub for: objc_retainAutoreleasedReturnValue
    0x10798f983 <+4484>: movq   %rbx, -0x458(%rbp)
    0x10798f98a <+4491>: movq   %r15, %rbx
    0x10798f98d <+4494>: movq   %rax, %r15
    0x10798f990 <+4497>: movq   -0x490(%rbp), %rdi
    0x10798f997 <+4504>: movq   -0x488(%rbp), %rsi
    0x10798f99e <+4511>: movq   %r12, %rdx
    0x10798f9a1 <+4514>: movq   %r15, %rcx
    0x10798f9a4 <+4517>: callq  *%rbx
    0x10798f9a6 <+4519>: movq   %r15, %rdi
    0x10798f9a9 <+4522>: movq   %rbx, %r15
    0x10798f9ac <+4525>: jmp    0x10798fa8c               ; <+4749>
    0x10798f9b1 <+4530>: movq   -0x468(%rbp), %rax
    0x10798f9b8 <+4537>: movq   (%r12,%rax), %r14
    0x10798f9bc <+4541>: movq   %rbx, %rdi
    0x10798f9bf <+4544>: movq   -0x418(%rbp), %rsi
    0x10798f9c6 <+4551>: callq  *%r15
    0x10798f9c9 <+4554>: movq   %rax, %rdi
    0x10798f9cc <+4557>: callq  0x107c40b2c               ; symbol stub for: objc_retainAutoreleasedReturnValue
    0x10798f9d1 <+4562>: movq   %rbx, %r12
    0x10798f9d4 <+4565>: movq   %r15, %rbx
    0x10798f9d7 <+4568>: movq   %rax, %r15
    0x10798f9da <+4571>: movq   %r14, %rdi
    0x10798f9dd <+4574>: movq   -0x438(%rbp), %rsi
    0x10798f9e4 <+4581>: movq   %r15, %rdx
    0x10798f9e7 <+4584>: callq  *%rbx
    0x10798f9e9 <+4586>: movq   %rax, %rdi
    0x10798f9ec <+4589>: callq  0x107c40b2c               ; symbol stub for: objc_retainAutoreleasedReturnValue
    0x10798f9f1 <+4594>: movq   %rax, %r14
    0x10798f9f4 <+4597>: movq   %r15, %rdi
    0x10798f9f7 <+4600>: movq   %rbx, %r15
    0x10798f9fa <+4603>: movq   %r12, %rbx
    0x10798f9fd <+4606>: callq  *0x50c995(%rip)           ; (void *)0x0000000106593d20: objc_release
    0x10798fa03 <+4612>: testq  %r14, %r14
    0x10798fa06 <+4615>: jne    0x10798fa99               ; <+4762>
    0x10798fa0c <+4621>: movq   0x80fa4d(%rip), %rdi      ; (void *)0x0000000106ddae50: NSMutableArray
    0x10798fa13 <+4628>: movq   -0x478(%rbp), %rsi
    0x10798fa1a <+4635>: callq  *%r15
    0x10798fa1d <+4638>: movq   %rax, %rdi
    0x10798fa20 <+4641>: movq   -0x480(%rbp), %rsi
    0x10798fa27 <+4648>: callq  *%r15
    0x10798fa2a <+4651>: movq   %rax, %r12
    0x10798fa2d <+4654>: movq   %r14, %rdi
    0x10798fa30 <+4657>: movq   0x50c961(%rip), %r14      ; (void *)0x0000000106593d20: objc_release
    0x10798fa37 <+4664>: callq  *%r14
    0x10798fa3a <+4667>: movq   -0x420(%rbp), %rax
    0x10798fa41 <+4674>: movq   -0x468(%rbp), %rcx
    0x10798fa48 <+4681>: movq   (%rax,%rcx), %rax
    0x10798fa4c <+4685>: movq   %rax, -0x490(%rbp)
    0x10798fa53 <+4692>: movq   %rbx, %rdi
    0x10798fa56 <+4695>: movq   -0x418(%rbp), %rsi
    0x10798fa5d <+4702>: callq  *%r15
    0x10798fa60 <+4705>: movq   %rax, %rdi
    0x10798fa63 <+4708>: callq  0x107c40b2c               ; symbol stub for: objc_retainAutoreleasedReturnValue
    0x10798fa68 <+4713>: movq   %rbx, -0x458(%rbp)
    0x10798fa6f <+4720>: movq   %rax, %rbx
    0x10798fa72 <+4723>: movq   -0x490(%rbp), %rdi
    0x10798fa79 <+4730>: movq   -0x488(%rbp), %rsi
    0x10798fa80 <+4737>: movq   %r12, %rdx
    0x10798fa83 <+4740>: movq   %rbx, %rcx
    0x10798fa86 <+4743>: callq  *%r15
    0x10798fa89 <+4746>: movq   %rbx, %rdi
    0x10798fa8c <+4749>: movq   -0x458(%rbp), %rbx
    0x10798fa93 <+4756>: callq  *%r14
    0x10798fa96 <+4759>: movq   %r12, %r14
    0x10798fa99 <+4762>: movq   %rbx, %rdi
    0x10798fa9c <+4765>: movq   -0x440(%rbp), %rsi
    0x10798faa3 <+4772>: callq  *%r15
    0x10798faa6 <+4775>: movq   %rax, %rdi
    0x10798faa9 <+4778>: callq  0x107c40b2c               ; symbol stub for: objc_retainAutoreleasedReturnValue
    0x10798faae <+4783>: movq   %rax, %rbx
    0x10798fab1 <+4786>: movq   %r14, %rdi
    0x10798fab4 <+4789>: movq   -0x448(%rbp), %rsi
    0x10798fabb <+4796>: movq   %rbx, %rdx
    0x10798fabe <+4799>: callq  *%r15
    0x10798fac1 <+4802>: movq   %rbx, %rdi
    0x10798fac4 <+4805>: movq   0x50c8cd(%rip), %rax      ; (void *)0x0000000106593d20: objc_release
    0x10798facb <+4812>: movq   %rax, %rbx
    0x10798face <+4815>: callq  *%rbx
    0x10798fad0 <+4817>: movq   %r14, %rdi
    0x10798fad3 <+4820>: callq  *%rbx
    0x10798fad5 <+4822>: incq   %r13
    0x10798fad8 <+4825>: cmpq   -0x428(%rbp), %r13
    0x10798fadf <+4832>: movq   -0x420(%rbp), %r12
    0x10798fae6 <+4839>: jb     0x10798f895               ; <+4246>
    0x10798faec <+4845>: movl   $0x10, %r8d
    0x10798faf2 <+4851>: movq   -0x470(%rbp), %rdi
    0x10798faf9 <+4858>: movq   -0x4a8(%rbp), %rsi
    0x10798fb00 <+4865>: leaq   -0x3d0(%rbp), %rdx
    0x10798fb07 <+4872>: leaq   -0x230(%rbp), %rcx
    0x10798fb0e <+4879>: callq  *0x50c87c(%rip)           ; (void *)0x0000000106596ac0: objc_msgSend
    0x10798fb14 <+4885>: movq   %rax, -0x428(%rbp)
    0x10798fb1b <+4892>: testq  %rax, %rax
    0x10798fb1e <+4895>: jne    0x10798f806               ; <+4103>
    0x10798fb24 <+4901>: movq   -0x470(%rbp), %rdi
    0x10798fb2b <+4908>: callq  *0x50c867(%rip)           ; (void *)0x0000000106593d20: objc_release
    0x10798fb31 <+4914>: movq   -0x4d8(%rbp), %rax
    0x10798fb38 <+4921>: movq   (%r12,%rax), %rdi
    0x10798fb3c <+4925>: movq   -0x4e0(%rbp), %rsi
    0x10798fb43 <+4932>: movq   -0x4b0(%rbp), %rdx
    0x10798fb4a <+4939>: callq  *0x50c840(%rip)           ; (void *)0x0000000106596ac0: objc_msgSend
    0x10798fb50 <+4945>: movq   %rax, %rbx
    0x10798fb53 <+4948>: movabsq $0x7fffffffffffffff, %rax ; imm = 0x7FFFFFFFFFFFFFFF 
    0x10798fb5d <+4958>: cmpq   %rax, %rbx
    0x10798fb60 <+4961>: jne    0x10798f73a               ; <+3899>
    0x10798fb66 <+4967>: movq   0x82827b(%rip), %rax      ; UICollectionViewLayout._insertedSectionsSet
    0x10798fb6d <+4974>: movq   (%r12,%rax), %rdi
    0x10798fb71 <+4978>: movq   0x7de390(%rip), %rsi      ; "firstIndex"
    0x10798fb78 <+4985>: callq  *0x50c812(%rip)           ; (void *)0x0000000106596ac0: objc_msgSend
    0x10798fb7e <+4991>: movq   %rax, %rbx
    0x10798fb81 <+4994>: movabsq $0x7fffffffffffffff, %rax ; imm = 0x7FFFFFFFFFFFFFFF 
    0x10798fb8b <+5004>: cmpq   %rax, %rbx
    0x10798fb8e <+5007>: je     0x10799001a               ; <+6171>
    0x10798fb94 <+5013>: movq   0x82822d(%rip), %rax      ; UICollectionViewLayout._collectionView
    0x10798fb9b <+5020>: movq   %rax, -0x4b8(%rbp)
    0x10798fba2 <+5027>: movq   0x805d0f(%rip), %rax      ; "_currentUpdate"
    0x10798fba9 <+5034>: movq   %rax, -0x4c0(%rbp)
    0x10798fbb0 <+5041>: movq   0x805a11(%rip), %rax      ; "existingSupplementaryLayoutAttributesInSection:"
    0x10798fbb7 <+5048>: movq   %rax, -0x4c8(%rbp)
    0x10798fbbe <+5055>: movq   0x7d407b(%rip), %rax      ; "countByEnumeratingWithState:objects:count:"
    0x10798fbc5 <+5062>: movq   %rax, -0x4d0(%rbp)
    0x10798fbcc <+5069>: movq   0x828215(%rip), %rax      ; UICollectionViewLayout._insertedSectionsSet
    0x10798fbd3 <+5076>: movq   %rax, -0x4d8(%rbp)
    0x10798fbda <+5083>: movq   0x7de32f(%rip), %rax      ; "indexGreaterThanIndex:"
    0x10798fbe1 <+5090>: movq   %rax, -0x4e0(%rbp)
    0x10798fbe8 <+5097>: movq   %rbx, -0x4b0(%rbp)
    0x10798fbef <+5104>: xorps  %xmm0, %xmm0
    0x10798fbf2 <+5107>: movaps %xmm0, -0x3e0(%rbp)
    0x10798fbf9 <+5114>: movaps %xmm0, -0x3f0(%rbp)
    0x10798fc00 <+5121>: movaps %xmm0, -0x400(%rbp)
    0x10798fc07 <+5128>: movaps %xmm0, -0x410(%rbp)
    0x10798fc0e <+5135>: movq   -0x4b8(%rbp), %rax
    0x10798fc15 <+5142>: movq   (%r12,%rax), %rdi
    0x10798fc19 <+5146>: movq   -0x4c0(%rbp), %rsi
    0x10798fc20 <+5153>: callq  *%r15
    0x10798fc23 <+5156>: movq   %rax, %rdi
    0x10798fc26 <+5159>: callq  0x107c40b2c               ; symbol stub for: objc_retainAutoreleasedReturnValue
    0x10798fc2b <+5164>: movq   %rax, %r14
    0x10798fc2e <+5167>: leaq   0x826eb3(%rip), %rax      ; UICollectionViewUpdate._newModel
    0x10798fc35 <+5174>: movq   (%rax), %rax
    0x10798fc38 <+5177>: movq   (%r14,%rax), %rdi
    0x10798fc3c <+5181>: movq   -0x4c8(%rbp), %rsi
    0x10798fc43 <+5188>: movq   %rbx, %rdx
    0x10798fc46 <+5191>: callq  *%r15
    0x10798fc49 <+5194>: movq   %rax, %rdi
    0x10798fc4c <+5197>: callq  0x107c40b2c               ; symbol stub for: objc_retainAutoreleasedReturnValue
    0x10798fc51 <+5202>: movq   %rax, %rbx
    0x10798fc54 <+5205>: movq   %rbx, -0x470(%rbp)
    0x10798fc5b <+5212>: movq   %r14, %rdi
    0x10798fc5e <+5215>: callq  *0x50c734(%rip)           ; (void *)0x0000000106593d20: objc_release
    0x10798fc64 <+5221>: movl   $0x10, %r8d
    0x10798fc6a <+5227>: movq   %rbx, %rdi
    0x10798fc6d <+5230>: movq   -0x4d0(%rbp), %rsi
    0x10798fc74 <+5237>: leaq   -0x410(%rbp), %rdx
    0x10798fc7b <+5244>: leaq   -0x2b0(%rbp), %rcx
    0x10798fc82 <+5251>: callq  *%r15
    0x10798fc85 <+5254>: movq   %rax, -0x430(%rbp)
    0x10798fc8c <+5261>: testq  %rax, %rax
    0x10798fc8f <+5264>: je     0x10798ffd8               ; <+6105>
    0x10798fc95 <+5270>: movq   -0x400(%rbp), %rax
    0x10798fc9c <+5277>: movq   (%rax), %rax
    0x10798fc9f <+5280>: movq   %rax, -0x458(%rbp)
    0x10798fca6 <+5287>: movq   0x7d3f93(%rip), %rax      ; "countByEnumeratingWithState:objects:count:"
    0x10798fcad <+5294>: movq   %rax, -0x4a8(%rbp)
    0x10798fcb4 <+5301>: movq   0x8054dd(%rip), %rax      ; "_isDecorationView"
    0x10798fcbb <+5308>: movq   %rax, -0x438(%rbp)
    0x10798fcc2 <+5315>: movq   0x828137(%rip), %rax      ; UICollectionViewLayout._insertedDecorationIndexPathsDict
    0x10798fcc9 <+5322>: movq   %rax, -0x460(%rbp)
    0x10798fcd0 <+5329>: movq   0x7f44d9(%rip), %rax      ; "_elementKind"
    0x10798fcd7 <+5336>: movq   %rax, -0x428(%rbp)
    0x10798fcde <+5343>: movq   0x7d4403(%rip), %rax      ; "objectForKeyedSubscript:"
    0x10798fce5 <+5350>: movq   %rax, -0x440(%rbp)
    0x10798fcec <+5357>: movq   0x7d3bd5(%rip), %rax      ; "alloc"
    0x10798fcf3 <+5364>: movq   %rax, -0x478(%rbp)
    0x10798fcfa <+5371>: movq   0x7d3bcf(%rip), %rax      ; "init"
    0x10798fd01 <+5378>: movq   %rax, -0x480(%rbp)
    0x10798fd08 <+5385>: movq   0x7d4409(%rip), %rax      ; "setObject:forKeyedSubscript:"
    0x10798fd0f <+5392>: movq   %rax, -0x488(%rbp)
    0x10798fd16 <+5399>: movq   0x7d4df3(%rip), %rax      ; "indexPath"
    0x10798fd1d <+5406>: movq   %rax, -0x448(%rbp)
    0x10798fd24 <+5413>: movq   0x7d40bd(%rip), %rax      ; "addObject:"
    0x10798fd2b <+5420>: movq   %rax, -0x450(%rbp)
    0x10798fd32 <+5427>: movq   0x8280cf(%rip), %rax      ; UICollectionViewLayout._insertedSupplementaryIndexPathsDict
    0x10798fd39 <+5434>: movq   %rax, -0x468(%rbp)
    0x10798fd40 <+5441>: xorl   %r13d, %r13d
    0x10798fd43 <+5444>: movq   -0x400(%rbp), %rax
    0x10798fd4a <+5451>: movq   -0x458(%rbp), %rcx
    0x10798fd51 <+5458>: cmpq   %rcx, (%rax)
    0x10798fd54 <+5461>: je     0x10798fd62               ; <+5475>
    0x10798fd56 <+5463>: movq   -0x470(%rbp), %rdi
    0x10798fd5d <+5470>: callq  0x107c40aba               ; symbol stub for: objc_enumerationMutation
    0x10798fd62 <+5475>: movq   -0x408(%rbp), %rax
    0x10798fd69 <+5482>: movq   (%rax,%r13,8), %rdi
    0x10798fd6d <+5486>: movq   %rdi, -0x418(%rbp)
    0x10798fd74 <+5493>: movq   -0x438(%rbp), %rsi
    0x10798fd7b <+5500>: callq  *0x50c60f(%rip)           ; (void *)0x0000000106596ac0: objc_msgSend
    0x10798fd81 <+5506>: testb  %al, %al
    0x10798fd83 <+5508>: je     0x10798fe67               ; <+5736>
    0x10798fd89 <+5514>: movq   -0x460(%rbp), %rax
    0x10798fd90 <+5521>: movq   (%r12,%rax), %r14
    0x10798fd94 <+5525>: movq   -0x418(%rbp), %rdi
    0x10798fd9b <+5532>: movq   -0x428(%rbp), %rsi
    0x10798fda2 <+5539>: callq  *%r15
    0x10798fda5 <+5542>: movq   %rax, %rdi
    0x10798fda8 <+5545>: callq  0x107c40b2c               ; symbol stub for: objc_retainAutoreleasedReturnValue
    0x10798fdad <+5550>: movq   %r15, %rbx
    0x10798fdb0 <+5553>: movq   %rax, %r15
    0x10798fdb3 <+5556>: movq   %r14, %rdi
    0x10798fdb6 <+5559>: movq   -0x440(%rbp), %rsi
    0x10798fdbd <+5566>: movq   %r15, %rdx
    0x10798fdc0 <+5569>: callq  *%rbx
    0x10798fdc2 <+5571>: movq   %rax, %rdi
    0x10798fdc5 <+5574>: callq  0x107c40b2c               ; symbol stub for: objc_retainAutoreleasedReturnValue
    0x10798fdca <+5579>: movq   %rax, %r12
    0x10798fdcd <+5582>: movq   %r15, %rdi
    0x10798fdd0 <+5585>: movq   %rbx, %r15
    0x10798fdd3 <+5588>: callq  *0x50c5bf(%rip)           ; (void *)0x0000000106593d20: objc_release
    0x10798fdd9 <+5594>: testq  %r12, %r12
    0x10798fddc <+5597>: jne    0x10798ff49               ; <+5962>
    0x10798fde2 <+5603>: movq   0x80f677(%rip), %rdi      ; (void *)0x0000000106ddae50: NSMutableArray
    0x10798fde9 <+5610>: movq   -0x478(%rbp), %rsi
    0x10798fdf0 <+5617>: callq  *%r15
    0x10798fdf3 <+5620>: movq   %rax, %rdi
    0x10798fdf6 <+5623>: movq   -0x480(%rbp), %rsi
    0x10798fdfd <+5630>: callq  *%r15
    0x10798fe00 <+5633>: movq   %rax, %rbx
    0x10798fe03 <+5636>: movq   %r12, %rdi
    0x10798fe06 <+5639>: movq   0x50c58b(%rip), %r12      ; (void *)0x0000000106593d20: objc_release
    0x10798fe0d <+5646>: callq  *%r12
    0x10798fe10 <+5649>: movq   -0x420(%rbp), %rax
    0x10798fe17 <+5656>: movq   -0x460(%rbp), %rcx
    0x10798fe1e <+5663>: movq   (%rax,%rcx), %rax
    0x10798fe22 <+5667>: movq   %rax, -0x490(%rbp)
    0x10798fe29 <+5674>: movq   -0x418(%rbp), %rdi
    0x10798fe30 <+5681>: movq   -0x428(%rbp), %rsi
    0x10798fe37 <+5688>: callq  *%r15
    0x10798fe3a <+5691>: movq   %rax, %rdi
    0x10798fe3d <+5694>: callq  0x107c40b2c               ; symbol stub for: objc_retainAutoreleasedReturnValue
    0x10798fe42 <+5699>: movq   %rax, %r14
    0x10798fe45 <+5702>: movq   -0x490(%rbp), %rdi
    0x10798fe4c <+5709>: movq   -0x488(%rbp), %rsi
    0x10798fe53 <+5716>: movq   %rbx, %rdx
    0x10798fe56 <+5719>: movq   %r14, %rcx
    0x10798fe59 <+5722>: callq  *%r15
    0x10798fe5c <+5725>: movq   %r14, %rdi
    0x10798fe5f <+5728>: callq  *%r12
    0x10798fe62 <+5731>: jmp    0x10798ff46               ; <+5959>
    0x10798fe67 <+5736>: movq   %r15, %rbx
    0x10798fe6a <+5739>: movq   -0x468(%rbp), %rax
    0x10798fe71 <+5746>: movq   (%r12,%rax), %r15
    0x10798fe75 <+5750>: movq   -0x418(%rbp), %rdi
    0x10798fe7c <+5757>: movq   -0x428(%rbp), %rsi
    0x10798fe83 <+5764>: callq  *%rbx
    0x10798fe85 <+5766>: movq   %rax, %rdi
    0x10798fe88 <+5769>: callq  0x107c40b2c               ; symbol stub for: objc_retainAutoreleasedReturnValue
    0x10798fe8d <+5774>: movq   %rax, %r14
    0x10798fe90 <+5777>: movq   %r15, %rdi
    0x10798fe93 <+5780>: movq   %rbx, %r15
    0x10798fe96 <+5783>: movq   -0x440(%rbp), %rsi
    0x10798fe9d <+5790>: movq   %r14, %rdx
    0x10798fea0 <+5793>: callq  *%r15
    0x10798fea3 <+5796>: movq   %rax, %rdi
    0x10798fea6 <+5799>: callq  0x107c40b2c               ; symbol stub for: objc_retainAutoreleasedReturnValue
    0x10798feab <+5804>: movq   %rax, %r12
    0x10798feae <+5807>: movq   %r14, %rdi
    0x10798feb1 <+5810>: callq  *0x50c4e1(%rip)           ; (void *)0x0000000106593d20: objc_release
    0x10798feb7 <+5816>: testq  %r12, %r12
    0x10798feba <+5819>: jne    0x10798ff49               ; <+5962>
    0x10798fec0 <+5825>: movq   0x80f599(%rip), %rdi      ; (void *)0x0000000106ddae50: NSMutableArray
    0x10798fec7 <+5832>: movq   -0x478(%rbp), %rsi
    0x10798fece <+5839>: callq  *%r15
    0x10798fed1 <+5842>: movq   %rax, %rdi
    0x10798fed4 <+5845>: movq   -0x480(%rbp), %rsi
    0x10798fedb <+5852>: callq  *%r15
    0x10798fede <+5855>: movq   %rax, -0x490(%rbp)
    0x10798fee5 <+5862>: movq   %r12, %rdi
    0x10798fee8 <+5865>: movq   0x50c4a9(%rip), %r14      ; (void *)0x0000000106593d20: objc_release
    0x10798feef <+5872>: callq  *%r14
    0x10798fef2 <+5875>: movq   -0x420(%rbp), %rax
    0x10798fef9 <+5882>: movq   %r15, %r12
    0x10798fefc <+5885>: movq   -0x468(%rbp), %rcx
    0x10798ff03 <+5892>: movq   (%rax,%rcx), %rbx
    0x10798ff07 <+5896>: movq   -0x418(%rbp), %rdi
    0x10798ff0e <+5903>: movq   -0x428(%rbp), %rsi
    0x10798ff15 <+5910>: callq  *%r12
    0x10798ff18 <+5913>: movq   %rax, %rdi
    0x10798ff1b <+5916>: callq  0x107c40b2c               ; symbol stub for: objc_retainAutoreleasedReturnValue
    0x10798ff20 <+5921>: movq   %rax, %r15
    0x10798ff23 <+5924>: movq   %rbx, %rdi
    0x10798ff26 <+5927>: movq   -0x488(%rbp), %rsi
    0x10798ff2d <+5934>: movq   -0x490(%rbp), %rbx
    0x10798ff34 <+5941>: movq   %rbx, %rdx
    0x10798ff37 <+5944>: movq   %r15, %rcx
    0x10798ff3a <+5947>: callq  *%r12
    0x10798ff3d <+5950>: movq   %r15, %rdi
    0x10798ff40 <+5953>: movq   %r12, %r15
    0x10798ff43 <+5956>: callq  *%r14
    0x10798ff46 <+5959>: movq   %rbx, %r12
    0x10798ff49 <+5962>: movq   -0x418(%rbp), %rdi
    0x10798ff50 <+5969>: movq   -0x448(%rbp), %rsi
    0x10798ff57 <+5976>: callq  *%r15
    0x10798ff5a <+5979>: movq   %rax, %rdi
    0x10798ff5d <+5982>: callq  0x107c40b2c               ; symbol stub for: objc_retainAutoreleasedReturnValue
    0x10798ff62 <+5987>: movq   %rax, %rbx
    0x10798ff65 <+5990>: movq   %r12, %rdi
    0x10798ff68 <+5993>: movq   -0x450(%rbp), %rsi
    0x10798ff6f <+6000>: movq   %rbx, %rdx
    0x10798ff72 <+6003>: callq  *%r15
    0x10798ff75 <+6006>: movq   %rbx, %rdi
    0x10798ff78 <+6009>: movq   0x50c419(%rip), %rax      ; (void *)0x0000000106593d20: objc_release
    0x10798ff7f <+6016>: movq   %rax, %rbx
    0x10798ff82 <+6019>: callq  *%rbx
    0x10798ff84 <+6021>: movq   %r12, %rdi
    0x10798ff87 <+6024>: callq  *%rbx
    0x10798ff89 <+6026>: incq   %r13
    0x10798ff8c <+6029>: cmpq   -0x430(%rbp), %r13
    0x10798ff93 <+6036>: movq   -0x420(%rbp), %r12
    0x10798ff9a <+6043>: jb     0x10798fd43               ; <+5444>
    0x10798ffa0 <+6049>: movl   $0x10, %r8d
    0x10798ffa6 <+6055>: movq   -0x470(%rbp), %rdi
    0x10798ffad <+6062>: movq   -0x4a8(%rbp), %rsi
    0x10798ffb4 <+6069>: leaq   -0x410(%rbp), %rdx
    0x10798ffbb <+6076>: leaq   -0x2b0(%rbp), %rcx
    0x10798ffc2 <+6083>: callq  *0x50c3c8(%rip)           ; (void *)0x0000000106596ac0: objc_msgSend
    0x10798ffc8 <+6089>: movq   %rax, -0x430(%rbp)
    0x10798ffcf <+6096>: testq  %rax, %rax
    0x10798ffd2 <+6099>: jne    0x10798fcb4               ; <+5301>
    0x10798ffd8 <+6105>: movq   -0x470(%rbp), %rdi
    0x10798ffdf <+6112>: callq  *0x50c3b3(%rip)           ; (void *)0x0000000106593d20: objc_release
    0x10798ffe5 <+6118>: movq   -0x4d8(%rbp), %rax
    0x10798ffec <+6125>: movq   (%r12,%rax), %rdi
    0x10798fff0 <+6129>: movq   -0x4e0(%rbp), %rsi
    0x10798fff7 <+6136>: movq   -0x4b0(%rbp), %rdx
    0x10798fffe <+6143>: callq  *0x50c38c(%rip)           ; (void *)0x0000000106596ac0: objc_msgSend
    0x107990004 <+6149>: movq   %rax, %rbx
    0x107990007 <+6152>: movabsq $0x7fffffffffffffff, %rax ; imm = 0x7FFFFFFFFFFFFFFF 
    0x107990011 <+6162>: cmpq   %rax, %rbx
    0x107990014 <+6165>: jne    0x10798fbe8               ; <+5097>
    0x10799001a <+6171>: movq   0x50c377(%rip), %rbx      ; (void *)0x0000000106593d20: objc_release
    0x107990021 <+6178>: movq   -0x498(%rbp), %rdi
    0x107990028 <+6185>: callq  *%rbx
    0x10799002a <+6187>: movq   -0x4a0(%rbp), %rdi
    0x107990031 <+6194>: callq  *%rbx
    0x107990033 <+6196>: movq   0x50bb76(%rip), %rax      ; (void *)0x0000000109967070: __stack_chk_guard
    0x10799003a <+6203>: movq   (%rax), %rax
    0x10799003d <+6206>: cmpq   -0x30(%rbp), %rax
    0x107990041 <+6210>: jne    0x107990055               ; <+6230>
    0x107990043 <+6212>: addq   $0x4e8, %rsp              ; imm = 0x4E8 
    0x10799004a <+6219>: popq   %rbx
    0x10799004b <+6220>: popq   %r12
    0x10799004d <+6222>: popq   %r13
    0x10799004f <+6224>: popq   %r14
    0x107990051 <+6226>: popq   %r15
    0x107990053 <+6228>: popq   %rbp
    0x107990054 <+6229>: retq   
    0x107990055 <+6230>: callq  0x107c411f2               ; symbol stub for: __stack_chk_fail
