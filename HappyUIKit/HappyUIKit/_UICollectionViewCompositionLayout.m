void * +[_UICollectionViewCompositionLayout invalidationContextClass](void * self, void * _cmd) {
    rax = [_UICollectionViewCompositionLayoutInvalidationContext class];
    return rax;
}

void * -[_UICollectionViewCompositionLayout init](void * self, void * _cmd) {
    rbx = [[self super] init];
    if (rbx != 0x0) {
            rbx->_sublayoutsDict = [[NSMutableDictionary alloc] init];
            [rbx->_sublayoutsDict release];
            r14 = [[NSMutableSet alloc] init];
            [rbx->_sublayoutsDict setObject:r14 forKeyedSubscript:@"UINoElementKind"];
            [r14 release];
    }
    rax = rbx;
    return rax;
}

void -[_UICollectionViewCompositionLayout addSublayout:forRect:](void * self, void * _cmd, void * arg2, struct CGRect arg3) {
    r14 = [arg2 retain];
    [arg2 _setFrame:rdx, arg3];
    [arg2 _setSublayoutType:0x1];
    [arg2 _setCompositionLayout:self];
    rbx = [[self->_sublayoutsDict objectForKeyedSubscript:@"UINoElementKind"] retain];
    [rbx addObject:arg2];
    [r14 release];
    [rbx release];
    return;
}

struct CGRect -[_UICollectionViewCompositionLayout _frameForLayout:offset:relativeToEdges:fromSiblingLayout:](void * self, void * _cmd, void * arg2, struct CGPoint arg3, NSUInteger arg4, void * arg5) {
    r15 = arg4;
    var_98 = intrinsic_movsd(var_98, xmm1, arg2, arg3, arg4, arg5);
    var_80 = intrinsic_movsd(var_80, xmm0);
    var_A8 = arg2;
    var_78 = _cmd;
    var_88 = self;
    r13 = [arg3 retain];
    rbx = [arg5 retain];
    var_40 = *_CGShadingCreateAxial;
    var_48 = *_CGRectZero;
    [arg3 collectionViewContentSize];
    var_90 = intrinsic_movsd(var_90, xmm0);
    var_A0 = intrinsic_movsd(var_A0, xmm1);
    rdi = r13;
    [rdi release];
    xmm0 = intrinsic_movsd(xmm0, var_90);
    var_38 = intrinsic_movsd(*_CGShadingRelease, xmm0);
    xmm0 = intrinsic_movsd(xmm0, var_A0);
    var_30 = intrinsic_movsd(var_30, xmm0);
    if (rbx != 0x0) {
            rdi = var_70;
            var_90 = rbx;
            [rdi _frame];
    }
    else {
            var_90 = rbx;
            xmm0 = intrinsic_xorpd(xmm0, xmm0);
            var_60 = intrinsic_movapd(var_60, xmm0);
            var_70 = intrinsic_movapd(var_70, xmm0);
    }
    rbx = 0x4000000000000 & *(var_78->_collectionView + *_OBJC_IVAR_$_UIView._viewFlags + 0x8);
    if (rbx != 0x0) {
            rdi = var_78;
            [rdi collectionViewContentSize];
            var_A0 = intrinsic_movsd(var_A0, xmm0);
            CGRectGetWidth(rdi);
            xmm1 = intrinsic_movsd(xmm1, var_A0);
            xmm1 = intrinsic_subsd(xmm1, xmm0);
            var_48 = intrinsic_movsd(*_CGRectZero, xmm1);
    }
    r12 = 0x2;
    r13 = 0x8;
    if (rbx == 0x0) {
            r12 = 0x2;
            r13 = r12;
    }
    if (CPU_FLAGS & E) {
            r12 = 0x8;
    }
    r14 = r15 & 0x4;
    if ((r15 & 0x1) != 0x0) {
            if (r14 != 0x0) {
                    rbx = [[NSString stringWithUTF8String:"/BuildRoot/Library/Caches/com.apple.xbs/Sources/UIKit_Sim/UIKit-3600.6.21/UICollectionViewCompositionLayout.m"] retain];
                    rdi = @"<Unknown File>";
                    if (rbx != 0x0) {
                            rdi = rbx;
                    }
                    var_A0 = [rdi retain];
                    [rbx release];
                    rcx = [[NSAssertionHandler currentHandler] retain];
                    [rcx handleFailureInMethod:var_A8 object:var_78 file:var_A0 lineNumber:0x4f description:@"UICollectionViewCompositionLayout cannot place a sublayout relative to both the top and bottom edge of a sibling layout"];
                    [var_A0 release];
                    rdi = rcx;
                    [rdi release];
            }
            CGRectGetMinY(rdi);
            var_A0 = intrinsic_movsd(var_A0, xmm0);
            CGRectGetHeight(rdi);
            xmm0 = intrinsic_addsd(xmm0, var_98);
            xmm1 = intrinsic_movsd(xmm1, var_A0);
            xmm1 = intrinsic_subsd(xmm1, xmm0);
            var_40 = intrinsic_movsd(var_40, xmm1);
    }
    if (r14 != 0x0) {
            CGRectGetMaxY(rdi);
            xmm0 = intrinsic_addsd(xmm0, var_98);
            var_40 = intrinsic_movsd(var_40, xmm0);
    }
    r12 = r12 & r15;
    if ((r13 & r15) != 0x0) {
            if (r12 != 0x0) {
                    rbx = [[NSString stringWithUTF8String:"/BuildRoot/Library/Caches/com.apple.xbs/Sources/UIKit_Sim/UIKit-3600.6.21/UICollectionViewCompositionLayout.m"] retain];
                    rdi = @"<Unknown File>";
                    if (rbx != 0x0) {
                            rdi = rbx;
                    }
                    r14 = [rdi retain];
                    [rbx release];
                    rbx = [[NSAssertionHandler currentHandler] retain];
                    [rbx handleFailureInMethod:var_A8 object:var_78 file:r14 lineNumber:0x56 description:@"UICollectionViewCompositionLayout cannot place a sublayout relative to both the leading and trailing edge of a sibling layout"];
                    [r14 release];
                    rdi = rbx;
                    [rdi release];
            }
            CGRectGetMinX(rdi);
            var_78 = intrinsic_movsd(var_78, xmm0);
            CGRectGetWidth(rdi);
            xmm0 = intrinsic_addsd(xmm0, var_80);
            var_48 = intrinsic_movsd(var_48, intrinsic_subsd(intrinsic_movsd(xmm1, var_78), xmm0));
    }
    if (r12 != 0x0) {
            CGRectGetMaxX(rdi);
            var_48 = intrinsic_movsd(var_48, intrinsic_addsd(xmm0, var_80));
    }
    *(var_88 + 0x18) = var_30;
    *(var_88 + 0x10) = var_38;
    *(var_88 + 0x8) = var_40;
    *var_88 = var_48;
    [var_90 release];
    rax = var_88;
    return rax;
}

void -[_UICollectionViewCompositionLayout addSublayout:forSections:offset:relativeToEdges:fromSiblingLayout:](void * self, void * _cmd, void * arg2, void * arg3, struct CGPoint arg4, NSUInteger arg5, void * arg6) {
    r8 = arg4;
    rcx = arg3;
    var_38 = r8;
    var_40 = intrinsic_movsd(var_40, xmm1, arg2, rcx, r8, arg5, stack[2033]);
    var_48 = intrinsic_movsd(var_48, xmm0);
    var_50 = _cmd;
    r13 = self;
    r12 = [arg2 retain];
    rbx = [rcx retain];
    r14 = [arg5 retain];
    [r12 _setSections:rbx];
    [rbx release];
    [r12 _setSublayoutType:0x2];
    rdx = r13;
    [r12 _setCompositionLayout:rdx];
    if (r14 != 0x0) {
            rbx = [[r13 sublayouts] retain];
            rdx = r14;
            var_30 = r13;
            r13 = [rbx containsObject:rdx, rcx, r8];
            [rbx release];
            if (r13 == 0x0) {
                    rbx = [[NSString stringWithUTF8String:"/BuildRoot/Library/Caches/com.apple.xbs/Sources/UIKit_Sim/UIKit-3600.6.21/UICollectionViewCompositionLayout.m"] retain];
                    rdi = @"<Unknown File>";
                    if (rbx != 0x0) {
                            rdi = rbx;
                    }
                    var_58 = [rdi retain];
                    [rbx release];
                    r13 = [[NSAssertionHandler currentHandler] retain];
                    rdx = var_50;
                    rcx = var_30;
                    r8 = var_58;
                    [r13 handleFailureInMethod:rdx object:rcx file:r8 lineNumber:0x65 description:@"attempt to add layout (%@) to composition layout with sibling (%@) where the sibling does not have the same parent", r12, r14];
                    [var_58 release];
                    [r13 release];
            }
    }
    else {
            var_30 = r13;
    }
    intrinsic_movsd(xmm0, var_48);
    intrinsic_movsd(xmm1, var_40);
    [r12 _setLayoutOffset:rdx, rcx, r8];
    [r12 _setLayoutOffsetEdges:var_38, rcx, r8];
    [r12 _setSiblingLayout:r14, rcx, r8];
    rbx = [[var_30->_sublayoutsDict objectForKeyedSubscript:@"UINoElementKind", var_30, r8] retain];
    [rbx addObject:r12, var_30, r8];
    [rbx release];
    [r14 release];
    rdi = r12;
    [rdi release];
    return;
}

void -[_UICollectionViewCompositionLayout addSublayout:forItems:inSection:offset:relativeToEdges:fromSiblingLayout:](void * self, void * _cmd, void * arg2, void * arg3, NSInteger arg4, struct CGPoint arg5, NSUInteger arg_0, void * arg7) {
    r8 = arg4;
    rcx = arg3;
    var_38 = arg5;
    var_40 = intrinsic_movsd(var_40, xmm1, arg2, rcx, r8, arg5, stack[2031], stack[2032]);
    var_48 = intrinsic_movsd(var_48, xmm0);
    var_60 = _cmd;
    var_30 = self;
    r15 = [arg2 retain];
    r13 = [rcx retain];
    var_50 = [arg_0 retain];
    rbx = [[NSIndexSet indexSetWithIndex:r8] retain];
    [r15 _setSections:rbx];
    rdi = rbx;
    rbx = var_30;
    [rdi release];
    [r15 _setItems:r13];
    rdi = r13;
    r13 = _objc_msgSend;
    [rdi release];
    [r15 _setSublayoutType:0x3];
    rdx = rbx;
    [r15 _setCompositionLayout:rdx];
    r12 = var_50;
    if (var_50 != 0x0) {
            r14 = [[rbx sublayouts] retain];
            rdx = r12;
            r13 = r12;
            r12 = [r14 containsObject:rdx, rcx, r8];
            [r14 release];
            COND = r12 != 0x0;
            r12 = r13;
            r13 = _objc_msgSend;
            if (!COND) {
                    rbx = [[NSString stringWithUTF8String:"/BuildRoot/Library/Caches/com.apple.xbs/Sources/UIKit_Sim/UIKit-3600.6.21/UICollectionViewCompositionLayout.m"] retain];
                    rdi = @"<Unknown File>";
                    if (rbx != 0x0) {
                            rdi = rbx;
                    }
                    r13 = [rdi retain];
                    [rbx release];
                    rbx = [[NSAssertionHandler currentHandler] retain];
                    rdx = var_60;
                    rcx = var_30;
                    r8 = r13;
                    [rbx handleFailureInMethod:rdx object:rcx file:r8 lineNumber:0x72 description:@"attempt to add layout (%@) to composition layout with sibling (%@) where the sibling does not have the same parent", r15, r12];
                    rdi = r13;
                    r13 = _objc_msgSend;
                    [rdi release];
                    [rbx release];
            }
    }
    intrinsic_movsd(xmm0, var_48);
    intrinsic_movsd(xmm1, var_40);
    (r13)(r15, @selector(_setLayoutOffset:), rdx, rcx, r8);
    (r13)(r15, @selector(_setLayoutOffsetEdges:), var_38, rcx, r8);
    (r13)(r15, @selector(_setSiblingLayout:), r12, rcx, r8);
    rbx = [(r13)(var_30->_sublayoutsDict, @selector(objectForKeyedSubscript:), @"UINoElementKind", var_30, r8) retain];
    (r13)(rbx, @selector(addObject:), r15, var_30, r8);
    [rbx release];
    [r12 release];
    rdi = r15;
    [rdi release];
    return;
}

void -[_UICollectionViewCompositionLayout addSublayout:forElementKinds:](void * self, void * _cmd, void * arg2, void * arg3) {
    var_100 = self;
    rbx = [arg2 retain];
    var_F8 = rbx;
    r14 = [arg3 retain];
    [rbx _setElementKinds:r14];
    [rbx _setSublayoutType:0x4];
    [rbx _setCompositionLayout:self];
    intrinsic_movaps(var_C0, 0x0);
    intrinsic_movaps(var_D0, 0x0);
    var_E0 = intrinsic_movaps(var_E0, 0x0);
    var_F0 = intrinsic_movaps(var_F0, 0x0);
    rax = [r14 retain];
    var_108 = rax;
    rbx = [rax countByEnumeratingWithState:var_F0 objects:var_B0 count:0x10];
    if (rbx != 0x0) {
            r15 = *var_E0;
            do {
                    r13 = 0x0;
                    do {
                            if (*var_E0 != r15) {
                                    objc_enumerationMutation(var_108);
                            }
                            [var_100->_sublayoutsDict setObject:var_F8 forKeyedSubscript:*(var_E8 + r13 * 0x8)];
                            r13 = r13 + 0x1;
                    } while (r13 < rbx);
                    rbx = [var_108 countByEnumeratingWithState:var_F0 objects:var_B0 count:0x10];
            } while (rbx != 0x0);
    }
    [var_108 release];
    [var_108 release];
    [var_F8 release];
    if (*___stack_chk_guard != *___stack_chk_guard) {
            __stack_chk_fail();
    }
    return;
}

void -[_UICollectionViewCompositionLayout removeSublayout:](void * self, void * _cmd, void * arg2) {
    r14 = [arg2 retain];
    rbx = [[NSMutableArray alloc] init];
    var_38 = r14;
    rdi = r14;
    var_68 = [rdi retain];
    var_30 = rbx;
    var_60 = [rbx retain];
    [self->_sublayoutsDict enumerateKeysAndObjectsUsingBlock:__NSConcreteStackBlock];
    [self->_sublayoutsDict removeObjectsForKeys:rbx];
    rbx = [[self->_sublayoutsDict objectForKeyedSubscript:@"UINoElementKind"] retain];
    [rbx removeObject:var_68];
    [rbx release];
    [var_30 release];
    [var_38 release];
    [var_60 release];
    [var_68 release];
    return;
}

void ___54-[_UICollectionViewCompositionLayout removeSublayout:]_block_invoke(int arg0, int arg1, int arg2) {
    rbx = arg0;
    r14 = [arg1 retain];
    if (*(rbx + 0x20) == arg2) {
            [*(rbx + 0x28) addObject:r14];
    }
    rdi = r14;
    [rdi release];
    return;
}

void * -[_UICollectionViewCompositionLayout sublayouts](void * self, void * _cmd) {
    r15 = [NSMutableArray alloc];
    r12 = [[self->_sublayoutsDict valueForKey:@"UINoElementKind"] retain];
    rbx = [[r12 allObjects] retain];
    var_118 = [r15 initWithArray:rbx];
    [rbx release];
    [r12 release];
    intrinsic_movaps(var_C0, 0x0);
    intrinsic_movaps(var_D0, 0x0);
    var_E0 = intrinsic_movaps(var_E0, 0x0);
    var_F0 = intrinsic_movaps(var_F0, 0x0);
    rax = [self->_sublayoutsDict objectEnumerator];
    rax = [rax retain];
    var_108 = rax;
    rax = [rax countByEnumeratingWithState:var_F0 objects:var_B0 count:0x10];
    var_F8 = rax;
    if (rax != 0x0) {
            var_100 = *var_E0;
            do {
                    r14 = 0x0;
                    do {
                            if (*var_E0 != var_100) {
                                    objc_enumerationMutation(var_108);
                            }
                            r12 = *(var_E8 + r14 * 0x8);
                            if ([r12 isKindOfClass:[UICollectionViewLayout class]] != 0x0) {
                                    [var_118 addObject:r12];
                            }
                            r14 = r14 + 0x1;
                    } while (r14 < var_F8);
                    rax = [var_108 countByEnumeratingWithState:var_F0 objects:var_B0 count:0x10];
                    var_F8 = rax;
            } while (rax != 0x0);
    }
    [var_108 release];
    r14 = objc_retainAutoreleaseReturnValue(var_118);
    [var_118 release];
    if (*___stack_chk_guard == *___stack_chk_guard) {
            rax = r14;
    }
    else {
            rax = __stack_chk_fail();
    }
    return rax;
}

struct CGSize -[_UICollectionViewCompositionLayout collectionViewContentSize](void * self, void * _cmd) {
    var_B8 = *_CGSizeCreateDictionaryRepresentation;
    var_C0 = *_CGShadingRelease;
    var_C8 = *_CGShadingCreateAxial;
    var_D0 = *_CGRectZero;
    intrinsic_movaps(var_E0, 0x0);
    intrinsic_movaps(var_F0, 0x0);
    var_100 = intrinsic_movaps(var_100, 0x0);
    var_110 = intrinsic_movaps(var_110, 0x0);
    rax = [self sublayouts];
    rax = [rax retain];
    var_158 = rax;
    rbx = [rax countByEnumeratingWithState:var_110 objects:var_B0 count:0x10];
    if (rbx != 0x0) {
            r13 = *var_100;
            r12 = var_150;
            do {
                    r15 = 0x0;
                    do {
                            if (*var_100 != r13) {
                                    objc_enumerationMutation(var_158);
                            }
                            rsi = *(var_108 + r15 * 0x8);
                            if (rsi != 0x0) {
                                    [var_130 _frame];
                            }
                            else {
                                    var_120 = intrinsic_movaps(var_120, 0x0);
                                    var_130 = intrinsic_movaps(var_130, 0x0);
                            }
                            CGRectUnion(r12, rsi);
                            var_B8 = var_138;
                            var_C0 = var_140;
                            var_C8 = var_148;
                            var_D0 = var_150;
                            r15 = r15 + 0x1;
                    } while (r15 < rbx);
                    rbx = [var_158 countByEnumeratingWithState:var_110 objects:var_B0 count:0x10];
            } while (rbx != 0x0);
    }
    [var_158 release];
    intrinsic_movsd(0x0, var_C0);
    intrinsic_movsd(xmm1, var_B8);
    rax = *___stack_chk_guard;
    if (rax != *___stack_chk_guard) {
            rax = __stack_chk_fail();
    }
    return rax;
}

void * -[_UICollectionViewCompositionLayout _originConvertedSublayoutAttributesForAttributes:inLayout:](void * self, void * _cmd, void * arg2, void * arg3) {
    r15 = self;
    r14 = [arg2 retain];
    r13 = [arg3 retain];
    if (r13 != 0x0) {
            [var_50 _frame];
            xmm1 = intrinsic_movsd(xmm1, var_50);
            xmm0 = intrinsic_movsd(xmm0, var_48);
    }
    else {
            xmm0 = intrinsic_xorpd(xmm0, xmm0);
            intrinsic_movapd(var_40, xmm0);
            intrinsic_movapd(var_50, xmm0);
            xmm0 = intrinsic_xorpd(xmm0, xmm0);
            xmm1 = intrinsic_xorpd(xmm1, xmm1);
    }
    xmm1 = intrinsic_ucomisd(xmm1, *_CGPointZero);
    if ((xmm1 == 0x0) && (!CPU_FLAGS & P)) {
            xmm0 = intrinsic_ucomisd(xmm0, *_CGRectApplyAffineTransform);
            if ((xmm0 == 0x0) && (!CPU_FLAGS & P)) {
                    r12 = [r14 retain];
            }
            else {
                    r12 = [r14 copy];
                    if (r14 != 0x0) {
                            [var_90 frame];
                    }
                    else {
                            xmm0 = intrinsic_xorpd(xmm0, xmm0);
                            var_80 = intrinsic_movapd(var_80, xmm0);
                            var_90 = intrinsic_movapd(var_90, xmm0);
                    }
                    [var_70 convertRect:r15 fromLayout:r13, r8];
                    [r12 setFrame:rdx, r13];
            }
    }
    else {
            r12 = [r14 copy];
            if (r14 != 0x0) {
                    [var_90 frame];
            }
            else {
                    xmm0 = intrinsic_xorpd(xmm0, xmm0);
                    var_80 = intrinsic_movapd(var_80, xmm0);
                    var_90 = intrinsic_movapd(var_90, xmm0);
            }
            [var_70 convertRect:r15 fromLayout:r13, r8];
            [r12 setFrame:rdx, r13];
    }
    [r13 release];
    [r14 release];
    rdi = r12;
    rax = [rdi autorelease];
    return rax;
}

void * -[_UICollectionViewCompositionLayout layoutAttributesForElementsInRect:](void * self, void * _cmd, struct CGRect arg2) {
    var_238 = self;
    var_248 = [[NSMutableArray alloc] init];
    intrinsic_movaps(var_140, 0x0);
    intrinsic_movaps(var_150, 0x0);
    var_160 = intrinsic_movaps(var_160, 0x0);
    var_170 = intrinsic_movaps(var_170, 0x0);
    rax = [self sublayouts];
    rax = [rax retain];
    var_268 = rax;
    rsi = @selector(countByEnumeratingWithState:objects:count:);
    rdx = var_170;
    r8 = 0x10;
    rdi = rax;
    r15 = _objc_msgSend(rdi, rsi);
    if (r15 != 0x0) {
            r12 = arg_0;
            r14 = *var_160;
            var_290 = r14;
            var_298 = @selector(countByEnumeratingWithState:objects:count:);
            do {
                    var_278 = @selector(countByEnumeratingWithState:objects:count:);
                    var_270 = r15;
                    rbx = 0x0;
                    do {
                            if (*var_160 != r14) {
                                    rdi = var_268;
                                    objc_enumerationMutation(rdi);
                            }
                            r13 = *(var_168 + rbx * 0x8);
                            if (r13 != 0x0) {
                                    rdi = var_190;
                                    rsi = r13;
                                    [rdi _frame];
                            }
                            else {
                                    var_180 = intrinsic_movaps(var_180, 0x0);
                                    var_190 = intrinsic_movaps(var_190, 0x0);
                            }
                            if (CGRectIntersectsRect(rdi, rsi) != 0x0) {
                                    var_258 = rbx;
                                    [var_1B0 convertRect:var_238 toLayout:r13, r8];
                                    var_1C0 = intrinsic_movaps(var_1C0, 0x0);
                                    var_1D0 = intrinsic_movaps(var_1D0, 0x0);
                                    var_1E0 = intrinsic_movaps(var_1E0, 0x0);
                                    var_1F0 = intrinsic_movaps(var_1F0, 0x0);
                                    var_240 = r13;
                                    rax = [r13 layoutAttributesForElementsInRect:rdx, r13];
                                    rax = [rax retain];
                                    var_220 = rax;
                                    r8 = 0x10;
                                    rdi = rax;
                                    rsi = var_278;
                                    rdx = var_1F0;
                                    r12 = _objc_msgSend(rdi, rsi);
                                    if (r12 != 0x0) {
                                            r14 = *var_1E0;
                                            do {
                                                    r13 = 0x0;
                                                    do {
                                                            if (*var_1E0 != r14) {
                                                                    rdi = var_220;
                                                                    objc_enumerationMutation(rdi);
                                                            }
                                                            r15 = *(var_1E8 + r13 * 0x8);
                                                            if (r15 != 0x0) {
                                                                    rdi = var_210;
                                                                    rsi = r15;
                                                                    [rdi frame];
                                                            }
                                                            else {
                                                                    var_200 = intrinsic_movaps(var_200, 0x0);
                                                                    var_210 = intrinsic_movaps(var_210, 0x0);
                                                            }
                                                            if (CGRectIntersectsRect(rdi, rsi) != 0x0) {
                                                                    r15 = [[var_238 _originConvertedSublayoutAttributesForAttributes:r15 inLayout:var_240] retain];
                                                                    rsi = @selector(addObject:);
                                                                    _objc_msgSend(var_248, rsi);
                                                                    rdi = r15;
                                                                    [rdi release];
                                                            }
                                                            r13 = r13 + 0x1;
                                                    } while (r13 < r12);
                                                    r8 = 0x10;
                                                    rdi = var_220;
                                                    rsi = @selector(countByEnumeratingWithState:objects:count:);
                                                    rdx = var_1F0;
                                                    r12 = _objc_msgSend(rdi, rsi);
                                            } while (r12 != 0x0);
                                    }
                                    rdi = var_220;
                                    [rdi release];
                                    r12 = arg_0;
                                    r14 = var_290;
                                    r15 = var_270;
                                    rbx = var_258;
                            }
                            rbx = rbx + 0x1;
                    } while (rbx < r15);
                    r8 = 0x10;
                    rdi = var_268;
                    rsi = var_298;
                    rdx = var_170;
                    r15 = _objc_msgSend(rdi, rsi);
            } while (r15 != 0x0);
    }
    [var_268 release];
    r15 = objc_retainAutoreleaseReturnValue(var_248);
    [var_248 release];
    if (*___stack_chk_guard == *___stack_chk_guard) {
            rax = r15;
    }
    else {
            rax = __stack_chk_fail();
    }
    return rax;
}

void * -[_UICollectionViewCompositionLayout layoutAttributesForItemAtIndexPath:](void * self, void * _cmd, void * arg2) {
    r14 = _cmd;
    r15 = self;
    var_30 = *___stack_chk_guard;
    r13 = [arg2 retain];
    rbx = [[r15->_sublayoutsDict objectForKeyedSubscript:@"UICollectionElementKindCell"] retain];
    if (rbx == 0x0) goto loc_54b894;

loc_54b83f:
    var_128 = r13;
    r13 = [[rbx layoutAttributesForItemAtIndexPath:r13] retain];
    r15 = [[r15 _originConvertedSublayoutAttributesForAttributes:r13 inLayout:rbx] retain];
    [r13 release];
    goto loc_54bb74;

loc_54bb74:
    [rbx release];
    [var_128 release];
    if (*___stack_chk_guard == var_30) {
            rdi = r15;
            rax = [rdi autorelease];
    }
    else {
            rax = __stack_chk_fail();
    }
    return rax;

loc_54b894:
    var_140 = r14;
    var_138 = rbx;
    rbx = r13;
    var_F8 = [rbx section];
    intrinsic_movaps(var_C0, 0x0);
    intrinsic_movaps(var_D0, 0x0);
    var_E0 = intrinsic_movaps(var_E0, 0x0);
    var_F0 = intrinsic_movaps(var_F0, 0x0);
    rax = [r15->_sublayoutsDict objectForKeyedSubscript:@"UINoElementKind"];
    rax = [rax retain];
    var_120 = rax;
    rax = [rax countByEnumeratingWithState:var_F0 objects:var_B0 count:0x10];
    var_110 = rax;
    rcx = rbx;
    if (rax == 0x0) goto loc_54ba47;

loc_54b93e:
    var_118 = *var_E0;
    goto loc_54b95d;

loc_54b95d:
    var_130 = r15;
    var_128 = rcx;
    r15 = 0x0;
    goto loc_54b98a;

loc_54b98a:
    if (*var_E0 != var_118) {
            objc_enumerationMutation(var_120);
    }
    r12 = *(var_E8 + r15 * 0x8);
    rbx = [[r12 _sections] retain];
    r14 = [rbx containsIndex:var_F8];
    [rbx release];
    if (r14 != 0x0) goto loc_54bb0a;

loc_54b9f5:
    r15 = r15 + 0x1;
    if (r15 < var_110) goto loc_54b98a;

loc_54ba01:
    rax = [var_120 countByEnumeratingWithState:var_F0 objects:var_B0 count:0x10];
    var_110 = rax;
    rcx = var_128;
    r15 = var_130;
    if (rax != 0x0) goto loc_54b95d;

loc_54ba47:
    var_128 = rcx;
    [var_120 release];
    rbx = [[NSString stringWithUTF8String:"/BuildRoot/Library/Caches/com.apple.xbs/Sources/UIKit_Sim/UIKit-3600.6.21/UICollectionViewCompositionLayout.m", rcx, 0x10] retain];
    rdi = @"<Unknown File>";
    if (rbx != 0x0) {
            rdi = rbx;
    }
    r14 = [rdi retain];
    [rbx release];
    rbx = [[NSAssertionHandler currentHandler] retain];
    stack[2004] = r15;
    rcx = r15;
    r15 = 0x0;
    [rbx handleFailureInMethod:var_140 object:rcx file:r14 lineNumber:0xd0 description:@"composition layout (%@) does not have a sublayout for UICollectionElementKindCell or for section %ld", stack[2004], var_F8];
    [r14 release];
    [rbx release];
    goto loc_54bb62;

loc_54bb62:
    rbx = var_138;
    goto loc_54bb74;

loc_54bb0a:
    rbx = [[r12 layoutAttributesForItemAtIndexPath:var_128] retain];
    r15 = [[var_130 _originConvertedSublayoutAttributesForAttributes:rbx inLayout:r12] retain];
    [rbx release];
    [var_120 release];
    goto loc_54bb62;
}

bool -[_UICollectionViewCompositionLayout shouldInvalidateLayoutForPreferredLayoutAttributes:withOriginalAttributes:](void * self, void * _cmd, void * arg2, void * arg3) {
    rcx = arg3;
    var_130 = _cmd;
    r12 = self;
    var_128 = [arg2 retain];
    r13 = [rcx retain];
    r14 = [[r13 _elementKind] retain];
    rdx = r14;
    rbx = [[r12->_sublayoutsDict objectForKeyedSubscript:rdx] retain];
    [r14 release];
    if (rbx == 0x0) goto loc_54bc78;

loc_54bc50:
    r14 = var_128;
    rdi = rbx;
    r15 = [rbx shouldInvalidateLayoutForPreferredLayoutAttributes:r14 withOriginalAttributes:r13];
    goto loc_54bf3e;

loc_54bf3e:
    [rdi release];
    [r13 release];
    [r14 release];
    if (*___stack_chk_guard == *___stack_chk_guard) {
            rax = r15;
    }
    else {
            rax = __stack_chk_fail();
    }
    return rax;

loc_54bc78:
    var_140 = rbx;
    var_138 = r13;
    rbx = [[r13 indexPath] retain];
    var_F8 = [rbx section];
    [rbx release];
    intrinsic_movaps(var_C0, 0x0);
    intrinsic_movaps(var_D0, 0x0);
    var_E0 = intrinsic_movaps(var_E0, 0x0);
    var_F0 = intrinsic_movaps(var_F0, 0x0);
    rax = [r12->_sublayoutsDict objectForKeyedSubscript:@"UINoElementKind", rcx];
    rax = [rax retain];
    var_120 = rax;
    rcx = var_B0;
    rax = [rax countByEnumeratingWithState:var_F0 objects:rcx count:0x10];
    var_110 = rax;
    rbx = r12;
    var_148 = rbx;
    r13 = _objc_msgSend;
    if (rax == 0x0) goto loc_54be36;

loc_54bd43:
    var_118 = *var_E0;
    goto loc_54bd62;

loc_54bd62:
    rbx = 0x0;
    goto loc_54bd80;

loc_54bd80:
    if (*var_E0 != var_118) {
            objc_enumerationMutation(var_120);
    }
    r14 = *(var_E8 + rbx * 0x8);
    r12 = [(r13)(r14, @selector(_sections)) retain];
    r15 = (r13)(r12, @selector(containsIndex:), var_F8);
    [r12 release];
    if (r15 != 0x0) goto loc_54bf03;

loc_54bdeb:
    rbx = rbx + 0x1;
    if (rbx < var_110) goto loc_54bd80;

loc_54bdf7:
    rcx = var_B0;
    rax = [var_120 countByEnumeratingWithState:var_F0 objects:rcx count:0x10];
    var_110 = rax;
    rbx = var_148;
    if (rax != 0x0) goto loc_54bd62;

loc_54be36:
    [var_120 release];
    r15 = [(r13)(@class(NSString), @selector(stringWithUTF8String:), "/BuildRoot/Library/Caches/com.apple.xbs/Sources/UIKit_Sim/UIKit-3600.6.21/UICollectionViewCompositionLayout.m", rcx, 0x10) retain];
    rdi = @"<Unknown File>";
    if (r15 != 0x0) {
            rdi = r15;
    }
    r14 = [rdi retain];
    [r15 release];
    r10 = r13;
    r13 = [(r13)(@class(NSAssertionHandler), @selector(currentHandler), "/BuildRoot/Library/Caches/com.apple.xbs/Sources/UIKit_Sim/UIKit-3600.6.21/UICollectionViewCompositionLayout.m") retain];
    r15 = 0x0;
    (r10)(r13, @selector(handleFailureInMethod:object:file:lineNumber:description:), var_130, rbx, r14, 0xf4, @"composition layout (%@) does not have a sublayout for UICollectionElementKindCell or for section %ld", rbx, var_F8);
    [r14 release];
    [r13 release];
    r14 = var_128;
    r13 = var_138;
    goto loc_54bf37;

loc_54bf37:
    rdi = var_140;
    goto loc_54bf3e;

loc_54bf03:
    rdi = r14;
    r14 = var_128;
    r13 = var_138;
    r15 = [rdi shouldInvalidateLayoutForPreferredLayoutAttributes:r14 withOriginalAttributes:r13];
    [var_120 release];
    goto loc_54bf37;
}

void * -[_UICollectionViewCompositionLayout layoutAttributesForSupplementaryViewOfKind:atIndexPath:](void * self, void * _cmd, void * arg2, void * arg3) {
    var_128 = _cmd;
    r13 = self;
    var_30 = *___stack_chk_guard;
    r12 = [arg2 retain];
    rbx = [arg3 retain];
    rax = [r13->_sublayoutsDict objectForKeyedSubscript:r12];
    rax = [rax retain];
    if (rax == 0x0) goto loc_54c01c;

loc_54bfec:
    r13 = rax;
    r14 = rbx;
    var_F8 = [[r13 layoutAttributesForSupplementaryViewOfKind:r12 atIndexPath:rbx] retain];
    goto loc_54c2ee;

loc_54c2ee:
    [r13 release];
    [r14 release];
    [r12 release];
    if (*___stack_chk_guard == var_30) {
            rax = [var_F8 autorelease];
    }
    else {
            rax = __stack_chk_fail();
    }
    return rax;

loc_54c01c:
    var_140 = rax;
    var_130 = r12;
    var_138 = rbx;
    var_F8 = [rbx section];
    intrinsic_movaps(var_C0, 0x0);
    intrinsic_movaps(var_D0, 0x0);
    var_E0 = intrinsic_movaps(var_E0, 0x0);
    var_F0 = intrinsic_movaps(var_F0, 0x0);
    var_148 = r13;
    rax = [r13->_sublayoutsDict objectForKeyedSubscript:@"UINoElementKind"];
    rax = [rax retain];
    var_120 = rax;
    rcx = var_B0;
    rax = [rax countByEnumeratingWithState:var_F0 objects:rcx count:0x10];
    var_110 = rax;
    if (rax == 0x0) goto loc_54c1b4;

loc_54c0c8:
    var_118 = *var_E0;
    goto loc_54c0e7;

loc_54c0e7:
    rbx = 0x0;
    goto loc_54c105;

loc_54c105:
    if (*var_E0 != var_118) {
            objc_enumerationMutation(var_120);
    }
    r13 = *(var_E8 + rbx * 0x8);
    r12 = [[r13 _sections] retain];
    r14 = [r12 containsIndex:var_F8];
    [r12 release];
    if (r14 != 0x0) goto loc_54c29d;

loc_54c170:
    rbx = rbx + 0x1;
    if (rbx < var_110) goto loc_54c105;

loc_54c17c:
    rcx = var_B0;
    rax = [var_120 countByEnumeratingWithState:var_F0 objects:rcx count:0x10];
    var_110 = rax;
    if (rax != 0x0) goto loc_54c0e7;

loc_54c1b4:
    [var_120 release];
    r13 = _objc_msgSend;
    rbx = [[NSString stringWithUTF8String:"/BuildRoot/Library/Caches/com.apple.xbs/Sources/UIKit_Sim/UIKit-3600.6.21/UICollectionViewCompositionLayout.m", rcx, 0x10] retain];
    rdi = @"<Unknown File>";
    if (rbx != 0x0) {
            rdi = rbx;
    }
    r14 = [rdi retain];
    [rbx release];
    r15 = [(r13)(@class(NSAssertionHandler), @selector(currentHandler), "/BuildRoot/Library/Caches/com.apple.xbs/Sources/UIKit_Sim/UIKit-3600.6.21/UICollectionViewCompositionLayout.m") retain];
    stack[2004] = var_F8;
    var_F8 = 0x0;
    (r13)(r15, @selector(handleFailureInMethod:object:file:lineNumber:description:), var_128, var_148, r14, 0x106, @"composition layout (%@) does not have a sublayout for %@ or for section %ld", var_148, var_130, stack[2004]);
    [r14 release];
    [r15 release];
    r12 = var_130;
    r14 = var_138;
    goto loc_54c2e7;

loc_54c2e7:
    r13 = var_140;
    goto loc_54c2ee;

loc_54c29d:
    r12 = var_130;
    r14 = var_138;
    var_F8 = [[r13 layoutAttributesForSupplementaryViewOfKind:r12 atIndexPath:r14] retain];
    [var_120 release];
    goto loc_54c2e7;
}

void * -[_UICollectionViewCompositionLayout layoutAttributesForDecorationViewOfKind:atIndexPath:](void * self, void * _cmd, void * arg2, void * arg3) {
    var_128 = _cmd;
    r13 = self;
    var_30 = *___stack_chk_guard;
    r12 = [arg2 retain];
    rbx = [arg3 retain];
    rax = [r13->_sublayoutsDict objectForKeyedSubscript:r12];
    rax = [rax retain];
    if (rax == 0x0) goto loc_54c3cd;

loc_54c39d:
    r13 = rax;
    r14 = rbx;
    var_F8 = [[r13 layoutAttributesForDecorationViewOfKind:r12 atIndexPath:rbx] retain];
    goto loc_54c69f;

loc_54c69f:
    [r13 release];
    [r14 release];
    [r12 release];
    if (*___stack_chk_guard == var_30) {
            rax = [var_F8 autorelease];
    }
    else {
            rax = __stack_chk_fail();
    }
    return rax;

loc_54c3cd:
    var_140 = rax;
    var_130 = r12;
    var_138 = rbx;
    var_F8 = [rbx section];
    intrinsic_movaps(var_C0, 0x0);
    intrinsic_movaps(var_D0, 0x0);
    var_E0 = intrinsic_movaps(var_E0, 0x0);
    var_F0 = intrinsic_movaps(var_F0, 0x0);
    var_148 = r13;
    rax = [r13->_sublayoutsDict objectForKeyedSubscript:@"UINoElementKind"];
    rax = [rax retain];
    var_120 = rax;
    rcx = var_B0;
    rax = [rax countByEnumeratingWithState:var_F0 objects:rcx count:0x10];
    var_110 = rax;
    if (rax == 0x0) goto loc_54c565;

loc_54c479:
    var_118 = *var_E0;
    goto loc_54c498;

loc_54c498:
    rbx = 0x0;
    goto loc_54c4b6;

loc_54c4b6:
    if (*var_E0 != var_118) {
            objc_enumerationMutation(var_120);
    }
    r13 = *(var_E8 + rbx * 0x8);
    r12 = [[r13 _sections] retain];
    r14 = [r12 containsIndex:var_F8];
    [r12 release];
    if (r14 != 0x0) goto loc_54c64e;

loc_54c521:
    rbx = rbx + 0x1;
    if (rbx < var_110) goto loc_54c4b6;

loc_54c52d:
    rcx = var_B0;
    rax = [var_120 countByEnumeratingWithState:var_F0 objects:rcx count:0x10];
    var_110 = rax;
    if (rax != 0x0) goto loc_54c498;

loc_54c565:
    [var_120 release];
    r13 = _objc_msgSend;
    rbx = [[NSString stringWithUTF8String:"/BuildRoot/Library/Caches/com.apple.xbs/Sources/UIKit_Sim/UIKit-3600.6.21/UICollectionViewCompositionLayout.m", rcx, 0x10] retain];
    rdi = @"<Unknown File>";
    if (rbx != 0x0) {
            rdi = rbx;
    }
    r14 = [rdi retain];
    [rbx release];
    r15 = [(r13)(@class(NSAssertionHandler), @selector(currentHandler), "/BuildRoot/Library/Caches/com.apple.xbs/Sources/UIKit_Sim/UIKit-3600.6.21/UICollectionViewCompositionLayout.m") retain];
    stack[2004] = var_F8;
    var_F8 = 0x0;
    (r13)(r15, @selector(handleFailureInMethod:object:file:lineNumber:description:), var_128, var_148, r14, 0x118, @"composition layout (%@) does not have a sublayout for %@ or for section %ld", var_148, var_130, stack[2004]);
    [r14 release];
    [r15 release];
    r12 = var_130;
    r14 = var_138;
    goto loc_54c698;

loc_54c698:
    r13 = var_140;
    goto loc_54c69f;

loc_54c64e:
    r12 = var_130;
    r14 = var_138;
    var_F8 = [[r13 layoutAttributesForDecorationViewOfKind:r12 atIndexPath:r14] retain];
    [var_120 release];
    goto loc_54c698;
}

void -[_UICollectionViewCompositionLayout prepareLayout](void * self, void * _cmd) {
    r12 = self;
    [[r12 super] prepareLayout];
    intrinsic_movaps(var_D0, 0x0);
    intrinsic_movaps(var_E0, 0x0);
    var_F0 = intrinsic_movaps(var_F0, 0x0);
    var_100 = intrinsic_movaps(var_100, 0x0);
    rax = [r12 sublayouts];
    rax = [rax retain];
    var_108 = rax;
    rbx = [rax countByEnumeratingWithState:var_100 objects:var_B0 count:0x10];
    if (rbx != 0x0) {
            r15 = *var_F0;
            do {
                    r14 = 0x0;
                    do {
                            if (*var_F0 != r15) {
                                    objc_enumerationMutation(var_108);
                            }
                            [r12 _prepareLayout:*(var_F8 + r14 * 0x8)];
                            r14 = r14 + 0x1;
                    } while (r14 < rbx);
                    rbx = [var_108 countByEnumeratingWithState:var_100 objects:var_B0 count:0x10];
            } while (rbx != 0x0);
    }
    [var_108 release];
    if (*___stack_chk_guard != *___stack_chk_guard) {
            __stack_chk_fail();
    }
    return;
}

void -[_UICollectionViewCompositionLayout _prepareLayout:](void * self, void * _cmd, void * arg2) {
    r14 = arg2;
    r15 = self;
    var_50 = [r14 retain];
    rbx = [[r14 _siblingLayout] retain];
    if ((rbx != 0x0) && ([rbx _isPrepared] == 0x0)) {
            rdx = rbx;
            [r15 _prepareLayout:rdx];
    }
    var_58 = rbx;
    [r14 prepareLayout];
    [r14 _layoutOffset];
    var_60 = intrinsic_movsd(var_60, xmm0);
    var_68 = intrinsic_movsd(var_68, xmm1);
    r12 = [r14 _layoutOffsetEdges];
    r13 = [[r14 _siblingLayout] retain];
    intrinsic_movsd(xmm0, var_60, @selector(_frameForLayout:offset:relativeToEdges:fromSiblingLayout:), var_50);
    intrinsic_movsd(xmm1, var_68);
    [var_48 _frameForLayout:r15 offset:rcx relativeToEdges:r12 fromSiblingLayout:r13, stack[2029]];
    [r14 _setFrame:rdx, rcx];
    [var_50 release];
    [r13 release];
    [var_58 release];
    return;
}

void -[_UICollectionViewCompositionLayout invalidateLayoutWithContext:](void * self, void * _cmd, void * arg2) {
    r14 = self;
    rbx = [arg2 retain];
    var_220 = rbx;
    [[r14 super] invalidateLayoutWithContext:rbx];
    rax = [rbx _invalidationContextTable];
    rax = [rax retain];
    if (rax != 0x0) {
            intrinsic_movaps(var_150, 0x0);
            intrinsic_movaps(var_160, 0x0);
            var_170 = intrinsic_movaps(var_170, 0x0);
            var_180 = intrinsic_movaps(var_180, 0x0);
            var_1D8 = rax;
            rax = [rax keyEnumerator];
            rax = [rax retain];
            var_1E8 = rax;
            rax = [rax countByEnumeratingWithState:var_180 objects:var_B0 count:0x10];
            var_1C8 = rax;
            if (rax != 0x0) {
                    var_1E0 = *var_170;
                    do {
                            rbx = 0x0;
                            do {
                                    if (*var_170 != var_1E0) {
                                            objc_enumerationMutation(var_1E8);
                                    }
                                    r15 = [[var_1D8 objectForKey:*(var_178 + rbx * 0x8)] retain];
                                    [*(var_178 + rbx * 0x8) invalidateLayoutWithContext:r15];
                                    [r15 release];
                                    rbx = rbx + 0x1;
                            } while (rbx < var_1C8);
                            rax = [var_1E8 countByEnumeratingWithState:var_180 objects:var_B0 count:0x10];
                            var_1C8 = rax;
                    } while (rax != 0x0);
            }
            rdi = var_1E8;
    }
    else {
            var_1D8 = rax;
            intrinsic_movaps(var_190, 0x0);
            intrinsic_movaps(var_1A0, 0x0);
            var_1B0 = intrinsic_movaps(var_1B0, 0x0);
            var_1C0 = intrinsic_movaps(var_1C0, 0x0);
            rax = [r14 sublayouts];
            rax = [rax retain];
            var_230 = rax;
            rax = [rax countByEnumeratingWithState:var_1C0 objects:var_130 count:0x10];
            var_1C8 = rax;
            if (rax != 0x0) {
                    var_228 = *var_1B0;
                    r13 = var_220;
                    do {
                            r14 = 0x0;
                            do {
                                    if (*var_1B0 != var_228) {
                                            objc_enumerationMutation(var_230);
                                    }
                                    r12 = [[[[*(var_1B8 + r14 * 0x8) class] invalidationContextClass] alloc] init];
                                    rax = [r13 invalidateEverything];
                                    [r12 _setInvalidateEverything:rax & 0xff];
                                    rax = [r13 invalidateDataSourceCounts];
                                    [r12 _setInvalidateDataSourceCounts:rax & 0xff];
                                    [*(var_1B8 + r14 * 0x8) invalidateLayoutWithContext:r12];
                                    [r12 release];
                                    r14 = r14 + 0x1;
                            } while (r14 < var_1C8);
                            rax = [var_230 countByEnumeratingWithState:var_1C0 objects:var_130 count:0x10];
                            var_1C8 = rax;
                    } while (rax != 0x0);
            }
            rdi = var_230;
    }
    [rdi release];
    [var_1D8 release];
    [var_220 release];
    if (*___stack_chk_guard != *___stack_chk_guard) {
            __stack_chk_fail();
    }
    return;
}

void * -[_UICollectionViewCompositionLayout invalidationContextForBoundsChange:](void * self, void * _cmd, struct CGRect arg2) {
    var_130 = [[[[self class] invalidationContextClass] alloc] init];
    var_110 = [[NSMapTable alloc] init];
    intrinsic_movaps(var_C0, 0x0);
    intrinsic_movaps(var_D0, 0x0);
    var_E0 = intrinsic_movaps(var_E0, 0x0);
    var_F0 = intrinsic_movaps(var_F0, 0x0);
    rax = [self sublayouts];
    rax = [rax retain];
    var_120 = rax;
    rdx = var_F0;
    rcx = var_B0;
    rax = [rax countByEnumeratingWithState:rdx objects:rcx count:0x10];
    var_F8 = rax;
    if (rax != 0x0) {
            rbx = arg_0;
            var_118 = *var_E0;
            do {
                    r14 = 0x0;
                    do {
                            if (*var_E0 != var_118) {
                                    objc_enumerationMutation(var_120);
                            }
                            r13 = [[*(var_E8 + r14 * 0x8) invalidationContextForBoundsChange:rdx, rcx] retain];
                            [var_110 setObject:r13 forKey:*(var_E8 + r14 * 0x8)];
                            [r13 release];
                            r14 = r14 + 0x1;
                    } while (r14 < var_F8);
                    rdx = var_F0;
                    rcx = var_B0;
                    rax = [var_120 countByEnumeratingWithState:rdx objects:rcx count:0x10];
                    var_F8 = rax;
            } while (rax != 0x0);
    }
    [var_120 release];
    r15 = var_130;
    [r15 _setInvalidationContextTable:var_110];
    [var_110 release];
    if (*___stack_chk_guard == *___stack_chk_guard) {
            rdi = r15;
            rax = [rdi autorelease];
    }
    else {
            rax = __stack_chk_fail();
    }
    return rax;
}

void * -[_UICollectionViewCompositionLayout invalidationContextForPreferredLayoutAttributes:withOriginalAttributes:](void * self, void * _cmd, void * arg2, void * arg3) {
    var_110 = self;
    rbx = [arg2 retain];
    var_140 = rbx;
    r15 = [arg3 retain];
    var_108 = r15;
    rcx = r15;
    var_150 = [[[self super] invalidationContextForPreferredLayoutAttributes:rbx withOriginalAttributes:rcx] retain];
    r12 = _objc_msgSend;
    var_158 = [[NSMapTable alloc] init];
    r13 = [[r15 _elementKind] retain];
    rbx = r15;
    rdx = r13;
    r14 = [[self->_sublayoutsDict objectForKeyedSubscript:rdx] retain];
    [r13 release];
    if (r14 != 0x0) goto loc_54d35a;

loc_54d15d:
    r15 = r14;
    r14 = [[rbx indexPath] retain];
    var_120 = [r14 section];
    rdi = r14;
    r14 = r15;
    [rdi release];
    intrinsic_movaps(var_D0, 0x0);
    intrinsic_movaps(var_E0, 0x0);
    var_F0 = intrinsic_movaps(var_F0, 0x0);
    var_100 = intrinsic_movaps(var_100, 0x0);
    rax = [var_110->_sublayoutsDict objectForKeyedSubscript:@"UINoElementKind", *_OBJC_IVAR_$__UICollectionViewCompositionLayout._sublayoutsDict];
    rax = [rax retain];
    var_138 = rax;
    rax = [rax countByEnumeratingWithState:var_100 objects:var_B0 count:0x10];
    var_128 = rax;
    r15 = _objc_msgSend;
    if (rax == 0x0) goto loc_54d340;

loc_54d21d:
    var_130 = *var_F0;
    goto loc_54d23c;

loc_54d23c:
    var_148 = r14;
    r12 = 0x0;
    goto loc_54d262;

loc_54d262:
    if (*var_F0 != var_130) {
            objc_enumerationMutation(var_138);
    }
    rbx = *(var_F8 + r12 * 0x8);
    r14 = [(r15)(rbx, @selector(_sections)) retain];
    r13 = (r15)(r14, @selector(containsIndex:), var_120);
    [r14 release];
    if (r13 != 0x0) goto loc_54d31d;

loc_54d2c9:
    r12 = r12 + 0x1;
    rbx = var_108;
    if (r12 < var_128) goto loc_54d262;

loc_54d2dc:
    rax = [var_138 countByEnumeratingWithState:var_100 objects:var_B0 count:0x10];
    var_128 = rax;
    r14 = var_148;
    if (rax != 0x0) goto loc_54d23c;

loc_54d340:
    [var_138 release];
    r12 = r15;
    goto loc_54d35a;

loc_54d35a:
    var_148 = r14;
    var_108 = rbx;
    rcx = rbx;
    r14 = [(r12)(r14, @selector(invalidationContextForPreferredLayoutAttributes:withOriginalAttributes:), var_140, rcx) retain];
    rbx = [(r12)(r14, @selector(invalidatedItemIndexPaths), var_140, rcx) retain];
    r13 = var_150;
    (r12)(r13, @selector(invalidateItemsAtIndexPaths:), rbx, rcx);
    [rbx release];
    (r12)(var_158, @selector(setObject:forKey:), r14, var_148);
    (r12)(r13, @selector(_setInvalidationContextTable:), var_158, var_148);
    rdi = r14;
    [rdi release];
    [var_148 release];
    [var_158 release];
    [var_108 release];
    [var_140 release];
    if (*___stack_chk_guard == *___stack_chk_guard) {
            rdi = r13;
            rax = [rdi autorelease];
    }
    else {
            rax = __stack_chk_fail();
    }
    return rax;

loc_54d31d:
    rbx = [rbx retain];
    [var_148 release];
    r14 = rbx;
    rbx = var_108;
    goto loc_54d340;
}

void -[_UICollectionViewCompositionLayout .cxx_destruct](void * self, void * _cmd) {
    objc_storeStrong(self + *_OBJC_IVAR_$__UICollectionViewCompositionLayout._sublayoutsDict, 0x0);
    return;
}

