void -[_RDFlowLayoutSection updateEstimatedSizeForSection:](void * self, void * _cmd, long long arg2) {
    var_200 = arg2;
    r15 = self;
    var_30 = *___stack_chk_guard;
    rdi = *_OBJC_IVAR_$__RDFlowLayoutSection._layoutInfo + r15;
    var_1F8 = rdi;
    rbx = objc_loadWeakRetained(rdi);
    r14 = [rbx horizontal];
    [rbx release];
    if ([r15->_items count] != 0x0) {
        var_1D8 = r15;
        if ([r15->_rows count] != 0x0) {
            xmm0 = intrinsic_xorpd(xmm0, xmm0);
            if (r14 != 0x0) {
                intrinsic_movapd(var_140, xmm0);
                intrinsic_movapd(var_150, xmm0);
                var_160 = intrinsic_movapd(var_160, xmm0);
                var_170 = intrinsic_movapd(var_170, xmm0);
                rax = [var_1D8->_rows retain];
                var_1E8 = rax;
                rdi = rax;
                rbx = [rdi countByEnumeratingWithState:var_170 objects:var_B0 count:0x10];
                xmm0 = intrinsic_xorpd(xmm0, xmm0);
                var_1E0 = intrinsic_movsd(var_1E0, xmm0);
                if (rbx != 0x0) {
                    r15 = *var_160;
                    xmm0 = intrinsic_xorpd(xmm0, xmm0);
                    var_1E0 = intrinsic_movsd(var_1E0, xmm0);
                    do {
                        r13 = 0x0;
                        do {
                            if (*var_160 != r15) {
                                rdi = var_1E8;
                                objc_enumerationMutation(rdi);
                            }
                            rsi = *(var_168 + r13 * 0x8);
                            if (rsi != 0x0) {
                                rdi = var_190;
                                [rdi rowFrame];
                            }
                            else {
                                xmm0 = intrinsic_xorpd(xmm0, xmm0);
                                var_180 = intrinsic_movapd(var_180, xmm0);
                                var_190 = intrinsic_movapd(var_190, xmm0);
                            }
                            CGRectGetWidth(rdi);
                            xmm0 = intrinsic_addsd(xmm0, var_1D8->_horizontalInterstice);
                            xmm1 = intrinsic_movsd(xmm1, var_1E0);
                            xmm1 = intrinsic_addsd(xmm1, xmm0);
                            var_1E0 = intrinsic_movsd(var_1E0, xmm1);
                            r13 = r13 + 0x1;
                        } while (r13 < rbx);
                        rdi = var_1E8;
                        rcx = var_B0;
                        rbx = [rdi countByEnumeratingWithState:var_170 objects:rcx count:0x10];
                    } while (rbx != 0x0);
                }
                [var_1E8 release];
                rbx = objc_loadWeakRetained(var_1F8);
                [rbx dimension];
                var_1E8 = intrinsic_movsd(var_1E8, xmm0);
                [rbx release];
                rdi = var_1D8;
                intrinsic_movsd(xmm0, var_1E0);
                intrinsic_movsd(xmm1, var_1E8);
            }
            else {
                intrinsic_movapd(var_1A0, xmm0);
                intrinsic_movapd(var_1B0, xmm0);
                var_1C0 = intrinsic_movapd(var_1C0, xmm0);
                var_1D0 = intrinsic_movapd(var_1D0, xmm0);
                rax = [var_1D8->_rows retain];
                var_1E8 = rax;
                rdi = rax;
                r13 = [rdi countByEnumeratingWithState:var_1D0 objects:var_130 count:0x10];
                xmm0 = intrinsic_xorpd(xmm0, xmm0);
                var_1E0 = intrinsic_movsd(var_1E0, xmm0);
                if (r13 != 0x0) {
                    r15 = *var_1C0;
                    xmm0 = intrinsic_xorpd(xmm0, xmm0);
                    var_1E0 = intrinsic_movsd(var_1E0, xmm0);
                    do {
                        rbx = 0x0;
                        do {
                            if (*var_1C0 != r15) {
                                rdi = var_1E8;
                                objc_enumerationMutation(rdi);
                            }
                            rsi = *(var_1C8 + rbx * 0x8);
                            if (rsi != 0x0) {
                                rdi = var_190;
                                [rdi rowFrame];
                            }
                            else {
                                xmm0 = intrinsic_xorpd(xmm0, xmm0);
                                var_180 = intrinsic_movapd(var_180, xmm0);
                                var_190 = intrinsic_movapd(var_190, xmm0);
                            }
                            CGRectGetHeight(rdi);
                            xmm0 = intrinsic_addsd(xmm0, var_1D8->_verticalInterstice);
                            xmm1 = intrinsic_movsd(xmm1, var_1E0);
                            xmm1 = intrinsic_addsd(xmm1, xmm0);
                            var_1E0 = intrinsic_movsd(var_1E0, xmm1);
                            rbx = rbx + 0x1;
                        } while (rbx < r13);
                        rdi = var_1E8;
                        rcx = var_130;
                        r13 = [rdi countByEnumeratingWithState:var_1D0 objects:rcx count:0x10];
                    } while (r13 != 0x0);
                }
                [var_1E8 release];
                rbx = objc_loadWeakRetained(var_1F8);
                [rbx dimension];
                var_1E8 = intrinsic_movsd(var_1E8, xmm0);
                [rbx release];
                rdi = var_1D8;
                intrinsic_movsd(xmm0, var_1E8);
                intrinsic_movsd(xmm1, var_1E0);
            }
            [rdi setEstimatedSize:var_200 forSection:rcx];
        }
        if (*___stack_chk_guard != var_30) {
            __stack_chk_fail();
        }
    }
    else {
        if (r14 != 0x0) {
            xmm0 = intrinsic_movsd(xmm0, *(r15 + *_OBJC_IVAR_$__RDFlowLayoutSection._sectionMargins + 0x8));
            xmm0 = intrinsic_addsd(xmm0, *(r15 + *_OBJC_IVAR_$__RDFlowLayoutSection._sectionMargins + 0x18));
            xmm0 = intrinsic_addsd(xmm0, r15->_headerDimension);
            xmm0 = intrinsic_addsd(xmm0, r15->_footerDimension);
            var_1E0 = intrinsic_movsd(var_1E0, xmm0);
            rbx = objc_loadWeakRetained(var_1F8);
            [rbx dimension];
        }
        else {
            rbx = objc_loadWeakRetained(var_1F8);
            [rbx dimension];
            var_1E0 = intrinsic_movsd(var_1E0, xmm0);
            xmm0 = intrinsic_movsd(xmm0, r15->_sectionMargins);
            xmm0 = intrinsic_addsd(xmm0, *(r15 + *_OBJC_IVAR_$__RDFlowLayoutSection._sectionMargins + 0x10));
            xmm0 = intrinsic_addsd(xmm0, r15->_headerDimension);
            xmm0 = intrinsic_addsd(xmm0, r15->_footerDimension);
        }
        var_1E8 = intrinsic_movsd(var_1E8, xmm0);
        [rbx release];
        if (*___stack_chk_guard == var_30) {
            rdi = r15;
            intrinsic_movsd(xmm0, var_1E0);
            intrinsic_movsd(xmm1, var_1E8);
            [rdi setEstimatedSize:var_200 forSection:rcx];
        }
        else {
            __stack_chk_fail();
        }
    }
    return;
}
