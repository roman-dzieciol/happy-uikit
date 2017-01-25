void +[UICollectionViewData initialize](void * self, void * _cmd) {
    if ([UICollectionViewData class] == self) {
            rdi = [UIScreen mainScreen];
            rbx = [rdi retain];
            if (rbx != 0x0) {
                    rdi = var_30;
                    [rdi bounds];
            }
            else {
                    xmm0 = intrinsic_xorpd(xmm0, xmm0);
                    var_20 = intrinsic_movapd(var_20, xmm0);
                    var_30 = intrinsic_movapd(var_30, xmm0);
            }
            CGRectGetHeight(rdi);
            var_38 = intrinsic_movsd(var_38, xmm0);
            [rbx release];
            xmm0 = intrinsic_xorpd(xmm0, xmm0);
            xmm1 = intrinsic_movsd(xmm1, var_38);
            xmm1 = intrinsic_ucomisd(xmm1, xmm0);
            COND = xmm1 != 0x0;
            xmm0 = intrinsic_movapd(xmm0, xmm1);
            if ((!COND) && (!CPU_FLAGS & P)) {
                    rbx = [[UIScreen mainScreen] retain];
                    NSLog(@"Incorrect screen size for %@ in UICollectionViewData", rbx);
                    [rbx release];
                    xmm0 = intrinsic_movsd(xmm0, *0xc4f740);
            }
            *___pageDimension = intrinsic_movsd(*___pageDimension, xmm0);
    }
    return;
}

void * -[UICollectionViewData initWithCollectionView:layout:](void * self, void * _cmd, void * arg2, void * arg3) {
    r15 = [arg2 retain];
    var_40 = [arg3 retain];
    rbx = [[self super] init];
    if (rbx != 0x0) {
            objc_storeWeak(rbx + *_OBJC_IVAR_$_UICollectionViewData._collectionView, r15);
            rbx->_layout = [var_40 retain];
            var_48 = r15;
            [rbx->_layout release];
            rbx->_supplementaryLayoutAttributes = [[NSMutableDictionary alloc] init];
            [rbx->_supplementaryLayoutAttributes release];
            rbx->_decorationLayoutAttributes = [[NSMutableDictionary alloc] init];
            [rbx->_decorationLayoutAttributes release];
            rbx->_clonedCellAttributes = [[NSMutableArray alloc] init];
            [rbx->_clonedCellAttributes release];
            rbx->_clonedSupplementaryAttributes = [[NSMutableArray alloc] init];
            [rbx->_clonedSupplementaryAttributes release];
            rbx->_clonedDecorationAttributes = [[NSMutableArray alloc] init];
            [rbx->_clonedDecorationAttributes release];
            r13 = [[NSPointerFunctions pointerFunctionsWithOptions:0x502] retain];
            r14 = [[NSPointerFunctions pointerFunctionsWithOptions:0x0] retain];
            rbx->_screenPageMap = [[NSMapTable alloc] initWithKeyPointerFunctions:r13 valuePointerFunctions:r14 capacity:0x0];
            [rbx->_screenPageMap release];
            rbx->_lastSectionTestedForNumberOfItemsBeforeSection = 0x7fffffffffffffff;
            [r14 release];
            [r13 release];
            r15 = var_48;
    }
    [var_40 release];
    [r15 release];
    rax = rbx;
    return rax;
}

void -[UICollectionViewData dealloc](void * self, void * _cmd) {
    r12 = self;
    rdi = r12->_sectionItemCounts;
    if (rdi != 0x0) {
            free(rdi);
    }
    rdi = r12->_globalItems;
    if (rdi != 0x0) {
            if (r12->_numItems > 0x0) {
                    *rdi = 0x0;
                    [*rdi release];
                    rbx = 0x1;
                    if (r12->_numItems > 0x1) {
                            do {
                                    *(r12->_globalItems + rbx * 0x8) = 0x0;
                                    [*(r12->_globalItems + rbx * 0x8) release];
                                    rbx = rbx + 0x1;
                            } while (rbx < r12->_numItems);
                    }
                    rdi = r12->_globalItems;
            }
            free(rdi);
    }
    [[r12 super] dealloc];
    return;
}

void -[UICollectionViewData invalidateItemsAtIndexPaths:](void * self, void * _cmd, void * arg2) {
    var_190 = _cmd;
    var_118 = self;
    rax = [arg2 retain];
    var_168 = rax;
    intrinsic_movaps(var_C0, 0x0);
    intrinsic_movaps(var_D0, 0x0);
    var_E0 = intrinsic_movaps(var_E0, 0x0);
    var_F0 = intrinsic_movaps(var_F0, 0x0);
    rax = [rax countByEnumeratingWithState:var_F0 objects:var_B0 count:0x10];
    var_140 = rax;
    if (rax != 0x0) {
            r15 = *var_E0;
            var_198 = r15;
            do {
                    r12 = @selector(globalIndexForItemAtIndexPath:);
                    var_170 = r12;
                    var_160 = *_OBJC_IVAR_$_UICollectionViewData._validLayoutRect + var_118;
                    r13 = 0x0;
                    do {
                            if (*var_E0 != r15) {
                                    objc_enumerationMutation(var_168);
                            }
                            var_138 = *(var_E8 + r13 * 0x8);
                            r14 = _objc_msgSend(var_118, r12);
                            if (r14 >= var_118->_numItems) {
                                    r12 = [[NSString stringWithUTF8String:"/BuildRoot/Library/Caches/com.apple.xbs/Sources/UIKit_Sim/UIKit-3600.6.21/UICollectionViewData.m"] retain];
                                    rdi = @"<Unknown File>";
                                    if (r12 != 0x0) {
                                            rdi = r12;
                                    }
                                    var_148 = [rdi retain];
                                    rdi = r12;
                                    [rdi release];
                                    rcx = [[NSAssertionHandler currentHandler] retain];
                                    stack[1985] = r14;
                                    r14 = r14;
                                    [rcx handleFailureInMethod:var_190 object:var_118 file:var_148 lineNumber:0x96 description:@"attempting to invalidate an item at an invalid indexPath: %@ globalIndex: %ld numItems: %ld", var_138, stack[1985], var_118->_numItems];
                                    [var_148 release];
                                    r15 = var_198;
                                    [rcx release];
                                    r12 = var_170;
                            }
                            rsi = *(var_118->_globalItems + r14 * 0x8);
                            if (rsi != 0x0) {
                                    [var_110 frame];
                                    if (CGRectIntersectsRect(var_110, rsi) != 0x0) {
                                            rdi = var_118->_globalIndexesOfItemsAwaitingValidation;
                                            if (rdi == 0x0) {
                                                    var_118->_globalIndexesOfItemsAwaitingValidation = [[NSMutableIndexSet alloc] init];
                                                    [var_118->_globalIndexesOfItemsAwaitingValidation release];
                                                    rdi = var_118->_globalIndexesOfItemsAwaitingValidation;
                                                    r14 = r14;
                                            }
                                            [rdi addIndex:r14];
                                    }
                                    *(var_118->_globalItems + r14 * 0x8) = 0x0;
                                    [*(var_118->_globalItems + r14 * 0x8) release];
                            }
                            r13 = r13 + 0x1;
                    } while (r13 < var_140);
                    rax = [var_168 countByEnumeratingWithState:var_F0 objects:var_B0 count:0x10];
                    var_140 = rax;
            } while (rax != 0x0);
    }
    [var_168 release];
    if (*___stack_chk_guard != *___stack_chk_guard) {
            __stack_chk_fail();
    }
    return;
}

void -[UICollectionViewData invalidateSupplementaryIndexPaths:](void * self, void * _cmd, void * arg2) {
    rbx = self;
    r14 = [arg2 retain];
    if ((rbx->_collectionViewDataFlags & 0x8) == 0x0) {
            if (rbx->_invalidatedSupplementaryIndexPaths == 0x0) {
                    rbx->_invalidatedSupplementaryIndexPaths = [[NSMutableDictionary alloc] init];
                    [rbx->_invalidatedSupplementaryIndexPaths release];
            }
            var_28 = [rbx retain];
            [r14 enumerateKeysAndObjectsUsingBlock:__NSConcreteStackBlock];
            [var_28 release];
    }
    [r14 release];
    return;
}

int ___58-[UICollectionViewData invalidateSupplementaryIndexPaths:]_block_invoke(int arg0, int arg1, int arg2) {
    r15 = arg2;
    r14 = arg1;
    rbx = arg0;
    r12 = [[*(rbx + 0x20)->_invalidatedSupplementaryIndexPaths objectForKeyedSubscript:r14] retain];
    if (r12 != 0x0) {
            [r12 addObjectsFromArray:r15];
    }
    else {
            r13 = *(rbx + 0x20)->_invalidatedSupplementaryIndexPaths;
            rax = [NSMutableSet setWithArray:r15];
            rbx = [rax retain];
            [r13 setObject:rbx forKeyedSubscript:r14];
            [rbx release];
    }
    rdi = r12;
    rax = [rdi release];
    return rax;
}

void -[UICollectionViewData invalidateDecorationIndexPaths:](void * self, void * _cmd, void * arg2) {
    rbx = self;
    r14 = [arg2 retain];
    if ((rbx->_collectionViewDataFlags & 0x8) == 0x0) {
            if (rbx->_invalidatedDecorationIndexPaths == 0x0) {
                    rbx->_invalidatedDecorationIndexPaths = [[NSMutableDictionary alloc] init];
                    [rbx->_invalidatedDecorationIndexPaths release];
            }
            var_28 = [rbx retain];
            [r14 enumerateKeysAndObjectsUsingBlock:__NSConcreteStackBlock];
            [var_28 release];
    }
    [r14 release];
    return;
}

int ___55-[UICollectionViewData invalidateDecorationIndexPaths:]_block_invoke(int arg0, int arg1, int arg2) {
    r15 = arg2;
    r14 = arg1;
    rbx = arg0;
    r12 = [[*(rbx + 0x20)->_invalidatedDecorationIndexPaths objectForKeyedSubscript:r14] retain];
    if (r12 != 0x0) {
            [r12 addObjectsFromArray:r15];
    }
    else {
            r13 = *(rbx + 0x20)->_invalidatedDecorationIndexPaths;
            rax = [NSMutableSet setWithArray:r15];
            rbx = [rax retain];
            [r13 setObject:rbx forKeyedSubscript:r14];
            [rbx release];
    }
    rdi = r12;
    rax = [rdi release];
    return rax;
}

void -[UICollectionViewData validateSupplementaryViews](void * self, void * _cmd) {
    rbx = self;
    if ((rbx->_collectionViewDataFlags & 0x8) == 0x0) {
            var_20 = [rbx retain];
            [rbx->_invalidatedSupplementaryIndexPaths enumerateKeysAndObjectsUsingBlock:__NSConcreteStackBlock];
            rdi = rbx->_invalidatedSupplementaryIndexPaths;
            rbx->_invalidatedSupplementaryIndexPaths = 0x0;
            [rdi release];
            [var_20 release];
    }
    return;
}

int ___50-[UICollectionViewData validateSupplementaryViews]_block_invoke(int arg0, int arg1, int arg2) {
    var_108 = arg1;
    var_110 = arg0;
    var_100 = [[*(arg0 + 0x20)->_supplementaryLayoutAttributes objectForKeyedSubscript:rdx] retain];
    intrinsic_movaps(var_C0, 0x0);
    intrinsic_movaps(var_D0, 0x0);
    var_E0 = intrinsic_movaps(var_E0, 0x0);
    var_F0 = intrinsic_movaps(var_F0, 0x0);
    rax = [arg2 retain];
    var_120 = rax;
    rax = [rax countByEnumeratingWithState:var_F0 objects:var_B0 count:0x10];
    var_F8 = rax;
    if (rax != 0x0) {
            var_118 = *var_E0;
            do {
                    rbx = 0x0;
                    do {
                            if (*var_E0 != var_118) {
                                    objc_enumerationMutation(var_120);
                            }
                            [var_100 removeObjectForKey:*(var_E8 + rbx * 0x8)];
                            rax = [*(var_110 + 0x20) layoutAttributesForSupplementaryElementOfKind:var_108 atIndexPath:*(var_E8 + rbx * 0x8)];
                            objc_unsafeClaimAutoreleasedReturnValue(rax);
                            rbx = rbx + 0x1;
                    } while (rbx < var_F8);
                    rax = [var_120 countByEnumeratingWithState:var_F0 objects:var_B0 count:0x10];
                    var_F8 = rax;
            } while (rax != 0x0);
    }
    [var_120 release];
    [var_100 release];
    rax = *___stack_chk_guard;
    if (rax != *___stack_chk_guard) {
            rax = __stack_chk_fail();
    }
    return rax;
}

void -[UICollectionViewData validateDecorationViews](void * self, void * _cmd) {
    rbx = self;
    if ((rbx->_collectionViewDataFlags & 0x8) == 0x0) {
            var_20 = [rbx retain];
            [rbx->_invalidatedDecorationIndexPaths enumerateKeysAndObjectsUsingBlock:__NSConcreteStackBlock];
            rdi = rbx->_invalidatedDecorationIndexPaths;
            rbx->_invalidatedDecorationIndexPaths = 0x0;
            [rdi release];
            [var_20 release];
    }
    return;
}

int ___47-[UICollectionViewData validateDecorationViews]_block_invoke(int arg0, int arg1, int arg2) {
    var_108 = arg1;
    var_110 = arg0;
    var_100 = [[*(arg0 + 0x20)->_decorationLayoutAttributes objectForKeyedSubscript:rdx] retain];
    intrinsic_movaps(var_C0, 0x0);
    intrinsic_movaps(var_D0, 0x0);
    var_E0 = intrinsic_movaps(var_E0, 0x0);
    var_F0 = intrinsic_movaps(var_F0, 0x0);
    rax = [arg2 retain];
    var_120 = rax;
    rax = [rax countByEnumeratingWithState:var_F0 objects:var_B0 count:0x10];
    var_F8 = rax;
    if (rax != 0x0) {
            var_118 = *var_E0;
            do {
                    rbx = 0x0;
                    do {
                            if (*var_E0 != var_118) {
                                    objc_enumerationMutation(var_120);
                            }
                            [var_100 removeObjectForKey:*(var_E8 + rbx * 0x8)];
                            rax = [*(var_110 + 0x20) layoutAttributesForDecorationViewOfKind:var_108 atIndexPath:*(var_E8 + rbx * 0x8)];
                            objc_unsafeClaimAutoreleasedReturnValue(rax);
                            rbx = rbx + 0x1;
                    } while (rbx < var_F8);
                    rax = [var_120 countByEnumeratingWithState:var_F0 objects:var_B0 count:0x10];
                    var_F8 = rax;
            } while (rax != 0x0);
    }
    [var_120 release];
    [var_100 release];
    rax = *___stack_chk_guard;
    if (rax != *___stack_chk_guard) {
            rax = __stack_chk_fail();
    }
    return rax;
}

void -[UICollectionViewData invalidate:](void * self, void * _cmd, bool arg2) {
    rdx = arg2;
    r12 = self;
    rcx = r12->_collectionViewDataFlags;
    if ((rcx & 0x8) == 0x0) {
            if (rdx == 0x0) {
                    rcx = rcx & 0xfd;
                    r12->_collectionViewDataFlags = rcx;
            }
            r12->_collectionViewDataFlags = rcx & 0xfa;
            *(r12 + *_OBJC_IVAR_$_UICollectionViewData._validLayoutRect + 0x18) = *_CGSizeCreateDictionaryRepresentation;
            *(r12 + *_OBJC_IVAR_$_UICollectionViewData._validLayoutRect + 0x10) = *_CGShadingRelease;
            *(r12 + *_OBJC_IVAR_$_UICollectionViewData._validLayoutRect + 0x8) = *_CGShadingCreateAxial;
            r12->_validLayoutRect = *_CGRectZero;
            [r12->_supplementaryLayoutAttributes removeAllObjects];
            [r12->_decorationLayoutAttributes removeAllObjects];
            [r12->_globalIndexesOfItemsAwaitingValidation removeAllIndexes];
            r12->_invalidatedSupplementaryIndexPaths = 0x0;
            [r12->_invalidatedSupplementaryIndexPaths release];
            r12->_invalidatedDecorationIndexPaths = 0x0;
            [r12->_invalidatedDecorationIndexPaths release];
            [r12->_screenPageMap removeAllObjects];
            if (r12->_numItems > 0x0) {
                    rbx = 0x0;
                    do {
                            *(r12->_globalItems + rbx * 0x8) = 0x0;
                            [*(r12->_globalItems + rbx * 0x8) release];
                            rbx = rbx + 0x1;
                    } while (rbx < r12->_numItems);
            }
    }
    return;
}

void -[UICollectionViewData _updateItemCounts](void * self, void * _cmd) {
    var_178 = _cmd;
    r12 = self;
    if (r12->_numItems > 0x0) {
            rbx = 0x0;
            do {
                    *(r12->_globalItems + rbx * 0x8) = 0x0;
                    [*(r12->_globalItems + rbx * 0x8) release];
                    rbx = rbx + 0x1;
            } while (rbx < r12->_numItems);
    }
    rbx = *_OBJC_IVAR_$_UICollectionViewData._collectionView + r12;
    var_118 = rbx;
    r15 = objc_loadWeakRetained(rbx);
    r13 = [[r15 dataSource] retain];
    [r15 release];
    r15 = objc_loadWeakRetained(rbx);
    rcx = 0x1;
    if ([r15 _dataSourceImplementsNumberOfSections] != 0x0) {
            r14 = r12;
            r12 = objc_loadWeakRetained(var_118);
            rbx = [r13 numberOfSectionsInCollectionView:r12];
            rdi = r12;
            r12 = r14;
            [rdi release];
            rcx = 0x0;
            if (rbx >= 0x0) {
                    rcx = rbx;
            }
    }
    r12->_numSections = rcx;
    [r15 release];
    r12->_numItems = 0x0;
    rdi = r12->_sectionItemCounts;
    rsi = r12->_numSections;
    if (rdi == 0x0) goto loc_9c84eb;

loc_9c84db:
    if (rsi == 0x0) goto loc_9c8502;

loc_9c84e0:
    rax = realloc(rdi, rsi << 0x3);
    goto loc_9c84fc;

loc_9c84fc:
    r12->_sectionItemCounts = rax;
    goto loc_9c850f;

loc_9c850f:
    rax = r13;
    if (r12->_numSections > 0x0) {
            var_F8 = *_OBJC_IVAR_$_UICollectionViewData._collectionView + r12;
            r13 = 0x0;
            var_190 = rax;
            r15 = *_OBJC_IVAR_$_UICollectionViewData._numItems;
            do {
                    r14 = objc_loadWeakRetained(var_F8);
                    rbx = [var_190 collectionView:r14 numberOfItemsInSection:r13];
                    [r14 release];
                    if (rbx < 0x0) {
                            rbx = 0x0;
                    }
                    *(r12->_sectionItemCounts + r13 * 0x8) = rbx;
                    rbx = rbx + *(r12 + r15);
                    *(r12 + r15) = rbx;
                    r13 = r13 + 0x1;
            } while (r13 < r12->_numSections);
    }
    else {
            r15 = *_OBJC_IVAR_$_UICollectionViewData._numItems;
            rbx = *(r12 + r15);
            var_190 = rax;
    }
    var_108 = r12;
    if (rbx > 0x0) {
            rax = realloc(r12->_globalItems, rbx << 0x3);
            r12->_globalItems = rax;
            memset(rax, 0x0, *(r12 + r15) << 0x3);
    }
    r12->_collectionViewDataFlags = r12->_collectionViewDataFlags | 0x2;
    r12->_lastSectionTestedForNumberOfItemsBeforeSection = 0x7fffffffffffffff;
    intrinsic_movaps(var_C0, 0x0);
    intrinsic_movaps(var_D0, 0x0);
    var_E0 = intrinsic_movaps(var_E0, 0x0);
    var_F0 = intrinsic_movaps(var_F0, 0x0);
    rbx = objc_loadWeakRetained(var_118);
    r15 = [[rbx _reorderedItems] retain];
    var_150 = r15;
    [rbx release];
    rax = [r15 countByEnumeratingWithState:var_F0 objects:var_B0 count:0x10];
    var_110 = rax;
    if (rax != 0x0) {
            var_138 = *var_E0;
            do {
                    var_168 = *_OBJC_IVAR_$_UICollectionViewData._collectionView + r12;
                    rbx = 0x0;
                    do {
                            if (*var_E0 != var_138) {
                                    objc_enumerationMutation(var_150);
                            }
                            r12 = *(var_E8 + rbx * 0x8);
                            var_100 = rbx;
                            rbx = [[r12 originalIndexPath] retain];
                            var_F8 = [rbx section];
                            [rbx release];
                            rbx = [[r12 targetIndexPath] retain];
                            r13 = [rbx section];
                            [rbx release];
                            r14 = var_F8;
                            r12 = var_108;
                            if (r14 != r13) {
                                    rax = r12->_sectionItemCounts;
                                    if (rax != 0x0) {
                                            if (r14 >= r12->_numSections) {
                                                    rbx = [[NSString stringWithUTF8String:"/BuildRoot/Library/Caches/com.apple.xbs/Sources/UIKit_Sim/UIKit-3600.6.21/UICollectionViewData.m"] retain];
                                                    rdi = @"<Unknown File>";
                                                    if (rbx != 0x0) {
                                                            rdi = rbx;
                                                    }
                                                    var_180 = [rdi retain];
                                                    var_130 = r13;
                                                    [rbx release];
                                                    rbx = [[NSAssertionHandler currentHandler] retain];
                                                    r14 = r12->_numSections;
                                                    r12 = objc_loadWeakRetained(var_168);
                                                    stack[1993] = r14;
                                                    r14 = var_F8;
                                                    [rbx handleFailureInMethod:var_178 object:var_108 file:var_180 lineNumber:0x131 description:@"trying to process interactive move from section %ld when there are only %ld sections in collection view: %@", r14, stack[1993], r12];
                                                    [var_180 release];
                                                    rdi = r12;
                                                    r12 = var_108;
                                                    [rdi release];
                                                    [rbx release];
                                                    r13 = var_130;
                                                    rax = r12->_sectionItemCounts;
                                            }
                                            if (*(rax + r14 * 0x8) <= 0x0) {
                                                    rbx = [[NSString stringWithUTF8String:"/BuildRoot/Library/Caches/com.apple.xbs/Sources/UIKit_Sim/UIKit-3600.6.21/UICollectionViewData.m"] retain];
                                                    rdi = @"<Unknown File>";
                                                    if (rbx != 0x0) {
                                                            rdi = rbx;
                                                    }
                                                    var_F8 = [rdi retain];
                                                    rdi = rbx;
                                                    [rdi release];
                                                    r12 = [[NSAssertionHandler currentHandler] retain];
                                                    var_130 = r13;
                                                    r13 = objc_loadWeakRetained(var_168);
                                                    [r12 handleFailureInMethod:var_178 object:var_108 file:var_F8 lineNumber:0x132 description:@"trying to process interactive move from section %ld when there are no items in that section for collection view: %@", r14, r13];
                                                    [var_F8 release];
                                                    rdi = r13;
                                                    r13 = var_130;
                                                    [rdi release];
                                                    rdi = r12;
                                                    r12 = var_108;
                                                    [rdi release];
                                            }
                                            if (r13 >= r12->_numSections) {
                                                    rbx = [[NSString stringWithUTF8String:"/BuildRoot/Library/Caches/com.apple.xbs/Sources/UIKit_Sim/UIKit-3600.6.21/UICollectionViewData.m"] retain];
                                                    rdi = @"<Unknown File>";
                                                    if (rbx != 0x0) {
                                                            rdi = rbx;
                                                    }
                                                    var_180 = [rdi retain];
                                                    var_130 = r13;
                                                    [rbx release];
                                                    var_F8 = [[NSAssertionHandler currentHandler] retain];
                                                    rax = objc_loadWeakRetained(var_168);
                                                    var_188 = rax;
                                                    stack[1994] = rax;
                                                    stack[1993] = r12->_numSections;
                                                    r12 = r12;
                                                    [var_F8 handleFailureInMethod:var_178 object:r12 file:var_180 lineNumber:0x133 description:@"trying to process interactive move to section %ld when there are only %ld sections in collection view: %@", var_130, stack[1993], stack[1994]];
                                                    [var_180 release];
                                                    [var_188 release];
                                                    [var_F8 release];
                                                    r13 = var_130;
                                            }
                                            *(r12->_sectionItemCounts + r14 * 0x8) = *(r12->_sectionItemCounts + r14 * 0x8) - 0x1;
                                            *(r12->_sectionItemCounts + r13 * 0x8) = *(r12->_sectionItemCounts + r13 * 0x8) + 0x1;
                                    }
                            }
                            rbx = var_100 + 0x1;
                    } while (rbx < var_110);
                    rax = [var_150 countByEnumeratingWithState:var_F0 objects:var_B0 count:0x10];
                    var_110 = rax;
            } while (rax != 0x0);
    }
    [var_150 release];
    [var_190 release];
    if (*___stack_chk_guard != *___stack_chk_guard) {
            __stack_chk_fail();
    }
    return;

loc_9c8502:
    free(rdi);
    r12->_sectionItemCounts = 0x0;
    goto loc_9c850f;

loc_9c84eb:
    if (rsi == 0x0) goto loc_9c850f;

loc_9c84f0:
    rax = malloc(rsi << 0x3);
    goto loc_9c84fc;
}

void -[UICollectionViewData _validateItemCounts](void * self, void * _cmd) {
    rdi = self;
    if ((rdi->_collectionViewDataFlags & 0x2) == 0x0) {
            [rdi _updateItemCounts];
    }
    return;
}

void -[UICollectionViewData _validateContentSize](void * self, void * _cmd) {
    rbx = self;
    rax = rbx->_collectionViewDataFlags;
    if ((rax & 0x1) == 0x0) {
            if ((rax & 0x8) != 0x0) {
                    r14 = ___UILogGetCategoryCachedImpl("Assert", __validateContentSize.__s_category);
                    if (os_log_type_enabled(*(r14 + 0x8), 0x10) != 0x0) {
                            r12 = rsp;
                            rax = rsp;
                            *(int8_t *)(rax + 0xfffffffffffffff0) = 0x0;
                            *(int8_t *)(rax + 0xfffffffffffffff1) = 0x0;
                            _os_log_impl(0xffffffffff63738b, *(r14 + 0x8), 0x10, "trying to load collection view layout data when layout is locked", rax + 0xfffffffffffffff0, 0x2);
                    }
            }
            [rbx->_layout collectionViewContentSize];
            rbx->_contentSize = intrinsic_movsd(rbx->_contentSize, xmm0);
            *(rbx + *_OBJC_IVAR_$_UICollectionViewData._contentSize + 0x8) = intrinsic_movsd(*(rbx + *_OBJC_IVAR_$_UICollectionViewData._contentSize + 0x8), xmm1);
            rbx->_collectionViewDataFlags = rbx->_collectionViewDataFlags | 0x1;
    }
    return;
}

void -[UICollectionViewData _prepareToLoadData](void * self, void * _cmd) {
    rbx = self;
    rax = rbx->_collectionViewDataFlags;
    if ((rax & 0x4) == 0x0) {
            if ((rax & 0x8) != 0x0) {
                    r14 = ___UILogGetCategoryCachedImpl("Assert", __prepareToLoadData.__s_category);
                    if (os_log_type_enabled(*(r14 + 0x8), 0x10) != 0x0) {
                            r12 = rsp;
                            rax = rsp;
                            *(int8_t *)(rax + 0xfffffffffffffff0) = 0x0;
                            *(int8_t *)(rax + 0xfffffffffffffff1) = 0x0;
                            _os_log_impl(0xffffffffff6372c6, *(r14 + 0x8), 0x10, "trying to load collection view layout data when layout is locked", rax + 0xfffffffffffffff0, 0x2);
                    }
            }
            [rbx->_layout prepareLayout];
            rbx->_collectionViewDataFlags = rbx->_collectionViewDataFlags | 0x4;
    }
    [rbx _validateItemCounts];
    [rbx _validateContentSize];
    return;
}

void * -[UICollectionViewData _screenPageForPoint:](void * self, void * _cmd, struct CGPoint arg2) {
    rdx = arg2;
    r14 = self;
    xmm2 = intrinsic_movsd(xmm2, *___pageDimension, rdx);
    var_50 = intrinsic_movsd(var_50, xmm2);
    xmm0 = intrinsic_divsd(xmm0, xmm2);
    var_68 = intrinsic_movsd(var_68, xmm0);
    xmm1 = intrinsic_divsd(xmm1, xmm2);
    var_58 = intrinsic_movsd(var_58, xmm1);
    floor(xmm0);
    xmm0 = intrinsic_mulsd(xmm0, var_50);
    var_60 = intrinsic_movsd(var_60, xmm0);
    xmm0 = intrinsic_movsd(xmm0, var_58);
    floor(xmm0);
    xmm1 = intrinsic_movsd(xmm1, var_50);
    xmm0 = intrinsic_mulsd(xmm0, xmm1);
    xmm2 = intrinsic_movsd(xmm2, var_60);
    var_48 = intrinsic_movsd(var_48, xmm2);
    var_40 = intrinsic_movsd(var_40, xmm0);
    var_38 = intrinsic_movsd(var_38, xmm1);
    var_30 = intrinsic_movsd(var_30, xmm1);
    rbx = 0x0;
    rax = CGRectIntersectsRect(self, _cmd);
    if (rax != 0x0) {
            xmm0 = intrinsic_movsd(xmm0, *0xc4f758);
            xmm2 = intrinsic_movsd(xmm2, var_68);
            xmm1 = intrinsic_movapd(xmm1, xmm2);
            xmm1 = intrinsic_subsd(xmm1, xmm0);
            rax = intrinsic_cvttsd2si(rax, xmm1);
            rcx = 0x8000000000000000;
            rax = rax ^ rcx;
            rdx = intrinsic_cvttsd2si(rdx, xmm2);
            xmm2 = intrinsic_ucomisd(xmm2, xmm0);
            asm { cmovae     rdx, rax };
            rdx = rdx << 0x20;
            xmm2 = intrinsic_movsd(xmm2, var_58);
            rax = intrinsic_cvttsd2si(rax, intrinsic_subsd(intrinsic_movapd(xmm1, xmm2), xmm0));
            rax = rax ^ rcx;
            rcx = intrinsic_cvttsd2si(rcx, xmm2);
            xmm2 = intrinsic_ucomisd(xmm2, xmm0);
            asm { cmovae     rcx, rax };
            r15 = !(rcx | rdx);
            rbx = [[r14->_screenPageMap objectForKey:r15] retain];
            if (rbx == 0x0) {
                    r12 = [[NSMutableIndexSet alloc] init];
                    [rbx release];
                    [r14->_screenPageMap setObject:r12 forKey:r15];
                    rbx = r12;
            }
    }
    rdi = rbx;
    rax = [rdi autorelease];
    return rax;
}

void -[UICollectionViewData _setLayoutAttributes:atGlobalItemIndex:](void * self, void * _cmd, void * arg2, int arg3) {
    r12 = self;
    rbx = [arg2 retain];
    r13 = sign_extend_64(arg3);
    rax = r12->_globalItems;
    rdi = *(rax + r13 * 0x8);
    if (rdi != rbx) {
            *(rax + r13 * 0x8) = 0x0;
            [rdi release];
            *(r12->_globalItems + r13 * 0x8) = [rbx copy];
            [*(r12->_globalItems + r13 * 0x8) release];
            if (rbx != 0x0) {
                    var_B0 = r13;
                    rdi = var_48;
                    rsi = rbx;
                    var_C8 = rbx;
                    [rdi frame];
                    CGRectGetMinX(rdi);
                    var_B8 = @selector(_screenPageForPoint:);
                    var_C0 = @selector(addIndex:);
                    do {
                            var_A8 = intrinsic_movsd(var_A8, xmm0);
                            CGRectGetMinY(rdi);
                            var_98 = intrinsic_movsd(var_98, xmm0);
                            xmm1 = intrinsic_movsd(xmm1, *___pageDimension);
                            var_90 = intrinsic_movsd(var_90, xmm1);
                            xmm0 = intrinsic_movsd(xmm0, var_A8);
                            xmm0 = intrinsic_divsd(xmm0, xmm1);
                            floor(xmm0);
                            xmm1 = intrinsic_movsd(xmm1, var_90);
                            xmm0 = intrinsic_mulsd(xmm0, xmm1);
                            var_A0 = intrinsic_movsd(var_A0, xmm0);
                            xmm0 = intrinsic_movsd(xmm0, var_98);
                            xmm0 = intrinsic_divsd(xmm0, xmm1);
                            floor(xmm0);
                            xmm1 = intrinsic_movsd(xmm1, var_90);
                            xmm0 = intrinsic_mulsd(xmm0, xmm1);
                            xmm2 = intrinsic_movsd(xmm2, var_A0);
                            var_68 = intrinsic_movsd(var_68, xmm2);
                            var_60 = intrinsic_movsd(var_60, xmm0);
                            var_58 = intrinsic_movsd(var_58, xmm1);
                            var_50 = intrinsic_movsd(var_50, xmm1);
                            if (CGRectIntersectsRect(rdi, rsi) == 0x0) {
                                break;
                            }
                            CGRectGetMinY(rdi);
                            var_90 = intrinsic_movsd(var_90, xmm0);
                            do {
                                    CGRectGetMinX(rdi);
                                    xmm1 = intrinsic_movsd(xmm1, *___pageDimension);
                                    var_98 = intrinsic_movsd(var_98, xmm1);
                                    xmm0 = intrinsic_divsd(xmm0, xmm1);
                                    floor(xmm0);
                                    xmm1 = intrinsic_movsd(xmm1, var_98);
                                    xmm0 = intrinsic_mulsd(xmm0, xmm1);
                                    var_A0 = intrinsic_movsd(var_A0, xmm0);
                                    xmm0 = intrinsic_movsd(xmm0, var_90);
                                    xmm0 = intrinsic_divsd(xmm0, xmm1);
                                    floor(xmm0);
                                    xmm1 = intrinsic_movsd(xmm1, var_98);
                                    xmm0 = intrinsic_mulsd(xmm0, xmm1);
                                    xmm2 = intrinsic_movsd(xmm2, var_A0);
                                    var_88 = intrinsic_movsd(var_88, xmm2);
                                    var_80 = intrinsic_movsd(var_80, xmm0);
                                    var_78 = intrinsic_movsd(var_78, xmm1);
                                    var_70 = intrinsic_movsd(var_70, xmm1);
                                    if (CGRectIntersectsRect(rdi, rsi) == 0x0) {
                                        break;
                                    }
                                    xmm0 = intrinsic_movsd(xmm0, var_A8);
                                    xmm1 = intrinsic_movsd(xmm1, var_90);
                                    r14 = [[r12 _screenPageForPoint:rdx] retain];
                                    rsi = @selector(addIndex:);
                                    _objc_msgSend(r14, rsi, var_B0);
                                    rdi = r14;
                                    [rdi release];
                                    xmm0 = intrinsic_movsd(xmm0, var_90);
                                    xmm0 = intrinsic_addsd(xmm0, *___pageDimension);
                                    var_90 = intrinsic_movsd(var_90, xmm0);
                            } while (true);
                            CGRectGetMaxY(rdi);
                            xmm1 = intrinsic_movapd(xmm1, xmm0);
                            xmm1 = intrinsic_addsd(xmm1, *0xc4f4c8);
                            xmm0 = intrinsic_movsd(xmm0, var_A8);
                            r14 = [_objc_msgSend(r12, var_B8) retain];
                            rsi = var_C0;
                            _objc_msgSend(r14, rsi, var_B0);
                            rdi = r14;
                            [rdi release];
                            xmm0 = intrinsic_movsd(xmm0, var_A8);
                            xmm0 = intrinsic_addsd(xmm0, *___pageDimension);
                    } while (true);
                    CGRectGetMaxX(rdi);
                    xmm1 = intrinsic_movapd(xmm1, xmm0);
                    xmm0 = intrinsic_movsd(xmm0, *0xc4f4c8);
                    xmm1 = intrinsic_addsd(xmm1, xmm0);
                    var_90 = intrinsic_movsd(var_90, xmm1);
                    CGRectGetMaxY(rdi);
                    xmm1 = intrinsic_movsd(xmm1, *0xc4f4c8);
                    intrinsic_addsd(xmm1, xmm0);
                    intrinsic_movsd(xmm0, var_90);
                    rbx = [[r12 _screenPageForPoint:rdx] retain];
                    [rbx addIndex:var_B0];
                    [rbx release];
                    rbx = var_C8;
            }
    }
    [rbx release];
    return;
}

void -[UICollectionViewData _loadEverything](void * self, void * _cmd) {
    r15 = self;
    [self _prepareToLoadData];
    rax = r15->_numItems;
    if (rax > 0x0) {
            rdx = *_OBJC_IVAR_$_UICollectionViewData._globalItems;
            var_50 = rdx;
            r13 = 0x0;
            do {
                    if (*(*(r15 + rdx) + r13 * 0x8) == 0x0) {
                            if ((r15->_collectionViewDataFlags & 0x8) != 0x0) {
                                    r14 = ___UILogGetCategoryCachedImpl("Assert", __loadEverything.__s_category);
                                    if (os_log_type_enabled(*(r14 + 0x8), 0x10) != 0x0) {
                                            rbx = rsp;
                                            rax = rsp;
                                            *(int8_t *)(rax + 0xfffffffffffffff0) = 0x0;
                                            *(int8_t *)(rax + 0xfffffffffffffff1) = 0x0;
                                            _os_log_impl(0xffffffffff636b03, *(r14 + 0x8), 0x10, "trying to load collection view layout data when layout is locked", rax + 0xfffffffffffffff0, 0x2);
                                            rsp = rbx;
                                    }
                            }
                            rbx = r15->_layout;
                            rdi = r15;
                            r14 = r15;
                            r12 = [[rdi indexPathForItemAtGlobalIndex:r13] retain];
                            rbx = [[rbx layoutAttributesForItemAtIndexPath:r12] retain];
                            [r14 _setLayoutAttributes:rbx atGlobalItemIndex:r13];
                            r15 = r14;
                            rdi = rbx;
                            [rdi release];
                            [r12 release];
                            rax = r15->_numItems;
                            rdx = var_50;
                    }
                    r13 = r13 + 0x1;
            } while (r13 < rax);
    }
    [var_48 collectionViewContentRect];
    *(r15 + *_OBJC_IVAR_$_UICollectionViewData._validLayoutRect + 0x18) = var_30;
    *(r15 + *_OBJC_IVAR_$_UICollectionViewData._validLayoutRect + 0x10) = var_38;
    *(r15 + *_OBJC_IVAR_$_UICollectionViewData._validLayoutRect + 0x8) = var_40;
    r15->_validLayoutRect = var_48;
    return;
}

void -[UICollectionViewData validateLayoutInRect:](void * self, void * _cmd, struct CGRect arg2) {
    rdi = self;
    var_298 = _cmd;
    r13 = rdi;
    var_30 = *___stack_chk_guard;
    rsi = @selector(_prepareToLoadData);
    _objc_msgSend(rdi, rsi);
    if (r13->_invalidatedSupplementaryIndexPaths != 0x0) {
            rsi = @selector(validateSupplementaryViews);
            rdi = r13;
            _objc_msgSend(rdi, rsi);
    }
    r12 = arg_0;
    if (r13->_invalidatedDecorationIndexPaths != 0x0) {
            rsi = @selector(validateDecorationViews);
            rdi = r13;
            _objc_msgSend(rdi, rsi);
    }
    if (CGRectContainsRect(rdi, rsi) != 0x0) goto loc_9ca5a3;

loc_9c96bc:
    r15 = *_OBJC_IVAR_$_UICollectionViewData._validLayoutRect + r13;
    [r13->_clonedCellAttributes removeAllObjects];
    [r13->_clonedSupplementaryAttributes removeAllObjects];
    [r13->_clonedDecorationAttributes removeAllObjects];
    var_2E8 = r13;
    rax = [r13 retain];
    var_140 = rax;
    rax = [rax retain];
    var_2B0 = rax;
    var_168 = rax;
    rdi = var_1A8;
    ___45-[UICollectionViewData validateLayoutInRect:]_block_invoke.164(rdi, __NSConcreteStackBlock);
    CGRectGetWidth(rdi);
    var_298 = intrinsic_movsd(var_298, xmm0);
    CGRectGetWidth(rdi);
    xmm1 = intrinsic_movsd(xmm1, var_298);
    xmm1 = intrinsic_ucomisd(xmm1, xmm0);
    if ((xmm1 != 0x0) || (CPU_FLAGS & P)) goto loc_9c98c4;

loc_9c9856:
    CGRectGetMinX(rdi);
    var_298 = intrinsic_movsd(var_298, xmm0);
    CGRectGetMinX(rdi);
    xmm1 = intrinsic_movsd(xmm1, var_298);
    xmm1 = intrinsic_ucomisd(xmm1, xmm0);
    if ((xmm1 != 0x0) || (!CPU_FLAGS & NP)) goto loc_9c98c4;

loc_9c99a8:
    CGRectGetMinX(rdi);
    var_298 = intrinsic_movsd(var_298, xmm0);
    CGRectGetMinX(rdi);
    xmm1 = intrinsic_movsd(xmm1, var_298);
    xmm1 = intrinsic_ucomisd(xmm1, xmm0);
    if ((xmm1 == 0x0) && (!CPU_FLAGS & P)) {
            CGRectGetMinY(rdi);
            var_298 = intrinsic_movsd(var_298, xmm0);
            CGRectGetMinY(rdi);
            xmm1 = intrinsic_movsd(xmm1, var_298);
            xmm1 = intrinsic_ucomisd(xmm1, xmm0);
            if (xmm1 > 0x0) {
                    CGRectGetMaxY(rdi);
                    var_298 = intrinsic_movsd(var_298, xmm0);
                    CGRectGetMinY(rdi);
                    xmm1 = intrinsic_movsd(xmm1, var_298);
                    xmm1 = intrinsic_subsd(xmm1, xmm0);
                    xmm0 = intrinsic_xorpd(xmm0, xmm0);
                    xmm1 = intrinsic_ucomisd(xmm1, xmm0);
                    if (xmm1 < 0x0) {
                            rbx = 0x0;
                    }
                    else {
                            xmm0 = intrinsic_movsd(xmm0, var_190);
                            xmm0 = intrinsic_subsd(xmm0, xmm1);
                            var_190 = intrinsic_movsd(var_190, xmm0);
                            rbx = 0x1;
                    }
                    CGRectGetHeight(rdi);
                    xmm1 = intrinsic_movsd(xmm1, *___pageDimension);
                    xmm2 = intrinsic_movsd(xmm2, *0xc4f408);
                    xmm2 = intrinsic_mulsd(xmm2, xmm1);
                    xmm0 = intrinsic_ucomisd(xmm0, xmm2);
                    if (xmm0 > 0x0) {
                            xmm0 = intrinsic_movsd(xmm0, *(r15 + 0x18));
                            xmm0 = intrinsic_subsd(xmm0, xmm1);
                            *(r15 + 0x18) = intrinsic_movsd(*(r15 + 0x18), xmm0);
                    }
            }
            else {
                    CGRectGetMaxY(rdi);
                    var_298 = intrinsic_movsd(var_298, xmm0);
                    CGRectGetMaxY(rdi);
                    xmm0 = intrinsic_ucomisd(xmm0, var_298);
                    if (xmm0 > 0x0) {
                            CGRectGetMaxY(rdi);
                            var_298 = intrinsic_movsd(var_298, xmm0);
                            CGRectGetMinY(rdi);
                            xmm1 = intrinsic_movsd(xmm1, var_298);
                            xmm1 = intrinsic_subsd(xmm1, xmm0);
                            xmm0 = intrinsic_xorpd(xmm0, xmm0);
                            xmm1 = intrinsic_ucomisd(xmm1, xmm0);
                            if (xmm1 < 0x0) {
                                    rbx = 0x0;
                            }
                            else {
                                    xmm0 = intrinsic_movsd(xmm0, var_1A0);
                                    xmm0 = intrinsic_addsd(xmm0, xmm1);
                                    var_1A0 = intrinsic_movsd(var_1A0, xmm0);
                                    xmm0 = intrinsic_movsd(xmm0, var_190);
                                    xmm0 = intrinsic_subsd(xmm0, xmm1);
                                    var_190 = intrinsic_movsd(var_190, xmm0);
                                    rbx = 0x1;
                            }
                            CGRectGetHeight(rdi);
                            xmm1 = intrinsic_movsd(xmm1, *___pageDimension);
                            xmm2 = intrinsic_movsd(xmm2, *0xc4f408);
                            xmm2 = intrinsic_mulsd(xmm2, xmm1);
                            xmm0 = intrinsic_ucomisd(xmm0, xmm2);
                            if (xmm0 > 0x0) {
                                    xmm0 = intrinsic_movsd(xmm0, *(r15 + 0x18));
                                    xmm0 = intrinsic_subsd(xmm0, xmm1);
                                    *(r15 + 0x18) = intrinsic_movsd(*(r15 + 0x18), xmm0);
                                    xmm0 = intrinsic_movsd(xmm0, *___pageDimension);
                                    xmm0 = intrinsic_addsd(xmm0, *(r15 + 0x8));
                                    *(r15 + 0x8) = intrinsic_movsd(*(r15 + 0x8), xmm0);
                            }
                    }
                    else {
                            rbx = 0x0;
                    }
            }
    }
    else {
            CGRectGetMinX(rdi);
            var_298 = intrinsic_movsd(var_298, xmm0);
            CGRectGetMinX(rdi);
            xmm1 = intrinsic_movsd(xmm1, var_298);
            xmm1 = intrinsic_ucomisd(xmm1, xmm0);
            if (xmm1 > 0x0) {
                    CGRectGetMaxX(rdi);
                    var_298 = intrinsic_movsd(var_298, xmm0);
                    CGRectGetMinX(rdi);
                    xmm1 = intrinsic_movsd(xmm1, var_298);
                    xmm1 = intrinsic_subsd(xmm1, xmm0);
                    xmm0 = intrinsic_xorpd(xmm0, xmm0);
                    xmm1 = intrinsic_ucomisd(xmm1, xmm0);
                    if (xmm1 < 0x0) {
                            rbx = 0x0;
                    }
                    else {
                            xmm0 = intrinsic_movsd(xmm0, var_198);
                            xmm0 = intrinsic_subsd(xmm0, xmm1);
                            var_198 = intrinsic_movsd(var_198, xmm0);
                            rbx = 0x1;
                    }
                    CGRectGetWidth(rdi);
                    xmm1 = intrinsic_movsd(xmm1, *___pageDimension);
                    xmm2 = intrinsic_movsd(xmm2, *0xc4f408);
                    xmm2 = intrinsic_mulsd(xmm2, xmm1);
                    xmm0 = intrinsic_ucomisd(xmm0, xmm2);
                    if (xmm0 > 0x0) {
                            xmm0 = intrinsic_movsd(xmm0, *(r15 + 0x10));
                            xmm0 = intrinsic_subsd(xmm0, xmm1);
                            *(r15 + 0x10) = intrinsic_movsd(*(r15 + 0x10), xmm0);
                    }
            }
            else {
                    CGRectGetMaxX(rdi);
                    var_298 = intrinsic_movsd(var_298, xmm0);
                    CGRectGetMaxX(rdi);
                    xmm0 = intrinsic_ucomisd(xmm0, var_298);
                    if (xmm0 > 0x0) {
                            CGRectGetMaxX(rdi);
                            var_298 = intrinsic_movsd(var_298, xmm0);
                            CGRectGetMinX(rdi);
                            xmm1 = intrinsic_movsd(xmm1, var_298);
                            xmm1 = intrinsic_subsd(xmm1, xmm0);
                            xmm0 = intrinsic_xorpd(xmm0, xmm0);
                            xmm1 = intrinsic_ucomisd(xmm1, xmm0);
                            if (xmm1 < 0x0) {
                                    rbx = 0x0;
                            }
                            else {
                                    xmm0 = intrinsic_movsd(xmm0, var_1A8);
                                    xmm0 = intrinsic_addsd(xmm0, xmm1);
                                    var_1A8 = intrinsic_movsd(var_1A8, xmm0);
                                    xmm0 = intrinsic_movsd(xmm0, var_198);
                                    xmm0 = intrinsic_subsd(xmm0, xmm1);
                                    var_198 = intrinsic_movsd(var_198, xmm0);
                                    rbx = 0x1;
                            }
                            CGRectGetWidth(rdi);
                            xmm1 = intrinsic_movsd(xmm1, *___pageDimension);
                            xmm2 = intrinsic_movsd(xmm2, *0xc4f408);
                            xmm2 = intrinsic_mulsd(xmm2, xmm1);
                            xmm0 = intrinsic_ucomisd(xmm0, xmm2);
                            if (xmm0 > 0x0) {
                                    xmm0 = intrinsic_movsd(xmm0, *(r15 + 0x10));
                                    xmm0 = intrinsic_subsd(xmm0, xmm1);
                                    *(r15 + 0x10) = intrinsic_movsd(*(r15 + 0x10), xmm0);
                                    xmm0 = intrinsic_movsd(xmm0, *___pageDimension);
                                    xmm0 = intrinsic_addsd(xmm0, *r15);
                                    *r15 = intrinsic_movsd(*r15, xmm0);
                            }
                    }
                    else {
                            rbx = 0x0;
                    }
            }
    }
    rsi = __NSConcreteStackBlock;
    ___45-[UICollectionViewData validateLayoutInRect:]_block_invoke.164(var_1C8, rsi);
    var_190 = var_1B0;
    var_198 = var_1B8;
    var_1A0 = var_1C0;
    var_1A8 = var_1C8;
    if (CGRectIsEmpty(var_1C8) != 0x0) goto loc_9ca187;

loc_9ca095:
    if (rbx == 0x0) {
            *(r15 + 0x18) = var_190;
            *(r15 + 0x10) = var_198;
            rax = var_1A8;
            rcx = var_1A0;
    }
    else {
            CGRectUnion(var_1E8, rsi);
            *(r15 + 0x18) = var_1D0;
            *(r15 + 0x10) = var_1D8;
            rax = var_1E8;
            rcx = var_1E0;
    }
    goto loc_9ca144;

loc_9ca144:
    *(r15 + 0x8) = rcx;
    *r15 = rax;
    ___45-[UICollectionViewData validateLayoutInRect:]_block_invoke(__NSConcreteStackBlock);
    goto loc_9ca187;

loc_9ca187:
    var_2D8 = [[NSMutableArray alloc] init];
    xmm0 = intrinsic_xorpd(xmm0, xmm0);
    intrinsic_movapd(var_200, xmm0);
    intrinsic_movapd(var_210, xmm0);
    var_220 = intrinsic_movapd(var_220, xmm0);
    var_230 = intrinsic_movapd(var_230, xmm0);
    rax = [var_2B0->_screenPageMap retain];
    var_2C0 = rax;
    rbx = @selector(countByEnumeratingWithState:objects:count:);
    rdi = rax;
    rsi = rbx;
    r14 = _objc_msgSend(rdi, rsi);
    if (r14 != 0x0) {
            var_2B8 = *var_220;
            do {
                    r15 = *_OBJC_IVAR_$_UICollectionViewData._validLayoutRect + var_2B0;
                    r12 = 0x0;
                    do {
                            if (*var_220 != var_2B8) {
                                    rdi = var_2C0;
                                    objc_enumerationMutation(rdi);
                            }
                            r13 = *(var_228 + r12 * 0x8);
                            xmm0 = intrinsic_cvtsi2sd(xmm0, !r13 >> 0x20);
                            xmm1 = intrinsic_movsd(xmm1, *___pageDimension);
                            var_298 = intrinsic_movsd(var_298, xmm1);
                            xmm0 = intrinsic_mulsd(xmm0, xmm1);
                            xmm2 = intrinsic_cvtsi2sd(xmm2, !r13);
                            xmm2 = intrinsic_mulsd(xmm2, xmm1);
                            var_2A0 = intrinsic_movsd(var_2A0, xmm2);
                            xmm0 = intrinsic_divsd(xmm0, xmm1);
                            floor(xmm0);
                            xmm1 = intrinsic_movsd(xmm1, var_298);
                            xmm0 = intrinsic_mulsd(xmm0, xmm1);
                            var_2A8 = intrinsic_movsd(var_2A8, xmm0);
                            xmm0 = intrinsic_movsd(xmm0, var_2A0);
                            xmm0 = intrinsic_divsd(xmm0, xmm1);
                            floor(xmm0);
                            xmm1 = intrinsic_movsd(xmm1, var_298);
                            xmm0 = intrinsic_mulsd(xmm0, xmm1);
                            xmm2 = intrinsic_movsd(xmm2, var_2A8);
                            var_250 = intrinsic_movsd(var_250, xmm2);
                            var_248 = intrinsic_movsd(var_248, xmm0);
                            var_240 = intrinsic_movsd(var_240, xmm1);
                            var_238 = intrinsic_movsd(var_238, xmm1);
                            if (CGRectIntersectsRect(rdi, rsi) == 0x0) {
                                    r13 = [[NSNumber numberWithUnsignedLong:r13] retain];
                                    rsi = @selector(addObject:);
                                    _objc_msgSend(var_2D8, rsi);
                                    rdi = r13;
                                    [rdi release];
                            }
                            r12 = r12 + 0x1;
                    } while (r12 < r14);
                    rdi = var_2C0;
                    rbx = @selector(countByEnumeratingWithState:objects:count:);
                    rsi = rbx;
                    r14 = _objc_msgSend(rdi, rsi);
            } while (r14 != 0x0);
    }
    [var_2C0 release];
    xmm0 = intrinsic_xorpd(xmm0, xmm0);
    intrinsic_movapd(var_260, xmm0);
    intrinsic_movapd(var_270, xmm0);
    var_280 = intrinsic_movapd(var_280, xmm0);
    var_290 = intrinsic_movapd(var_290, xmm0);
    rax = [var_2D8 retain];
    var_2B8 = rax;
    rax = _objc_msgSend(rax, rbx);
    var_298 = rax;
    if (rax != 0x0) {
            var_2A8 = *var_280;
            do {
                    rbx = 0x0;
                    do {
                            if (*var_280 != var_2A8) {
                                    objc_enumerationMutation(var_2B8);
                            }
                            [var_2B0->_screenPageMap removeObjectForKey:[*(var_288 + rbx * 0x8) unsignedLongValue]];
                            rbx = rbx + 0x1;
                    } while (rbx < var_298);
                    rax = [var_2B8 countByEnumeratingWithState:var_290 objects:var_130 count:0x10];
                    var_298 = rax;
            } while (rax != 0x0);
    }
    [var_2B8 release];
    [var_2B8 release];
    [var_168 release];
    [var_140 release];
    r13 = var_2E8;
    goto loc_9ca5a3;

loc_9ca5a3:
    r15 = r13;
    if (((r13->_collectionViewDataFlags & 0x8) == 0x0) && ([r15->_globalIndexesOfItemsAwaitingValidation count] != 0x0)) {
            r15->_collectionViewDataFlags = r15->_collectionViewDataFlags & 0xfb;
            rbx = [r15->_globalIndexesOfItemsAwaitingValidation firstIndex];
            if (rbx != 0x7fffffffffffffff) {
                    r14 = *_OBJC_IVAR_$_UICollectionViewData._globalItems;
                    var_2B0 = r14;
                    do {
                            if (*(*(r15 + r14) + rbx * 0x8) == 0x0) {
                                    [r15 _prepareToLoadData];
                                    r13 = r15;
                                    rax = [r13 indexPathForItemAtGlobalIndex:rbx];
                                    rax = [rax retain];
                                    var_2A8 = rax;
                                    r15 = [[r13->_layout layoutAttributesForItemAtIndexPath:rax] retain];
                                    [r13 _setLayoutAttributes:r15 atGlobalItemIndex:rbx];
                                    rdi = r15;
                                    r15 = r13;
                                    [rdi release];
                                    r14 = var_2B0;
                                    [var_2A8 release];
                            }
                            rbx = [r15->_globalIndexesOfItemsAwaitingValidation indexGreaterThanIndex:rbx];
                    } while (rbx != 0x7fffffffffffffff);
            }
            [r15->_globalIndexesOfItemsAwaitingValidation removeAllIndexes];
    }
    if (*___stack_chk_guard != var_30) {
            __stack_chk_fail();
    }
    return;

loc_9c98c4:
    CGRectGetHeight(rdi);
    var_298 = intrinsic_movsd(var_298, xmm0);
    CGRectGetHeight(rdi);
    xmm1 = intrinsic_movsd(xmm1, var_298);
    xmm1 = intrinsic_ucomisd(xmm1, xmm0);
    if ((xmm1 != 0x0) || (CPU_FLAGS & P)) goto loc_9ca099;

loc_9c9936:
    CGRectGetMinY(rdi);
    var_298 = intrinsic_movsd(var_298, xmm0);
    CGRectGetMinY(rdi);
    xmm1 = intrinsic_movsd(xmm1, var_298);
    xmm1 = intrinsic_ucomisd(xmm1, xmm0);
    if ((xmm1 != 0x0) || (CPU_FLAGS & P)) goto loc_9ca099;
    goto loc_9c99a8;

loc_9ca099:
    *(r15 + 0x18) = var_190;
    *(r15 + 0x10) = var_198;
    rax = var_1A8;
    rcx = var_1A0;
    goto loc_9ca144;
}

int ___45-[UICollectionViewData validateLayoutInRect:]_block_invoke(int arg0) {
    var_100 = arg0;
    r12 = arg_0;
    if ((*(arg0 + 0x20)->_collectionViewDataFlags & 0x8) != 0x0) {
            rbx = ___UILogGetCategoryCachedImpl("Assert", __block_invoke.__s_category);
            if (os_log_type_enabled(*(rbx + 0x8), 0x10) != 0x0) {
                    r15 = rsp;
                    rax = rsp;
                    *(int8_t *)(rax + 0xfffffffffffffff0) = 0x0;
                    *(int8_t *)(rax + 0xfffffffffffffff1) = 0x0;
                    _os_log_impl(0xffffffffff6357e7, *(rbx + 0x8), 0x10, "trying to load collection view layout data when layout is locked", rax + 0xfffffffffffffff0, 0x2);
                    rsp = r15;
            }
    }
    r12 = _objc_msgSend;
    rax = [*(var_100 + 0x20)->_layout layoutAttributesForElementsInRect:rdx, rcx];
    rsp = (rsp - 0x20) + 0x20;
    rax = [rax retain];
    var_130 = rax;
    intrinsic_movaps(var_C0, 0x0);
    intrinsic_movaps(var_D0, 0x0);
    var_E0 = intrinsic_movaps(var_E0, 0x0);
    var_F0 = intrinsic_movaps(var_F0, 0x0);
    r8 = 0x10;
    rax = [rax countByEnumeratingWithState:var_F0 objects:var_B0 count:r8];
    var_108 = rax;
    if (rax == 0x0) goto loc_9cb1ae;

loc_9ca8e7:
    r14 = *var_E0;
    var_150 = r14;
    goto loc_9ca906;

loc_9ca906:
    r13 = @selector(_isCell);
    var_138 = r13;
    rbx = 0x0;
    goto loc_9caa82;

loc_9caa82:
    if (*var_E0 != r14) {
            objc_enumerationMutation(var_130);
    }
    var_F8 = rbx;
    r15 = *(var_E8 + rbx * 0x8);
    rdi = r15;
    if ([r15 _isClone] == 0x0) goto loc_9caaeb;

loc_9caac3:
    if (_objc_msgSend(rdi, r13) != 0x0) {
            rdi = *(var_100 + 0x20)->_clonedCellAttributes;
    }
    else {
            rax = [r15 _isSupplementaryView];
            rcx = *(var_100 + 0x20);
            if (rax != 0x0) {
                    rax = *_OBJC_IVAR_$_UICollectionViewData._clonedSupplementaryAttributes;
            }
            else {
                    rax = *_OBJC_IVAR_$_UICollectionViewData._clonedDecorationAttributes;
            }
            rdi = *(rcx + rax);
    }
    [rdi addObject:r15];
    goto loc_9cb15f;

loc_9cb15f:
    rbx = var_F8;
    goto loc_9cb166;

loc_9cb166:
    rbx = rbx + 0x1;
    if (rbx < var_108) goto loc_9caa82;

loc_9cb176:
    r8 = 0x10;
    rax = [var_130 countByEnumeratingWithState:var_F0 objects:var_B0 count:r8];
    var_108 = rax;
    if (rax != 0x0) goto loc_9ca906;

loc_9cb1ae:
    *(var_100 + 0x20)->_collectionViewDataFlags = *(var_100 + 0x20)->_collectionViewDataFlags & 0xfe;
    [var_130 release];
    rax = *___stack_chk_guard;
    if (rax != *___stack_chk_guard) {
            rax = __stack_chk_fail();
    }
    return rax;

loc_9caaeb:
    r14 = objc_unsafeClaimAutoreleasedReturnValue((r12)(rdi, @selector(indexPath)));
    if ((r12)(r15, r13) == 0x0) goto loc_9cab65;

loc_9cab0d:
    r13 = r14;
    var_118 = r15;
    if (*(int32_t *)__UIApplicationLinkedOnVersion != 0x0) {
            r14 = *(int32_t *)__UIApplicationLinkedOnVersion > 0x6ffff ? 0x1 : 0x0;
    }
    else {
            r14 = __UIApplicationLinkedOnOrAfter(0x70000);
    }
    rbx = var_F8;
    r15 = r13;
    rax = [r15 section];
    rcx = *(var_100 + 0x20)->_numSections;
    if (r14 != 0x0) {
            if (rax < rcx) {
                    r14 = (r12)(r15, @selector(item));
                    rax = (r12)(r15, @selector(section));
                    rcx = *(var_100 + 0x20)->_sectionItemCounts;
                    if (r14 >= *(rcx + rax * 0x8)) {
                            r14 = [(r12)(@class(NSString), @selector(stringWithUTF8String:), "/BuildRoot/Library/Caches/com.apple.xbs/Sources/UIKit_Sim/UIKit-3600.6.21/UICollectionViewData.m", rcx) retain];
                            rdi = @"<Unknown File>";
                            if (r14 != 0x0) {
                                    rdi = r14;
                            }
                            var_120 = r15;
                            r15 = [rdi retain];
                            [r14 release];
                            r14 = [(r12)(@class(NSAssertionHandler), @selector(currentHandler), "/BuildRoot/Library/Caches/com.apple.xbs/Sources/UIKit_Sim/UIKit-3600.6.21/UICollectionViewData.m") retain];
                            rcx = *(var_100 + 0x20);
                            r8 = r15;
                            (r12)(r14, @selector(handleFailureInMethod:object:file:lineNumber:description:), *(var_100 + 0x28), rcx, r8, 0x1b1, @"UICollectionView received layout attributes for a cell with an index path that does not exist: %@", var_120);
                            rsp = (rsp - 0x10) + 0x10;
                            rdi = r15;
                            r15 = var_120;
                            [rdi release];
                            [r14 release];
                    }
            }
            else {
                    r14 = [(r12)(@class(NSString), @selector(stringWithUTF8String:), "/BuildRoot/Library/Caches/com.apple.xbs/Sources/UIKit_Sim/UIKit-3600.6.21/UICollectionViewData.m", rcx) retain];
                    rdi = @"<Unknown File>";
                    if (r14 != 0x0) {
                            rdi = r14;
                    }
                    var_120 = r15;
                    r15 = [rdi retain];
                    [r14 release];
                    r14 = [(r12)(@class(NSAssertionHandler), @selector(currentHandler), "/BuildRoot/Library/Caches/com.apple.xbs/Sources/UIKit_Sim/UIKit-3600.6.21/UICollectionViewData.m") retain];
                    rcx = *(var_100 + 0x20);
                    r8 = r15;
                    (r12)(r14, @selector(handleFailureInMethod:object:file:lineNumber:description:), *(var_100 + 0x28), rcx, r8, 0x1b1, @"UICollectionView received layout attributes for a cell with an index path that does not exist: %@", var_120);
                    rsp = (rsp - 0x10) + 0x10;
                    rdi = r15;
                    r15 = var_120;
                    [rdi release];
                    [r14 release];
            }
    }
    else {
            if (rax < rcx) {
                    r14 = (r12)(r15, @selector(item));
                    rax = (r12)(r15, @selector(section));
                    rcx = *(var_100 + 0x20)->_sectionItemCounts;
                    if (r14 >= *(rcx + rax * 0x8)) {
                            r14 = ___UILogGetCategoryCachedImpl("Assert", __block_invoke.__s_category.145);
                            if (os_log_type_enabled(*(r14 + 0x8), 0x10) != 0x0) {
                                    r13 = r12;
                                    r12 = rsp;
                                    rax = rsp;
                                    r8 = rax + 0xfffffffffffffff0;
                                    *(int8_t *)(rax + 0xfffffffffffffff0) = 0x2;
                                    *(int8_t *)(rax + 0xfffffffffffffff1) = 0x1;
                                    *(int8_t *)(rax + 0xfffffffffffffff2) = 0x40;
                                    *(int8_t *)(rax + 0xfffffffffffffff3) = 0x8;
                                    *(rax + 0xfffffffffffffff4) = r15;
                                    rcx = "UICollectionView received layout attributes for a cell with an index path that does not exist: %@";
                                    _os_log_impl(0xffffffffff6350a5, *(r14 + 0x8), 0x10, rcx, r8, 0xc);
                                    rsp = r12;
                                    r12 = r13;
                            }
                    }
            }
            else {
                    r14 = ___UILogGetCategoryCachedImpl("Assert", __block_invoke.__s_category.145);
                    if (os_log_type_enabled(*(r14 + 0x8), 0x10) != 0x0) {
                            r13 = r12;
                            r12 = rsp;
                            rax = rsp;
                            r8 = rax + 0xfffffffffffffff0;
                            *(int8_t *)(rax + 0xfffffffffffffff0) = 0x2;
                            *(int8_t *)(rax + 0xfffffffffffffff1) = 0x1;
                            *(int8_t *)(rax + 0xfffffffffffffff2) = 0x40;
                            *(int8_t *)(rax + 0xfffffffffffffff3) = 0x8;
                            *(rax + 0xfffffffffffffff4) = r15;
                            rcx = "UICollectionView received layout attributes for a cell with an index path that does not exist: %@";
                            _os_log_impl(0xffffffffff6350a5, *(r14 + 0x8), 0x10, rcx, r8, 0xc);
                            rsp = r12;
                            r12 = r13;
                    }
            }
    }
    rax = (r12)(*(var_100 + 0x20), @selector(globalIndexForItemAtIndexPath:), r15, rcx, r8);
    (r12)(*(var_100 + 0x20), @selector(_setLayoutAttributes:atGlobalItemIndex:), var_118, rax, r8);
    r14 = var_150;
    r13 = var_138;
    goto loc_9cb166;

loc_9cab65:
    rbx = r12;
    rax = (rbx)(r15, @selector(_isDecorationView));
    rdx = *(var_100 + 0x20) + *_OBJC_IVAR_$_UICollectionViewData._decorationLayoutAttributes;
    rcx = *(var_100 + 0x20) + *_OBJC_IVAR_$_UICollectionViewData._supplementaryLayoutAttributes;
    if (rax != 0x0) {
            rcx = rdx;
    }
    r12 = [*rcx retain];
    var_128 = r12;
    rax = (rbx)(r15, @selector(_elementKind), rdx, rcx);
    rax = [rax retain];
    var_118 = rax;
    r13 = [(rbx)(r12, @selector(objectForKey:), rax, rcx) retain];
    rdx = r14;
    var_120 = r14;
    r12 = [(rbx)(r13, @selector(objectForKey:), rdx, rbx) retain];
    rdi = r13;
    [rdi release];
    [var_118 release];
    rbx = r12;
    if (rbx != 0x0) {
            rcx = *_OBJC_IVAR_$_UICollectionViewData._layout;
            rsi = @selector(_estimatesSizes);
            r12 = _objc_msgSend;
            if (_objc_msgSend(*(*(var_100 + 0x20) + rcx), rsi) == 0x0) {
                    rsi = @selector(isEqual:);
                    rdx = r15;
                    if (_objc_msgSend(rbx, rsi) == 0x0) {
                            rsi = @selector(stringWithUTF8String:);
                            var_170 = rbx;
                            rbx = [_objc_msgSend(@class(NSString), rsi, "/BuildRoot/Library/Caches/com.apple.xbs/Sources/UIKit_Sim/UIKit-3600.6.21/UICollectionViewData.m") retain];
                            rdi = @"<Unknown File>";
                            if (rbx != 0x0) {
                                    rdi = rbx;
                            }
                            r12 = _objc_msgSend;
                            r14 = [rdi retain];
                            [rbx release];
                            rbx = [[NSAssertionHandler currentHandler] retain];
                            rcx = *(var_100 + 0x20);
                            rdx = *(var_100 + 0x28);
                            rsi = @selector(handleFailureInMethod:object:file:lineNumber:description:);
                            r8 = r14;
                            _objc_msgSend(rbx, rsi, rdx, rcx, r8, 0x1bd, @"layout attributes for supplementary item at index path (%@) changed from %@ to %@ without invalidating the layout", var_120, var_170, r15);
                            rsp = (rsp - 0x20) + 0x20;
                            [r14 release];
                            rdi = rbx;
                            rbx = var_170;
                            [rdi release];
                    }
            }
    }
    else {
            var_170 = rbx;
            r14 = [[r15 _elementKind] retain];
            r12 = _objc_msgSend;
            if (r14 == 0x0) {
                    rsi = @selector(stringWithUTF8String:);
                    var_118 = r14;
                    rbx = [_objc_msgSend(@class(NSString), rsi, "/BuildRoot/Library/Caches/com.apple.xbs/Sources/UIKit_Sim/UIKit-3600.6.21/UICollectionViewData.m") retain];
                    rdi = @"<Unknown File>";
                    if (rbx != 0x0) {
                            rdi = rbx;
                    }
                    r12 = _objc_msgSend;
                    r14 = [rdi retain];
                    [rbx release];
                    rbx = [[NSAssertionHandler currentHandler] retain];
                    r8 = r14;
                    [rbx handleFailureInMethod:*(var_100 + 0x28) object:*(var_100 + 0x20) file:r8 lineNumber:0x1c2 description:@"%@ elementKind is nil.  This probably means you created the UICollectionViewLayoutAttributes using +alloc/-init instead of one of the class constructors", r15];
                    rsp = (rsp - 0x10) + 0x10;
                    [r14 release];
                    [rbx release];
                    r14 = var_118;
            }
            var_118 = r15;
            rdx = r14;
            rbx = [[var_128 objectForKey:rdx] retain];
            r15 = var_120;
            if (rbx == 0x0) {
                    r12 = _objc_msgSend;
                    var_210 = [[NSMutableDictionary dictionary] retain];
                    [rbx release];
                    rbx = var_210;
                    [var_128 setObject:rbx forKey:r14];
            }
            rsi = @selector(setObject:forKey:);
            rdx = var_118;
            rcx = r15;
            _objc_msgSend(rbx, rsi);
            [rbx release];
            [r14 release];
            rbx = var_170;
    }
    [rbx release];
    [var_128 release];
    r14 = var_150;
    r13 = var_138;
    goto loc_9cb15f;
}

int ___45-[UICollectionViewData validateLayoutInRect:]_block_invoke.164(int arg0, int arg1) {
    r14 = arg1;
    rbx = arg0;
    r12 = arg_0;
    rdi = *(r14 + 0x20);
    [rdi _validateContentSize];
    xmm0 = intrinsic_movaps(xmm0, arg_0);
    xmm1 = intrinsic_movaps(xmm1, arg_10);
    var_30 = intrinsic_movaps(var_30, xmm1);
    var_40 = intrinsic_movaps(var_40, xmm0);
    xmm1 = intrinsic_movsd(xmm1, *___pageDimension);
    var_48 = intrinsic_movsd(var_48, xmm1);
    xmm0 = intrinsic_movsd(xmm0, var_40);
    xmm0 = intrinsic_divsd(xmm0, xmm1);
    floor(xmm0);
    xmm0 = intrinsic_mulsd(xmm0, var_48);
    var_40 = intrinsic_movsd(var_40, xmm0);
    CGRectGetMinX(rdi);
    var_48 = intrinsic_movsd(var_48, xmm0);
    CGRectGetMinX(rdi);
    xmm1 = intrinsic_movsd(xmm1, var_48);
    xmm1 = intrinsic_subsd(xmm1, xmm0);
    xmm1 = intrinsic_addsd(xmm1, var_30);
    xmm0 = intrinsic_movsd(xmm0, *___pageDimension);
    var_48 = intrinsic_movsd(var_48, xmm0);
    xmm1 = intrinsic_divsd(xmm1, xmm0);
    xmm0 = intrinsic_movapd(xmm0, xmm1);
    ceil(xmm0);
    xmm0 = intrinsic_mulsd(xmm0, var_48);
    var_30 = intrinsic_movsd(var_30, xmm0);
    CGRectGetMaxX(rdi);
    xmm0 = intrinsic_ucomisd(xmm0, *(r14 + 0x20)->_contentSize);
    if (xmm0 > 0x0) {
            CGRectGetMaxX(rdi);
            xmm0 = intrinsic_subsd(xmm0, *(r14 + 0x20)->_contentSize);
            xmm1 = intrinsic_movsd(xmm1, var_30);
            xmm1 = intrinsic_subsd(xmm1, xmm0);
            var_30 = intrinsic_movsd(var_30, xmm1);
    }
    xmm1 = intrinsic_movsd(xmm1, *___pageDimension);
    var_48 = intrinsic_movsd(var_48, xmm1);
    xmm0 = intrinsic_movsd(xmm0, var_38);
    xmm0 = intrinsic_divsd(xmm0, xmm1);
    floor(xmm0);
    xmm0 = intrinsic_mulsd(xmm0, var_48);
    var_38 = intrinsic_movsd(var_38, xmm0);
    CGRectGetMinY(rdi);
    var_48 = intrinsic_movsd(var_48, xmm0);
    CGRectGetMinY(rdi);
    xmm1 = intrinsic_movsd(xmm1, var_48);
    xmm1 = intrinsic_subsd(xmm1, xmm0);
    xmm1 = intrinsic_addsd(xmm1, var_28);
    xmm0 = intrinsic_movsd(xmm0, *___pageDimension);
    var_48 = intrinsic_movsd(var_48, xmm0);
    xmm1 = intrinsic_divsd(xmm1, xmm0);
    xmm0 = intrinsic_movapd(xmm0, xmm1);
    ceil(xmm0);
    xmm0 = intrinsic_mulsd(xmm0, var_48);
    var_28 = intrinsic_movsd(var_28, xmm0);
    CGRectGetMaxY(rdi);
    xmm0 = intrinsic_ucomisd(xmm0, *(*(r14 + 0x20) + *_OBJC_IVAR_$_UICollectionViewData._contentSize + 0x8));
    if (xmm0 > 0x0) {
            if (*(int32_t *)__UIApplicationLinkedOnVersion != 0x0) {
                    if (*(int32_t *)__UIApplicationLinkedOnVersion <= 0x7ffff) {
                            CGRectGetMaxY(rdi);
                            var_28 = intrinsic_movsd(var_28, intrinsic_subsd(intrinsic_movsd(xmm1, var_28), intrinsic_subsd(xmm0, *(*(r14 + 0x20) + *_OBJC_IVAR_$_UICollectionViewData._contentSize + 0x8))));
                    }
            }
            else {
                    rdi = 0x80000;
                    if (__UIApplicationLinkedOnOrAfter(rdi) == 0x0) {
                            CGRectGetMaxY(rdi);
                            var_28 = intrinsic_movsd(var_28, intrinsic_subsd(intrinsic_movsd(xmm1, var_28), intrinsic_subsd(xmm0, *(*(r14 + 0x20) + *_OBJC_IVAR_$_UICollectionViewData._contentSize + 0x8))));
                    }
            }
    }
    *(rbx + 0x18) = var_28;
    *(rbx + 0x10) = var_30;
    *(rbx + 0x8) = var_38;
    *rbx = var_40;
    rax = rbx;
    return rax;
}

NSInteger -[UICollectionViewData numberOfSections](void * self, void * _cmd) {
    [self _validateItemCounts];
    rax = self->_numSections;
    return rax;
}

NSInteger -[UICollectionViewData numberOfItems](void * self, void * _cmd) {
    [self _validateItemCounts];
    rax = self->_numItems;
    return rax;
}

NSInteger -[UICollectionViewData numberOfItemsInSection:](void * self, void * _cmd, NSInteger arg2) {
    r14 = arg2;
    rbx = _cmd;
    r13 = self;
    [self _validateItemCounts];
    if (r13->_numSections <= r14) {
            var_30 = rbx;
            rbx = [[NSString stringWithUTF8String:"/BuildRoot/Library/Caches/com.apple.xbs/Sources/UIKit_Sim/UIKit-3600.6.21/UICollectionViewData.m"] retain];
            rdi = @"<Unknown File>";
            if (rbx != 0x0) {
                    rdi = rbx;
            }
            r12 = [rdi retain];
            [rbx release];
            rbx = [[NSAssertionHandler currentHandler] retain];
            [rbx handleFailureInMethod:var_30 object:r13 file:r12 lineNumber:0x25c description:@"request for number of items in section %ld when there are only %ld sections in the collection view"];
            [r12 release];
            [rbx release];
    }
    rax = *(r13->_sectionItemCounts + r14 * 0x8);
    return rax;
}

NSInteger -[UICollectionViewData numberOfItemsBeforeSection:](void * self, void * _cmd, NSInteger arg2) {
    rbx = arg2;
    r12 = _cmd;
    r14 = self;
    [self _validateItemCounts];
    if (r14->_numSections < rbx) {
            r13 = [[NSString stringWithUTF8String:"/BuildRoot/Library/Caches/com.apple.xbs/Sources/UIKit_Sim/UIKit-3600.6.21/UICollectionViewData.m"] retain];
            rdi = @"<Unknown File>";
            if (r13 != 0x0) {
                    rdi = r13;
            }
            var_30 = r12;
            r12 = [rdi retain];
            [r13 release];
            r13 = [[NSAssertionHandler currentHandler] retain];
            [r13 handleFailureInMethod:var_30 object:r14 file:r12 lineNumber:0x263 description:@"request for number of items before section %ld when there are only %ld sections in the collection view"];
            [r12 release];
            [r13 release];
    }
    rdx = r14->_lastSectionTestedForNumberOfItemsBeforeSection;
    rax = 0x0;
    rdi = 0x0;
    if (rdx <= rbx) {
            rax = r14->_lastResultForNumberOfItemsBeforeSection;
            rdi = rdx;
    }
    rdx = sign_extend_64(rdi);
    if (rdx < rbx) {
            rsi = r14->_sectionItemCounts;
            rdi = sign_extend_64(rdi + 0x1) - 0x1;
            do {
                    rax = rax + *(rsi + rdx * 0x8);
                    rdi = rdi + 0x1;
                    rdx = sign_extend_64(rdi);
            } while (rdi < rbx);
    }
    r14->_lastSectionTestedForNumberOfItemsBeforeSection = rbx;
    r14->_lastResultForNumberOfItemsBeforeSection = rax;
    return rax;
}

NSInteger -[UICollectionViewData globalIndexForItemAtIndexPath:](void * self, void * _cmd, void * arg2) {
    r14 = [self numberOfItemsBeforeSection:[arg2 section]];
    rax = [arg2 item];
    rax = rax + r14;
    return rax;
}

void * -[UICollectionViewData indexPathForItemAtGlobalIndex:](void * self, void * _cmd, NSInteger arg2) {
    r14 = arg2;
    rbx = _cmd;
    r12 = self;
    [self _validateItemCounts];
    if (r12->_numSections <= 0x0) goto loc_9cb891;

loc_9cb854:
    var_30 = rbx;
    rbx = 0x0;
    goto loc_9cb861;

loc_9cb861:
    rax = [r12 numberOfItemsInSection:rbx];
    r15 = r14 - rax;
    if (r15 < 0x0) goto loc_9cb95a;

loc_9cb87c:
    rbx = rbx + 0x1;
    r14 = r15;
    if (rbx < r12->_numSections) goto loc_9cb861;

loc_9cb898:
    rbx = [[NSString stringWithUTF8String:"/BuildRoot/Library/Caches/com.apple.xbs/Sources/UIKit_Sim/UIKit-3600.6.21/UICollectionViewData.m"] retain];
    rdi = @"<Unknown File>";
    if (rbx != 0x0) {
            rdi = rbx;
    }
    r14 = [rdi retain];
    [rbx release];
    r13 = [[NSAssertionHandler currentHandler] retain];
    rbx = 0x0;
    [r13 handleFailureInMethod:var_30 object:r12 file:r14 lineNumber:0x28c description:@"request for index path for global index %ld when there are only %ld items in the collection view", r15, [r12 numberOfItems]];
    rdi = r14;
    [rdi release];
    [r13 release];
    goto loc_9cb97f;

loc_9cb97f:
    rdi = rbx;
    rax = [rdi autorelease];
    return rax;

loc_9cb95a:
    rbx = [[NSIndexPath indexPathForRow:r14 inSection:rbx] retain];
    goto loc_9cb97f;

loc_9cb891:
    var_30 = rbx;
    r15 = r14;
    goto loc_9cb898;
}

bool -[UICollectionViewData isGlobalIndexValid:](void * self, void * _cmd, NSInteger arg2) {
    rdx = arg2;
    rdi = self;
    if (rdx >= 0x0) {
            rax = rdi->_numItems <= rdx ? 0x1 : 0x0;
    }
    else {
            rax = 0x0;
    }
    return rax;
}

struct CGRect -[UICollectionViewData rectForItemAtIndexPath:](void * self, void * _cmd, void * arg2) {
    r14 = self;
    rbx = [[_cmd layoutAttributesForItemAtIndexPath:rcx] retain];
    if (rbx != 0x0) {
            [r14 frame];
    }
    else {
            *(r14 + 0x18) = 0x0;
            *(r14 + 0x10) = 0x0;
            *(r14 + 0x8) = 0x0;
            *r14 = 0x0;
    }
    [rbx release];
    rax = r14;
    return rax;
}

struct CGRect -[UICollectionViewData collectionViewContentRect](void * self, void * _cmd) {
    [_cmd _prepareToLoadData];
    *(self + 0x8) = *_CGRectApplyAffineTransform;
    *self = *_CGPointZero;
    *(self + 0x18) = *(_cmd + *_OBJC_IVAR_$_UICollectionViewData._contentSize + 0x8);
    *(self + 0x10) = _cmd->_contentSize;
    rax = self;
    return rax;
}

struct CGRect -[UICollectionViewData rectForGlobalItemIndex:](void * self, void * _cmd, NSInteger arg2) {
    rbx = [[_cmd indexPathForItemAtGlobalIndex:rcx] retain];
    [self rectForItemAtIndexPath:_cmd, rbx];
    [rbx release];
    rax = self;
    return rax;
}

struct CGRect -[UICollectionViewData rectForSupplementaryElementOfKind:atIndexPath:](void * self, void * _cmd, void * arg2, void * arg3) {
    r14 = r8;
    rbx = arg2;
    r12 = _cmd;
    r15 = self;
    r13 = [arg3 retain];
    if ([r14 length] != 0x1) {
            var_30 = rbx;
            if ([r14 section] >= r12->_numSections) {
                    var_38 = r13;
                    r13 = [[NSString stringWithUTF8String:"/BuildRoot/Library/Caches/com.apple.xbs/Sources/UIKit_Sim/UIKit-3600.6.21/UICollectionViewData.m"] retain];
                    rdi = @"<Unknown File>";
                    if (r13 != 0x0) {
                            rdi = r13;
                    }
                    var_40 = [rdi retain];
                    [r13 release];
                    r13 = [[NSAssertionHandler currentHandler] retain];
                    [r13 handleFailureInMethod:var_30 object:r12 file:var_40 lineNumber:0x2a8 description:@"request for CGRect for supplementary view of kind %@ in section %ld when there are only %ld sections in the collection view", var_38, [r14 section], r12->_numSections];
                    [var_40 release];
                    rdi = r13;
                    r13 = var_38;
                    [rdi release];
            }
    }
    rbx = [[r12 layoutAttributesForSupplementaryElementOfKind:r13 atIndexPath:r14] retain];
    if (rbx != 0x0) {
            [r15 frame];
    }
    else {
            *(r15 + 0x18) = 0x0;
            *(r15 + 0x10) = 0x0;
            *(r15 + 0x8) = 0x0;
            *r15 = 0x0;
    }
    [rbx release];
    [r13 release];
    rax = r15;
    return rax;
}

struct CGRect -[UICollectionViewData rectForDecorationElementOfKind:atIndexPath:](void * self, void * _cmd, void * arg2, void * arg3) {
    r14 = r8;
    rbx = arg2;
    r12 = _cmd;
    r15 = self;
    r13 = [arg3 retain];
    if ([r14 length] != 0x1) {
            var_30 = rbx;
            if ([r14 section] >= r12->_numSections) {
                    var_38 = r13;
                    r13 = [[NSString stringWithUTF8String:"/BuildRoot/Library/Caches/com.apple.xbs/Sources/UIKit_Sim/UIKit-3600.6.21/UICollectionViewData.m"] retain];
                    rdi = @"<Unknown File>";
                    if (r13 != 0x0) {
                            rdi = r13;
                    }
                    var_40 = [rdi retain];
                    [r13 release];
                    r13 = [[NSAssertionHandler currentHandler] retain];
                    [r13 handleFailureInMethod:var_30 object:r12 file:var_40 lineNumber:0x2af description:@"request for CGRect for decoration view of kind %@ in section %ld when there are only %ld sections in the collection view", var_38, [r14 section], r12->_numSections];
                    [var_40 release];
                    rdi = r13;
                    r13 = var_38;
                    [rdi release];
            }
    }
    rbx = [[r12 layoutAttributesForDecorationViewOfKind:r13 atIndexPath:r14] retain];
    if (rbx != 0x0) {
            [r15 frame];
    }
    else {
            *(r15 + 0x18) = 0x0;
            *(r15 + 0x10) = 0x0;
            *(r15 + 0x8) = 0x0;
            *r15 = 0x0;
    }
    [rbx release];
    [r13 release];
    rax = r15;
    return rax;
}

void * -[UICollectionViewData layoutAttributesForItemAtIndexPath:](void * self, void * _cmd, void * arg2) {
    rbx = arg2;
    r12 = _cmd;
    r14 = self;
    [self _prepareToLoadData];
    if ((r14->_collectionViewDataFlags & 0x8) == 0x0) {
            r13 = *_OBJC_IVAR_$_UICollectionViewData._collectionView + r14;
            r15 = objc_loadWeakRetained(r13);
            rax = [r15 _itemIndexPathIsReordered:rbx];
            var_30 = rbx;
            rbx = r14;
            r14 = r12;
            r12 = rax;
            [r15 release];
            COND = r12 == 0x0;
            r12 = r14;
            r14 = rbx;
            rbx = var_30;
            if (!COND) {
                    var_38 = r12;
                    r12 = objc_loadWeakRetained(r13);
                    [r12 _reorderingTargetPosition];
                    r15 = [[r14->_layout _layoutAttributesForReorderedItemAtIndexPath:rbx withTargetPosition:rcx] retain];
                    rdi = r12;
                    r12 = var_38;
                    [rdi release];
                    if (r15 != 0x0) {
                            rdi = r15;
                    }
                    else {
                            var_30 = rbx;
                            var_38 = r12;
                            r13 = [r14 globalIndexForItemAtIndexPath:rbx];
                            r12 = [*(r14->_globalItems + sign_extend_64(r13) * 0x8) retain];
                            if (r12 == 0x0) {
                                    rdi = r14->_layout;
                                    if ((r14->_collectionViewDataFlags & 0x8) == 0x0) {
                                            rbx = [[rdi layoutAttributesForItemAtIndexPath:var_30] retain];
                                            var_40 = 0x1;
                                            var_3C = 0x0;
                                    }
                                    else {
                                            rbx = [[rdi initialLayoutAttributesForAppearingItemAtIndexPath:var_30] retain];
                                            var_3C = 0x1;
                                            var_40 = 0x0;
                                    }
                                    r15 = [rbx retain];
                                    [r12 release];
                                    if (var_40 != 0x0) {
                                            [rbx release];
                                    }
                                    if (var_3C != 0x0) {
                                            [rbx release];
                                    }
                                    [r14 _setLayoutAttributes:r15 atGlobalItemIndex:r13];
                                    r12 = r15;
                            }
                            if ((r12 == 0x0) && ((r14->_collectionViewDataFlags & 0x8) == 0x0)) {
                                    rbx = [[NSString stringWithUTF8String:"/BuildRoot/Library/Caches/com.apple.xbs/Sources/UIKit_Sim/UIKit-3600.6.21/UICollectionViewData.m"] retain];
                                    rdi = @"<Unknown File>";
                                    if (rbx != 0x0) {
                                            rdi = rbx;
                                    }
                                    r15 = [rdi retain];
                                    [rbx release];
                                    rbx = [[NSAssertionHandler currentHandler] retain];
                                    [rbx handleFailureInMethod:var_38 object:r14 file:r15 lineNumber:0x2c5 description:@"no UICollectionViewLayoutAttributes instance for -layoutAttributesForItemAtIndexPath: %@"];
                                    [r15 release];
                                    [rbx release];
                            }
                            rdi = r12;
                    }
            }
            else {
                    var_30 = rbx;
                    var_38 = r12;
                    r13 = [r14 globalIndexForItemAtIndexPath:rbx];
                    r12 = [*(r14->_globalItems + sign_extend_64(r13) * 0x8) retain];
                    if (r12 == 0x0) {
                            rdi = r14->_layout;
                            if ((r14->_collectionViewDataFlags & 0x8) == 0x0) {
                                    rbx = [[rdi layoutAttributesForItemAtIndexPath:var_30] retain];
                                    var_40 = 0x1;
                                    var_3C = 0x0;
                            }
                            else {
                                    rbx = [[rdi initialLayoutAttributesForAppearingItemAtIndexPath:var_30] retain];
                                    var_3C = 0x1;
                                    var_40 = 0x0;
                            }
                            r15 = [rbx retain];
                            [r12 release];
                            if (var_40 != 0x0) {
                                    [rbx release];
                            }
                            if (var_3C != 0x0) {
                                    [rbx release];
                            }
                            [r14 _setLayoutAttributes:r15 atGlobalItemIndex:r13];
                            r12 = r15;
                    }
                    if ((r12 == 0x0) && ((r14->_collectionViewDataFlags & 0x8) == 0x0)) {
                            rbx = [[NSString stringWithUTF8String:"/BuildRoot/Library/Caches/com.apple.xbs/Sources/UIKit_Sim/UIKit-3600.6.21/UICollectionViewData.m"] retain];
                            rdi = @"<Unknown File>";
                            if (rbx != 0x0) {
                                    rdi = rbx;
                            }
                            r15 = [rdi retain];
                            [rbx release];
                            rbx = [[NSAssertionHandler currentHandler] retain];
                            [rbx handleFailureInMethod:var_38 object:r14 file:r15 lineNumber:0x2c5 description:@"no UICollectionViewLayoutAttributes instance for -layoutAttributesForItemAtIndexPath: %@"];
                            [r15 release];
                            [rbx release];
                    }
                    rdi = r12;
            }
    }
    else {
            var_30 = rbx;
            var_38 = r12;
            r13 = [r14 globalIndexForItemAtIndexPath:rbx];
            r12 = [*(r14->_globalItems + sign_extend_64(r13) * 0x8) retain];
            if (r12 == 0x0) {
                    rdi = r14->_layout;
                    if ((r14->_collectionViewDataFlags & 0x8) == 0x0) {
                            rbx = [[rdi layoutAttributesForItemAtIndexPath:var_30] retain];
                            var_40 = 0x1;
                            var_3C = 0x0;
                    }
                    else {
                            rbx = [[rdi initialLayoutAttributesForAppearingItemAtIndexPath:var_30] retain];
                            var_3C = 0x1;
                            var_40 = 0x0;
                    }
                    r15 = [rbx retain];
                    [r12 release];
                    if (var_40 != 0x0) {
                            [rbx release];
                    }
                    if (var_3C != 0x0) {
                            [rbx release];
                    }
                    [r14 _setLayoutAttributes:r15 atGlobalItemIndex:r13];
                    r12 = r15;
            }
            if ((r12 == 0x0) && ((r14->_collectionViewDataFlags & 0x8) == 0x0)) {
                    rbx = [[NSString stringWithUTF8String:"/BuildRoot/Library/Caches/com.apple.xbs/Sources/UIKit_Sim/UIKit-3600.6.21/UICollectionViewData.m"] retain];
                    rdi = @"<Unknown File>";
                    if (rbx != 0x0) {
                            rdi = rbx;
                    }
                    r15 = [rdi retain];
                    [rbx release];
                    rbx = [[NSAssertionHandler currentHandler] retain];
                    [rbx handleFailureInMethod:var_38 object:r14 file:r15 lineNumber:0x2c5 description:@"no UICollectionViewLayoutAttributes instance for -layoutAttributesForItemAtIndexPath: %@"];
                    [r15 release];
                    [rbx release];
            }
            rdi = r12;
    }
    rbx = [rdi retain];
    [rbx release];
    rdi = rbx;
    rax = [rdi autorelease];
    return rax;
}

void * -[UICollectionViewData layoutAttributesForGlobalItemIndex:](void * self, void * _cmd, NSInteger arg2) {
    rbx = [[self indexPathForItemAtGlobalIndex:arg2] retain];
    r14 = [[self layoutAttributesForItemAtIndexPath:rbx] retain];
    [rbx release];
    rdi = r14;
    rax = [rdi autorelease];
    return rax;
}
void * -[UICollectionViewData layoutAttributesForElementsInSection:](void * self, void * _cmd, NSInteger arg2) {
    var_-824 = arg2;
    var_-880 = self;
    var_-848 = [[NSMutableArray array] retain];
    rax = [self numberOfItemsInSection:arg2];
    var_-832 = rax;
    if (rax > 0x0) {
            r15 = 0x0;
            do {
                    r14 = [[NSIndexPath indexPathForItem:r15 inSection:var_-824] retain];
                    r12 = [[var_-880 layoutAttributesForItemAtIndexPath:r14] retain];
                    [r14 release];
                    if (r12 != 0x0) {
                            [var_-848 addObject:r12];
                    }
                    [r12 release];
                    r15 = r15 + 0x1;
            } while (var_-832 != r15);
    }
    intrinsic_movaps(var_-576, 0x0);
    intrinsic_movaps(var_-592, 0x0);
    var_-608 = intrinsic_movaps(var_-608, 0x0);
    var_-624 = intrinsic_movaps(var_-624, 0x0);
    rax = [var_-880->_supplementaryLayoutAttributes retain];
    var_-936 = rax;
    rax = [rax countByEnumeratingWithState:var_-624 objects:var_-176 count:0x10];
    var_-904 = rax;
    if (rax != 0x0) {
            var_-928 = *var_-608;
            do {
                    rbx = 0x0;
                    do {
                            if (*var_-608 != var_-928) {
                                    objc_enumerationMutation(var_-936);
                            }
                            rdx = *(var_-616 + rbx * 0x8);
                            var_-888 = rbx;
                            rax = [var_-880->_supplementaryLayoutAttributes objectForKey:rdx];
                            rax = objc_unsafeClaimAutoreleasedReturnValue(rax);
                            var_-640 = intrinsic_movaps(var_-640, 0x0);
                            var_-656 = intrinsic_movaps(var_-656, 0x0);
                            var_-672 = intrinsic_movaps(var_-672, 0x0);
                            var_-688 = intrinsic_movaps(var_-688, 0x0);
                            rax = [rax retain];
                            var_-832 = rax;
                            r13 = [rax countByEnumeratingWithState:var_-688 objects:var_-304 count:0x10];
                            if (r13 != 0x0) {
                                    r14 = *var_-672;
                                    do {
                                            r12 = 0x0;
                                            do {
                                                    if (*var_-672 != r14) {
                                                            objc_enumerationMutation(var_-832);
                                                    }
                                                    rbx = *(var_-680 + r12 * 0x8);
                                                    if (([rbx length] >= 0x2) && ([rbx section] == var_-824)) {
                                                            rax = [var_-832 objectForKey:rbx];
                                                            rax = objc_unsafeClaimAutoreleasedReturnValue(rax);
                                                            if (rax != 0x0) {
                                                                    [var_-848 addObject:rax];
                                                            }
                                                    }
                                                    r12 = r12 + 0x1;
                                            } while (r12 < r13);
                                            r13 = [var_-832 countByEnumeratingWithState:var_-688 objects:var_-304 count:0x10];
                                    } while (r13 != 0x0);
                            }
                            [var_-832 release];
                            rbx = var_-888 + 0x1;
                    } while (rbx < var_-904);
                    rax = [var_-936 countByEnumeratingWithState:var_-624 objects:var_-176 count:0x10];
                    var_-904 = rax;
            } while (rax != 0x0);
    }
    [var_-936 release];
    intrinsic_movaps(var_-704, 0x0);
    intrinsic_movaps(var_-720, 0x0);
    var_-736 = intrinsic_movaps(var_-736, 0x0);
    var_-752 = intrinsic_movaps(var_-752, 0x0);
    rax = [var_-880->_decorationLayoutAttributes retain];
    var_-936 = rax;
    rax = [rax countByEnumeratingWithState:var_-752 objects:var_-432 count:0x10];
    var_-896 = rax;
    if (rax != 0x0) {
            var_-928 = *var_-736;
            var_-944 = @selector(countByEnumeratingWithState:objects:count:);
            do {
                    var_-904 = @selector(countByEnumeratingWithState:objects:count:);
                    rbx = 0x0;
                    do {
                            if (*var_-736 != var_-928) {
                                    objc_enumerationMutation(var_-936);
                            }
                            rdx = *(var_-744 + rbx * 0x8);
                            var_-888 = rbx;
                            rax = [var_-880->_decorationLayoutAttributes objectForKey:rdx];
                            rax = objc_unsafeClaimAutoreleasedReturnValue(rax);
                            var_-768 = intrinsic_movaps(var_-768, 0x0);
                            var_-784 = intrinsic_movaps(var_-784, 0x0);
                            var_-800 = intrinsic_movaps(var_-800, 0x0);
                            var_-816 = intrinsic_movaps(var_-816, 0x0);
                            rax = [rax retain];
                            var_-832 = rax;
                            r15 = _objc_msgSend(rax, var_-904);
                            if (r15 != 0x0) {
                                    rbx = *var_-800;
                                    do {
                                            r13 = 0x0;
                                            do {
                                                    if (*var_-800 != rbx) {
                                                            objc_enumerationMutation(var_-832);
                                                    }
                                                    r14 = *(var_-808 + r13 * 0x8);
                                                    if (([r14 length] >= 0x2) && ([r14 section] == var_-824)) {
                                                            rax = [var_-832 objectForKey:r14];
                                                            rax = objc_unsafeClaimAutoreleasedReturnValue(rax);
                                                            if (rax != 0x0) {
                                                                    [var_-848 addObject:rax];
                                                            }
                                                    }
                                                    r13 = r13 + 0x1;
                                            } while (r13 < r15);
                                            r15 = [var_-832 countByEnumeratingWithState:var_-816 objects:var_-560 count:0x10];
                                    } while (r15 != 0x0);
                            }
                            [var_-832 release];
                            rbx = var_-888 + 0x1;
                    } while (rbx < var_-896);
                    rax = _objc_msgSend(var_-936, var_-944);
                    var_-896 = rax;
            } while (rax != 0x0);
    }
    [var_-936 release];
    r15 = objc_retainAutoreleaseReturnValue(var_-848);
    [var_-848 release];
    if (*___stack_chk_guard == *___stack_chk_guard) {
            rax = r15;
    }
    else {
            rax = __stack_chk_fail();
    }
    return rax;
}

void * -[UICollectionViewData layoutAttributesForElementsInRect:](void * self, void * _cmd, struct CGRect arg2) {
    rdx = arg2;
    r14 = self;
    stack[2048] = arg_0;
    if (CGRectIsNull(self) != 0x0) {
            rbx = [[NSArray array] retain];
    }
    else {
            rbx = arg_0;
            rdi = r14->_layout;
            if ([rdi _estimatesSizes] != 0x0) {
                    CGRectGetWidth(rdi);
                    xmm0 = intrinsic_mulsd(xmm0, *0xc51b10);
                    var_-272 = intrinsic_movsd(var_-272, xmm0);
                    CGRectGetHeight(rdi);
                    xmm1 = intrinsic_movsd(xmm1, *0xc51b10);
                    xmm1 = intrinsic_mulsd(xmm1, xmm0);
                    xmm0 = intrinsic_movsd(xmm0, var_-272);
                    CGRectInset(var_-72, @selector(_estimatesSizes), rdx);
                    *(rbx + 0x18) = var_-48;
                    *(rbx + 0x10) = var_-56;
                    *(rbx + 0x8) = var_-64;
                    *rbx = var_-72;
            }
            [r14 validateLayoutInRect:rdx, rcx];
            var_-328 = r14;
            rdx = [UICollectionViewTransitionLayout class];
            var_-329 = [r14->_layout isKindOfClass:rdx];
            xmm0 = intrinsic_movsd(xmm0, *rbx);
            var_-272 = intrinsic_movsd(var_-272, xmm0);
            xmm0 = intrinsic_movsd(xmm0, *(rbx + 0x8));
            var_-296 = intrinsic_movsd(var_-296, xmm0);
            r14 = rbx;
            rbx = [[NSMutableIndexSet alloc] init];
            do {
                    r12 = rbx;
                    xmm1 = intrinsic_movsd(xmm1, var_-272);
                    do {
                            r13 = 0x8000000000000000;
                            var_-312 = @selector(objectForKey:);
                            var_-320 = @selector(addIndexes:);
                            var_-272 = intrinsic_movsd(var_-272, xmm1);
                            rdi = var_-328->_screenPageMap;
                            xmm0 = intrinsic_movsd(xmm0, *___pageDimension);
                            xmm1 = intrinsic_divsd(xmm1, xmm0);
                            xmm2 = intrinsic_movapd(xmm2, xmm1);
                            xmm3 = intrinsic_movsd(xmm3, *0xc4f758);
                            xmm2 = intrinsic_subsd(xmm2, xmm3);
                            rax = intrinsic_cvttsd2si(*_OBJC_IVAR_$_UICollectionViewData._screenPageMap, xmm2);
                            rax = rax ^ r13;
                            rcx = intrinsic_cvttsd2si(var_-328, xmm1);
                            xmm1 = intrinsic_ucomisd(xmm1, xmm3);
                            asm { cmovae     rcx, rax };
                            xmm1 = intrinsic_movsd(xmm1, var_-296);
                            xmm1 = intrinsic_divsd(xmm1, xmm0);
                            xmm0 = intrinsic_movapd(xmm0, xmm1);
                            xmm0 = intrinsic_subsd(xmm0, xmm3);
                            rax = intrinsic_cvttsd2si(rax, xmm0);
                            rdx = intrinsic_cvttsd2si(rdx, xmm1);
                            xmm1 = intrinsic_ucomisd(xmm1, xmm3);
                            asm { cmovae     rdx, rax };
                            rbx = [_objc_msgSend(rdi, var_-312, !(rdx | rcx << 0x20), rcx << 0x20) retain];
                            rdx = rbx;
                            _objc_msgSend(r12, var_-320, rdx, rcx << 0x20);
                            CGRectGetMaxX(r12);
                            var_-280 = intrinsic_movsd(var_-280, xmm0);
                            xmm0 = intrinsic_movsd(xmm0, *___pageDimension);
                            xmm0 = intrinsic_addsd(xmm0, var_-272);
                            var_-288 = intrinsic_movsd(var_-288, xmm0);
                            rdi = rbx;
                            [rdi release];
                            xmm0 = intrinsic_movsd(xmm0, var_-272);
                            xmm0 = intrinsic_ucomisd(xmm0, var_-280);
                            xmm1 = intrinsic_movsd(xmm1, var_-288);
                    } while (xmm0 <= 0x0);
                    rbx = r12;
                    xmm0 = intrinsic_movsd(xmm0, *r14);
                    var_-272 = intrinsic_movsd(var_-272, xmm0);
                    stack[2048] = *r14;
                    CGRectGetMaxY(rdi);
                    xmm1 = intrinsic_movsd(xmm1, var_-296);
                    xmm1 = intrinsic_ucomisd(xmm1, xmm0);
                    COND = xmm1 <= 0x0;
                    xmm0 = intrinsic_movapd(xmm0, xmm1);
                    if (!COND) {
                        break;
                    }
                    xmm0 = intrinsic_addsd(xmm0, *___pageDimension);
                    var_-296 = intrinsic_movsd(var_-296, xmm0);
            } while (true);
            r13 = rbx;
            var_-304 = [[NSMutableArray arrayWithCapacity:[r13 count]] retain];
            rbx = [r13 firstIndex];
            if (rbx == 0x7fffffffffffffff) {
                    var_-272 = r13;
                    r13 = var_-328;
            }
            else {
                    var_-272 = r13;
                    r13 = var_-328;
                    do {
                            r12 = *(r13->_globalItems + rbx * 0x8);
                            if (r12 != 0x0) {
                                    [var_-104 frame];
                                    stack[2048] = *r14;
                                    if (((CGRectIntersectsRect(var_-104, r12) | var_-329) & 0xff) == 0x1) {
                                            [var_-304 addObject:r12];
                                    }
                            }
                            rbx = [var_-272 indexGreaterThanIndex:rbx];
                    } while (rbx != 0x7fffffffffffffff);
            }
            r12 = var_-304;
            var_-280 = [r12 retain];
            var_-152 = r12;
            [r13->_supplementaryLayoutAttributes enumerateKeysAndObjectsUsingBlock:__NSConcreteStackBlock];
            r14 = [var_-280 retain];
            var_-232 = r12;
            [r13->_decorationLayoutAttributes enumerateKeysAndObjectsUsingBlock:__NSConcreteStackBlock];
            if (*(int32_t *)__UIApplicationLinkedOnVersion != 0x0) {
                    if (*(int32_t *)__UIApplicationLinkedOnVersion >= 0x70100) {
                            rax = [r12 retain];
                    }
                    else {
                            rax = [r14 sortedArrayUsingComparator:^ {/* block implemented at ___58-[UICollectionViewData layoutAttributesForElementsInRect:]_block_invoke.243 */ } }];
                            rax = [rax retain];
                    }
            }
            else {
                    if (__UIApplicationLinkedOnOrAfter(0x70100) != 0x0) {
                            rax = [r12 retain];
                    }
                    else {
                            rax = [r14 sortedArrayUsingComparator:^ {/* block implemented at ___58-[UICollectionViewData layoutAttributesForElementsInRect:]_block_invoke.243 */ } }];
                            rax = [rax retain];
                    }
            }
            rbx = rax;
            [var_-232 release];
            [var_-152 release];
            [r14 release];
            [var_-272 release];
    }
    rdi = rbx;
    rax = [rdi autorelease];
    return rax;
}

int ___58-[UICollectionViewData layoutAttributesForElementsInRect:]_block_invoke(int arg0) {
    var_38 = [*(arg0 + 0x20) retain];
    [rdx enumerateKeysAndObjectsUsingBlock:__NSConcreteStackBlock];
    rax = [var_38 release];
    return rax;
}

int ___58-[UICollectionViewData layoutAttributesForElementsInRect:]_block_invoke_2(int arg0) {
    rdi = arg0;
    r14 = rdx;
    r15 = rdi;
    rbx = r15 + 0x28;
    if (r14 != 0x0) {
            rdi = var_40;
            rsi = r14;
            [rdi frame];
    }
    else {
            var_30 = intrinsic_movaps(var_30, 0x0);
            var_40 = intrinsic_movaps(var_40, 0x0);
    }
    rax = CGRectIntersectsRect(rdi, rsi);
    if ((rax != 0x0) || (*(int8_t *)(r15 + 0x48) != 0x0)) {
            rax = [*(r15 + 0x20) addObject:r14];
    }
    return rax;
}

int ___58-[UICollectionViewData layoutAttributesForElementsInRect:]_block_invoke.235(int arg0) {
    var_38 = [*(arg0 + 0x20) retain];
    [rdx enumerateKeysAndObjectsUsingBlock:__NSConcreteStackBlock];
    rax = [var_38 release];
    return rax;
}

int ___58-[UICollectionViewData layoutAttributesForElementsInRect:]_block_invoke_2.236(int arg0) {
    rdi = arg0;
    r14 = rdx;
    r15 = rdi;
    rbx = r15 + 0x28;
    if (r14 != 0x0) {
            rdi = var_40;
            rsi = r14;
            [rdi frame];
    }
    else {
            var_30 = intrinsic_movaps(var_30, 0x0);
            var_40 = intrinsic_movaps(var_40, 0x0);
    }
    rax = CGRectIntersectsRect(rdi, rsi);
    if ((rax != 0x0) || (*(int8_t *)(r15 + 0x48) != 0x0)) {
            rax = [*(r15 + 0x20) addObject:r14];
    }
    return rax;
}

NSInteger ___58-[UICollectionViewData layoutAttributesForElementsInRect:]_block_invoke.243(void * _block, void * arg1, void * arg2) {
    r14 = arg2;
    r15 = arg1;
    rbx = [r15 zIndex];
    rcx = [r14 zIndex];
    rax = 0xffffffffffffffff;
    if (rbx >= rcx) {
            rax = 0x1;
            if (rcx >= rbx) {
                    r15 = [[r15 indexPath] retain];
                    rbx = [[r14 indexPath] retain];
                    r14 = [r15 compare:rbx];
                    [rbx release];
                    [r15 release];
                    rax = r14;
            }
    }
    return rax;
}

void * -[UICollectionViewData layoutAttributesForCellsInRect:validateLayout:](void * self, void * _cmd, struct CGRect arg2, bool arg3) {
    rcx = arg3;
    rdx = arg2;
    rbx = rdx;
    r14 = self;
    if (CGRectIsNull(self) != 0x0) {
            r12 = [[NSArray array] retain];
    }
    else {
            r15 = arg_0;
            if (rbx != 0x0) {
                    var_88 = r14;
                    [r14 validateLayoutInRect:rdx, rcx];
            }
            else {
                    var_88 = r14;
            }
            xmm0 = intrinsic_movsd(xmm0, *r15);
            var_50 = intrinsic_movsd(var_50, xmm0);
            xmm0 = intrinsic_movsd(xmm0, *(r15 + 0x8));
            var_68 = intrinsic_movsd(var_68, xmm0);
            r14 = r15;
            r15 = [[NSMutableIndexSet alloc] init];
            do {
                    xmm1 = intrinsic_movsd(xmm1, var_50);
                    do {
                            var_80 = @selector(addIndexes:);
                            r12 = 0x8000000000000000;
                            var_78 = @selector(objectForKey:);
                            var_50 = intrinsic_movsd(var_50, xmm1);
                            rdi = var_88->_screenPageMap;
                            xmm0 = intrinsic_movsd(xmm0, *___pageDimension);
                            xmm1 = intrinsic_divsd(xmm1, xmm0);
                            xmm2 = intrinsic_movapd(xmm2, xmm1);
                            xmm3 = intrinsic_movsd(xmm3, *0xc4f758);
                            xmm2 = intrinsic_subsd(xmm2, xmm3);
                            rax = intrinsic_cvttsd2si(*_OBJC_IVAR_$_UICollectionViewData._screenPageMap, xmm2);
                            rax = rax ^ r12;
                            rcx = intrinsic_cvttsd2si(var_88, xmm1);
                            xmm1 = intrinsic_ucomisd(xmm1, xmm3);
                            asm { cmovae     rcx, rax };
                            xmm1 = intrinsic_movsd(xmm1, var_68);
                            xmm1 = intrinsic_divsd(xmm1, xmm0);
                            xmm0 = intrinsic_movapd(xmm0, xmm1);
                            xmm0 = intrinsic_subsd(xmm0, xmm3);
                            rax = intrinsic_cvttsd2si(rax, xmm0);
                            rdx = intrinsic_cvttsd2si(rdx, xmm1);
                            xmm1 = intrinsic_ucomisd(xmm1, xmm3);
                            asm { cmovae     rdx, rax };
                            rbx = [_objc_msgSend(rdi, var_78, !(rdx | rcx << 0x20), rcx << 0x20) retain];
                            rdx = rbx;
                            _objc_msgSend(r15, var_80, rdx, rcx << 0x20);
                            CGRectGetMaxX(r15);
                            var_58 = intrinsic_movsd(var_58, xmm0);
                            xmm0 = intrinsic_movsd(xmm0, *___pageDimension);
                            xmm0 = intrinsic_addsd(xmm0, var_50);
                            var_60 = intrinsic_movsd(var_60, xmm0);
                            rdi = rbx;
                            [rdi release];
                            xmm0 = intrinsic_movsd(xmm0, var_50);
                            xmm0 = intrinsic_ucomisd(xmm0, var_58);
                            xmm1 = intrinsic_movsd(xmm1, var_60);
                    } while (xmm0 <= 0x0);
                    xmm0 = intrinsic_movsd(xmm0, *r14);
                    var_50 = intrinsic_movsd(var_50, xmm0);
                    CGRectGetMaxY(rdi);
                    xmm1 = intrinsic_movsd(xmm1, var_68);
                    xmm1 = intrinsic_ucomisd(xmm1, xmm0);
                    COND = xmm1 <= 0x0;
                    xmm0 = intrinsic_movapd(xmm0, xmm1);
                    if (!COND) {
                        break;
                    }
                    xmm0 = intrinsic_addsd(xmm0, *___pageDimension);
                    var_68 = intrinsic_movsd(var_68, xmm0);
            } while (true);
            var_60 = [[NSMutableArray arrayWithCapacity:[r15 count]] retain];
            rbx = [r15 firstIndex];
            if (rbx != 0x7fffffffffffffff) {
                    r12 = r14;
                    do {
                            r14 = r15;
                            r15 = *(var_88->_globalItems + rbx * 0x8);
                            if (r15 != 0x0) {
                                    [var_48 frame];
                                    if (CGRectIntersectsRect(var_48, r15) != 0x0) {
                                            [var_60 addObject:r15];
                                    }
                            }
                            r15 = r14;
                            rbx = [r15 indexGreaterThanIndex:rbx];
                    } while (rbx != 0x7fffffffffffffff);
            }
            r12 = [var_60 retain];
            [var_60 release];
            [r15 release];
    }
    rdi = r12;
    rax = [rdi autorelease];
    return rax;
}

void * -[UICollectionViewData existingSupplementaryLayoutAttributesInSection:](void * self, void * _cmd, NSInteger arg2) {
    var_338 = arg2;
    var_3B8 = self;
    var_368 = [[NSMutableArray alloc] init];
    intrinsic_movaps(var_240, 0x0);
    intrinsic_movaps(var_250, 0x0);
    var_260 = intrinsic_movaps(var_260, 0x0);
    var_270 = intrinsic_movaps(var_270, 0x0);
    rax = [self->_supplementaryLayoutAttributes objectEnumerator];
    rax = [rax retain];
    var_3A8 = rax;
    rax = [rax countByEnumeratingWithState:var_270 objects:var_B0 count:0x10];
    var_390 = rax;
    if (rax != 0x0) {
            var_3A0 = *var_260;
            do {
                    rbx = 0x0;
                    do {
                            if (*var_260 != var_3A0) {
                                    objc_enumerationMutation(var_3A8);
                            }
                            rdi = *(var_268 + rbx * 0x8);
                            var_380 = rbx;
                            var_280 = intrinsic_movaps(var_280, 0x0);
                            var_290 = intrinsic_movaps(var_290, 0x0);
                            var_2A0 = intrinsic_movaps(var_2A0, 0x0);
                            var_2B0 = intrinsic_movaps(var_2B0, 0x0);
                            rax = [rdi objectEnumerator];
                            rax = [rax retain];
                            var_358 = rax;
                            rax = [rax countByEnumeratingWithState:var_2B0 objects:var_130 count:0x10];
                            var_340 = rax;
                            if (rax != 0x0) {
                                    var_350 = *var_2A0;
                                    do {
                                            r12 = 0x0;
                                            do {
                                                    if (*var_2A0 != var_350) {
                                                            objc_enumerationMutation(var_358);
                                                    }
                                                    r15 = *(var_2A8 + r12 * 0x8);
                                                    rbx = [[r15 indexPath] retain];
                                                    if (([rbx section] == var_338) && ([rbx length] >= 0x2)) {
                                                            [var_368 addObject:r15];
                                                    }
                                                    [rbx release];
                                                    r12 = r12 + 0x1;
                                            } while (r12 < var_340);
                                            rax = [var_358 countByEnumeratingWithState:var_2B0 objects:var_130 count:0x10];
                                            var_340 = rax;
                                    } while (rax != 0x0);
                            }
                            [var_358 release];
                            rbx = var_380 + 0x1;
                    } while (rbx < var_390);
                    rax = [var_3A8 countByEnumeratingWithState:var_270 objects:var_B0 count:0x10];
                    var_390 = rax;
            } while (rax != 0x0);
    }
    [var_3A8 release];
    intrinsic_movaps(var_2C0, 0x0);
    intrinsic_movaps(var_2D0, 0x0);
    var_2E0 = intrinsic_movaps(var_2E0, 0x0);
    var_2F0 = intrinsic_movaps(var_2F0, 0x0);
    rax = [var_3B8->_decorationLayoutAttributes objectEnumerator];
    rax = [rax retain];
    var_3A8 = rax;
    rax = [rax countByEnumeratingWithState:var_2F0 objects:var_1B0 count:0x10];
    var_388 = rax;
    if (rax != 0x0) {
            var_3A0 = *var_2E0;
            var_3B0 = @selector(countByEnumeratingWithState:objects:count:);
            do {
                    var_390 = @selector(countByEnumeratingWithState:objects:count:);
                    rbx = 0x0;
                    do {
                            if (*var_2E0 != var_3A0) {
                                    objc_enumerationMutation(var_3A8);
                            }
                            rdi = *(var_2E8 + rbx * 0x8);
                            var_380 = rbx;
                            var_300 = intrinsic_movaps(var_300, 0x0);
                            var_310 = intrinsic_movaps(var_310, 0x0);
                            var_320 = intrinsic_movaps(var_320, 0x0);
                            var_330 = intrinsic_movaps(var_330, 0x0);
                            rax = [rdi objectEnumerator];
                            rax = [rax retain];
                            var_358 = rax;
                            rax = _objc_msgSend(rax, var_390);
                            var_340 = rax;
                            if (rax != 0x0) {
                                    var_350 = *var_320;
                                    do {
                                            r15 = 0x0;
                                            do {
                                                    if (*var_320 != var_350) {
                                                            objc_enumerationMutation(var_358);
                                                    }
                                                    r13 = *(var_328 + r15 * 0x8);
                                                    r14 = [[r13 indexPath] retain];
                                                    if (([r14 section] == var_338) && ([r14 length] >= 0x2)) {
                                                            [var_368 addObject:r13];
                                                    }
                                                    [r14 release];
                                                    r15 = r15 + 0x1;
                                            } while (r15 < var_340);
                                            rax = [var_358 countByEnumeratingWithState:var_330 objects:var_230 count:0x10];
                                            var_340 = rax;
                                    } while (rax != 0x0);
                            }
                            [var_358 release];
                            rbx = var_380 + 0x1;
                    } while (rbx < var_388);
                    rax = _objc_msgSend(var_3A8, var_3B0);
                    var_388 = rax;
            } while (rax != 0x0);
    }
    [var_3A8 release];
    r15 = objc_retainAutoreleaseReturnValue(var_368);
    [var_368 release];
    if (*___stack_chk_guard == *___stack_chk_guard) {
            rax = r15;
    }
    else {
            rax = __stack_chk_fail();
    }
    return rax;
}

void * -[UICollectionViewData existingSupplementaryLayoutAttributes](void * self, void * _cmd) {
    r14 = self;
    var_1B8 = [[NSMutableArray alloc] init];
    intrinsic_movaps(var_140, 0x0);
    intrinsic_movaps(var_150, 0x0);
    var_160 = intrinsic_movaps(var_160, 0x0);
    var_170 = intrinsic_movaps(var_170, 0x0);
    rax = [r14->_supplementaryLayoutAttributes objectEnumerator];
    rax = [rax retain];
    var_1D0 = rax;
    r15 = @selector(countByEnumeratingWithState:objects:count:);
    rdx = var_170;
    rcx = var_B0;
    rax = _objc_msgSend(rax, r15);
    var_1C0 = rax;
    if (rax != 0x0) {
            var_1E0 = r14;
            var_1C8 = *var_160;
            do {
                    r12 = 0x0;
                    do {
                            if (*var_160 != var_1C8) {
                                    objc_enumerationMutation(var_1D0);
                            }
                            r13 = [[*(var_168 + r12 * 0x8) allValues] retain];
                            [var_1B8 addObjectsFromArray:r13];
                            [r13 release];
                            r12 = r12 + 0x1;
                    } while (r12 < var_1C0);
                    r15 = @selector(countByEnumeratingWithState:objects:count:);
                    rdx = var_170;
                    rcx = var_B0;
                    rax = _objc_msgSend(var_1D0, r15);
                    var_1C0 = rax;
            } while (rax != 0x0);
            r14 = var_1E0;
    }
    [var_1D0 release];
    intrinsic_movaps(var_180, 0x0);
    intrinsic_movaps(var_190, 0x0);
    var_1A0 = intrinsic_movaps(var_1A0, 0x0);
    var_1B0 = intrinsic_movaps(var_1B0, 0x0);
    rax = [r14->_decorationLayoutAttributes objectEnumerator];
    rax = [rax retain];
    var_1D0 = rax;
    rax = _objc_msgSend(rax, r15, var_1B0, var_130, 0x10);
    var_1C0 = rax;
    if (rax != 0x0) {
            var_1C8 = *var_1A0;
            do {
                    r12 = 0x0;
                    do {
                            if (*var_1A0 != var_1C8) {
                                    objc_enumerationMutation(var_1D0);
                            }
                            r14 = [[*(var_1A8 + r12 * 0x8) allValues] retain];
                            [var_1B8 addObjectsFromArray:r14];
                            [r14 release];
                            r12 = r12 + 0x1;
                    } while (r12 < var_1C0);
                    rax = [var_1D0 countByEnumeratingWithState:var_1B0 objects:var_130 count:0x10];
                    var_1C0 = rax;
            } while (rax != 0x0);
    }
    [var_1D0 release];
    r15 = objc_retainAutoreleaseReturnValue(var_1B8);
    [var_1B8 release];
    if (*___stack_chk_guard == *___stack_chk_guard) {
            rax = r15;
    }
    else {
            rax = __stack_chk_fail();
    }
    return rax;
}

void * -[UICollectionViewData knownSupplementaryElementKinds](void * self, void * _cmd) {
    r13 = self;
    r12 = [[r13->_supplementaryLayoutAttributes allKeys] retain];
    rdx = r12;
    r15 = [[NSSet setWithArray:rdx] retain];
    [r12 release];
    if (r15 != 0x0) {
            r14 = [[r13->_decorationLayoutAttributes allKeys] retain];
            rax = [r15 setByAddingObjectsFromArray:r14];
    }
    else {
            r14 = [[r13->_decorationLayoutAttributes allKeys] retain];
            rax = [NSSet setWithArray:r14];
    }
    rbx = [rax retain];
    [r14 release];
    [r15 release];
    [rbx autorelease];
    rax = rbx;
    return rax;
}

void * -[UICollectionViewData knownDecorationElementKinds](void * self, void * _cmd) {
    rbx = [[self->_decorationLayoutAttributes allKeys] retain];
    r14 = [[NSSet setWithArray:rbx] retain];
    [rbx release];
    rdi = r14;
    rax = [rdi autorelease];
    return rax;
}

void * -[UICollectionViewData layoutAttributesForSupplementaryElementOfKind:atIndexPath:](void * self, void * _cmd, void * arg2, void * arg3) {
    r14 = arg3;
    var_50 = _cmd;
    r13 = self;
    r15 = [arg2 retain];
    r12 = [r14 section];
    if ((r12 >= r13->_numSections) && ([r14 item] != 0x7fffffffffffffff)) {
            var_58 = r14;
            rbx = [[NSString stringWithUTF8String:"/BuildRoot/Library/Caches/com.apple.xbs/Sources/UIKit_Sim/UIKit-3600.6.21/UICollectionViewData.m"] retain];
            rdi = @"<Unknown File>";
            if (rbx != 0x0) {
                    rdi = rbx;
            }
            var_38 = [rdi retain];
            [rbx release];
            rcx = [[NSAssertionHandler currentHandler] retain];
            [rcx handleFailureInMethod:var_50 object:r13 file:var_38 lineNumber:0x3b5 description:@"request for layout attributes for supplementary view %@ in section %ld when there are only %ld sections in the collection view"];
            rsp = (rsp - 0x20) + 0x20;
            [var_38 release];
            r14 = var_58;
            [rcx release];
    }
    rbx = r14;
    rax = [r13->_supplementaryLayoutAttributes objectForKey:r15];
    rax = [rax retain];
    var_38 = rax;
    r12 = [[rax objectForKey:rbx] retain];
    if (r12 != 0x0) {
            var_40 = r15;
            var_48 = r13;
    }
    else {
            rdi = r13->_layout;
            var_48 = r13;
            if ((r13->_collectionViewDataFlags & 0x8) == 0x0) {
                    var_40 = r15;
                    var_58 = rbx;
                    rbx = [[rdi layoutAttributesForSupplementaryViewOfKind:r15 atIndexPath:rbx] retain];
                    r14 = 0x1;
                    r13 = 0x0;
            }
            else {
                    var_40 = r15;
                    var_58 = rbx;
                    rbx = [[rdi initialLayoutAttributesForAppearingSupplementaryElementOfKind:r15 atIndexPath:rbx] retain];
                    r13 = 0x1;
                    r14 = 0x0;
            }
            r15 = [rbx retain];
            [r12 release];
            if (r14 != 0x0) {
                    [rbx release];
            }
            if (r13 != 0x0) {
                    [rbx release];
            }
            r12 = 0x0;
            rbx = var_58;
            if (r15 != 0x0) {
                    r13 = rbx;
                    rax = var_38;
                    if (rax == 0x0) {
                            r12 = [[NSMutableDictionary alloc] init];
                            [rax release];
                            [var_48->_supplementaryLayoutAttributes setObject:r12 forKey:var_40];
                            rax = r12;
                    }
                    var_38 = rax;
                    rbx = r13;
                    [rax setObject:r15 forKey:rbx];
                    r12 = r15;
            }
    }
    r13 = rbx;
    if (*(int32_t *)__UIApplicationLinkedOnVersion != 0x0) {
            rcx = r12 != 0x0 ? 0x1 : 0x0;
            if (*(int32_t *)__UIApplicationLinkedOnVersion >= 0x70000) {
                    COND = rcx != 0x0;
                    rcx = var_48;
                    if ((!COND) && ((rcx->_collectionViewDataFlags & 0x8) == 0x0)) {
                            rbx = [[NSString stringWithUTF8String:"/BuildRoot/Library/Caches/com.apple.xbs/Sources/UIKit_Sim/UIKit-3600.6.21/UICollectionViewData.m"] retain];
                            rdi = @"<Unknown File>";
                            if (rbx != 0x0) {
                                    rdi = rbx;
                            }
                            var_58 = [rdi retain];
                            [rbx release];
                            r15 = [[NSAssertionHandler currentHandler] retain];
                            [r15 handleFailureInMethod:var_50 object:var_48 file:var_58 lineNumber:0x3c2 description:@"no UICollectionViewLayoutAttributes instance for -layoutAttributesForSupplementaryElementOfKind: %@ at path %@", var_40, r13];
                            [var_58 release];
                            [r15 release];
                    }
            }
            else {
                    COND = rcx != 0x0;
                    rcx = var_48;
                    if ((!COND) && ((rcx->_collectionViewDataFlags & 0x8) == 0x0)) {
                            rbx = ___UILogGetCategoryCachedImpl("Assert", _layoutAttributesForSupplementaryElementOfKind:atIndexPath:.__s_category);
                            if (os_log_type_enabled(*(rbx + 0x8), 0x10) != 0x0) {
                                    r14 = rsp;
                                    rax = rsp;
                                    *(int8_t *)(rax + 0xffffffffffffffe0) = 0x2;
                                    *(int8_t *)(rax + 0xffffffffffffffe1) = 0x2;
                                    *(int8_t *)(rax + 0xffffffffffffffe2) = 0x40;
                                    *(int8_t *)(rax + 0xffffffffffffffe3) = 0x8;
                                    *(rax + 0xffffffffffffffe4) = var_40;
                                    *(int8_t *)(rax + 0xffffffffffffffec) = 0x40;
                                    *(int8_t *)(rax + 0xffffffffffffffed) = 0x8;
                                    *(rax + 0xffffffffffffffee) = r13;
                                    _os_log_impl(0xffffffffff631882, *(rbx + 0x8), 0x10, "no UICollectionViewLayoutAttributes instance for -layoutAttributesForSupplementaryElementOfKind: %@ at path %@", rax + 0xffffffffffffffe0, 0x16);
                            }
                    }
            }
    }
    else {
            rcx = r12 != 0x0 ? 0x1 : 0x0;
            if (__UIApplicationLinkedOnOrAfter(0x70000) != 0x0) {
                    COND = rcx != 0x0;
                    rcx = var_48;
                    if ((!COND) && ((rcx->_collectionViewDataFlags & 0x8) == 0x0)) {
                            rbx = [[NSString stringWithUTF8String:"/BuildRoot/Library/Caches/com.apple.xbs/Sources/UIKit_Sim/UIKit-3600.6.21/UICollectionViewData.m"] retain];
                            rdi = @"<Unknown File>";
                            if (rbx != 0x0) {
                                    rdi = rbx;
                            }
                            var_58 = [rdi retain];
                            [rbx release];
                            r15 = [[NSAssertionHandler currentHandler] retain];
                            [r15 handleFailureInMethod:var_50 object:var_48 file:var_58 lineNumber:0x3c2 description:@"no UICollectionViewLayoutAttributes instance for -layoutAttributesForSupplementaryElementOfKind: %@ at path %@", var_40, r13];
                            [var_58 release];
                            [r15 release];
                    }
            }
            else {
                    COND = rcx != 0x0;
                    rcx = var_48;
                    if ((!COND) && ((rcx->_collectionViewDataFlags & 0x8) == 0x0)) {
                            rbx = ___UILogGetCategoryCachedImpl("Assert", _layoutAttributesForSupplementaryElementOfKind:atIndexPath:.__s_category);
                            if (os_log_type_enabled(*(rbx + 0x8), 0x10) != 0x0) {
                                    r14 = rsp;
                                    rax = rsp;
                                    *(int8_t *)(rax + 0xffffffffffffffe0) = 0x2;
                                    *(int8_t *)(rax + 0xffffffffffffffe1) = 0x2;
                                    *(int8_t *)(rax + 0xffffffffffffffe2) = 0x40;
                                    *(int8_t *)(rax + 0xffffffffffffffe3) = 0x8;
                                    *(rax + 0xffffffffffffffe4) = var_40;
                                    *(int8_t *)(rax + 0xffffffffffffffec) = 0x40;
                                    *(int8_t *)(rax + 0xffffffffffffffed) = 0x8;
                                    *(rax + 0xffffffffffffffee) = r13;
                                    _os_log_impl(0xffffffffff631882, *(rbx + 0x8), 0x10, "no UICollectionViewLayoutAttributes instance for -layoutAttributesForSupplementaryElementOfKind: %@ at path %@", rax + 0xffffffffffffffe0, 0x16);
                            }
                    }
            }
    }
    [var_38 release];
    [var_40 release];
    if (*___stack_chk_guard == *___stack_chk_guard) {
            rdi = r12;
            rax = [rdi autorelease];
    }
    else {
            rax = __stack_chk_fail();
    }
    return rax;
}

void * -[UICollectionViewData layoutAttributesForDecorationViewOfKind:atIndexPath:](void * self, void * _cmd, void * arg2, void * arg3) {
    r14 = arg3;
    var_50 = _cmd;
    r13 = self;
    r15 = [arg2 retain];
    r12 = [r14 section];
    if ((r12 >= r13->_numSections) && ([r14 item] != 0x7fffffffffffffff)) {
            var_58 = r14;
            rbx = [[NSString stringWithUTF8String:"/BuildRoot/Library/Caches/com.apple.xbs/Sources/UIKit_Sim/UIKit-3600.6.21/UICollectionViewData.m"] retain];
            rdi = @"<Unknown File>";
            if (rbx != 0x0) {
                    rdi = rbx;
            }
            var_38 = [rdi retain];
            [rbx release];
            rcx = [[NSAssertionHandler currentHandler] retain];
            [rcx handleFailureInMethod:var_50 object:r13 file:var_38 lineNumber:0x3c9 description:@"request for layout attributes for decoration view of kind %@ in section %ld when there are only %ld sections in the collection view"];
            rsp = (rsp - 0x20) + 0x20;
            [var_38 release];
            r14 = var_58;
            [rcx release];
    }
    rbx = r14;
    rax = [r13->_decorationLayoutAttributes objectForKey:r15];
    rax = [rax retain];
    var_38 = rax;
    r12 = [[rax objectForKey:rbx] retain];
    if (r12 != 0x0) {
            var_40 = r15;
            var_48 = r13;
    }
    else {
            rdi = r13->_layout;
            var_48 = r13;
            if ((r13->_collectionViewDataFlags & 0x8) == 0x0) {
                    var_40 = r15;
                    var_58 = rbx;
                    rbx = [[rdi layoutAttributesForDecorationViewOfKind:r15 atIndexPath:rbx] retain];
                    r14 = 0x1;
                    r13 = 0x0;
            }
            else {
                    var_40 = r15;
                    var_58 = rbx;
                    rbx = [[rdi initialLayoutAttributesForAppearingDecorationElementOfKind:r15 atIndexPath:rbx] retain];
                    r13 = 0x1;
                    r14 = 0x0;
            }
            r15 = [rbx retain];
            [r12 release];
            if (r14 != 0x0) {
                    [rbx release];
            }
            if (r13 != 0x0) {
                    [rbx release];
            }
            r12 = 0x0;
            rbx = var_58;
            if (r15 != 0x0) {
                    r13 = rbx;
                    rax = var_38;
                    if (rax == 0x0) {
                            r12 = [[NSMutableDictionary alloc] init];
                            [rax release];
                            [var_48->_decorationLayoutAttributes setObject:r12 forKey:var_40];
                            rax = r12;
                    }
                    var_38 = rax;
                    rbx = r13;
                    [rax setObject:r15 forKey:rbx];
                    r12 = r15;
            }
    }
    r13 = rbx;
    if (*(int32_t *)__UIApplicationLinkedOnVersion != 0x0) {
            rcx = r12 != 0x0 ? 0x1 : 0x0;
            if (*(int32_t *)__UIApplicationLinkedOnVersion >= 0x70000) {
                    COND = rcx != 0x0;
                    rcx = var_48;
                    if ((!COND) && ((rcx->_collectionViewDataFlags & 0x8) == 0x0)) {
                            rbx = [[NSString stringWithUTF8String:"/BuildRoot/Library/Caches/com.apple.xbs/Sources/UIKit_Sim/UIKit-3600.6.21/UICollectionViewData.m"] retain];
                            rdi = @"<Unknown File>";
                            if (rbx != 0x0) {
                                    rdi = rbx;
                            }
                            var_58 = [rdi retain];
                            [rbx release];
                            r15 = [[NSAssertionHandler currentHandler] retain];
                            [r15 handleFailureInMethod:var_50 object:var_48 file:var_58 lineNumber:0x3d6 description:@"no UICollectionViewLayoutAttributes instance for -layoutAttributesForDecorationViewOfKindOfKind: %@ at path %@", var_40, r13];
                            [var_58 release];
                            [r15 release];
                    }
            }
            else {
                    COND = rcx != 0x0;
                    rcx = var_48;
                    if ((!COND) && ((rcx->_collectionViewDataFlags & 0x8) == 0x0)) {
                            rbx = ___UILogGetCategoryCachedImpl("Assert", _layoutAttributesForDecorationViewOfKind:atIndexPath:.__s_category);
                            if (os_log_type_enabled(*(rbx + 0x8), 0x10) != 0x0) {
                                    r14 = rsp;
                                    rax = rsp;
                                    *(int8_t *)(rax + 0xffffffffffffffe0) = 0x2;
                                    *(int8_t *)(rax + 0xffffffffffffffe1) = 0x2;
                                    *(int8_t *)(rax + 0xffffffffffffffe2) = 0x40;
                                    *(int8_t *)(rax + 0xffffffffffffffe3) = 0x8;
                                    *(rax + 0xffffffffffffffe4) = var_40;
                                    *(int8_t *)(rax + 0xffffffffffffffec) = 0x40;
                                    *(int8_t *)(rax + 0xffffffffffffffed) = 0x8;
                                    *(rax + 0xffffffffffffffee) = r13;
                                    _os_log_impl(0xffffffffff631370, *(rbx + 0x8), 0x10, "no UICollectionViewLayoutAttributes instance for -layoutAttributesForDecorationViewOfKindOfKind: %@ at path %@", rax + 0xffffffffffffffe0, 0x16);
                            }
                    }
            }
    }
    else {
            rcx = r12 != 0x0 ? 0x1 : 0x0;
            if (__UIApplicationLinkedOnOrAfter(0x70000) != 0x0) {
                    COND = rcx != 0x0;
                    rcx = var_48;
                    if ((!COND) && ((rcx->_collectionViewDataFlags & 0x8) == 0x0)) {
                            rbx = [[NSString stringWithUTF8String:"/BuildRoot/Library/Caches/com.apple.xbs/Sources/UIKit_Sim/UIKit-3600.6.21/UICollectionViewData.m"] retain];
                            rdi = @"<Unknown File>";
                            if (rbx != 0x0) {
                                    rdi = rbx;
                            }
                            var_58 = [rdi retain];
                            [rbx release];
                            r15 = [[NSAssertionHandler currentHandler] retain];
                            [r15 handleFailureInMethod:var_50 object:var_48 file:var_58 lineNumber:0x3d6 description:@"no UICollectionViewLayoutAttributes instance for -layoutAttributesForDecorationViewOfKindOfKind: %@ at path %@", var_40, r13];
                            [var_58 release];
                            [r15 release];
                    }
            }
            else {
                    COND = rcx != 0x0;
                    rcx = var_48;
                    if ((!COND) && ((rcx->_collectionViewDataFlags & 0x8) == 0x0)) {
                            rbx = ___UILogGetCategoryCachedImpl("Assert", _layoutAttributesForDecorationViewOfKind:atIndexPath:.__s_category);
                            if (os_log_type_enabled(*(rbx + 0x8), 0x10) != 0x0) {
                                    r14 = rsp;
                                    rax = rsp;
                                    *(int8_t *)(rax + 0xffffffffffffffe0) = 0x2;
                                    *(int8_t *)(rax + 0xffffffffffffffe1) = 0x2;
                                    *(int8_t *)(rax + 0xffffffffffffffe2) = 0x40;
                                    *(int8_t *)(rax + 0xffffffffffffffe3) = 0x8;
                                    *(rax + 0xffffffffffffffe4) = var_40;
                                    *(int8_t *)(rax + 0xffffffffffffffec) = 0x40;
                                    *(int8_t *)(rax + 0xffffffffffffffed) = 0x8;
                                    *(rax + 0xffffffffffffffee) = r13;
                                    _os_log_impl(0xffffffffff631370, *(rbx + 0x8), 0x10, "no UICollectionViewLayoutAttributes instance for -layoutAttributesForDecorationViewOfKindOfKind: %@ at path %@", rax + 0xffffffffffffffe0, 0x16);
                            }
                    }
            }
    }
    [var_38 release];
    [var_40 release];
    if (*___stack_chk_guard == *___stack_chk_guard) {
            rdi = r12;
            rax = [rdi autorelease];
    }
    else {
            rax = __stack_chk_fail();
    }
    return rax;
}

bool -[UICollectionViewData layoutIsPrepared](void * self, void * _cmd) {
    rax = (self->_collectionViewDataFlags & 0x4) >> 0x2;
    return rax;
}

void -[UICollectionViewData setLayoutLocked:](void * self, void * _cmd, bool arg2) {
    self->_collectionViewDataFlags = self->_collectionViewDataFlags & 0xf7 | arg2 << 0x3;
    return;
}

bool -[UICollectionViewData isLayoutLocked](void * self, void * _cmd) {
    rax = (self->_collectionViewDataFlags & 0x8) >> 0x3;
    return rax;
}

void * -[UICollectionViewData clonedCellAttributes](void * self, void * _cmd) {
    rax = self->_clonedCellAttributes;
    return rax;
}

void * -[UICollectionViewData clonedSupplementaryAttributes](void * self, void * _cmd) {
    rax = self->_clonedSupplementaryAttributes;
    return rax;
}

void * -[UICollectionViewData clonedDecorationAttributes](void * self, void * _cmd) {
    rax = self->_clonedDecorationAttributes;
    return rax;
}

struct CGSize -[UICollectionViewData contentSize](void * self, void * _cmd) {
    intrinsic_movsd(xmm0, self->_contentSize);
    intrinsic_movsd(xmm1, *(self + *_OBJC_IVAR_$_UICollectionViewData._contentSize + 0x8));
    return *_OBJC_IVAR_$_UICollectionViewData._contentSize;
}

void -[UICollectionViewData setContentSize:](void * self, void * _cmd, struct CGSize arg2) {
    self->_contentSize = intrinsic_movsd(self->_contentSize, xmm0, arg2);
    *(self + *_OBJC_IVAR_$_UICollectionViewData._contentSize + 0x8) = intrinsic_movsd(*(self + *_OBJC_IVAR_$_UICollectionViewData._contentSize + 0x8), xmm1);
    return;
}

void -[UICollectionViewData .cxx_destruct](void * self, void * _cmd) {
    objc_storeStrong(*_OBJC_IVAR_$_UICollectionViewData._clonedDecorationAttributes + self, 0x0);
    objc_storeStrong(*_OBJC_IVAR_$_UICollectionViewData._clonedSupplementaryAttributes + self, 0x0);
    objc_storeStrong(*_OBJC_IVAR_$_UICollectionViewData._clonedCellAttributes + self, 0x0);
    objc_storeStrong(*_OBJC_IVAR_$_UICollectionViewData._invalidatedDecorationIndexPaths + self, 0x0);
    objc_storeStrong(*_OBJC_IVAR_$_UICollectionViewData._invalidatedSupplementaryIndexPaths + self, 0x0);
    objc_storeStrong(*_OBJC_IVAR_$_UICollectionViewData._decorationLayoutAttributes + self, 0x0);
    objc_storeStrong(*_OBJC_IVAR_$_UICollectionViewData._supplementaryLayoutAttributes + self, 0x0);
    objc_storeStrong(*_OBJC_IVAR_$_UICollectionViewData._globalIndexesOfItemsAwaitingValidation + self, 0x0);
    objc_storeStrong(*_OBJC_IVAR_$_UICollectionViewData._screenPageMap + self, 0x0);
    objc_storeStrong(*_OBJC_IVAR_$_UICollectionViewData._layout + self, 0x0);
    objc_destroyWeak(self + *_OBJC_IVAR_$_UICollectionViewData._collectionView);
    return;
}
