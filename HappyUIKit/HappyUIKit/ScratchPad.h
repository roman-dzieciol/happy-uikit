-[_UIFlowLayoutSection updateEstimatedSizeForSection:]


Pseudocode:
r15 = arg2;
r14 = self;
rdi = *_OBJC_IVAR_$__UIFlowLayoutSection._layoutInfo + r14;
var_3B8 = rdi;
rbx = objc_loadWeakRetained(rdi);
r12 = [rbx horizontal];
[rbx release];
if ([r14->_items count] == 0x0) goto loc_a1b84f;

loc_a1b593:
var_3C0 = r15;
rbx = r14;
if ([r14->_rows count] == 0x0) goto loc_a1b8cf;

loc_a1b5ba:
xmm0 = intrinsic_xorpd(xmm0, xmm0);
if (r12 != 0x0) {
    intrinsic_movapd(var_240, xmm0);
    intrinsic_movapd(var_250, xmm0);
    var_260 = intrinsic_movapd(var_260, xmm0);
    var_270 = intrinsic_movapd(var_270, xmm0);
    var_3A0 = rbx;
    rax = [rbx->_rows retain];
    var_3A8 = rax;
    rcx = var_B0;
    rdi = rax;
    rbx = [rdi countByEnumeratingWithState:var_270 objects:rcx count:0x10];
    xmm0 = intrinsic_xorpd(xmm0, xmm0);
    var_398 = intrinsic_movsd(var_398, xmm0);
    if (rbx != 0x0) {
        r14 = *var_260;
        xmm0 = intrinsic_xorpd(xmm0, xmm0);
        var_398 = intrinsic_movsd(var_398, xmm0);
        do {
            r12 = 0x0;
            do {
                if (*var_260 != r14) {
                    rdi = var_3A8;
                    objc_enumerationMutation(rdi);
                }
                rsi = *(var_268 + r12 * 0x8);
                if (rsi != 0x0) {
                    rdi = var_290;
                    [rdi rowFrame];
                }
                else {
                    xmm0 = intrinsic_xorpd(xmm0, xmm0);
                    var_280 = intrinsic_movapd(var_280, xmm0);
                    var_290 = intrinsic_movapd(var_290, xmm0);
                }
                CGRectGetWidth(rdi);
                xmm0 = intrinsic_addsd(xmm0, var_3A0->_horizontalInterstice);
                xmm1 = intrinsic_movsd(xmm1, var_398);
                xmm1 = intrinsic_addsd(xmm1, xmm0);
                var_398 = intrinsic_movsd(var_398, xmm1);
                r12 = r12 + 0x1;
            } while (r12 < rbx);
            rdi = var_3A8;
            rcx = var_B0;
            rbx = [rdi countByEnumeratingWithState:var_270 objects:rcx count:0x10];
        } while (rbx != 0x0);
    }
    [var_3A8 release];
    temp_0 = var_3A0->_itemsCount / *(var_3A0 + *_OBJC_IVAR_$__UIFlowLayoutSection._validItemRange + 0x8);
    xmm0 = intrinsic_punpckldq(zero_extend_64(temp_0), *(int128_t *)0xc4f620);
    xmm0 = intrinsic_subpd(xmm0, *(int128_t *)0xc4f630);
    xmm0 = intrinsic_haddpd(xmm0, xmm0);
    round(xmm0);
    xmm0 = intrinsic_mulsd(xmm0, var_398);
    xmm0 = intrinsic_subsd(xmm0, var_3A0->_horizontalInterstice);
    xmm1 = intrinsic_movapd(xmm1, xmm0);
    xmm0 = intrinsic_movsd(xmm0, *(var_3A0 + *_OBJC_IVAR_$__UIFlowLayoutSection._sectionMargins + 0x8));
    xmm0 = intrinsic_addsd(xmm0, *(var_3A0 + *_OBJC_IVAR_$__UIFlowLayoutSection._sectionMargins + 0x18));
    xmm0 = intrinsic_addsd(xmm0, var_3A0->_headerDimension);
    xmm0 = intrinsic_addsd(xmm0, var_3A0->_footerDimension);
    xmm1 = intrinsic_addsd(xmm1, xmm0);
    var_398 = intrinsic_movsd(var_398, xmm1);
    r12 = objc_loadWeakRetained(var_3B8);
    [r12 dimension];
    intrinsic_movapd(xmm1, xmm0);
    intrinsic_movsd(xmm0, var_398);
    [var_3A0 setEstimatedSize:var_3C0 forSection:rcx];
    [r12 release];
}
else {
    intrinsic_movapd(var_2A0, xmm0);
    intrinsic_movapd(var_2B0, xmm0);
    var_2C0 = intrinsic_movapd(var_2C0, xmm0);
    var_2D0 = intrinsic_movapd(var_2D0, xmm0);
    var_3A0 = rbx;
    rax = [rbx->_rows retain];
    var_3A8 = rax;
    rcx = var_130;
    rdi = rax;
    rbx = [rdi countByEnumeratingWithState:var_2D0 objects:rcx count:0x10];
    xmm1 = intrinsic_xorpd(xmm1, xmm1);
    if (rbx != 0x0) {
        r14 = *var_2C0;
        xmm1 = intrinsic_xorpd(xmm1, xmm1);
        do {
            r12 = 0x0;
            do {
                var_398 = intrinsic_movsd(var_398, xmm1);
                if (*var_2C0 != r14) {
                    rdi = var_3A8;
                    objc_enumerationMutation(rdi);
                }
                rsi = *(var_2C8 + r12 * 0x8);
                if (rsi != 0x0) {
                    rdi = var_2F0;
                    [rdi rowFrame];
                }
                else {
                    xmm0 = intrinsic_xorpd(xmm0, xmm0);
                    var_2E0 = intrinsic_movapd(var_2E0, xmm0);
                    var_2F0 = intrinsic_movapd(var_2F0, xmm0);
                }
                CGRectGetHeight(rdi);
                xmm0 = intrinsic_addsd(xmm0, var_3A0->_verticalInterstice);
                xmm1 = intrinsic_movsd(xmm1, var_398);
                xmm1 = intrinsic_addsd(xmm1, xmm0);
                r12 = r12 + 0x1;
            } while (r12 < rbx);
            rdi = var_3A8;
            var_398 = intrinsic_movsd(var_398, xmm1, var_2D0, var_130, 0x10);
            rax = [rdi countByEnumeratingWithState:rdx objects:rcx count:r8];
            xmm1 = intrinsic_movsd(xmm1, var_398);
            rbx = rax;
        } while (rbx != 0x0);
    }
    var_398 = intrinsic_movsd(var_398, xmm1);
    [var_3A8 release];
    rbx = var_3A0;
    rax = *(rbx + *_OBJC_IVAR_$__UIFlowLayoutSection._validItemRange + 0x8);
    if (rax != 0x0) {
        xmm2 = intrinsic_cvtsi2sd(xmm2, rbx->_itemsCount);
        xmm1 = intrinsic_punpckldq(zero_extend_64(rax), *(int128_t *)0xc4f620);
        xmm1 = intrinsic_subpd(xmm1, *(int128_t *)0xc4f630);
        xmm1 = intrinsic_haddpd(xmm1, xmm1);
        xmm2 = intrinsic_divsd(xmm2, xmm1);
        xmm0 = intrinsic_movsd(xmm0, var_398);
        xmm0 = intrinsic_mulsd(xmm0, xmm2);
        round(xmm0);
        xmm0 = intrinsic_subsd(xmm0, rbx->_verticalInterstice);
        xmm1 = intrinsic_movsd(xmm1, rbx->_sectionMargins);
        xmm1 = intrinsic_addsd(xmm1, *(rbx + *_OBJC_IVAR_$__UIFlowLayoutSection._sectionMargins + 0x10));
        xmm1 = intrinsic_addsd(xmm1, rbx->_headerDimension);
        xmm1 = intrinsic_addsd(xmm1, rbx->_footerDimension);
        xmm1 = intrinsic_addsd(xmm1, xmm0);
        var_398 = intrinsic_movsd(var_398, xmm1);
    }
    r12 = rbx;
    r13 = objc_loadWeakRetained(var_3B8);
    [r13 dimension];
    intrinsic_movsd(xmm1, var_398);
    [r12 setEstimatedSize:var_3C0 forSection:rcx];
    [r13 release];
}
goto loc_a1c3e5;

loc_a1c3e5:
if (*___stack_chk_guard != *___stack_chk_guard) {
    __stack_chk_fail();
}
return;

loc_a1b8cf:
r15 = objc_loadWeakRetained(var_3B8);
[r15 dimension];
var_398 = intrinsic_movsd(var_398, xmm0);
if (r12 == 0x0) goto loc_a1bed1;

loc_a1b909:
xmm0 = intrinsic_movsd(xmm0, rbx->_sectionMargins);
var_3A0 = intrinsic_movsd(var_3A0, xmm0);
xmm0 = intrinsic_movsd(xmm0, *(rbx + *_OBJC_IVAR_$__UIFlowLayoutSection._sectionMargins + 0x10));
var_3A8 = intrinsic_movsd(var_3A8, xmm0);
[r15 release];
xmm0 = intrinsic_xorpd(xmm0, xmm0);
intrinsic_movapd(var_300, xmm0);
intrinsic_movapd(var_310, xmm0);
var_320 = intrinsic_movapd(var_320, xmm0);
var_330 = intrinsic_movapd(var_330, xmm0);
r15 = [rbx->_items retain];
rdi = r15;
r12 = [rdi countByEnumeratingWithState:var_330 objects:var_1B0 count:0x10];
if (r12 == 0x0) goto loc_a1c1df;

loc_a1b997:
var_3B0 = r15;
r14 = rbx;
xmm1 = intrinsic_movsd(xmm1, var_3A0);
xmm1 = intrinsic_addsd(xmm1, var_3A8);
xmm0 = intrinsic_movsd(xmm0, var_398);
xmm0 = intrinsic_subsd(xmm0, xmm1);
var_398 = intrinsic_movsd(var_398, xmm0);
r15 = *var_320;
xmm0 = intrinsic_xorpd(xmm0, xmm0);
var_3A0 = intrinsic_movsd(var_3A0, xmm0);
rax = 0x0;
goto loc_a1b9eb;

loc_a1b9eb:
var_3C8 = rax;
r13 = 0x0;
goto loc_a1ba0a;

loc_a1ba0a:
if (*var_320 != r15) {
    rdi = var_3B0;
    objc_enumerationMutation(rdi);
}
rsi = *(var_328 + r13 * 0x8);
if (rsi != 0x0) {
    rdi = var_350;
    [rdi itemFrame];
}
else {
    xmm0 = intrinsic_xorpd(xmm0, xmm0);
    var_340 = intrinsic_movapd(var_340, xmm0);
    var_350 = intrinsic_movapd(var_350, xmm0);
}
CGRectGetHeight(rdi);
xmm1 = intrinsic_movsd(xmm1, var_398);
xmm1 = intrinsic_ucomisd(xmm1, xmm0);
if (xmm1 < 0x0) goto loc_a1c173;

loc_a1baa1:
CGRectGetHeight(rdi);
xmm0 = intrinsic_addsd(xmm0, r14->_verticalInterstice);
xmm1 = intrinsic_movsd(xmm1, var_398);
xmm1 = intrinsic_subsd(xmm1, xmm0);
var_398 = intrinsic_movsd(var_398, xmm1);
CGRectGetWidth(rdi);
xmm3 = intrinsic_movsd(xmm3, var_3A0);
xmm1 = intrinsic_movapd(xmm1, xmm3);
asm { cmpunordsd xmm1, xmm1 };
xmm2 = intrinsic_movapd(xmm2, xmm1);
xmm2 = intrinsic_andpd(xmm2, xmm0);
xmm0 = intrinsic_maxsd(xmm0, xmm3);
xmm1 = intrinsic_andnpd(xmm1, xmm0);
xmm1 = intrinsic_orpd(xmm1, xmm2);
var_3A0 = intrinsic_movsd(var_3A0, xmm1);
r13 = r13 + 0x1;
if (r13 < r12) goto loc_a1ba0a;

loc_a1bb5c:
rdi = var_3B0;
r12 = [rdi countByEnumeratingWithState:var_330 objects:var_1B0 count:0x10];
rcx = var_3C8;
rax = rcx + r13;
if (r12 != 0x0) goto loc_a1b9eb;

loc_a1bb9b:
r15 = rcx + r13;
goto loc_a1c184;

loc_a1c184:
[var_3B0 release];
rbx = r14;
if (r15 == 0x0) {
    [rbx logInvalidSizes];
    r15 = 0x1;
}
goto loc_a1c211;

loc_a1c211:
xmm0 = intrinsic_movsd(xmm0, rbx->_horizontalInterstice);
var_398 = intrinsic_movsd(var_398, xmm0);
xmm1 = intrinsic_movsd(xmm1, var_3A0);
xmm1 = intrinsic_addsd(xmm1, xmm0);
var_3A0 = intrinsic_movsd(var_3A0, xmm1);
xmm0 = intrinsic_cvtsi2sd(0x0, rbx->_itemsCount / r15);
xmm0 = intrinsic_cvtsi2sd(0x0, intrinsic_cvttsd2si(ceil(xmm0), xmm0));
xmm0 = intrinsic_mulsd(xmm0, var_3A0);
xmm0 = intrinsic_subsd(xmm0, var_398);
xmm0 = intrinsic_addsd(xmm0, *(rbx + *_OBJC_IVAR_$__UIFlowLayoutSection._sectionMargins + 0x8));
xmm0 = intrinsic_addsd(xmm0, *(rbx + *_OBJC_IVAR_$__UIFlowLayoutSection._sectionMargins + 0x18));
xmm0 = intrinsic_addsd(xmm0, rbx->_headerDimension);
xmm0 = intrinsic_addsd(xmm0, rbx->_footerDimension);
var_398 = intrinsic_movsd(var_398, xmm0);
r14 = objc_loadWeakRetained(var_3B8);
[r14 dimension];
intrinsic_movapd(xmm1, xmm0);
rdi = rbx;
intrinsic_movsd(xmm0, var_398);
goto loc_a1c3c8;

loc_a1c3c8:
[rdi setEstimatedSize:var_3C0 forSection:rcx];
[r14 release];
goto loc_a1c3e5;

loc_a1c173:
r15 = var_3C8 + r13;
goto loc_a1c184;

loc_a1c1df:
[r15 release];
xmm0 = intrinsic_xorpd(xmm0, xmm0);
var_3A0 = intrinsic_movsd(var_3A0, xmm0);
[rbx logInvalidSizes];
r15 = 0x1;
goto loc_a1c211;

loc_a1bed1:
xmm0 = intrinsic_movsd(xmm0, *(rbx + *_OBJC_IVAR_$__UIFlowLayoutSection._sectionMargins + 0x8));
var_3A0 = intrinsic_movsd(var_3A0, xmm0);
xmm0 = intrinsic_movsd(xmm0, *(rbx + *_OBJC_IVAR_$__UIFlowLayoutSection._sectionMargins + 0x18));
var_3A8 = intrinsic_movsd(var_3A8, xmm0);
[r15 release];
xmm0 = intrinsic_xorpd(xmm0, xmm0);
intrinsic_movapd(var_360, xmm0);
intrinsic_movapd(var_370, xmm0);
var_380 = intrinsic_movapd(var_380, xmm0);
var_390 = intrinsic_movapd(var_390, xmm0);
r14 = [rbx->_items retain];
rdi = r14;
r12 = [rdi countByEnumeratingWithState:var_390 objects:var_230 count:0x10];
if (r12 == 0x0) goto loc_a1c2d4;

loc_a1bf60:
var_3B0 = r14;
r14 = rbx;
xmm1 = intrinsic_movsd(xmm1, var_3A0);
xmm1 = intrinsic_addsd(xmm1, var_3A8);
xmm0 = intrinsic_movsd(xmm0, var_398);
xmm0 = intrinsic_subsd(xmm0, xmm1);
var_398 = intrinsic_movsd(var_398, xmm0);
r15 = *var_380;
xmm0 = intrinsic_xorpd(xmm0, xmm0);
var_3A0 = intrinsic_movsd(var_3A0, xmm0);
rax = 0x0;
goto loc_a1bfb4;

loc_a1bfb4:
var_3C8 = rax;
r13 = 0x0;
goto loc_a1bfd3;

loc_a1bfd3:
if (*var_380 != r15) {
    rdi = var_3B0;
    objc_enumerationMutation(rdi);
}
rsi = *(var_388 + r13 * 0x8);
if (rsi != 0x0) {
    rdi = var_350;
    [rdi itemFrame];
}
else {
    xmm0 = intrinsic_xorpd(xmm0, xmm0);
    var_340 = intrinsic_movapd(var_340, xmm0);
    var_350 = intrinsic_movapd(var_350, xmm0);
}
CGRectGetWidth(rdi);
xmm1 = intrinsic_movsd(xmm1, var_398);
xmm1 = intrinsic_ucomisd(xmm1, xmm0);
if (xmm1 < 0x0) goto loc_a1c1a9;

loc_a1c06a:
CGRectGetWidth(rdi);
xmm0 = intrinsic_addsd(xmm0, r14->_horizontalInterstice);
xmm1 = intrinsic_movsd(xmm1, var_398);
xmm1 = intrinsic_subsd(xmm1, xmm0);
var_398 = intrinsic_movsd(var_398, xmm1);
CGRectGetHeight(rdi);
xmm3 = intrinsic_movsd(xmm3, var_3A0);
xmm1 = intrinsic_movapd(xmm1, xmm3);
asm { cmpunordsd xmm1, xmm1 };
xmm2 = intrinsic_movapd(xmm2, xmm1);
xmm2 = intrinsic_andpd(xmm2, xmm0);
xmm0 = intrinsic_maxsd(xmm0, xmm3);
xmm1 = intrinsic_andnpd(xmm1, xmm0);
xmm1 = intrinsic_orpd(xmm1, xmm2);
var_3A0 = intrinsic_movsd(var_3A0, xmm1);
r13 = r13 + 0x1;
if (r13 < r12) goto loc_a1bfd3;

loc_a1c125:
rdi = var_3B0;
r12 = [rdi countByEnumeratingWithState:var_390 objects:var_230 count:0x10];
rcx = var_3C8;
rax = rcx + r13;
if (r12 != 0x0) goto loc_a1bfb4;

loc_a1c164:
r15 = rcx + r13;
goto loc_a1c1ba;

loc_a1c1ba:
[var_3B0 release];
rbx = r14;
if (r15 == 0x0) {
    [rbx logInvalidSizes];
    r15 = 0x1;
}
goto loc_a1c306;

loc_a1c306:
xmm0 = intrinsic_movsd(xmm0, rbx->_verticalInterstice);
var_398 = intrinsic_movsd(var_398, xmm0);
var_3A0 = intrinsic_movsd(var_3A0, intrinsic_addsd(intrinsic_movsd(xmm1, var_3A0), xmm0));
xmm0 = intrinsic_cvtsi2sd(0x0, rbx->_itemsCount);
xmm1 = intrinsic_cvtsi2sd(0x0, r15);
xmm0 = intrinsic_divsd(xmm0, xmm1);
var_398 = intrinsic_movsd(var_398, intrinsic_subsd(intrinsic_mulsd(intrinsic_cvtsi2sd(0x0, intrinsic_cvttsd2si(ceil(xmm0), xmm0)), var_3A0), var_398));
r14 = objc_loadWeakRetained(var_3B8);
[r14 dimension];
xmm1 = intrinsic_movsd(xmm1, var_398);
xmm1 = intrinsic_addsd(xmm1, rbx->_sectionMargins);
xmm1 = intrinsic_addsd(xmm1, *(rbx + *_OBJC_IVAR_$__UIFlowLayoutSection._sectionMargins + 0x10));
xmm1 = intrinsic_addsd(xmm1, rbx->_headerDimension);
intrinsic_addsd(xmm1, rbx->_footerDimension);
rdi = rbx;
goto loc_a1c3c8;

loc_a1c1a9:
r15 = var_3C8 + r13;
goto loc_a1c1ba;

loc_a1c2d4:
[r14 release];
xmm0 = intrinsic_xorpd(xmm0, xmm0);
var_3A0 = intrinsic_movsd(var_3A0, xmm0);
[rbx logInvalidSizes];
r15 = 0x1;
goto loc_a1c306;

loc_a1b84f:
rbx = r14;
if (r12 != 0x0) {
    xmm0 = intrinsic_movsd(xmm0, *(rbx + *_OBJC_IVAR_$__UIFlowLayoutSection._sectionMargins + 0x8));
    xmm0 = intrinsic_addsd(xmm0, *(rbx + *_OBJC_IVAR_$__UIFlowLayoutSection._sectionMargins + 0x18));
    xmm0 = intrinsic_addsd(xmm0, rbx->_headerDimension);
    xmm0 = intrinsic_addsd(xmm0, rbx->_footerDimension);
    var_398 = intrinsic_movsd(var_398, xmm0);
    r12 = objc_loadWeakRetained(var_3B8);
    [r12 dimension];
    intrinsic_movapd(xmm1, xmm0);
    rdi = rbx;
    intrinsic_movsd(xmm0, var_398);
}
else {
    r12 = objc_loadWeakRetained(var_3B8);
    [r12 dimension];
    rdi = rbx;
    xmm1 = intrinsic_movsd(xmm1, rdi->_sectionMargins);
    xmm1 = intrinsic_addsd(xmm1, *(rdi + *_OBJC_IVAR_$__UIFlowLayoutSection._sectionMargins + 0x10));
    xmm1 = intrinsic_addsd(xmm1, rdi->_headerDimension);
    intrinsic_addsd(xmm1, rdi->_footerDimension);
}
[rdi setEstimatedSize:r15 forSection:rcx];
if (*___stack_chk_guard == *___stack_chk_guard) {
    rdi = r12;
    [rdi release];
}
else {
    __stack_chk_fail();
}
return;

