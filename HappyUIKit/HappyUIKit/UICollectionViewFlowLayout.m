int _UICollectionViewFlowLayoutCommonInit(int arg0) {
    arg0->_interitemSpacing = 0x4024000000000000;
    arg0->_lineSpacing = 0x4024000000000000;
    arg0->_itemSize = intrinsic_movups(arg0->_itemSize, intrinsic_movaps(xmm0, *(int128_t *)0xc54cf0));
    arg0->_gridLayoutFlags = arg0->_gridLayoutFlags | 0x200;
    var_68 = [arg0 retain];
    rax = @(0x3);
    rax = [rax retain];
    var_78 = rax;
    r14 = [@(0x0) retain];
    r13 = [@(0x1) retain];
    r15 = [[NSArray arrayWithObjects:rax count:0x3] retain];
    var_70 = r15;
    [r13 release];
    [r14 release];
    [var_78 release];
    rbx = [[NSArray arrayWithObjects:intrinsic_movdqa(var_60, intrinsic_punpcklqdq(zero_extend_64(@"UIFlowLayoutCommonRowHorizontalAlignmentKey"), zero_extend_64(@"UIFlowLayoutLastRowHorizontalAlignmentKey"))) count:0x3] retain];
    rdx = r15;
    r15 = rbx;
    arg0->_rowAlignmentsOptionsDictionary = [[NSDictionary alloc] initWithObjects:rdx forKeys:rbx];
    [arg0->_rowAlignmentsOptionsDictionary release];
    arg0->_cachedItemAttributes = [[NSMutableDictionary alloc] init];
    [arg0->_cachedItemAttributes release];
    arg0->_cachedItemFrames = [[NSMutableDictionary alloc] init];
    [arg0->_cachedItemFrames release];
    [var_68 release];
    [r15 release];
    [var_70 release];
    rax = *___stack_chk_guard;
    if (rax != *___stack_chk_guard) {
            rax = __stack_chk_fail();
    }
    return rax;
}

void * -[UICollectionViewFlowLayout initWithCoder:](void * self, void * _cmd, void * arg2) {
    r13 = [arg2 retain];
    r15 = [[self super] init];
    r14 = r15;
    if (r15 != 0x0) {
            _UICollectionViewFlowLayoutCommonInit(r14);
            if ([r13 containsValueForKey:@"UIInteritemSpacing"] != 0x0) {
                    [r13 decodeFloatForKey:@"UIInteritemSpacing"];
                    xmm0 = intrinsic_cvtss2sd(xmm0, xmm0);
                    r14->_interitemSpacing = intrinsic_movsd(r14->_interitemSpacing, xmm0);
            }
            if ([r13 containsValueForKey:@"UILineSpacing"] != 0x0) {
                    [r13 decodeFloatForKey:@"UILineSpacing"];
                    xmm0 = intrinsic_cvtss2sd(xmm0, xmm0);
                    r14->_lineSpacing = intrinsic_movsd(r14->_lineSpacing, xmm0);
            }
            if ([r13 containsValueForKey:@"UIItemSize"] != 0x0) {
                    [r13 decodeCGSizeForKey:@"UIItemSize"];
                    r14->_itemSize = intrinsic_movsd(r14->_itemSize, xmm0);
                    *(r14 + *_OBJC_IVAR_$_UICollectionViewFlowLayout._itemSize + 0x8) = intrinsic_movsd(*(r14 + *_OBJC_IVAR_$_UICollectionViewFlowLayout._itemSize + 0x8), xmm1);
            }
            if ([r13 containsValueForKey:@"UIHeaderReferenceSize"] != 0x0) {
                    [r13 decodeCGSizeForKey:@"UIHeaderReferenceSize"];
                    r14->_headerReferenceSize = intrinsic_movsd(r14->_headerReferenceSize, xmm0);
                    *(r14 + *_OBJC_IVAR_$_UICollectionViewFlowLayout._headerReferenceSize + 0x8) = intrinsic_movsd(*(r14 + *_OBJC_IVAR_$_UICollectionViewFlowLayout._headerReferenceSize + 0x8), xmm1);
            }
            if ([r13 containsValueForKey:@"UIFooterReferenceSize"] != 0x0) {
                    [r13 decodeCGSizeForKey:@"UIFooterReferenceSize"];
                    r14->_footerReferenceSize = intrinsic_movsd(r14->_footerReferenceSize, xmm0);
                    *(r14 + *_OBJC_IVAR_$_UICollectionViewFlowLayout._footerReferenceSize + 0x8) = intrinsic_movsd(*(r14 + *_OBJC_IVAR_$_UICollectionViewFlowLayout._footerReferenceSize + 0x8), xmm1);
            }
            if ([r13 containsValueForKey:@"UISectionInset"] != 0x0) {
                    r15 = r15 + *_OBJC_IVAR_$_UICollectionViewFlowLayout._sectionInset;
                    if (r13 != 0x0) {
                            rbx = var_60;
                            [rbx decodeUIEdgeInsetsForKey:r13, @"UISectionInset"];
                    }
                    else {
                            rbx = var_60;
                            xmm0 = intrinsic_xorpd(xmm0, xmm0);
                            intrinsic_movapd(var_50, xmm0);
                            intrinsic_movapd(var_60, xmm0);
                    }
                    *(r15 + 0x18) = *(rbx + 0x18);
                    *(r15 + 0x10) = *(rbx + 0x10);
                    *(r15 + 0x8) = *(rbx + 0x8);
                    *r15 = *rbx;
            }
            if ([r13 containsValueForKey:@"UIScrollDirection"] != 0x0) {
                    r14->_scrollDirection = [r13 decodeIntegerForKey:@"UIScrollDirection"];
            }
    }
    [r13 release];
    rax = r14;
    return rax;
}

void -[UICollectionViewFlowLayout invalidateLayoutWithContext:](void * self, void * _cmd, void * arg2) {
    r15 = self;
    r14 = [arg2 retain];
    if ([r14 isKindOfClass:[UICollectionViewFlowLayoutInvalidationContext class]] == 0x0) {
            rcx = @"the invalidation context (%@) sent to -[UICollectionViewFlowLayout invalidateLayoutWithContext:] is not an instance of type UICollectionViewFlowLayoutInvalidationContext or a subclass";
            [NSException raise:*_NSInvalidArgumentException format:rcx];
    }
    if (*(int32_t *)__UIApplicationLinkedOnVersion == 0x0) goto loc_9a7a67;

loc_9a7a5a:
    if (*(int32_t *)__UIApplicationLinkedOnVersion < 0xa0000) goto loc_9a7b2f;

loc_9a7a79:
    if (([r14 _retainExistingSizingInfoForEstimates] != 0x0) || ([r14 _initiatedFromReloadData] != 0x0)) goto loc_9a7aa5;

loc_9a7b2f:
    if (([r14 invalidateFlowLayoutAttributes] != 0x0) || ([r14 invalidateDataSourceCounts] != 0x0)) {
            if (r15->_gridLayoutFlags < 0x0) {
                    rax = [r14 invalidateFlowLayoutDelegateMetrics];
                    [r15->_data invalidate:(rax ^ 0x1) & 0xff];
                    [r15 _resetCachedItems];
                    if ([r14 invalidateFlowLayoutDelegateMetrics] != 0x0) {
                            rax = 0x0;
                    }
                    else {
                            rax = [r15 _estimatesSizes];
                            rax = rax ^ 0x1;
                    }
                    r15->_gridLayoutFlags = r15->_gridLayoutFlags & 0xffff & 0xfe7f | (rax & 0xff) << 0x8;
            }
    }
    rbx = [[r14 invalidatedItemIndexPaths] retain];
    if ([rbx count] != 0x0) {
            rdi = r15->_indexPathsToValidate;
            if (rdi == 0x0) {
                    r15->_indexPathsToValidate = [[NSMutableArray alloc] init];
                    [r15->_indexPathsToValidate release];
                    rdi = r15->_indexPathsToValidate;
            }
            [rdi addObjectsFromArray:rbx];
            [r15->_cachedItemAttributes removeObjectsForKeys:rbx];
            [r15->_cachedItemFrames removeObjectsForKeys:rbx];
    }
    rdi = rbx;
    goto loc_9a7c88;

loc_9a7c88:
    [rdi release];
    goto loc_9a7c8e;

loc_9a7c8e:
    *(r15 + *_OBJC_IVAR_$_UICollectionViewFlowLayout._contentSizeAdjustment + 0x8) = *_CPBitmapCreateImagesFromData;
    r15->_contentSizeAdjustment = *_CGSizeZero;
    *(r15 + *_OBJC_IVAR_$_UICollectionViewFlowLayout._contentOffsetAdjustment + 0x8) = *_CGRectApplyAffineTransform;
    r15->_contentOffsetAdjustment = *_CGPointZero;
    [[r15 super] invalidateLayoutWithContext:r14];
    [r14 release];
    return;

loc_9a7aa5:
    if ([r15 _estimatesSizes] == 0x0) goto loc_9a7b2f;

loc_9a7ab9:
    [r15 collectionViewContentSize];
    var_50 = intrinsic_movaps(var_50, 0x0);
    var_40 = intrinsic_movsd(var_40, xmm0);
    var_38 = intrinsic_movsd(var_38, xmm1);
    xmm0 = intrinsic_mulsd(xmm0, xmm1);
    xmm0 = intrinsic_andpd(xmm0, *(int128_t *)0xc4f640);
    xmm1 = intrinsic_movsd(xmm1, *0xc4f700);
    xmm1 = intrinsic_ucomisd(xmm1, xmm0);
    if (xmm1 <= 0x0) goto loc_9a7d10;

loc_9a7af8:
    [r15->_data invalidate:0x0];
    [r15 _resetCachedItems];
    r15->_gridLayoutFlags = r15->_gridLayoutFlags & 0xfe7f;
    goto loc_9a7c8e;

loc_9a7d10:
    var_78 = 0x0;
    intrinsic_movdqu(var_68, intrinsic_punpcklqdq(zero_extend_64(___Block_byref_object_copy_), zero_extend_64(___Block_byref_object_dispose_)));
    var_58 = [[r15->_data specifiedItemSizes] retain];
    rbx = [[r14 _updateItems] retain];
    r12 = [rbx count];
    [rbx release];
    if (r12 != 0x0) {
            r13 = [[NSMutableDictionary alloc] init];
            var_98 = [r14 retain];
            rbx = [r13 retain];
            var_90 = rbx;
            [*(var_78 + 0x28) enumerateKeysAndObjectsUsingBlock:__NSConcreteStackBlock];
            *(var_78 + 0x28) = rbx;
            r13 = [rbx retain];
            [*(var_78 + 0x28) release];
            [var_90 release];
            [var_98 release];
            [r13 release];
    }
    [r15->_data invalidate:0x0];
    [r15 _getSizingInfosWithExistingSizingDictionary:*(var_78 + 0x28)];
    [r15 _updateItemsLayoutForRect:0x0 allowsPartialUpdate:rcx];
    [r15 _resetCachedItems];
    r15->_gridLayoutFlags = r15->_gridLayoutFlags | 0x180;
    _Block_object_dispose(0x0, 0x8);
    rdi = var_58;
    goto loc_9a7c88;

loc_9a7a67:
    if (__UIApplicationLinkedOnOrAfter(0xa0000) == 0x0) goto loc_9a7b2f;
}

int ___58-[UICollectionViewFlowLayout invalidateLayoutWithContext:]_block_invoke(int arg0, int arg1, int arg2, int arg3) {
    var_158 = arg3;
    r12 = arg2;
    var_150 = arg0;
    var_30 = *___stack_chk_guard;
    var_138 = [arg1 item];
    var_130 = [arg1 section];
    intrinsic_movaps(var_C0, 0x0);
    intrinsic_movaps(var_D0, 0x0);
    var_E0 = intrinsic_movaps(var_E0, 0x0);
    var_F0 = intrinsic_movaps(var_F0, 0x0);
    rbx = [[*(arg0 + 0x20) _updateItems] retain];
    var_140 = rbx;
    rax = [rbx countByEnumeratingWithState:var_F0 objects:var_B0 count:0x10];
    var_108 = rax;
    if (rax == 0x0) goto loc_9a82fc;

loc_9a804b:
    var_170 = r12;
    var_120 = *var_E0;
    var_15C = 0x1;
    goto loc_9a8079;

loc_9a8079:
    r12 = @selector(updateAction);
    r14 = 0x0;
    goto loc_9a80c5;

loc_9a80c5:
    if (*var_E0 != var_120) {
            objc_enumerationMutation(var_140);
    }
    r13 = *(var_E8 + r14 * 0x8);
    r15 = [[r13 indexPathBeforeUpdate] retain];
    var_100 = [[r13 indexPathAfterUpdate] retain];
    if (_objc_msgSend(r13, r12) != 0x1) goto loc_9a8192;

loc_9a8139:
    if ([r15 section] == var_130) {
            r13 = r12;
            r12 = @selector(item);
            rbx = var_138;
            if (_objc_msgSend(r15, r12) == rbx) {
                    var_F8 = r15;
                    var_15C = 0x0;
            }
            else {
                    var_F8 = r15;
                    var_138 = rbx - ((_objc_msgSend(r15, r12) < rbx ? 0x1 : 0x0) & 0xff);
            }
    }
    else {
            var_F8 = r15;
            r13 = r12;
    }
    goto loc_9a8262;

loc_9a8262:
    rbx = var_100;
    goto loc_9a8269;

loc_9a8269:
    rdi = rbx;
    [rdi release];
    [var_F8 release];
    r14 = r14 + 0x1;
    r12 = r13;
    if (r14 < var_108) goto loc_9a80c5;

loc_9a8294:
    rbx = var_140;
    rax = [rbx countByEnumeratingWithState:var_F0 objects:var_B0 count:0x10];
    var_108 = rax;
    if (rax != 0x0) goto loc_9a8079;

loc_9a82cf:
    [rbx release];
    rax = var_15C;
    r15 = var_170;
    rdx = var_138;
    if ((rax & 0x1) != 0x0) {
            rbx = [[NSIndexPath indexPathForItem:rdx inSection:var_130] retain];
            [*(var_150 + 0x28) setObject:r15 forKeyedSubscript:rbx];
            rax = [rbx release];
    }
    goto loc_9a835d;

loc_9a835d:
    if (*___stack_chk_guard != var_30) {
            rax = __stack_chk_fail();
    }
    return rax;

loc_9a8192:
    var_F8 = r15;
    if (_objc_msgSend(r13, r12) == 0x0) goto loc_9a81e9;

loc_9a81aa:
    r13 = r12;
    *(*(*(var_150 + 0x30) + 0x8) + 0x28) = 0x0;
    [*(*(*(var_150 + 0x30) + 0x8) + 0x28) release];
    *(int8_t *)var_158 = 0x1;
    goto loc_9a8262;

loc_9a81e9:
    rbx = var_100;
    if ([rbx section] == var_130) {
            r13 = r12;
            var_138 = var_138 + (([rbx item] <= var_138 ? 0x1 : 0x0) & 0xff);
    }
    else {
            r13 = r12;
    }
    goto loc_9a8269;

loc_9a82fc:
    [rbx release];
    rdx = var_138;
    r15 = r12;
    rbx = [[NSIndexPath indexPathForItem:rdx inSection:var_130] retain];
    [*(var_150 + 0x28) setObject:r15 forKeyedSubscript:rbx];
    rax = [rbx release];
    goto loc_9a835d;
}

void -[UICollectionViewFlowLayout prepareLayout](void * self, void * _cmd) {
    r14 = self;
    [[r14 super] prepareLayout];
    *(r14 + *_OBJC_IVAR_$_UICollectionViewFlowLayout._contentSizeAdjustment + 0x8) = *_CPBitmapCreateImagesFromData;
    r14->_contentSizeAdjustment = *_CGSizeZero;
    *(r14 + *_OBJC_IVAR_$_UICollectionViewFlowLayout._contentOffsetAdjustment + 0x8) = *_CGRectApplyAffineTransform;
    r14->_contentOffsetAdjustment = *_CGPointZero;
    rbx = [[r14 collectionView] retain];
    if (rbx != 0x0) {
            [var_40 bounds];
    }
    else {
            var_30 = intrinsic_movaps(var_30, 0x0);
            var_40 = intrinsic_movaps(var_40, 0x0);
    }
    [rbx release];
    if (CGRectIsEmpty(rbx) == 0x0) {
            [r14 _fetchItemsInfoForRect:rdx, rcx];
    }
    return;
}

ool -[UICollectionViewFlowLayout shouldInvalidateLayoutForBoundsChange:](void * self, void * _cmd, struct CGRect arg2) {
    r13 = self;
    rbx = [[self collectionView] retain];
    if (rbx != 0x0) {
            [var_50 bounds];
    }
    else {
            xmm0 = intrinsic_xorpd(xmm0, xmm0);
            var_40 = intrinsic_movapd(var_40, xmm0);
            var_50 = intrinsic_movapd(var_50, xmm0);
    }
    r14 = arg_0;
    [rbx release];
    rax = r13->_gridLayoutFlags & 0xffff;
    if ((rax & 0x8) == 0x0) goto loc_9a866c;

loc_9a8584:
    r14 = [[r13 indexesForSectionHeadersInRect:r13->_data usingData:rcx] retain];
    if ([r14 count] != 0x0) goto loc_9a86db;

loc_9a85eb:
    rbx = [[r13 indexesForSectionHeadersInRect:r13->_data usingData:*(arg_0 + 0x8)] retain];
    r15 = [rbx count];
    [rbx release];
    rdi = r14;
    r14 = arg_0;
    [rdi release];
    rax = 0x1;
    if (r15 != 0x0) goto .l1;

loc_9a865f:
    rax = r13->_gridLayoutFlags & 0xffff;
    goto loc_9a866c;

loc_9a866c:
    if ((rax & 0x10) == 0x0) goto loc_9a8759;

loc_9a8675:
    rbx = r14;
    r14 = [[r13 indexesForSectionFootersInRect:r13->_data usingData:rcx] retain];
    if ([r14 count] == 0x0) goto loc_9a86eb;

loc_9a86db:
    [r14 release];
    rax = 0x1;
    return rax;

.l1:
    return rax;

loc_9a86eb:
    r12 = [[r13 indexesForSectionFootersInRect:r13->_data usingData:*(rbx + 0x8)] retain];
    r15 = [r12 count];
    [r12 release];
    rdi = r14;
    r14 = rbx;
    [rdi release];
    rax = 0x1;
    if (r15 != 0x0) goto .l1;

loc_9a8759:
    if (r13->_scrollDirection == 0x0) goto loc_9a8787;

loc_9a8768:
    xmm0 = intrinsic_movsd(xmm0, *(r14 + 0x18));
    rax = 0x1;
    xmm0 = intrinsic_ucomisd(xmm0, var_38);
    if ((xmm0 != 0x0) || (CPU_FLAGS & P)) goto .l1;

loc_9a8779:
    xmm0 = intrinsic_movsd(xmm0, *(r14 + 0x8));
    asm { cmpneqsd   xmm0, qword [rbp+var_48] };
    goto loc_9a87a3;

loc_9a87a3:
    rax = zero_extend_64(xmm0) & 0x1;
    return rax;

loc_9a8787:
    xmm0 = intrinsic_movsd(xmm0, *(r14 + 0x10));
    rax = 0x1;
    xmm0 = intrinsic_ucomisd(xmm0, var_40);
    if ((xmm0 != 0x0) || (CPU_FLAGS & P)) goto .l1;

loc_9a8798:
    xmm0 = intrinsic_movsd(xmm0, *r14);
    asm { cmpneqsd   xmm0, qword [rbp+var_50] };
    goto loc_9a87a3;
}

void * -[UICollectionViewFlowLayout invalidationContextForBoundsChange:](void * self, void * _cmd, struct CGRect arg2) {
    rbx = self;
    r13 = arg_0;
    r14 = [[[rbx super] invalidationContextForBoundsChange:arg2, rcx] retain];
    [r14 setInvalidateFlowLayoutDelegateMetrics:0x0];
    [r14 setInvalidateFlowLayoutAttributes:0x0];
    rsi = rbx;
    [var_58 _bounds];
    rax = rbx->_scrollDirection;
    if (rax != 0x1) {
            if (rax == 0x0) {
                    xmm0 = intrinsic_movsd(xmm0, *(r13 + 0x10));
                    xmm0 = intrinsic_ucomisd(xmm0, var_48);
                    if ((xmm0 == 0x0) && (!CPU_FLAGS & P)) {
                            xmm0 = intrinsic_movsd(xmm0, *r13);
                            xmm0 = intrinsic_ucomisd(xmm0, var_58);
                            if ((xmm0 == 0x0) && (CPU_FLAGS & NP)) {
                                    CGRectUnion(var_78, rsi);
                                    rax = rbx->_gridLayoutFlags & 0xffff;
                                    if ((rax & 0x8) != 0x0) {
                                            r13 = [[rbx indexesForSectionHeadersInRect:rbx->_data usingData:var_70] retain];
                                            if ([r13 count] != 0x0) {
                                                    [r14 invalidateSupplementaryElementsOfKind:@"UICollectionElementKindSectionHeader" atIndexPaths:r13];
                                            }
                                            [r13 release];
                                            rax = rbx->_gridLayoutFlags & 0xffff;
                                    }
                                    if ((rax & 0x10) != 0x0) {
                                            r13 = [[rbx indexesForSectionFootersInRect:rbx->_data usingData:var_70] retain];
                                            if ([r13 count] != 0x0) {
                                                    [r14 invalidateSupplementaryElementsOfKind:@"UICollectionElementKindSectionFooter" atIndexPaths:r13];
                                            }
                                            [r13 release];
                                    }
                            }
                            else {
                                    [r14 setInvalidateFlowLayoutAttributes:0x1];
                            }
                    }
                    else {
                            [r14 setInvalidateFlowLayoutAttributes:0x1];
                    }
            }
            else {
                    CGRectUnion(var_78, rsi);
                    rax = rbx->_gridLayoutFlags & 0xffff;
                    if ((rax & 0x8) != 0x0) {
                            r13 = [[rbx indexesForSectionHeadersInRect:rbx->_data usingData:var_70] retain];
                            if ([r13 count] != 0x0) {
                                    [r14 invalidateSupplementaryElementsOfKind:@"UICollectionElementKindSectionHeader" atIndexPaths:r13];
                            }
                            [r13 release];
                            rax = rbx->_gridLayoutFlags & 0xffff;
                    }
                    if ((rax & 0x10) != 0x0) {
                            r13 = [[rbx indexesForSectionFootersInRect:rbx->_data usingData:var_70] retain];
                            if ([r13 count] != 0x0) {
                                    [r14 invalidateSupplementaryElementsOfKind:@"UICollectionElementKindSectionFooter" atIndexPaths:r13];
                            }
                            [r13 release];
                    }
            }
    }
    else {
            xmm0 = intrinsic_movsd(xmm0, *(r13 + 0x18));
            xmm0 = intrinsic_ucomisd(xmm0, var_40);
            if ((xmm0 == 0x0) && (!CPU_FLAGS & P)) {
                    xmm0 = intrinsic_movsd(xmm0, *(r13 + 0x8));
                    xmm0 = intrinsic_ucomisd(xmm0, var_50);
                    if ((xmm0 == 0x0) && (CPU_FLAGS & NP)) {
                            CGRectUnion(var_78, rsi);
                            rax = rbx->_gridLayoutFlags & 0xffff;
                            if ((rax & 0x8) != 0x0) {
                                    r13 = [[rbx indexesForSectionHeadersInRect:rbx->_data usingData:var_70] retain];
                                    if ([r13 count] != 0x0) {
                                            [r14 invalidateSupplementaryElementsOfKind:@"UICollectionElementKindSectionHeader" atIndexPaths:r13];
                                    }
                                    [r13 release];
                                    rax = rbx->_gridLayoutFlags & 0xffff;
                            }
                            if ((rax & 0x10) != 0x0) {
                                    r13 = [[rbx indexesForSectionFootersInRect:rbx->_data usingData:var_70] retain];
                                    if ([r13 count] != 0x0) {
                                            [r14 invalidateSupplementaryElementsOfKind:@"UICollectionElementKindSectionFooter" atIndexPaths:r13];
                                    }
                                    [r13 release];
                            }
                    }
                    else {
                            [r14 setInvalidateFlowLayoutAttributes:0x1];
                    }
            }
            else {
                    [r14 setInvalidateFlowLayoutAttributes:0x1];
            }
    }
    if (*(int32_t *)__UIApplicationLinkedOnVersion != 0x0) {
            if (*(int32_t *)__UIApplicationLinkedOnVersion >= 0xa0000) {
                    if ([rbx _estimatesSizes] != 0x0) {
                            [r14 setInvalidateFlowLayoutDelegateMetrics:0x0];
                            [r14 setInvalidateFlowLayoutAttributes:0x0];
                            [r14 _setRetainExistingSizingInfoForEstimates:0x1];
                    }
            }
    }
    else {
            if (__UIApplicationLinkedOnOrAfter(0xa0000) != 0x0) {
                    if ([rbx _estimatesSizes] != 0x0) {
                            [r14 setInvalidateFlowLayoutDelegateMetrics:0x0];
                            [r14 setInvalidateFlowLayoutAttributes:0x0];
                            [r14 _setRetainExistingSizingInfoForEstimates:0x1];
                    }
            }
    }
    rdi = r14;
    rax = [rdi autorelease];
    return rax;
}


struct CGSize -[UICollectionViewFlowLayout collectionViewContentSize](void * self, void * _cmd) {
    [self _fetchItemsInfoForRect:rdx, rcx];
    intrinsic_movsd(xmm0, self->_currentLayoutSize);
    intrinsic_movsd(xmm1, *(self + *_OBJC_IVAR_$_UICollectionViewFlowLayout._currentLayoutSize + 0x8));
    return *_OBJC_IVAR_$_UICollectionViewFlowLayout._currentLayoutSize;
}


void * -[UICollectionViewFlowLayout indexesForSectionHeadersInRect:usingData:](void * self, void * _cmd, struct CGRect arg2, void * arg3) {
    var_E0 = self;
    rax = [arg2 retain];
    var_110 = rax;
    rdi = rax;
    if (rax == 0x0) {
            rdi = var_E0->_data;
    }
    rax = [rdi retain];
    var_D0 = rax;
    rbx = [[rax sections] retain];
    var_F8 = rbx;
    r12 = [rbx count];
    var_B8 = r12;
    var_F0 = [[NSMutableArray arrayWithCapacity:0xa] retain];
    if (r12 > 0x0) {
            r14 = arg_0;
            r12 = 0x0;
            do {
                    r13 = [[rbx objectAtIndex:r12] retain];
                    rsi = @selector(headerDimension);
                    _objc_msgSend(r13, rsi);
                    xmm0 = intrinsic_ucomisd(xmm0, *0xc4ff40);
                    if (xmm0 > 0x0) {
                            if (r13 != 0x0) {
                                    rsi = r13;
                                    [var_70 frame];
                            }
                            else {
                                    xmm0 = 0x0;
                                    var_60 = intrinsic_movaps(var_60, xmm0);
                                    var_70 = intrinsic_movaps(var_70, xmm0);
                            }
                            CGRectIntersection(var_48, rsi);
                            if (CGRectIsNull(var_48) == 0x0) {
                                    r8 = var_D0;
                                    [var_90 _frameForHeaderInSection:var_E0 usingData:r12, r8];
                                    CGRectIntersection(var_B0, var_E0);
                                    if (CGRectIsNull(var_B0) == 0x0) {
                                            rbx = [[NSIndexPath indexPathForItem:0x0 inSection:r12, r8] retain];
                                            [var_F0 addObject:rbx, r12, r8];
                                            rdi = rbx;
                                            rbx = var_F8;
                                            [rdi release];
                                    }
                            }
                    }
                    [r13 release];
                    r12 = r12 + 0x1;
            } while (var_B8 != r12);
    }
    r15 = rbx;
    r14 = objc_retainAutoreleaseReturnValue(var_F0);
    [var_F0 release];
    [r15 release];
    [var_D0 release];
    [var_110 release];
    rax = r14;
    return rax;
}

void * -[UICollectionViewFlowLayout indexesForSectionFootersInRect:usingData:](void * self, void * _cmd, struct CGRect arg2, void * arg3) {
    var_E0 = self;
    rax = [arg2 retain];
    var_110 = rax;
    rdi = rax;
    if (rax == 0x0) {
            rdi = var_E0->_data;
    }
    rax = [rdi retain];
    var_D0 = rax;
    rbx = [[rax sections] retain];
    var_F8 = rbx;
    r12 = [rbx count];
    var_B8 = r12;
    var_F0 = [[NSMutableArray arrayWithCapacity:0xa] retain];
    if (r12 > 0x0) {
            r14 = arg_0;
            r12 = 0x0;
            do {
                    r13 = [[rbx objectAtIndex:r12] retain];
                    rsi = @selector(footerDimension);
                    _objc_msgSend(r13, rsi);
                    xmm0 = intrinsic_ucomisd(xmm0, *0xc4ff40);
                    if (xmm0 > 0x0) {
                            if (r13 != 0x0) {
                                    rsi = r13;
                                    [var_70 frame];
                            }
                            else {
                                    xmm0 = 0x0;
                                    var_60 = intrinsic_movaps(var_60, xmm0);
                                    var_70 = intrinsic_movaps(var_70, xmm0);
                            }
                            CGRectIntersection(var_48, rsi);
                            if (CGRectIsNull(var_48) == 0x0) {
                                    r8 = var_D0;
                                    [var_90 _frameForFooterInSection:var_E0 usingData:r12, r8];
                                    CGRectIntersection(var_B0, var_E0);
                                    if (CGRectIsNull(var_B0) == 0x0) {
                                            rbx = [[NSIndexPath indexPathForItem:0x0 inSection:r12, r8] retain];
                                            [var_F0 addObject:rbx, r12, r8];
                                            rdi = rbx;
                                            rbx = var_F8;
                                            [rdi release];
                                    }
                            }
                    }
                    [r13 release];
                    r12 = r12 + 0x1;
            } while (var_B8 != r12);
    }
    r15 = rbx;
    r14 = objc_retainAutoreleaseReturnValue(var_F0);
    [var_F0 release];
    [r15 release];
    [var_D0 release];
    [var_110 release];
    rax = r14;
    return rax;
}

void * -[UICollectionViewFlowLayout indexesForSectionHeadersInRect:](void * self, void * _cmd, struct CGRect arg2) {
    return 0x0;
}

void * -[UICollectionViewFlowLayout indexesForSectionFootersInRect:](void * self, void * _cmd, struct CGRect arg2) {
    return 0x0;
}

void * -[UICollectionViewFlowLayout indexPathForItemAtPoint:](void * self, void * _cmd, struct CGPoint arg2) {
    return 0x0;
}

void * -[UICollectionViewFlowLayout layoutAttributesForHeaderInSection:usingData:](void * self, void * _cmd, NSInteger arg2, void * arg3) {
    r14 = arg2;
    r15 = self;
    [var_40 _frameForHeaderInSection:r15 usingData:r14, arg3];
    rbx = 0x0;
    if (CGRectEqualToRect(var_40, r15) == 0x0) {
            r15 = [[r15 class] layoutAttributesClass];
            rbx = [[NSIndexPath indexPathForItem:0x0 inSection:r14] retain];
            r14 = [[[r15 layoutAttributesForSupplementaryViewOfKind:@"UICollectionElementKindSectionHeader" withIndexPath:rbx] retain] autorelease];
            [rbx release];
            [r14 setFrame:@"UICollectionElementKindSectionHeader", rbx];
            if (*(int32_t *)__UIApplicationLinkedOnVersion != 0x0) {
                    if (*(int32_t *)__UIApplicationLinkedOnVersion >= 0x90000) {
                            [r14 setZIndex:0xa];
                    }
            }
            else {
                    if (__UIApplicationLinkedOnOrAfter(0x90000) != 0x0) {
                            [r14 setZIndex:0xa];
                    }
            }
            rbx = [r14 retain];
    }
    rdi = rbx;
    rax = [rdi autorelease];
    return rax;
}

void * -[UICollectionViewFlowLayout layoutAttributesForFooterInSection:usingData:](void * self, void * _cmd, NSInteger arg2, void * arg3) {
    r14 = arg2;
    r15 = self;
    [var_40 _frameForFooterInSection:r15 usingData:r14, arg3];
    rbx = 0x0;
    if (CGRectEqualToRect(var_40, r15) == 0x0) {
            r15 = [[r15 class] layoutAttributesClass];
            rbx = [[NSIndexPath indexPathForItem:0x0 inSection:r14] retain];
            r14 = [[[r15 layoutAttributesForSupplementaryViewOfKind:@"UICollectionElementKindSectionFooter" withIndexPath:rbx] retain] autorelease];
            [rbx release];
            [r14 setFrame:@"UICollectionElementKindSectionFooter", rbx];
            if (*(int32_t *)__UIApplicationLinkedOnVersion != 0x0) {
                    if (*(int32_t *)__UIApplicationLinkedOnVersion >= 0x90000) {
                            [r14 setZIndex:0xa];
                    }
            }
            else {
                    if (__UIApplicationLinkedOnOrAfter(0x90000) != 0x0) {
                            [r14 setZIndex:0xa];
                    }
            }
            rbx = [r14 retain];
    }
    rdi = rbx;
    rax = [rdi autorelease];
    return rax;
}

void * -[UICollectionViewFlowLayout layoutAttributesForItemAtIndexPath:usingData:](void * self, void * _cmd, void * arg2, void * arg3) {
    r13 = _cmd;
    r15 = self;
    r12 = [arg2 retain];
    r14 = [arg3 retain];
    rbx = [[r15 _existingLayoutAttributesForItemAtIndexPath:r12] retain];
    if (rbx != 0x0) {
            r15 = [rbx retain];
    }
    else {
            var_70 = r13;
            var_68 = rbx;
            var_58 = r14;
            var_60 = r15;
            r13 = [[r15 _sections] retain];
            var_50 = r12;
            r14 = [r12 section];
            if ((r13 != 0x0) && ([r13 containsIndex:r14] == 0x0)) {
                    r12 = _objc_msgSend;
                    rbx = [[NSString stringWithUTF8String:"/BuildRoot/Library/Caches/com.apple.xbs/Sources/UIKit_Sim/UIKit-3600.6.21/UICollectionViewFlowLayout.m"] retain];
                    rdi = @"<Unknown File>";
                    if (rbx != 0x0) {
                            rdi = rbx;
                    }
                    r15 = [rdi retain];
                    [rbx release];
                    r12 = [(r12)(@class(NSAssertionHandler), @selector(currentHandler), "/BuildRoot/Library/Caches/com.apple.xbs/Sources/UIKit_Sim/UIKit-3600.6.21/UICollectionViewFlowLayout.m") retain];
                    rbx = r15;
                    [r12 handleFailureInMethod:var_70 object:var_60 file:rbx lineNumber:0x205 description:@"request for layout attributes at index path (%@) when this flow layout only lays out sections in the set (%@)"];
                    rdi = rbx;
                    [rdi release];
                    [r12 release];
            }
            rax = [r13 firstIndex];
            r12 = 0x0;
            if (rax != r14) {
                    r12 = 0x0;
                    do {
                            if (r13 != 0x0) {
                                    rax = [r13 indexGreaterThanIndex:rax];
                            }
                            else {
                                    rax = rax + 0x1;
                            }
                            r12 = r12 + 0x1;
                    } while (rax != r14);
            }
            var_78 = [var_50 item];
            rax = [var_58 sections];
            rax = [rax retain];
            var_70 = rax;
            rax = [rax objectAtIndexedSubscript:r12];
            rax = [rax retain];
            var_80 = rax;
            [var_48 _frameForItem:var_60 inSection:var_78 usingData:r14, rax];
            r12 = var_50;
            r15 = [[var_60 _fetchAndCacheNewLayoutAttributesForCellWithIndexPath:r12 frame:var_40] retain];
            [var_80 release];
            [var_70 release];
            [r13 release];
            r14 = var_58;
            rbx = var_68;
    }
    [rbx release];
    [r14 release];
    [r12 release];
    rdi = r15;
    rax = [rdi autorelease];
    return rax;
}

void * -[UICollectionViewFlowLayout layoutAttributesForHeaderInSection:](void * self, void * _cmd, NSInteger arg2) {
    rax = [self layoutAttributesForHeaderInSection:arg2 usingData:self->_data];
    return rax;
}



void * -[UICollectionViewFlowLayout layoutAttributesForFooterInSection:](void * self, void * _cmd, NSInteger arg2) {
    rax = [self layoutAttributesForFooterInSection:arg2 usingData:self->_data];
    return rax;
}

void -[UICollectionViewFlowLayout _calculateAttributesForRect:](void * self, void * _cmd, struct CGRect arg2) {
    rdx = arg2;
    rdi = self;
    if (rdi->_gridLayoutFlags >= 0x0) {
            [rdi _fetchItemsInfoForRect:rdx, rcx];
    }
    return;
}

void * -[UICollectionViewFlowLayout layoutAttributesForItemAtIndexPath:](void * self, void * _cmd, void * arg2) {
    r15 = self;
    r13 = [arg2 retain];
    rbx = 0x0;
    if (r13 != 0x0) {
            if (r15->_gridLayoutFlags >= 0x0) {
                    rbx = [[[[r15 class] layoutAttributesClass] layoutAttributesForCellWithIndexPath:r13] retain];
            }
            else {
                    r12 = [[r15 _existingLayoutAttributesForItemAtIndexPath:r13] retain];
                    if (r12 != 0x0) {
                            rbx = [r12 retain];
                    }
                    else {
                            var_88 = r12;
                            rbx = [r13 copy];
                            var_80 = rbx;
                            var_78 = [r15 _sectionArrayIndexForIndexPath:rbx];
                            var_90 = [rbx item];
                            rbx = [[r15->_data sections] retain];
                            r12 = [[rbx objectAtIndex:var_78] retain];
                            [rbx release];
                            if (((r15->_gridLayoutFlags & 0xffff & 0x401) != 0x0) && ([r12 fixedItemSize] == 0x0)) {
                                    var_78 = r12;
                                    rcx = r15->_data;
                                    rdi = r15;
                                    r15 = var_80;
                                    rbx = [[rdi layoutAttributesForItemAtIndexPath:r15 usingData:rcx] retain];
                                    r12 = var_88;
                            }
                            else {
                                    if ([r15 _estimatesSizes] != 0x0) {
                                            var_78 = r12;
                                            rcx = r15->_data;
                                            rdi = r15;
                                            r15 = var_80;
                                            rbx = [[rdi layoutAttributesForItemAtIndexPath:r15 usingData:rcx] retain];
                                            r12 = var_88;
                                    }
                                    else {
                                            var_78 = r12;
                                            var_91 = [r15->_data horizontal];
                                            r12 = [[r15 collectionView] retain];
                                            rcx = 0x1;
                                            if ([r12 _shouldReverseLayoutDirection] != 0x0) {
                                                    rcx = [r15 _wantsRightToLeftHorizontalMirroringIfNeeded];
                                            }
                                            var_A0 = rcx;
                                            [r12 release];
                                            rbx = var_78;
                                            rax = [rbx itemsByRowCount];
                                            var_B8 = var_90 / rax;
                                            rax = [rbx itemsByRowCount];
                                            temp_7 = var_90 % rax;
                                            rdx = temp_7;
                                            rcx = var_A0;
                                            var_C0 = rdx;
                                            if (rcx == 0x0) {
                                                    rax = var_91 ^ 0x1;
                                                    if (rax == 0x0) {
                                                            r14 = [rbx itemsCount];
                                                            rax = [rbx itemsByRowCount];
                                                            r12 = r14 / rax;
                                                            r14 = [rbx itemsCount];
                                                            rax = [rbx itemsByRowCount];
                                                            temp_3 = r14 % rax;
                                                            rdx = temp_3;
                                                            rcx = !var_B8 + r12;
                                                            rcx = rcx + ((rdx != 0x0 ? 0x1 : 0x0) & 0xff);
                                                            var_B8 = rcx;
                                                    }
                                                    else {
                                                            rcx = rcx | var_91;
                                                            if (rcx == 0x0) {
                                                                    rcx = !var_C0 + [rbx itemsByRowCount];
                                                                    var_C0 = rcx;
                                                            }
                                                    }
                                            }
                                            else {
                                                    rcx = rcx | var_91;
                                                    if (rcx == 0x0) {
                                                            rcx = !var_C0 + [rbx itemsByRowCount];
                                                            var_C0 = rcx;
                                                    }
                                            }
                                            [rbx itemSize];
                                            var_A8 = intrinsic_movsd(var_A8, xmm0);
                                            var_78 = intrinsic_movsd(var_78, xmm1);
                                            [rbx itemSize];
                                            var_B0 = intrinsic_movsd(var_B0, xmm1);
                                            if (var_91 == 0x0) {
                                                    xmm1 = intrinsic_movsd(xmm1, var_78);
                                                    var_A8 = intrinsic_movsd(var_A8, xmm1);
                                            }
                                            if (!CPU_FLAGS & NE) {
                                                    var_B0 = intrinsic_movsd(var_B0, xmm0);
                                            }
                                            if (rbx != 0x0) {
                                                    rdx = @selector(frame);
                                                    objc_msgSend_stret(var_50, rbx, rdx);
                                                    xmm0 = intrinsic_movsd(xmm0, var_50);
                                                    var_90 = intrinsic_movsd(var_90, xmm0);
                                                    xmm0 = intrinsic_movsd(xmm0, var_48);
                                                    var_A0 = intrinsic_movsd(var_A0, xmm0);
                                            }
                                            else {
                                                    xmm0 = intrinsic_xorpd(xmm0, xmm0);
                                                    intrinsic_movapd(var_40, xmm0);
                                                    intrinsic_movapd(var_50, xmm0);
                                                    xmm0 = intrinsic_xorpd(xmm0, xmm0);
                                                    var_A0 = intrinsic_movsd(var_A0, xmm0);
                                                    xmm0 = intrinsic_xorpd(xmm0, xmm0);
                                                    var_90 = intrinsic_movsd(var_90, xmm0);
                                            }
                                            r14 = [rbx rowAlignmentOptions];
                                            if ([rbx lastRowIncomplete] != 0x0) {
                                                    rax = [rbx indexOfIncompleteRow];
                                                    if ((r14 != 0x3) && (var_B8 == rax)) {
                                                            [rbx lastRowBeginMargin];
                                                            var_78 = intrinsic_movsd(var_78, xmm0);
                                                            rsi = @selector(lastRowActualGap);
                                                    }
                                                    else {
                                                            [rbx beginMargin];
                                                            var_78 = intrinsic_movsd(var_78, xmm0);
                                                            rsi = @selector(actualGap);
                                                    }
                                            }
                                            else {
                                                    [rbx beginMargin];
                                                    var_78 = intrinsic_movsd(var_78, xmm0);
                                                    rsi = @selector(actualGap);
                                            }
                                            _objc_msgSend(rbx, rsi);
                                            xmm1 = intrinsic_cvtsi2sd(xmm1, var_C0);
                                            xmm0 = intrinsic_addsd(xmm0, var_B0);
                                            xmm0 = intrinsic_mulsd(xmm0, xmm1);
                                            xmm0 = intrinsic_addsd(xmm0, var_78);
                                            var_C0 = intrinsic_movsd(var_C0, xmm0);
                                            [rbx otherMargin];
                                            var_C8 = intrinsic_movsd(var_C8, xmm0);
                                            xmm0 = intrinsic_cvtsi2sd(0x0, var_B8);
                                            var_B8 = intrinsic_movsd(var_B8, xmm0);
                                            var_78 = rbx;
                                            [rbx verticalInterstice];
                                            xmm0 = intrinsic_addsd(xmm0, var_A8);
                                            xmm0 = intrinsic_mulsd(xmm0, var_B8);
                                            xmm0 = intrinsic_addsd(xmm0, var_C8);
                                            var_C8 = intrinsic_movsd(var_C8, xmm0);
                                            rbx = [[r15 collectionView] retain];
                                            [rbx _currentScreenScale];
                                            var_B8 = intrinsic_movsd(var_B8, xmm0);
                                            [rbx release];
                                            if (var_91 != 0x0) {
                                                    xmm0 = intrinsic_movsd(xmm0, var_90);
                                                    xmm0 = intrinsic_addsd(xmm0, var_C8);
                                                    var_90 = intrinsic_movsd(var_90, xmm0);
                                                    if ([r15 _roundsToScreenScale] != 0x0) {
                                                            xmm0 = intrinsic_xorpd(xmm0, xmm0);
                                                            xmm1 = intrinsic_movsd(xmm1, var_B8);
                                                            xmm1 = intrinsic_ucomisd(xmm1, xmm0);
                                                            xmm2 = intrinsic_movapd(xmm2, xmm1);
                                                            if ((xmm1 == 0x0) && (!CPU_FLAGS & P)) {
                                                                    if (*_AdjustToScale.onceToken != 0xffffffffffffffff) {
                                                                            dispatch_once(_AdjustToScale.onceToken, ^ {/* block implemented at ___AdjustToScale_block_invoke_9b16a4 */ } });
                                                                            xmm1 = intrinsic_movsd(xmm1, var_B8);
                                                                    }
                                                                    xmm2 = intrinsic_movsd(xmm2, *_AdjustToScale.__s);
                                                            }
                                                            var_B8 = intrinsic_movsd(var_B8, xmm1);
                                                            xmm2 = intrinsic_ucomisd(xmm2, *0xc4f410);
                                                            xmm0 = intrinsic_movsd(xmm0, var_90);
                                                            if ((xmm2 == 0x0) && (!CPU_FLAGS & P)) {
                                                                    round(xmm0);
                                                            }
                                                            else {
                                                                    xmm0 = intrinsic_mulsd(xmm0, xmm2);
                                                                    var_90 = intrinsic_movsd(var_90, xmm2);
                                                                    round(xmm0);
                                                                    xmm0 = intrinsic_divsd(xmm0, var_90);
                                                            }
                                                            var_90 = intrinsic_movsd(var_90, xmm0);
                                                    }
                                                    xmm0 = intrinsic_movsd(xmm0, var_A0);
                                                    xmm0 = intrinsic_addsd(xmm0, var_C0);
                                                    var_A0 = intrinsic_movsd(var_A0, xmm0);
                                                    if ([r15 _roundsToScreenScale] != 0x0) {
                                                            xmm0 = intrinsic_xorpd(xmm0, xmm0);
                                                            xmm1 = intrinsic_movsd(xmm1, var_B8);
                                                            xmm1 = intrinsic_ucomisd(xmm1, xmm0);
                                                            if ((xmm1 == 0x0) && (!CPU_FLAGS & P)) {
                                                                    if (*_AdjustToScale.onceToken != 0xffffffffffffffff) {
                                                                            dispatch_once(_AdjustToScale.onceToken, ^ {/* block implemented at ___AdjustToScale_block_invoke_9b16a4 */ } });
                                                                    }
                                                                    xmm1 = intrinsic_movsd(xmm1, *_AdjustToScale.__s);
                                                            }
                                                            xmm1 = intrinsic_ucomisd(xmm1, *0xc4f410);
                                                            r12 = var_88;
                                                            xmm0 = intrinsic_movsd(xmm0, var_A0);
                                                            if ((xmm1 == 0x0) && (!CPU_FLAGS & P)) {
                                                                    round(xmm0);
                                                            }
                                                            else {
                                                                    xmm0 = intrinsic_mulsd(xmm0, xmm1);
                                                                    var_B8 = intrinsic_movsd(var_B8, xmm1);
                                                                    round(xmm0);
                                                                    xmm0 = intrinsic_divsd(xmm0, var_B8);
                                                            }
                                                    }
                                                    else {
                                                            r12 = var_88;
                                                            xmm0 = intrinsic_movsd(xmm0, var_A0);
                                                    }
                                                    var_70 = intrinsic_movsd(var_70, intrinsic_movsd(xmm1, var_90));
                                                    var_68 = intrinsic_movsd(var_68, xmm0);
                                                    xmm0 = intrinsic_movsd(xmm0, var_A8);
                                                    var_60 = intrinsic_movsd(var_60, xmm0);
                                                    xmm0 = intrinsic_movsd(xmm0, var_B0);
                                            }
                                            else {
                                                    xmm0 = intrinsic_movsd(xmm0, var_90);
                                                    xmm0 = intrinsic_addsd(xmm0, var_C0);
                                                    var_90 = intrinsic_movsd(var_90, xmm0);
                                                    if ([r15 _roundsToScreenScale] != 0x0) {
                                                            xmm0 = intrinsic_xorpd(xmm0, xmm0);
                                                            xmm1 = intrinsic_movsd(xmm1, var_B8);
                                                            xmm1 = intrinsic_ucomisd(xmm1, xmm0);
                                                            xmm2 = intrinsic_movapd(xmm2, xmm1);
                                                            if ((xmm1 == 0x0) && (!CPU_FLAGS & P)) {
                                                                    if (*_AdjustToScale.onceToken != 0xffffffffffffffff) {
                                                                            dispatch_once(_AdjustToScale.onceToken, ^ {/* block implemented at ___AdjustToScale_block_invoke_9b16a4 */ } });
                                                                            xmm1 = intrinsic_movsd(xmm1, var_B8);
                                                                    }
                                                                    xmm2 = intrinsic_movsd(xmm2, *_AdjustToScale.__s);
                                                            }
                                                            var_B8 = intrinsic_movsd(var_B8, xmm1);
                                                            xmm2 = intrinsic_ucomisd(xmm2, *0xc4f410);
                                                            xmm0 = intrinsic_movsd(xmm0, var_90);
                                                            if ((xmm2 == 0x0) && (!CPU_FLAGS & P)) {
                                                                    round(xmm0);
                                                            }
                                                            else {
                                                                    xmm0 = intrinsic_mulsd(xmm0, xmm2);
                                                                    var_90 = intrinsic_movsd(var_90, xmm2);
                                                                    round(xmm0);
                                                                    xmm0 = intrinsic_divsd(xmm0, var_90);
                                                            }
                                                            var_90 = intrinsic_movsd(var_90, xmm0);
                                                    }
                                                    xmm0 = intrinsic_movsd(xmm0, var_A0);
                                                    xmm0 = intrinsic_addsd(xmm0, var_C8);
                                                    var_A0 = intrinsic_movsd(var_A0, xmm0);
                                                    if ([r15 _roundsToScreenScale] != 0x0) {
                                                            xmm0 = intrinsic_xorpd(xmm0, xmm0);
                                                            xmm1 = intrinsic_movsd(xmm1, var_B8);
                                                            xmm1 = intrinsic_ucomisd(xmm1, xmm0);
                                                            if ((xmm1 == 0x0) && (!CPU_FLAGS & P)) {
                                                                    if (*_AdjustToScale.onceToken != 0xffffffffffffffff) {
                                                                            dispatch_once(_AdjustToScale.onceToken, ^ {/* block implemented at ___AdjustToScale_block_invoke_9b16a4 */ } });
                                                                    }
                                                                    xmm1 = intrinsic_movsd(xmm1, *_AdjustToScale.__s);
                                                            }
                                                            xmm1 = intrinsic_ucomisd(xmm1, *0xc4f410);
                                                            r12 = var_88;
                                                            xmm0 = intrinsic_movsd(xmm0, var_A0);
                                                            if ((xmm1 == 0x0) && (!CPU_FLAGS & P)) {
                                                                    round(xmm0);
                                                            }
                                                            else {
                                                                    xmm0 = intrinsic_mulsd(xmm0, xmm1);
                                                                    var_B8 = intrinsic_movsd(var_B8, xmm1);
                                                                    round(xmm0);
                                                                    xmm0 = intrinsic_divsd(xmm0, var_B8);
                                                            }
                                                    }
                                                    else {
                                                            r12 = var_88;
                                                            xmm0 = intrinsic_movsd(xmm0, var_A0);
                                                    }
                                                    var_70 = intrinsic_movsd(var_70, intrinsic_movsd(xmm1, var_90));
                                                    var_68 = intrinsic_movsd(var_68, xmm0);
                                                    xmm0 = intrinsic_movsd(xmm0, var_B0);
                                                    var_60 = intrinsic_movsd(var_60, xmm0);
                                                    xmm0 = intrinsic_movsd(xmm0, var_A8);
                                            }
                                            intrinsic_movsd(var_58, xmm0);
                                            rdi = r15;
                                            r15 = var_80;
                                            rbx = [[rdi _fetchAndCacheNewLayoutAttributesForCellWithIndexPath:r15 frame:rcx] retain];
                                    }
                            }
                            [var_78 release];
                            [r15 release];
                    }
                    [r12 release];
            }
    }
    [r13 release];
    rdi = rbx;
    rax = [rdi autorelease];
    return rax;
}

void * -[UICollectionViewFlowLayout layoutAttributesForSupplementaryViewOfKind:atIndexPath:](void * self, void * _cmd, void * arg2, void * arg3) {
    r15 = self;
    r14 = [arg2 retain];
    r12 = [arg3 retain];
    rbx = 0x0;
    if (r12 == 0x0) goto loc_9aa210;

loc_9aa176:
    if ([r14 isEqualToString:@"UICollectionElementKindSectionHeader"] == 0x0) goto loc_9aa1bd;

loc_9aa194:
    rax = [r12 indexAtPosition:0x0];
    rcx = r15->_data;
    rsi = @selector(layoutAttributesForHeaderInSection:usingData:);
    goto loc_9aa1fd;

loc_9aa1fd:
    rbx = [_objc_msgSend(r15, rsi, rax, rcx) retain];
    goto loc_9aa210;

loc_9aa210:
    [r12 release];
    [r14 release];
    rdi = rbx;
    rax = [rdi autorelease];
    return rax;

loc_9aa1bd:
    rbx = 0x0;
    if ([r14 isEqualToString:@"UICollectionElementKindSectionFooter"] == 0x0) goto loc_9aa210;

loc_9aa1d6:
    rax = [r12 indexAtPosition:0x0];
    rcx = r15->_data;
    rsi = @selector(layoutAttributesForFooterInSection:usingData:);
    goto loc_9aa1fd;
}

bool -[UICollectionViewFlowLayout shouldInvalidateLayoutForPreferredLayoutAttributes:withOriginalAttributes:](void * self, void * _cmd, void * arg2, void * arg3) {
    var_40 = [arg2 retain];
    var_38 = [arg3 retain];
    rbx = [self _estimatesSizes];
    var_30 = [arg3 representedElementCategory];
    [arg2 size];
    var_50 = intrinsic_movsd(var_50, xmm0);
    var_48 = intrinsic_movsd(var_48, xmm1);
    [var_40 release];
    [arg3 size];
    var_58 = intrinsic_movsd(var_58, xmm0);
    var_40 = intrinsic_movsd(var_40, xmm1);
    rax = [var_38 release];
    xmm0 = intrinsic_movsd(xmm0, var_50);
    xmm0 = intrinsic_ucomisd(xmm0, var_58);
    COND = xmm0 != 0x0;
    asm { setp       al };
    rcx = (COND ? 0x1 : 0x0) | rax;
    xmm0 = intrinsic_movsd(xmm0, var_48);
    xmm0 = intrinsic_ucomisd(xmm0, var_40);
    COND = xmm0 != 0x0;
    asm { setp       al };
    rax = rbx & (var_30 == 0x0 ? 0x1 : 0x0) & ((COND ? 0x1 : 0x0) | rax | rcx);
    return rax;
}

void * -[UICollectionViewFlowLayout invalidationContextForPreferredLayoutAttributes:withOriginalAttributes:](void * self, void * _cmd, void * arg2, void * arg3) {
    rcx = arg3;
    r12 = rcx;
    r15 = self;
    rbx = [arg2 retain];
    var_50 = rbx;
    var_58 = [r12 retain];
    [rbx size];
    var_40 = intrinsic_movsd(var_40, xmm0);
    var_48 = intrinsic_movsd(var_48, xmm1);
    [r12 size];
    xmm0 = intrinsic_ucomisd(xmm0, var_40);
    if ((xmm0 == 0x0) && (!CPU_FLAGS & P)) {
            xmm1 = intrinsic_ucomisd(xmm1, var_48);
            if (xmm1 == 0x0) {
                    if (!CPU_FLAGS & NP) {
                            rbx = [r12 indexPath];
                            [var_58 release];
                            r12 = [rbx retain];
                            xmm0 = intrinsic_movsd(xmm0, var_40);
                            xmm1 = intrinsic_movsd(xmm1, var_48);
                            rdx = r12;
                            rbx = [[r15->_data setSize:rdx forItemAtIndexPath:rcx] retain];
                            [r12 release];
                            r13 = var_50;
                    }
                    else {
                            r13 = var_50;
                            rcx = var_58;
                            r14 = [[r15 super] invalidationContextForPreferredLayoutAttributes:r13 withOriginalAttributes:rcx];
                            [var_58 release];
                            rbx = [r14 retain];
                            [rbx setInvalidateFlowLayoutAttributes:0x0];
                            rdx = 0x0;
                            [rbx setInvalidateFlowLayoutDelegateMetrics:rdx];
                    }
            }
            else {
                    rbx = [r12 indexPath];
                    [var_58 release];
                    r12 = [rbx retain];
                    xmm0 = intrinsic_movsd(xmm0, var_40);
                    xmm1 = intrinsic_movsd(xmm1, var_48);
                    rdx = r12;
                    rbx = [[r15->_data setSize:rdx forItemAtIndexPath:rcx] retain];
                    [r12 release];
                    r13 = var_50;
            }
    }
    else {
            rbx = [r12 indexPath];
            [var_58 release];
            r12 = [rbx retain];
            xmm0 = intrinsic_movsd(xmm0, var_40);
            xmm1 = intrinsic_movsd(xmm1, var_48);
            rdx = r12;
            rbx = [[r15->_data setSize:rdx forItemAtIndexPath:rcx] retain];
            [r12 release];
            r13 = var_50;
    }
    xmm0 = intrinsic_movsd(xmm0, r15->_contentOffsetAdjustment);
    xmm1 = intrinsic_movsd(xmm1, *(r15 + *_OBJC_IVAR_$_UICollectionViewFlowLayout._contentOffsetAdjustment + 0x8));
    [rbx setContentOffsetAdjustment:rdx, rcx];
    intrinsic_movsd(xmm0, r15->_contentSizeAdjustment);
    intrinsic_movsd(xmm1, *(r15 + *_OBJC_IVAR_$_UICollectionViewFlowLayout._contentSizeAdjustment + 0x8));
    [rbx setContentSizeAdjustment:rdx, rcx];
    [r13 release];
    rdi = rbx;
    rax = [rdi autorelease];
    return rax;
}

bool -[UICollectionViewFlowLayout _estimatesSizes](void * self, void * _cmd) {
    xmm0 = intrinsic_movupd(xmm0, self->_estimatedItemSize);
    xmm1 = intrinsic_movupd(xmm1, *(int128_t *)_CGSizeZero);
    asm { cmpneqpd   xmm1, xmm0 };
    rax = (intrinsic_movapd(var_10, xmm1) | var_8) & 0x1;
    return rax;
}
bool -[UICollectionViewFlowLayout _cellsShouldConferWithAutolayoutEngineForSizingInfo](void * self, void * _cmd) {
    rax = [self _estimatesSizes];
    return rax;
}

void -[UICollectionViewFlowLayout _resetCachedItems](void * self, void * _cmd) {
    [self->_cachedItemAttributes removeAllObjects];
    [self->_cachedItemFrames removeAllObjects];
    return;
}
struct CGSize -[UICollectionViewFlowLayout _effectiveEstimatedItemSize](void * self, void * _cmd) {
    
    if (CGSizeEqual)
    
    rdi = self;
    
    
    rax = *_OBJC_IVAR_$_UICollectionViewFlowLayout._estimatedItemSize;
    xmm0 = intrinsic_movsd(xmm0, *(rdi + rax));
    xmm1 = intrinsic_movsd(xmm1, *(rdi + rax + 0x8));
    xmm0 = intrinsic_ucomisd(xmm0, *0xc4f6f8);
    if ((xmm0 == 0x0) && (!CPU_FLAGS & P)) {
            xmm1 = intrinsic_ucomisd(xmm1, *0xc4f6f8);
            if ((xmm1 == 0x0) && (!CPU_FLAGS & P)) {
                    stack[2047] = rbp;
                    rsp = rsp - 0x8;
                    [rdi->_data computedEstimatedSize];
                    xmm3 = intrinsic_movapd(xmm3, xmm0);
                    xmm2 = intrinsic_movapd(xmm2, xmm1);
                    rax = _CGSizeZero;
                    xmm3 = intrinsic_ucomisd(xmm3, *rax);
                    COND = xmm3 == 0x0;
                    asm { setnp      cl };
                    rdx = (COND ? 0x1 : 0x0) & rcx;
                    xmm2 = intrinsic_ucomisd(xmm2, *(rax + 0x8));
                    COND = xmm2 == 0x0;
                    asm { setnp      cl };
                    rax = (COND ? 0x1 : 0x0) & rcx & rdx;
                    xmm1 = intrinsic_movsd(xmm1, *0xc4fba0);
                    xmm0 = intrinsic_movapd(xmm0, xmm1);
                    if (rax == 0x0) {
                            intrinsic_movapd(xmm0, xmm3);
                    }
                    if (rax == 0x0) {
                            intrinsic_movapd(xmm1, xmm2);
                    }
            }
    }
    return rax;
}
void * -[UICollectionViewFlowLayout _fetchAndCacheNewLayoutAttributesForCellWithIndexPath:frame:](void * self, void * _cmd, void * arg2, struct CGRect arg3) {
    rcx = arg3;
    r14 = arg2;
    r15 = self;
    rbx = 0x0;
    if (r14 != 0x0) {
            r13 = arg_0;
            rbx = [[[[r15 class] layoutAttributesClass] layoutAttributesForCellWithIndexPath:r14] retain];
            [rbx setFrame:r14, rcx];
            if ([r15 _estimatesSizes] == 0x0) {
                    [r15->_cachedItemAttributes setObject:rbx forKeyedSubscript:r14];
                    r13 = [[NSValue valueWithCGRect:rbx, *(r13 + 0x8)] retain];
                    [r15->_cachedItemFrames setObject:r13 forKeyedSubscript:r14];
                    [r13 release];
            }
    }
    rdi = rbx;
    rax = [rdi autorelease];
    return rax;
}

void * -[UICollectionViewFlowLayout _existingLayoutAttributesForItemAtIndexPath:](void * self, void * _cmd, void * arg2) {
    r12 = self;
    r15 = [arg2 retain];
    r14 = [[r12->_cachedItemFrames objectForKeyedSubscript:r15] retain];
    r13 = 0x0;
    if (r14 != 0x0) {
            rdx = r15;
            r13 = [[r12->_cachedItemAttributes objectForKeyedSubscript:rdx] retain];
            if (r13 != 0x0) {
                    [var_48 CGRectValue];
                    [var_68 frame];
                    if (CGRectEqualToRect(var_68, r13) == 0x0) {
                            var_A0 = [r15 retain];
                            var_98 = r13;
                            var_C8 = [r13 retain];
                            var_90 = [r12 retain];
                            if (*__existingLayoutAttributesForItemAtIndexPath:.onceToken != 0xffffffffffffffff) {
                                    dispatch_once(__existingLayoutAttributesForItemAtIndexPath:.onceToken, __NSConcreteStackBlock);
                            }
                            r12->_cachedItemAttributes = 0x0;
                            [r12->_cachedItemAttributes release];
                            r12->_cachedItemFrames = 0x0;
                            [r12->_cachedItemFrames release];
                            r13 = [r13 copy];
                            [var_C8 release];
                            [r13 setFrame:rdx, rcx];
                            [var_90 release];
                            [var_98 release];
                            [var_A0 release];
                    }
            }
    }
    [r14 release];
    [r15 release];
    rdi = r13;
    rax = [rdi autorelease];
    return rax;
}

int ___74-[UICollectionViewFlowLayout _existingLayoutAttributesForItemAtIndexPath:]_block_invoke(int arg0) {
    r13 = arg0;
    rdi = @"Logging only once for UICollectionViewFlowLayout cache mismatched frame";
    NSLog(rdi);
    var_58 = *(r13 + 0x20);
    rsi = *(r13 + 0x28);
    if (rsi != 0x0) {
            rdi = var_50;
            [rdi frame];
    }
    else {
            var_40 = intrinsic_movaps(var_40, 0x0);
            var_50 = intrinsic_movaps(var_50, 0x0);
    }
    rdi = _NSStringFromCGRect(rdi, rsi);
    r12 = [rdi retain];
    rbx = [_NSStringFromCGRect(rdi, rsi) retain];
    r14 = [[NSString stringWithFormat:@"UICollectionViewFlowLayout has cached frame mismatch for index path %@ - cached value: %@; expected value: %@", var_58, r12, rbx] retain];
    [rbx release];
    [r12 release];
    NSLog(@"%@", r14);
    if ([*(r13 + 0x30) isMemberOfClass:[UICollectionViewFlowLayout class]] != 0x0) {
            NSLog(@"This is likely a bug internal to UICollectionViewFlowLayout - please file against UIKit :)");
    }
    else {
            rbx = [NSStringFromClass([*(r13 + 0x30) class]) retain];
            NSLog(@"This is likely occurring because the flow layout subclass %@ is modifying attributes returned by UICollectionViewFlowLayout without copying them", rbx);
            [rbx release];
    }
    rax = [r14 release];
    return rax;
}

bool -[UICollectionViewFlowLayout _boundsAndInsetsAreValidForReferenceDimension](void * self, void * _cmd) {
    r12 = self;
    rbx = [[self collectionView] retain];
    if (rbx != 0x0) {
            [var_40 bounds];
    }
    else {
            var_30 = intrinsic_movaps(var_30, 0x0);
            intrinsic_movaps(var_40, 0x0);
    }
    [rbx release];
    if (r12->_scrollDirection == 0x0) goto loc_9aac3e;

loc_9aabf5:
    xmm0 = intrinsic_movsd(0x0, var_28);
    var_C8 = intrinsic_movsd(var_C8, xmm0);
    r15 = [[r12 collectionView] retain];
    if (r15 != 0x0) {
            [var_A0 contentInset];
            xmm0 = intrinsic_movsd(xmm0, var_A0);
    }
    else {
            xmm0 = intrinsic_xorpd(xmm0, xmm0);
            intrinsic_movapd(var_90, xmm0);
            intrinsic_movapd(var_A0, xmm0);
            xmm0 = intrinsic_xorpd(xmm0, xmm0);
    }
    xmm1 = intrinsic_movsd(xmm1, var_C8);
    xmm1 = intrinsic_subsd(xmm1, xmm0);
    var_C8 = intrinsic_movsd(var_C8, xmm1);
    rbx = [[r12 collectionView] retain];
    if (rbx == 0x0) goto loc_9aacf3;

loc_9aacd0:
    [var_C0 contentInset];
    xmm0 = intrinsic_movsd(xmm0, var_B0);
    goto loc_9aad77;

loc_9aad77:
    xmm1 = intrinsic_movsd(xmm1, var_C8);
    xmm1 = intrinsic_subsd(xmm1, xmm0);
    var_C8 = intrinsic_movsd(var_C8, xmm1);
    [rbx release];
    [r15 release];
    xmm0 = intrinsic_xorpd(xmm0, xmm0);
    xmm1 = intrinsic_xorpd(xmm1, xmm1);
    xmm1 = intrinsic_maxsd(xmm1, var_C8);
    xmm1 = intrinsic_ucomisd(xmm1, xmm0);
    rax = xmm1 > 0x0 ? 0x1 : 0x0;
    return rax;

loc_9aacf3:
    xmm0 = intrinsic_xorpd(xmm0, xmm0);
    intrinsic_movapd(var_B0, xmm0);
    intrinsic_movapd(var_C0, xmm0);
    goto loc_9aad73;

loc_9aad73:
    xmm0 = intrinsic_xorpd(xmm0, xmm0);
    goto loc_9aad77;

loc_9aac3e:
    xmm0 = intrinsic_movsd(0x0, var_30);
    var_C8 = intrinsic_movsd(var_C8, xmm0);
    r15 = [[r12 collectionView] retain];
    if (r15 != 0x0) {
            [var_60 contentInset];
            xmm0 = intrinsic_movsd(xmm0, var_58);
    }
    else {
            xmm0 = intrinsic_xorpd(xmm0, xmm0);
            intrinsic_movapd(var_50, xmm0);
            intrinsic_movapd(var_60, xmm0);
            xmm0 = intrinsic_xorpd(xmm0, xmm0);
    }
    xmm1 = intrinsic_movsd(xmm1, var_C8);
    xmm1 = intrinsic_subsd(xmm1, xmm0);
    var_C8 = intrinsic_movsd(var_C8, xmm1);
    rbx = [[r12 collectionView] retain];
    if (rbx == 0x0) goto loc_9aad65;

loc_9aad4b:
    [var_80 contentInset];
    xmm0 = intrinsic_movsd(xmm0, var_68);
    goto loc_9aad77;

loc_9aad65:
    xmm0 = intrinsic_xorpd(xmm0, xmm0);
    intrinsic_movapd(var_70, xmm0);
    intrinsic_movapd(var_80, xmm0);
    goto loc_9aad73;
}

void * -[UICollectionViewFlowLayout _layoutAttributesForItemsInRect:](void * self, void * _cmd, struct CGRect arg2) {
    rdx = arg2;
    r14 = self;
    r13 = *___stack_chk_guard;
    var_30 = r13;
    if (CGRectIsEmpty(self) != 0x0) goto loc_9aaf3c;

loc_9aae22:
    rdi = [r14 collectionView];
    r15 = [rdi retain];
    r12 = *___stack_chk_guard;
    if (r15 != 0x0) {
            rdx = @selector(bounds);
            rdi = var_1D0;
            objc_msgSend_stret(rdi, r15, rdx);
    }
    else {
            xmm0 = intrinsic_xorpd(xmm0, xmm0);
            var_1C0 = intrinsic_movapd(var_1C0, xmm0);
            var_1D0 = intrinsic_movapd(var_1D0, xmm0);
    }
    rbx = CGRectIsEmpty(rdi);
    [r15 release];
    r13 = r12;
    if ((rbx != 0x0) || ([r14 _boundsAndInsetsAreValidForReferenceDimension] == 0x0)) goto loc_9aaf3c;

loc_9aaecf:
    var_3B0 = [[NSMutableArray array] retain];
    rbx = [[r14 collectionView] retain];
    if ([rbx _shouldReverseLayoutDirection] != 0x0) {
            r12 = r14;
            var_444 = [r14 _wantsRightToLeftHorizontalMirroringIfNeeded] ^ 0x1;
    }
    else {
            r12 = r14;
            var_444 = 0x0;
    }
    var_340 = r12;
    [rbx release];
    r14 = *_OBJC_IVAR_$_UICollectionViewFlowLayout._data;
    var_5C8 = r14;
    r13 = r12;
    goto loc_9ab06a;

loc_9ab06a:
    [r13 _fetchItemsInfoForRect:rdx, rcx];
    rbx = [[*(r13 + r14) sections] retain];
    rax = [r13 _sections];
    rax = [rax retain];
    var_4B8 = rax;
    r13 = [rax firstIndex];
    xmm0 = intrinsic_xorpd(xmm0, xmm0);
    var_1E0 = intrinsic_movapd(var_1E0, xmm0);
    var_1F0 = intrinsic_movapd(var_1F0, xmm0);
    var_200 = intrinsic_movapd(var_200, xmm0);
    var_210 = intrinsic_movapd(var_210, xmm0);
    rbx = [rbx retain];
    rax = [rbx countByEnumeratingWithState:var_210 objects:var_B0 count:0x10];
    var_4B0 = rax;
    if (rax == 0x0) goto loc_9ac9e1;

loc_9ab147:
    var_4F0 = rbx;
    var_4C0 = *var_200;
    var_3D8 = 0x0;
    goto loc_9ab18d;

loc_9ab18d:
    r14 = var_250;
    rdx = 0x0;
    r12 = var_340;
    goto loc_9ab2c6;

loc_9ab2c6:
    if (*var_200 != var_4C0) {
            objc_enumerationMutation(var_4F0);
            rdx = rdx;
    }
    rsi = *(var_208 + rdx * 0x8);
    if (rsi != 0x0) {
            var_470 = rdx;
            rbx = rsi;
            [var_230 frame];
    }
    else {
            rbx = rsi;
            var_470 = rdx;
            xmm0 = intrinsic_xorpd(xmm0, xmm0);
            var_220 = intrinsic_movapd(var_220, xmm0);
            var_230 = intrinsic_movapd(var_230, xmm0);
    }
    if ((var_444 != 0x0) && (r12->_scrollDirection == 0x1)) {
            rsi = @selector(contentSize);
            _objc_msgSend(r12->_data, rsi);
            xmm0 = intrinsic_subsd(xmm0, var_230);
            xmm0 = intrinsic_subsd(xmm0, var_220);
            var_230 = intrinsic_movsd(var_230, xmm0);
    }
    CGRectIntersection(r14, rsi);
    if ((CGRectIsNull(r14) != 0x0) || ([rbx itemsCount] == 0x0)) goto loc_9ac958;

loc_9ab436:
    r14 = rbx;
    if (([rbx fixedItemSize] == 0x0) || ([r12 _estimatesSizes] != 0x0)) goto loc_9ab465;

loc_9abaa1:
    rdi = r12->_data;
    rax = [rdi horizontal];
    var_400 = rax;
    xmm0 = intrinsic_pshufd(zero_extend_32(rax & 0xff), 0x44);
    xmm0 = intrinsic_psllq(xmm0, 0x3f);
    xmm0 = intrinsic_psrad(xmm0, 0x1f);
    xmm2 = intrinsic_pshufd(xmm0, 0xf5);
    xmm0 = intrinsic_movsd(xmm0, var_230);
    xmm1 = intrinsic_movsd(xmm1, var_228);
    xmm1 = intrinsic_pslldq(xmm1, 0x8);
    xmm0 = intrinsic_andpd(xmm0, xmm2);
    xmm2 = intrinsic_pandn(xmm2, xmm1);
    xmm2 = intrinsic_por(xmm2, xmm0);
    var_430 = intrinsic_movdqa(var_430, xmm2);
    xmm0 = intrinsic_movapd(xmm0, var_250);
    xmm0 = intrinsic_subpd(xmm0, xmm2);
    xmm1 = intrinsic_movapd(xmm1, var_240);
    var_270 = intrinsic_movapd(var_270, xmm0);
    var_260 = intrinsic_movapd(var_260, xmm1);
    if ((var_444 != 0x0) && (r12->_scrollDirection == 0x1)) {
            xmm2 = intrinsic_movsd(xmm2, var_220);
            xmm2 = intrinsic_subsd(xmm2, xmm0);
            xmm2 = intrinsic_subsd(xmm2, xmm1);
            var_270 = intrinsic_movsd(var_270, xmm2);
    }
    CGRectGetMinX(rdi);
    var_360 = intrinsic_movsd(var_360, xmm0);
    CGRectGetMinY(rdi);
    var_338 = intrinsic_movsd(var_338, xmm0);
    CGRectGetMaxX(rdi);
    var_368 = intrinsic_movsd(var_368, xmm0);
    CGRectGetMaxY(rdi);
    var_380 = intrinsic_movsd(var_380, xmm0);
    [r14 itemSize];
    var_3E0 = intrinsic_movsd(var_3E0, xmm0);
    var_388 = intrinsic_movsd(var_388, xmm1);
    [r14 itemSize];
    xmm2 = intrinsic_movsd(xmm2, var_338);
    var_3B8 = intrinsic_movsd(var_3B8, xmm1);
    xmm1 = intrinsic_movapd(xmm1, xmm2);
    if (var_400 == 0x0) {
            xmm1 = intrinsic_movsd(xmm1, var_360);
    }
    var_370 = intrinsic_movsd(var_370, xmm1);
    if (!CPU_FLAGS & NE) {
            var_360 = intrinsic_movsd(var_360, xmm2);
    }
    xmm2 = intrinsic_movsd(xmm2, var_380);
    xmm1 = intrinsic_movapd(xmm1, xmm2);
    if (!CPU_FLAGS & NE) {
            xmm1 = intrinsic_movsd(xmm1, var_368);
    }
    if (!CPU_FLAGS & NE) {
            var_368 = intrinsic_movsd(var_368, xmm2);
    }
    if (!CPU_FLAGS & NE) {
            xmm2 = intrinsic_movsd(xmm2, var_388);
            var_3E0 = intrinsic_movsd(var_3E0, xmm2);
    }
    var_338 = intrinsic_movsd(var_338, xmm1);
    if (!CPU_FLAGS & NE) {
            var_3B8 = intrinsic_movsd(var_3B8, xmm0);
    }
    var_398 = r13;
    r12 = @selector(otherMargin);
    _objc_msgSend(r14, r12);
    r13 = 0xffffffffffffffff;
    xmm1 = intrinsic_movsd(xmm1, var_360);
    xmm1 = intrinsic_ucomisd(xmm1, xmm0);
    if (xmm1 > 0x0) {
            rbx = r12;
            [r14 verticalInterstice];
            xmm0 = intrinsic_addsd(xmm0, var_3E0);
            var_380 = intrinsic_movapd(var_380, xmm0);
            xmm0 = intrinsic_andpd(xmm0, *(int128_t *)0xc4f640);
            r12 = r14;
            r14 = 0xffffffffffffffff;
            xmm1 = intrinsic_movsd(xmm1, *0xc4fb20);
            xmm1 = intrinsic_ucomisd(xmm1, xmm0);
            if (xmm1 < 0x0) {
                    _objc_msgSend(r12, rbx);
                    xmm0 = intrinsic_movapd(xmm0, intrinsic_divsd(intrinsic_subsd(intrinsic_movsd(xmm1, var_360), xmm0), var_380));
                    floor(xmm0);
                    r14 = intrinsic_cvttsd2si(0xffffffffffffffff, xmm0);
            }
            _objc_msgSend(r12, rbx);
            xmm1 = intrinsic_cvtsi2sd(0x0, r14);
            xmm2 = intrinsic_movapd(xmm2, var_380);
            xmm2 = intrinsic_mulsd(xmm2, xmm1);
            xmm2 = intrinsic_addsd(xmm2, xmm0);
            xmm2 = intrinsic_addsd(xmm2, var_3E0);
            xmm0 = intrinsic_movsd(xmm0, var_360);
            xmm0 = intrinsic_ucomisd(xmm0, xmm2);
            r13 = ((xmm0 > 0x0 ? 0x1 : 0x0) & 0xff) + r14;
            r14 = r12;
            r12 = rbx;
    }
    _objc_msgSend(r14, r12);
    xmm1 = intrinsic_movsd(xmm1, var_368);
    xmm1 = intrinsic_ucomisd(xmm1, xmm0);
    rbx = r14;
    if (xmm1 <= 0x0) goto loc_9ac9da;

loc_9abdf5:
    [rbx verticalInterstice];
    xmm0 = intrinsic_addsd(xmm0, var_3E0);
    xmm2 = intrinsic_movapd(xmm2, xmm0);
    xmm2 = intrinsic_andpd(xmm2, *(int128_t *)0xc4f640);
    r14 = 0xffffffffffffffff;
    xmm1 = intrinsic_movsd(xmm1, *0xc4fb20);
    xmm1 = intrinsic_ucomisd(xmm1, xmm2);
    if (xmm1 < 0x0) {
            var_360 = intrinsic_movapd(var_360, xmm0);
            _objc_msgSend(rbx, r12);
            xmm1 = intrinsic_movsd(xmm1, var_368);
            xmm1 = intrinsic_subsd(xmm1, xmm0);
            xmm1 = intrinsic_divsd(xmm1, var_360);
            xmm0 = intrinsic_movapd(xmm0, xmm1);
            floor(xmm0);
            r14 = intrinsic_cvttsd2si(0xffffffffffffffff, xmm0);
    }
    var_480 = r14;
    _objc_msgSend(rbx, r12);
    [rbx verticalInterstice];
    r12 = rbx;
    if (r14 == 0xffffffffffffffff) goto loc_9ac9da;

loc_9abe8e:
    rax = 0x0;
    if (r13 != 0xffffffffffffffff) {
            rax = r13;
    }
    var_488 = rax;
    rbx = @selector(beginMargin);
    _objc_msgSend(r12, rbx);
    var_4C8 = 0xffffffffffffffff;
    xmm1 = intrinsic_movsd(xmm1, var_370);
    xmm1 = intrinsic_ucomisd(xmm1, xmm0);
    r14 = 0xffffffffffffffff;
    if (xmm1 > 0x0) {
            _objc_msgSend(r12, rbx);
            xmm1 = intrinsic_movsd(xmm1, var_370);
            xmm1 = intrinsic_subsd(xmm1, xmm0);
            var_360 = intrinsic_movsd(var_360, xmm1);
            [r12 actualGap];
            xmm0 = intrinsic_addsd(xmm0, var_3B8);
            xmm1 = intrinsic_movsd(xmm1, var_360);
            xmm1 = intrinsic_divsd(xmm1, xmm0);
            xmm0 = intrinsic_movapd(xmm0, xmm1);
            floor(xmm0);
            r13 = intrinsic_cvttsd2si(r13, xmm0);
            [r12 beginMargin];
            var_360 = intrinsic_movsd(var_360, xmm0);
            xmm0 = intrinsic_cvtsi2sd(0x0, r13);
            var_368 = intrinsic_movsd(var_368, xmm0);
            [r12 actualGap];
            xmm1 = intrinsic_movsd(xmm1, var_3B8);
            xmm0 = intrinsic_addsd(xmm0, xmm1);
            xmm0 = intrinsic_mulsd(xmm0, var_368);
            xmm0 = intrinsic_addsd(xmm0, var_360);
            xmm0 = intrinsic_addsd(xmm0, xmm1);
            xmm1 = intrinsic_movsd(xmm1, var_370);
            xmm1 = intrinsic_ucomisd(xmm1, xmm0);
            r14 = ((xmm1 > 0x0 ? 0x1 : 0x0) & 0xff) + r13;
            rbx = @selector(beginMargin);
    }
    _objc_msgSend(r12, rbx);
    xmm1 = intrinsic_movsd(xmm1, var_338);
    xmm1 = intrinsic_ucomisd(xmm1, xmm0);
    if (xmm1 > 0x0) {
            r13 = [[r12 layoutInfo] retain];
            [r13 dimension];
            var_360 = intrinsic_movsd(var_360, xmm0);
            [r12 endMargin];
            xmm1 = intrinsic_movsd(xmm1, var_360);
            xmm1 = intrinsic_subsd(xmm1, xmm0);
            var_360 = intrinsic_movsd(var_360, xmm1);
            [r13 release];
            xmm0 = intrinsic_movsd(xmm0, var_338);
            xmm0 = intrinsic_ucomisd(xmm0, var_360);
            if (xmm0 > 0x0) {
                    r13 = [[r12 layoutInfo] retain];
                    [r13 dimension];
                    var_338 = intrinsic_movsd(var_338, xmm0);
                    [r12 endMargin];
                    xmm1 = intrinsic_movsd(xmm1, var_338);
                    xmm1 = intrinsic_subsd(xmm1, xmm0);
                    var_338 = intrinsic_movsd(var_338, xmm1);
                    [r13 release];
            }
            _objc_msgSend(r12, rbx);
            xmm1 = intrinsic_movsd(xmm1, var_338);
            xmm1 = intrinsic_subsd(xmm1, xmm0);
            var_360 = intrinsic_movsd(var_360, xmm1);
            [r12 actualGap];
            xmm0 = intrinsic_addsd(xmm0, var_360);
            var_360 = intrinsic_movsd(var_360, xmm0);
            [r12 actualGap];
            xmm0 = intrinsic_addsd(xmm0, var_3B8);
            xmm1 = intrinsic_movsd(xmm1, var_360);
            xmm1 = intrinsic_divsd(xmm1, xmm0);
            xmm0 = intrinsic_movapd(xmm0, xmm1);
            floor(xmm0);
            rbx = intrinsic_cvttsd2si(rbx, xmm0);
            [r12 beginMargin];
            var_360 = intrinsic_movsd(var_360, xmm0);
            xmm0 = intrinsic_cvtsi2sd(0x0, rbx);
            var_368 = intrinsic_movsd(var_368, xmm0);
            [r12 actualGap];
            xmm0 = intrinsic_addsd(xmm0, var_3B8);
            xmm0 = intrinsic_mulsd(xmm0, var_368);
            xmm0 = intrinsic_addsd(xmm0, var_360);
            xmm0 = intrinsic_ucomisd(xmm0, var_338);
            var_4C8 = rbx - ((xmm0 >= 0x0 ? 0x1 : 0x0) & 0xff);
    }
    if ((var_4C8 & r14) == 0xffffffffffffffff) goto loc_9ac9da;

loc_9ac14b:
    var_348 = r12;
    r12 = 0x0;
    if (r14 != 0xffffffffffffffff) {
            r12 = r14;
    }
    var_408 = r12;
    rbx = [[var_340 collectionView] retain];
    [rbx _currentScreenScale];
    var_410 = intrinsic_movsd(var_410, xmm0);
    [rbx release];
    rax = var_480;
    if (rax >= var_488) {
            var_370 = var_4C8 - r12;
            var_480 = rax + 0x1 - var_488;
            var_4C8 = var_4C8 - r12 + r12;
            var_478 = var_488;
            rcx = 0x0;
            do {
                    var_468 = rcx;
                    var_338 = rcx + var_488;
                    rbx = var_348;
                    var_360 = [rbx itemsByRowCount];
                    r13 = [rbx itemsCount];
                    rax = [rbx itemsByRowCount];
                    if ((var_444 != 0x0) && (var_340->_scrollDirection != 0x0)) {
                            xmm0 = intrinsic_cvtsi2sd(xmm0, r13);
                            xmm0 = intrinsic_divsd(xmm0, intrinsic_cvtsi2sd(xmm1, rax));
                            ceil(xmm0);
                            xmm1 = intrinsic_cvtsi2sd(0x0, var_338);
                            xmm0 = intrinsic_subsd(xmm0, xmm1);
                            xmm0 = intrinsic_addsd(xmm0, *0xc4f4c8);
                    }
                    else {
                            xmm0 = intrinsic_cvtsi2sd(xmm0, var_338);
                    }
                    var_368 = intrinsic_movsd(var_368, xmm0);
                    [rbx otherMargin];
                    var_338 = intrinsic_movsd(var_338, xmm0);
                    rax = [rbx verticalInterstice];
                    if (var_370 >= 0x0) {
                            xmm1 = intrinsic_cvtsi2sd(0x0, intrinsic_cvttsd2si(rax, var_368));
                            xmm0 = intrinsic_addsd(xmm0, var_3E0);
                            xmm0 = intrinsic_mulsd(xmm0, xmm1);
                            xmm2 = intrinsic_movsd(xmm2, var_338);
                            xmm2 = intrinsic_addsd(xmm2, xmm0);
                            var_388 = @selector(indexPathForItem:inSection:);
                            xmm0 = intrinsic_movapd(xmm0, var_430);
                            xmm1 = intrinsic_movapd(xmm1, xmm0);
                            xmm1 = intrinsic_addsd(xmm1, xmm2);
                            var_420 = intrinsic_movapd(var_420, xmm1);
                            xmm0 = intrinsic_shufpd(xmm0, 0x1);
                            var_440 = intrinsic_movapd(var_440, xmm0);
                            xmm0 = intrinsic_addsd(xmm0, xmm2);
                            var_460 = intrinsic_movapd(var_460, xmm0);
                            var_360 = var_360 * var_478 + r12;
                            r15 = var_4C8;
                            r14 = 0x0;
                            do {
                                    r13 = r12 + r14;
                                    rbx = var_360 + r14;
                                    if ((var_444 != 0x0) && (var_340->_scrollDirection != 0x1)) {
                                            r13 = r15;
                                    }
                                    var_380 = @selector(itemsCount);
                                    if (rbx >= _objc_msgSend(var_348, var_380)) {
                                        break;
                                    }
                                    var_388 = @selector(indexPathForItem:inSection:);
                                    rcx = var_398;
                                    rax = _objc_msgSend(@class(NSIndexPath), var_388);
                                    rax = [rax retain];
                                    var_338 = rax;
                                    rax = [var_340 _existingLayoutAttributesForItemAtIndexPath:rax];
                                    rax = [rax retain];
                                    rbx = rax;
                                    if (rax == 0x0) {
                                            var_3C0 = rax;
                                            [var_348 beginMargin];
                                            var_368 = intrinsic_movsd(var_368, xmm0);
                                            xmm0 = intrinsic_cvtsi2sd(xmm0, r13);
                                            var_3C8 = intrinsic_movsd(var_3C8, xmm0);
                                            [var_348 actualGap];
                                            xmm0 = intrinsic_addsd(xmm0, var_3B8);
                                            xmm0 = intrinsic_mulsd(xmm0, var_3C8);
                                            xmm0 = intrinsic_addsd(xmm0, var_368);
                                            if (var_400 != 0x0) {
                                                    var_368 = intrinsic_movsd(var_368, xmm0);
                                                    rbx = var_340;
                                                    rax = [rbx _roundsToScreenScale];
                                                    xmm0 = intrinsic_movapd(xmm0, var_420);
                                                    r12 = var_408;
                                                    if (rax != 0x0) {
                                                            xmm0 = intrinsic_movsd(xmm0, var_410);
                                                            xmm0 = intrinsic_ucomisd(xmm0, *0xc4ff40);
                                                            xmm1 = intrinsic_movapd(xmm1, xmm0);
                                                            if ((xmm0 == 0x0) && (!CPU_FLAGS & P)) {
                                                                    if (*_AdjustToScale.onceToken != 0xffffffffffffffff) {
                                                                            dispatch_once(_AdjustToScale.onceToken, ^ {/* block implemented at ___AdjustToScale_block_invoke_9b16a4 */ } });
                                                                    }
                                                                    xmm1 = intrinsic_movsd(xmm1, *_AdjustToScale.__s);
                                                            }
                                                            xmm1 = intrinsic_ucomisd(xmm1, *0xc4f410);
                                                            if ((xmm1 == 0x0) && (!CPU_FLAGS & P)) {
                                                                    xmm0 = intrinsic_movapd(xmm0, var_420);
                                                                    round(xmm0);
                                                            }
                                                            else {
                                                                    xmm0 = intrinsic_movapd(xmm0, var_420);
                                                                    xmm0 = intrinsic_mulsd(xmm0, xmm1);
                                                                    var_3C8 = intrinsic_movsd(var_3C8, xmm1);
                                                                    round(xmm0);
                                                                    xmm0 = intrinsic_divsd(xmm0, var_3C8);
                                                            }
                                                    }
                                                    var_3C8 = intrinsic_movsd(var_3C8, xmm0);
                                                    xmm0 = intrinsic_movsd(xmm0, var_368);
                                                    xmm0 = intrinsic_addsd(xmm0, var_440);
                                                    var_368 = intrinsic_movsd(var_368, xmm0);
                                                    if ([rbx _roundsToScreenScale] != 0x0) {
                                                            xmm0 = intrinsic_movsd(xmm0, var_410);
                                                            xmm0 = intrinsic_ucomisd(xmm0, *0xc4ff40);
                                                            xmm1 = intrinsic_movapd(xmm1, xmm0);
                                                            if ((xmm0 == 0x0) && (!CPU_FLAGS & P)) {
                                                                    if (*_AdjustToScale.onceToken != 0xffffffffffffffff) {
                                                                            dispatch_once(_AdjustToScale.onceToken, ^ {/* block implemented at ___AdjustToScale_block_invoke_9b16a4 */ } });
                                                                    }
                                                                    xmm1 = intrinsic_movsd(xmm1, *_AdjustToScale.__s);
                                                            }
                                                            xmm1 = intrinsic_ucomisd(xmm1, *0xc4f410);
                                                            xmm0 = intrinsic_movsd(xmm0, var_368);
                                                            if ((xmm1 == 0x0) && (!CPU_FLAGS & P)) {
                                                                    round(xmm0);
                                                            }
                                                            else {
                                                                    xmm0 = intrinsic_mulsd(xmm0, xmm1);
                                                                    var_368 = intrinsic_movsd(var_368, xmm1);
                                                                    round(xmm0);
                                                                    xmm0 = intrinsic_divsd(xmm0, var_368);
                                                            }
                                                            xmm2 = intrinsic_movsd(xmm2, var_3E0);
                                                            xmm1 = intrinsic_movsd(xmm1, var_3B8);
                                                    }
                                                    else {
                                                            xmm2 = intrinsic_movsd(xmm2, var_3E0);
                                                            xmm1 = intrinsic_movsd(xmm1, var_3B8);
                                                            xmm0 = intrinsic_movsd(xmm0, var_368);
                                                    }
                                            }
                                            else {
                                                    xmm0 = intrinsic_addsd(xmm0, var_430);
                                                    var_368 = intrinsic_movsd(var_368, xmm0);
                                                    rbx = var_340;
                                                    r12 = var_408;
                                                    if ([rbx _roundsToScreenScale] != 0x0) {
                                                            xmm0 = intrinsic_movsd(xmm0, var_410);
                                                            xmm0 = intrinsic_ucomisd(xmm0, *0xc4ff40);
                                                            xmm1 = intrinsic_movapd(xmm1, xmm0);
                                                            if ((xmm0 == 0x0) && (!CPU_FLAGS & P)) {
                                                                    if (*_AdjustToScale.onceToken != 0xffffffffffffffff) {
                                                                            dispatch_once(_AdjustToScale.onceToken, ^ {/* block implemented at ___AdjustToScale_block_invoke_9b16a4 */ } });
                                                                    }
                                                                    xmm1 = intrinsic_movsd(xmm1, *_AdjustToScale.__s);
                                                            }
                                                            xmm1 = intrinsic_ucomisd(xmm1, *0xc4f410);
                                                            xmm0 = intrinsic_movsd(xmm0, var_368);
                                                            if ((xmm1 == 0x0) && (!CPU_FLAGS & P)) {
                                                                    round(xmm0);
                                                            }
                                                            else {
                                                                    xmm0 = intrinsic_mulsd(xmm0, xmm1);
                                                                    var_368 = intrinsic_movsd(var_368, xmm1);
                                                                    round(xmm0);
                                                                    xmm0 = intrinsic_divsd(xmm0, var_368);
                                                            }
                                                    }
                                                    else {
                                                            xmm0 = intrinsic_movsd(xmm0, var_368);
                                                    }
                                                    var_3C8 = intrinsic_movsd(var_3C8, xmm0);
                                                    if ([rbx _roundsToScreenScale] != 0x0) {
                                                            xmm0 = intrinsic_movsd(xmm0, var_410);
                                                            xmm0 = intrinsic_ucomisd(xmm0, *0xc4ff40);
                                                            xmm1 = intrinsic_movapd(xmm1, xmm0);
                                                            if ((xmm0 == 0x0) && (!CPU_FLAGS & P)) {
                                                                    if (*_AdjustToScale.onceToken != 0xffffffffffffffff) {
                                                                            dispatch_once(_AdjustToScale.onceToken, ^ {/* block implemented at ___AdjustToScale_block_invoke_9b16a4 */ } });
                                                                    }
                                                                    xmm1 = intrinsic_movsd(xmm1, *_AdjustToScale.__s);
                                                            }
                                                            xmm1 = intrinsic_ucomisd(xmm1, *0xc4f410);
                                                            if ((xmm1 == 0x0) && (!CPU_FLAGS & P)) {
                                                                    xmm0 = intrinsic_movapd(xmm0, var_460);
                                                                    round(xmm0);
                                                            }
                                                            else {
                                                                    xmm0 = intrinsic_movapd(xmm0, var_460);
                                                                    xmm0 = intrinsic_mulsd(xmm0, xmm1);
                                                                    var_368 = intrinsic_movsd(var_368, xmm1);
                                                                    round(xmm0);
                                                                    xmm0 = intrinsic_divsd(xmm0, var_368);
                                                            }
                                                    }
                                                    else {
                                                            xmm0 = intrinsic_movapd(xmm0, var_460);
                                                    }
                                                    xmm2 = intrinsic_movsd(xmm2, var_3B8);
                                                    xmm1 = intrinsic_movsd(xmm1, var_3E0);
                                            }
                                            xmm3 = intrinsic_movsd(xmm3, var_3C8);
                                            var_290 = intrinsic_movsd(var_290, xmm3);
                                            var_288 = intrinsic_movsd(var_288, xmm0);
                                            var_280 = intrinsic_movsd(var_280, xmm2);
                                            var_278 = intrinsic_movsd(var_278, xmm1);
                                            rbx = [[rbx _fetchAndCacheNewLayoutAttributesForCellWithIndexPath:var_338 frame:rcx] retain];
                                            [var_3C0 release];
                                            if (rbx != 0x0) {
                                                    [var_3B0 addObject:rbx];
                                                    [rbx release];
                                            }
                                    }
                                    else {
                                            [var_3B0 addObject:rbx];
                                            [rbx release];
                                    }
                                    [var_338 release];
                                    r15 = r15 - 0x1;
                                    COND = r14 < var_370;
                                    r14 = r14 + 0x1;
                            } while (COND);
                    }
                    rcx = var_468 + 0x1;
                    var_478 = var_478 + 0x1;
            } while (rcx != var_480);
    }
    r14 = var_250;
    r13 = var_398;
    goto loc_9ac951;

loc_9ac951:
    r12 = var_340;
    goto loc_9ac958;

loc_9ac958:
    rax = var_4B8;
    if (rax != 0x0) {
            r13 = [rax indexGreaterThanIndex:r13];
    }
    else {
            r13 = r13 + 0x1;
    }
    var_3D8 = var_3D8 + 0x1;
    rdx = var_470 + 0x1;
    if (rdx < var_4B0) goto loc_9ab2c6;

loc_9ac99d:
    rbx = var_4F0;
    rcx = var_B0;
    rax = [rbx countByEnumeratingWithState:var_210 objects:rcx count:0x10];
    var_4B0 = rax;
    if (rax != 0x0) goto loc_9ab18d;

loc_9ac9e1:
    [rbx release];
    r13 = var_340;
    r12 = rbx;
    if (r13->_gridLayoutFlags >= 0x0) goto loc_9ab026;

loc_9aca07:
    [var_4B8 release];
    [r12 release];
    r13 = *___stack_chk_guard;
    goto loc_9aaf5f;

loc_9aaf5f:
    if (r13 == var_30) {
            rax = [var_3B0 autorelease];
    }
    else {
            rax = __stack_chk_fail();
    }
    return rax;

loc_9ab026:
    [var_3B0 removeAllObjects];
    r14 = var_5C8;
    rdx = 0x1;
    [*(r13 + r14) invalidate:rdx];
    [var_4B8 release];
    [r12 release];
    goto loc_9ab06a;

loc_9ac9da:
    rbx = var_4F0;
    goto loc_9ac9e1;

loc_9ab465:
    r12 = [r14 validItemRange];
    xmm0 = intrinsic_xorpd(xmm0, xmm0);
    var_2A0 = intrinsic_movapd(var_2A0, xmm0);
    var_2B0 = intrinsic_movapd(var_2B0, xmm0);
    var_2C0 = intrinsic_movapd(var_2C0, xmm0);
    var_2D0 = intrinsic_movapd(var_2D0, xmm0);
    rax = [r14 rows];
    rax = [rax retain];
    var_420 = rax;
    rdi = rax;
    rsi = @selector(countByEnumeratingWithState:objects:count:);
    rax = _objc_msgSend(rdi, rsi, var_2D0, var_130, 0x10);
    var_3F8 = rax;
    if (rax != 0x0) {
            var_408 = *var_2C0;
            var_460 = @selector(countByEnumeratingWithState:objects:count:);
            do {
                    var_430 = @selector(countByEnumeratingWithState:objects:count:);
                    var_440 = @selector(count);
                    var_410 = @selector(rowFrame);
                    rbx = 0x0;
                    do {
                            if (*var_2C0 != var_408) {
                                    rdi = var_420;
                                    objc_enumerationMutation(rdi);
                            }
                            var_3F0 = rbx;
                            r14 = *(var_2C8 + rbx * 0x8);
                            if (r14 != 0x0) {
                                    var_410 = @selector(rowFrame);
                                    rdi = var_270;
                                    rsi = r14;
                                    objc_msgSend_stret(rdi, rsi, var_410);
                                    xmm0 = intrinsic_movapd(xmm0, var_270);
                            }
                            else {
                                    xmm0 = intrinsic_xorpd(xmm0, xmm0);
                                    var_260 = intrinsic_movapd(var_260, xmm0);
                                    var_270 = intrinsic_movapd(var_270, xmm0);
                            }
                            xmm0 = intrinsic_addpd(xmm0, var_230);
                            var_270 = intrinsic_movapd(var_270, xmm0);
                            if (CGRectIntersectsRect(rdi, rsi) != 0x0) {
                                    xmm0 = intrinsic_xorpd(xmm0, xmm0);
                                    var_2E0 = intrinsic_movapd(var_2E0, xmm0);
                                    var_2F0 = intrinsic_movapd(var_2F0, xmm0);
                                    var_300 = intrinsic_movapd(var_300, xmm0);
                                    var_310 = intrinsic_movapd(var_310, xmm0);
                                    rax = [r14 items];
                                    rax = [rax retain];
                                    var_3A0 = rax;
                                    rsi = var_430;
                                    rax = _objc_msgSend(rax, rsi, var_310, var_1B0, 0x10);
                                    var_348 = rax;
                                    if (rax != 0x0) {
                                            var_380 = *var_300;
                                            do {
                                                    rbx = r12;
                                                    var_360 = rbx;
                                                    var_3E0 = @selector(_fetchAndCacheNewLayoutAttributesForCellWithIndexPath:frame:);
                                                    var_3B8 = *_OBJC_IVAR_$_UICollectionViewFlowLayout._data;
                                                    var_3C8 = @selector(objectAtIndexedSubscript:);
                                                    r14 = 0x0;
                                                    r12 = var_340;
                                                    do {
                                                            rbx = rbx + r14;
                                                            if (*var_300 != var_380) {
                                                                    objc_enumerationMutation(var_3A0);
                                                            }
                                                            var_368 = @selector(indexPathForItem:inSection:);
                                                            var_370 = @selector(_existingLayoutAttributesForItemAtIndexPath:);
                                                            rax = _objc_msgSend(@class(NSIndexPath), var_368, rbx, r13);
                                                            rax = [rax retain];
                                                            var_338 = rax;
                                                            rdx = rax;
                                                            rcx = rbx;
                                                            rbx = r12;
                                                            r12 = [_objc_msgSend(r12, var_370, rdx) retain];
                                                            if (r12 != 0x0) {
                                                                    rsi = r12;
                                                                    [var_290 frame];
                                                            }
                                                            else {
                                                                    var_3B8 = *_OBJC_IVAR_$_UICollectionViewFlowLayout._data;
                                                                    var_3C8 = @selector(objectAtIndexedSubscript:);
                                                                    var_388 = rcx;
                                                                    rax = [*(rbx + var_3B8) sections];
                                                                    rax = [rax retain];
                                                                    var_390 = rax;
                                                                    r15 = [_objc_msgSend(rax, var_3C8, var_3D8, rcx) retain];
                                                                    rsi = rbx;
                                                                    rcx = var_388;
                                                                    [var_290 _frameForItem:rsi inSection:rcx usingData:r13, r15];
                                                                    [r15 release];
                                                                    [var_390 release];
                                                            }
                                                            CGRectIntersection(var_330, rsi);
                                                            r15 = var_338;
                                                            if (CGRectIsNull(var_330) == 0x0) {
                                                                    rbx = r12;
                                                                    if (r12 == 0x0) {
                                                                            var_3E0 = @selector(_fetchAndCacheNewLayoutAttributesForCellWithIndexPath:frame:);
                                                                            rbx = [_objc_msgSend(var_340, var_3E0, r15, rcx) retain];
                                                                            [r12 release];
                                                                            r12 = 0x0;
                                                                            if (rbx != 0x0) {
                                                                                    [var_3B0 addObject:rbx];
                                                                                    r12 = rbx;
                                                                            }
                                                                    }
                                                                    else {
                                                                            [var_3B0 addObject:rbx];
                                                                            r12 = rbx;
                                                                    }
                                                            }
                                                            [r12 release];
                                                            [r15 release];
                                                            r14 = r14 + 0x1;
                                                            r12 = var_340;
                                                            rbx = var_360;
                                                    } while (r14 < var_348);
                                                    rsi = @selector(countByEnumeratingWithState:objects:count:);
                                                    rax = _objc_msgSend(var_3A0, rsi);
                                                    var_348 = rax;
                                                    r12 = rbx + r14;
                                            } while (rax != 0x0);
                                            r12 = rbx + r14;
                                    }
                                    rdi = var_3A0;
                            }
                            else {
                                    var_440 = @selector(count);
                                    r14 = [[r14 items] retain];
                                    rsi = var_440;
                                    r12 = r12 + _objc_msgSend(r14, rsi);
                                    rdi = r14;
                            }
                            [rdi release];
                            rbx = var_3F0 + 0x1;
                    } while (rbx < var_3F8);
                    rdi = var_420;
                    rsi = var_460;
                    rcx = var_130;
                    rax = _objc_msgSend(rdi, rsi);
                    var_3F8 = rax;
            } while (rax != 0x0);
    }
    [var_420 release];
    r14 = var_250;
    goto loc_9ac951;

loc_9aaf3c:
    var_3B0 = [[NSArray array] retain];
    goto loc_9aaf5f;
}


void * -[UICollectionViewFlowLayout layoutAttributesForElementsInRect:](void * self, void * _cmd, struct CGRect arg2) {
    r15 = self;
    r14 = [[NSMutableArray array] retain];
    var_1B8 = r14;
    rax = [r15 _layoutAttributesForItemsInRect:arg2, rcx];
    rax = [rax retain];
    var_200 = rax;
    [r14 addObjectsFromArray:rax];
    rax = [r15 indexesForSectionHeadersInRect:r15->_data usingData:rcx];
    rax = [rax retain];
    var_1E8 = rax;
    intrinsic_movaps(var_140, 0x0);
    intrinsic_movaps(var_150, 0x0);
    var_160 = intrinsic_movaps(var_160, 0x0);
    var_170 = intrinsic_movaps(var_170, 0x0);
    rbx = @selector(countByEnumeratingWithState:objects:count:);
    rcx = var_B0;
    rax = _objc_msgSend(rax, rbx);
    var_1C0 = rax;
    if (rax != 0x0) {
            r14 = r15;
            var_1E0 = *var_160;
            do {
                    r13 = 0x0;
                    do {
                            if (*var_160 != var_1E0) {
                                    objc_enumerationMutation(var_1E8);
                            }
                            r15 = [[r14 layoutAttributesForHeaderInSection:[*(var_168 + r13 * 0x8) indexAtPosition:0x0] usingData:r14->_data] retain];
                            [var_1B8 addObject:r15];
                            [r15 release];
                            r13 = r13 + 0x1;
                    } while (r13 < var_1C0);
                    rbx = @selector(countByEnumeratingWithState:objects:count:);
                    rcx = var_B0;
                    rax = _objc_msgSend(var_1E8, rbx);
                    var_1C0 = rax;
            } while (rax != 0x0);
            r15 = r14;
    }
    rdx = r15->_data;
    r14 = r15;
    rax = [r15 indexesForSectionFootersInRect:rdx usingData:*(arg_0 + 0x8), 0x10];
    rax = [rax retain];
    var_1F0 = rax;
    intrinsic_movaps(var_180, 0x0);
    intrinsic_movaps(var_190, 0x0);
    var_1A0 = intrinsic_movaps(var_1A0, 0x0);
    var_1B0 = intrinsic_movaps(var_1B0, 0x0);
    rax = _objc_msgSend(rax, rbx, var_1B0, var_130, 0x10);
    rbx = _objc_msgSend;
    var_1C0 = rax;
    if (rax != 0x0) {
            var_1E0 = *var_1A0;
            do {
                    r12 = 0x0;
                    do {
                            if (*var_1A0 != var_1E0) {
                                    objc_enumerationMutation(var_1F0);
                            }
                            r13 = [(rbx)(r14, @selector(layoutAttributesForFooterInSection:usingData:), (rbx)(*(var_1A8 + r12 * 0x8), @selector(indexAtPosition:), 0x0), r14->_data) retain];
                            (rbx)(var_1B8, @selector(addObject:), r13);
                            [r13 release];
                            r12 = r12 + 0x1;
                    } while (r12 < var_1C0);
                    rdx = var_1B0;
                    rcx = var_130;
                    rax = [var_1F0 countByEnumeratingWithState:rdx objects:rcx count:0x10];
                    var_1C0 = rax;
            } while (rax != 0x0);
    }
    if (r14->_gridLayoutFlags >= 0x0) {
            [r14 _fetchItemsInfoForRect:rdx, rcx];
    }
    [var_1F0 release];
    [var_1E8 release];
    [var_200 release];
    if (*___stack_chk_guard == *___stack_chk_guard) {
            rax = [var_1B8 autorelease];
    }
    else {
            rax = __stack_chk_fail();
    }
    return rax;
}

void -[UICollectionViewFlowLayout setScrollDirection:](void * self, void * _cmd, NSInteger arg2) {
    rdx = arg2;
    rdi = self;
    if ((rdi->_scrollDirection != rdx) && (rdi->_gridLayoutFlags < 0x0)) {
            rdi->_scrollDirection = rdx;
            [rdi invalidateLayout];
    }
    else {
            rdi->_scrollDirection = rdx;
    }
    return;
}

void -[UICollectionViewFlowLayout setMinimumInteritemSpacing:](void * self, void * _cmd, double arg2) {
    xmm0 = arg2;
    rdi = self;
    xmm1 = intrinsic_movsd(xmm1, rdi->_interitemSpacing);
    xmm1 = intrinsic_ucomisd(xmm1, xmm0);
    if ((xmm1 == 0x0) && (CPU_FLAGS & NP)) {
            rdi->_interitemSpacing = intrinsic_movsd(rdi->_interitemSpacing, xmm0);
    }
    else {
            if (rdi->_gridLayoutFlags >= 0x0) {
                    rdi->_interitemSpacing = intrinsic_movsd(rdi->_interitemSpacing, xmm0);
            }
            else {
                    rdi->_interitemSpacing = intrinsic_movsd(rdi->_interitemSpacing, xmm0);
                    [rdi invalidateLayout];
            }
    }
    return;
}

void -[UICollectionViewFlowLayout setMinimumLineSpacing:](void * self, void * _cmd, double arg2) {
    xmm0 = arg2;
    rdi = self;
    xmm1 = intrinsic_movsd(xmm1, rdi->_lineSpacing);
    xmm1 = intrinsic_ucomisd(xmm1, xmm0);
    if ((xmm1 == 0x0) && (CPU_FLAGS & NP)) {
            rdi->_lineSpacing = intrinsic_movsd(rdi->_lineSpacing, xmm0);
    }
    else {
            if (rdi->_gridLayoutFlags >= 0x0) {
                    rdi->_lineSpacing = intrinsic_movsd(rdi->_lineSpacing, xmm0);
            }
            else {
                    rdi->_lineSpacing = intrinsic_movsd(rdi->_lineSpacing, xmm0);
                    [rdi invalidateLayout];
            }
    }
    return;
}

void -[UICollectionViewFlowLayout setItemSize:](void * self, void * _cmd, struct CGSize arg2) {
    rdi = self;
    rbx = rdi;
    xmm2 = intrinsic_ucomisd(0x0, xmm0, arg2);
    if (xmm2 >= 0x0) {
            var_20 = intrinsic_movsd(var_20, xmm1);
            var_28 = intrinsic_movsd(var_28, xmm0);
            r14 = ___UILogGetCategoryCachedImpl("Assert", _setItemSize:.__s_category);
            rdi = *(r14 + 0x8);
            rax = os_log_type_enabled(rdi, 0x10);
            xmm0 = intrinsic_movsd(xmm0, var_28);
            xmm1 = intrinsic_movsd(xmm1, var_20);
            if (rax != 0x0) {
                    r15 = rsp;
                    rax = rsp;
                    r8 = rax + 0xfffffffffffffff0;
                    *(int8_t *)(rax + 0xfffffffffffffff0) = 0x0;
                    *(int8_t *)(rax + 0xfffffffffffffff1) = 0x0;
                    rdi = 0xffffffffff652ff2;
                    _os_log_impl(rdi, *(r14 + 0x8), 0x10, "negative or zero item sizes are not supported in the flow layout", r8, 0x2);
                    xmm0 = intrinsic_movsd(xmm0, var_28);
                    xmm1 = intrinsic_movsd(xmm1, var_20);
            }
    }
    rax = rbx->_gridLayoutFlags & 0xffff;
    if ((rax & 0x401) != 0x0) {
            rbx->_itemSize = intrinsic_movsd(rbx->_itemSize, xmm0);
            *(rbx + *_OBJC_IVAR_$_UICollectionViewFlowLayout._itemSize + 0x8) = intrinsic_movsd(*(rbx + *_OBJC_IVAR_$_UICollectionViewFlowLayout._itemSize + 0x8), xmm1);
    }
    else {
            rdx = *_OBJC_IVAR_$_UICollectionViewFlowLayout._itemSize;
            xmm0 = intrinsic_ucomisd(xmm0, *(rbx + rdx));
            COND = xmm0 != 0x0;
            asm { setp       dil };
            rsi = COND ? 0x1 : 0x0;
            xmm1 = intrinsic_ucomisd(xmm1, *(rbx + rdx + 0x8));
            COND = xmm1 != 0x0;
            asm { setp       r8b };
            rcx = COND ? 0x1 : 0x0;
            *(rbx + rdx) = intrinsic_movsd(*(rbx + rdx), xmm0);
            *(rbx + rdx + 0x8) = intrinsic_movsd(*(rbx + rdx + 0x8), xmm1);
            if (rax < 0x0) {
                    rcx = rcx | r8 | rsi | rdi;
                    if (rcx != 0x0) {
                            [rbx invalidateLayout];
                    }
            }
    }
    return;
}

void -[UICollectionViewFlowLayout setEstimatedItemSize:](void * self, void * _cmd, struct CGSize arg2) {
    rbx = self;
    xmm2 = intrinsic_movsd(xmm2, rbx->_estimatedItemSize, arg2);
    xmm2 = intrinsic_ucomisd(xmm2, xmm0);
    if ((xmm2 == 0x0) && (!CPU_FLAGS & P)) {
            xmm2 = intrinsic_movsd(xmm2, *(rbx + *_OBJC_IVAR_$_UICollectionViewFlowLayout._estimatedItemSize + 0x8));
            xmm2 = intrinsic_ucomisd(xmm2, xmm1);
            if ((xmm2 != 0x0) || (!CPU_FLAGS & NP)) {
                    rbx->_estimatedItemSize = intrinsic_movsd(rbx->_estimatedItemSize, xmm0);
                    *(rbx + *_OBJC_IVAR_$_UICollectionViewFlowLayout._estimatedItemSize + 0x8) = intrinsic_movsd(*(rbx + *_OBJC_IVAR_$_UICollectionViewFlowLayout._estimatedItemSize + 0x8), xmm1);
                    if (*(int32_t *)__UIApplicationLinkedOnVersion != 0x0) {
                            if (*(int32_t *)__UIApplicationLinkedOnVersion >= 0xa0000) {
                                    if ([rbx _estimatesSizes] != 0x0) {
                                            [rbx _resetCachedItems];
                                    }
                                    r14 = [[[rbx class] invalidationContextClass] new];
                                    [r14 _setInvalidateEverything:0x1];
                                    [rbx invalidateLayoutWithContext:r14];
                                    rdi = r14;
                                    [rdi release];
                            }
                    }
                    else {
                            if (__UIApplicationLinkedOnOrAfter(0xa0000) != 0x0) {
                                    if ([rbx _estimatesSizes] != 0x0) {
                                            [rbx _resetCachedItems];
                                    }
                                    r14 = [[[rbx class] invalidationContextClass] new];
                                    [r14 _setInvalidateEverything:0x1];
                                    [rbx invalidateLayoutWithContext:r14];
                                    rdi = r14;
                                    [rdi release];
                            }
                    }
            }
    }
    else {
            rbx->_estimatedItemSize = intrinsic_movsd(rbx->_estimatedItemSize, xmm0);
            *(rbx + *_OBJC_IVAR_$_UICollectionViewFlowLayout._estimatedItemSize + 0x8) = intrinsic_movsd(*(rbx + *_OBJC_IVAR_$_UICollectionViewFlowLayout._estimatedItemSize + 0x8), xmm1);
            if (*(int32_t *)__UIApplicationLinkedOnVersion != 0x0) {
                    if (*(int32_t *)__UIApplicationLinkedOnVersion >= 0xa0000) {
                            if ([rbx _estimatesSizes] != 0x0) {
                                    [rbx _resetCachedItems];
                            }
                            r14 = [[[rbx class] invalidationContextClass] new];
                            [r14 _setInvalidateEverything:0x1];
                            [rbx invalidateLayoutWithContext:r14];
                            rdi = r14;
                            [rdi release];
                    }
            }
            else {
                    if (__UIApplicationLinkedOnOrAfter(0xa0000) != 0x0) {
                            if ([rbx _estimatesSizes] != 0x0) {
                                    [rbx _resetCachedItems];
                            }
                            r14 = [[[rbx class] invalidationContextClass] new];
                            [r14 _setInvalidateEverything:0x1];
                            [rbx invalidateLayoutWithContext:r14];
                            rdi = r14;
                            [rdi release];
                    }
            }
    }
    return;
}

void -[UICollectionViewFlowLayout setHeaderReferenceSize:](void * self, void * _cmd, struct CGSize arg2) {
    rdi = self;
    rbx = rdi;
    xmm2 = intrinsic_ucomisd(0x0, xmm0, arg2);
    if (xmm2 > 0x0) {
            var_20 = intrinsic_movsd(var_20, xmm1);
            var_28 = intrinsic_movsd(var_28, xmm0);
            r14 = ___UILogGetCategoryCachedImpl("Assert", _setHeaderReferenceSize:.__s_category);
            rdi = *(r14 + 0x8);
            rax = os_log_type_enabled(rdi, 0x10);
            xmm0 = intrinsic_movsd(xmm0, var_28);
            xmm1 = intrinsic_movsd(xmm1, var_20);
            if (rax != 0x0) {
                    r15 = rsp;
                    rax = rsp;
                    r8 = rax + 0xfffffffffffffff0;
                    *(int8_t *)(rax + 0xfffffffffffffff0) = 0x0;
                    *(int8_t *)(rax + 0xfffffffffffffff1) = 0x0;
                    rdi = 0xffffffffff652de2;
                    _os_log_impl(rdi, *(r14 + 0x8), 0x10, "negative sizes of headers are not supported in the flow layout", r8, 0x2);
                    xmm0 = intrinsic_movsd(xmm0, var_28);
                    xmm1 = intrinsic_movsd(xmm1, var_20);
            }
    }
    rcx = rbx->_gridLayoutFlags & 0xffff;
    if ((rcx & 0x2) == 0x0) {
            rax = *_OBJC_IVAR_$_UICollectionViewFlowLayout._headerReferenceSize;
            xmm0 = intrinsic_ucomisd(xmm0, *(rbx + rax));
            COND = xmm0 != 0x0;
            asm { setp       dil };
            rsi = COND ? 0x1 : 0x0;
            xmm1 = intrinsic_ucomisd(xmm1, *(rbx + rax + 0x8));
            COND = xmm1 != 0x0;
            asm { setp       r8b };
            rdx = COND ? 0x1 : 0x0;
            *(rbx + rax) = intrinsic_movsd(*(rbx + rax), xmm0);
            *(rbx + rax + 0x8) = intrinsic_movsd(*(rbx + rax + 0x8), xmm1);
            if (rcx < 0x0) {
                    rdx = rdx | r8 | rsi | rdi;
                    if (rdx != 0x0) {
                            [rbx invalidateLayout];
                    }
            }
    }
    else {
            rbx->_headerReferenceSize = intrinsic_movsd(rbx->_headerReferenceSize, xmm0);
            *(rbx + *_OBJC_IVAR_$_UICollectionViewFlowLayout._headerReferenceSize + 0x8) = intrinsic_movsd(*(rbx + *_OBJC_IVAR_$_UICollectionViewFlowLayout._headerReferenceSize + 0x8), xmm1);
    }
    return;
}

void -[UICollectionViewFlowLayout setFooterReferenceSize:](void * self, void * _cmd, struct CGSize arg2) {
    rdi = self;
    rbx = rdi;
    xmm2 = intrinsic_ucomisd(0x0, xmm0, arg2);
    if (xmm2 > 0x0) {
            var_20 = intrinsic_movsd(var_20, xmm1);
            var_28 = intrinsic_movsd(var_28, xmm0);
            r14 = ___UILogGetCategoryCachedImpl("Assert", _setFooterReferenceSize:.__s_category);
            rdi = *(r14 + 0x8);
            rax = os_log_type_enabled(rdi, 0x10);
            xmm0 = intrinsic_movsd(xmm0, var_28);
            xmm1 = intrinsic_movsd(xmm1, var_20);
            if (rax != 0x0) {
                    r15 = rsp;
                    rax = rsp;
                    r8 = rax + 0xfffffffffffffff0;
                    *(int8_t *)(rax + 0xfffffffffffffff0) = 0x0;
                    *(int8_t *)(rax + 0xfffffffffffffff1) = 0x0;
                    rdi = 0xffffffffff652cd2;
                    _os_log_impl(rdi, *(r14 + 0x8), 0x10, "negative sizes of footers are not supported in the flow layout", r8, 0x2);
                    xmm0 = intrinsic_movsd(xmm0, var_28);
                    xmm1 = intrinsic_movsd(xmm1, var_20);
            }
    }
    rcx = rbx->_gridLayoutFlags & 0xffff;
    if ((rcx & 0x4) == 0x0) {
            rax = *_OBJC_IVAR_$_UICollectionViewFlowLayout._footerReferenceSize;
            xmm0 = intrinsic_ucomisd(xmm0, *(rbx + rax));
            COND = xmm0 != 0x0;
            asm { setp       dil };
            rsi = COND ? 0x1 : 0x0;
            xmm1 = intrinsic_ucomisd(xmm1, *(rbx + rax + 0x8));
            COND = xmm1 != 0x0;
            asm { setp       r8b };
            rdx = COND ? 0x1 : 0x0;
            *(rbx + rax) = intrinsic_movsd(*(rbx + rax), xmm0);
            *(rbx + rax + 0x8) = intrinsic_movsd(*(rbx + rax + 0x8), xmm1);
            if (rcx < 0x0) {
                    rdx = rdx | r8 | rsi | rdi;
                    if (rdx != 0x0) {
                            [rbx invalidateLayout];
                    }
            }
    }
    else {
            rbx->_footerReferenceSize = intrinsic_movsd(rbx->_footerReferenceSize, xmm0);
            *(rbx + *_OBJC_IVAR_$_UICollectionViewFlowLayout._footerReferenceSize + 0x8) = intrinsic_movsd(*(rbx + *_OBJC_IVAR_$_UICollectionViewFlowLayout._footerReferenceSize + 0x8), xmm1);
    }
    return;
}

void -[UICollectionViewFlowLayout setSectionInset:](void * self, void * _cmd, struct UIEdgeInsets arg2) {
    rdi = self;
    rcx = arg_0;
    rdx = rdi->_gridLayoutFlags & 0xffff;
    rax = *_OBJC_IVAR_$_UICollectionViewFlowLayout._sectionInset + rdi;
    if ((rdx & 0x8) == 0x0) {
            xmm0 = intrinsic_movsd(xmm0, *(rcx + 0x8));
            xmm0 = intrinsic_ucomisd(xmm0, *(rax + 0x8));
            if ((xmm0 == 0x0) && (!CPU_FLAGS & P)) {
                    xmm0 = intrinsic_movsd(xmm0, *rcx);
                    xmm0 = intrinsic_ucomisd(xmm0, *rax);
                    if ((xmm0 == 0x0) && (!CPU_FLAGS & P)) {
                            xmm0 = intrinsic_movsd(xmm0, *(rcx + 0x18));
                            xmm0 = intrinsic_ucomisd(xmm0, *(rax + 0x18));
                            if ((xmm0 == 0x0) && (!CPU_FLAGS & P)) {
                                    xmm0 = intrinsic_movsd(xmm0, *(rcx + 0x10));
                                    xmm0 = intrinsic_ucomisd(xmm0, *(rax + 0x10));
                                    if (xmm0 == 0x0) {
                                            if (!CPU_FLAGS & NP) {
                                                    if (rdx >= 0x0) {
                                                            *(rax + 0x18) = *(rcx + 0x18);
                                                            *(rax + 0x10) = *(rcx + 0x10);
                                                            *(rax + 0x8) = *(rcx + 0x8);
                                                            *rax = *rcx;
                                                    }
                                                    else {
                                                            *(rax + 0x18) = *(rcx + 0x18);
                                                            *(rax + 0x10) = *(rcx + 0x10);
                                                            *(rax + 0x8) = *(rcx + 0x8);
                                                            *rax = *rcx;
                                                            [rdi invalidateLayout];
                                                    }
                                            }
                                            else {
                                                    *(rax + 0x18) = *(rcx + 0x18);
                                                    *(rax + 0x10) = *(rcx + 0x10);
                                                    *(rax + 0x8) = *(rcx + 0x8);
                                                    *rax = *rcx;
                                            }
                                    }
                                    else {
                                            if (rdx >= 0x0) {
                                                    *(rax + 0x18) = *(rcx + 0x18);
                                                    *(rax + 0x10) = *(rcx + 0x10);
                                                    *(rax + 0x8) = *(rcx + 0x8);
                                                    *rax = *rcx;
                                            }
                                            else {
                                                    *(rax + 0x18) = *(rcx + 0x18);
                                                    *(rax + 0x10) = *(rcx + 0x10);
                                                    *(rax + 0x8) = *(rcx + 0x8);
                                                    *rax = *rcx;
                                                    [rdi invalidateLayout];
                                            }
                                    }
                            }
                            else {
                                    if (rdx >= 0x0) {
                                            *(rax + 0x18) = *(rcx + 0x18);
                                            *(rax + 0x10) = *(rcx + 0x10);
                                            *(rax + 0x8) = *(rcx + 0x8);
                                            *rax = *rcx;
                                    }
                                    else {
                                            *(rax + 0x18) = *(rcx + 0x18);
                                            *(rax + 0x10) = *(rcx + 0x10);
                                            *(rax + 0x8) = *(rcx + 0x8);
                                            *rax = *rcx;
                                            [rdi invalidateLayout];
                                    }
                            }
                    }
                    else {
                            if (rdx >= 0x0) {
                                    *(rax + 0x18) = *(rcx + 0x18);
                                    *(rax + 0x10) = *(rcx + 0x10);
                                    *(rax + 0x8) = *(rcx + 0x8);
                                    *rax = *rcx;
                            }
                            else {
                                    *(rax + 0x18) = *(rcx + 0x18);
                                    *(rax + 0x10) = *(rcx + 0x10);
                                    *(rax + 0x8) = *(rcx + 0x8);
                                    *rax = *rcx;
                                    [rdi invalidateLayout];
                            }
                    }
            }
            else {
                    if (rdx >= 0x0) {
                            *(rax + 0x18) = *(rcx + 0x18);
                            *(rax + 0x10) = *(rcx + 0x10);
                            *(rax + 0x8) = *(rcx + 0x8);
                            *rax = *rcx;
                    }
                    else {
                            *(rax + 0x18) = *(rcx + 0x18);
                            *(rax + 0x10) = *(rcx + 0x10);
                            *(rax + 0x8) = *(rcx + 0x8);
                            *rax = *rcx;
                            [rdi invalidateLayout];
                    }
            }
    }
    else {
            *(rax + 0x18) = *(rcx + 0x18);
            *(rax + 0x10) = *(rcx + 0x10);
            *(rax + 0x8) = *(rcx + 0x8);
            *rax = *rcx;
    }
    return;
}

void -[UICollectionViewFlowLayout _updateDelegateFlags](void * self, void * _cmd) {
    r15 = [[self collectionView] retain];
    r14 = [[r15 delegate] retain];
    [r15 release];
    self->_gridLayoutFlags = self->_gridLayoutFlags & 0xffff & 0xfffe | [r14 respondsToSelector:@selector(collectionView:layout:sizeForItemAtIndexPath:)] & 0xff;
    self->_gridLayoutFlags = (self->_gridLayoutFlags & 0xffff & 0xfffd) + ([r14 respondsToSelector:@selector(collectionView:layout:referenceSizeForHeaderInSection:)] & 0xff) * 0x2;
    self->_gridLayoutFlags = (self->_gridLayoutFlags & 0xffff & 0xfffb) + ([r14 respondsToSelector:@selector(collectionView:layout:referenceSizeForFooterInSection:)] & 0xff) * 0x4;
    self->_gridLayoutFlags = (self->_gridLayoutFlags & 0xffff & 0xfff7) + ([r14 respondsToSelector:@selector(collectionView:layout:insetForSectionAtIndex:)] & 0xff) * 0x8;
    self->_gridLayoutFlags = self->_gridLayoutFlags & 0xffff & 0xffef | ([r14 respondsToSelector:@selector(collectionView:layout:minimumInteritemSpacingForSectionAtIndex:)] & 0xff) << 0x4;
    self->_gridLayoutFlags = self->_gridLayoutFlags & 0xffff & 0xffdf | ([r14 respondsToSelector:@selector(collectionView:layout:minimumLineSpacingForSectionAtIndex:)] & 0xff) << 0x5;
    self->_gridLayoutFlags = self->_gridLayoutFlags & 0xffff & 0xffbf | ([r14 respondsToSelector:@selector(_collectionView:layout:flowLayoutRowAlignmentOptionsForSection:)] & 0xff) << 0x6;
    self->_gridLayoutFlags = self->_gridLayoutFlags & 0xffff & 0xfbff | ([r14 respondsToSelector:@selector(_collectionView:layout:sizesForItemsInSection:)] & 0xff) << 0xa;
    rdi = r14;
    [rdi release];
    return;
}

void -[UICollectionViewFlowLayout _getSizingInfosWithExistingSizingDictionary:](void * self, void * _cmd, void * arg2) {
    rdx = arg2;
    var_1C8 = _cmd;
    r15 = self;
    var_178 = r15;
    var_2C0 = [rdx retain];
    r14 = [[r15 collectionView] retain];
    rbx = [[r14 delegate] retain];
    r12 = r15 + *_OBJC_IVAR_$_UICollectionViewFlowLayout._data;
    rdi = r15->_data;
    if (rdi == 0x0) {
            var_1B8 = rbx;
            *r12 = [[_UIFlowLayoutInfo alloc] init];
            [*r12 release];
            [*r12 setLayout:r15];
            rdi = r14;
            var_1D0 = rdi;
            r14 = *r12;
            rcx = [rdi _shouldReverseLayoutDirection];
            rax = 0x1;
            if (rcx != 0x0) {
                    rax = [r15 _wantsRightToLeftHorizontalMirroringIfNeeded];
            }
            [r14 setLeftToRight:rax & 0xff];
            rdi = *r12;
            rbx = var_1B8;
            r14 = var_1D0;
    }
    rdx = (r15->_scrollDirection == 0x1 ? 0x1 : 0x0) & 0xff;
    [rdi setHorizontal:rdx];
    var_369 = [*r12 horizontal];
    [r15 _dimensionFromCollectionView];
    var_378 = intrinsic_movsd(var_378, xmm0);
    if ((r15->_gridLayoutFlags & 0xffff & 0x401) != 0x0) {
            var_1B8 = rbx;
            var_1D4 = 0x0;
    }
    else {
            var_1B8 = rbx;
            var_1D4 = [r15 _estimatesSizes] ^ 0x1;
    }
    rax = [*r12 sections];
    rax = [rax retain];
    var_298 = rax;
    var_208 = [rax count];
    rax = [r15 _sections];
    rax = [rax retain];
    var_218 = rax;
    r12 = [rax firstIndex];
    var_1D0 = r14;
    rax = [r14 numberOfSections];
    var_220 = rax;
    if (r12 >= rax) goto loc_9aefff;

loc_9ad85d:
    var_2E0 = *_OBJC_IVAR_$_UICollectionViewFlowLayout._sectionInset + r15;
    xmm0 = intrinsic_movsd(xmm0, *_CGSizeZero);
    var_1A0 = intrinsic_movsd(var_1A0, xmm0);
    xmm0 = intrinsic_movsd(xmm0, *_CPBitmapCreateImagesFromData);
    var_1B0 = intrinsic_movsd(var_1B0, xmm0);
    goto loc_9adabe;

loc_9adabe:
    if (var_208 != 0x0) {
            rdx = 0x0;
            rax = [var_298 objectAtIndexedSubscript:rdx];
    }
    else {
            rax = [r15->_data addSection];
    }
    rbx = [rax retain];
    r14 = var_1D0;
    var_168 = rbx;
    rax = [r14 numberOfItemsInSection:r12];
    var_170 = rax;
    [rbx setItemsCount:rax];
    if (var_1D4 != 0x0) goto loc_9aea6f;

loc_9adb46:
    var_58 = 0x0;
    rcx = *_CPBitmapCreateImagesFromData;
    rdx = var_40;
    *(rdx + 0x8) = rcx;
    *rdx = *_CGSizeZero;
    var_78 = 0x0;
    [r15 _estimatesSizes] ^ 0x1;
    if (var_208 == 0x0) goto loc_9adf43;

loc_9adbcc:
    var_188 = r12;
    if (var_170 > 0x0) {
            r14 = 0x0;
            do {
                    var_180 = @selector(items);
                    rbx = [_objc_msgSend(var_168, var_180) retain];
                    rdx = r14;
                    r12 = [[rbx objectAtIndexedSubscript:rdx] retain];
                    [rbx release];
                    if (r12 != 0x0) {
                            rdx = @selector(itemFrame);
                            objc_msgSend_stret(var_A0, r12, rdx);
                            xmm2 = intrinsic_movupd(xmm2, var_90);
                    }
                    else {
                            xmm2 = intrinsic_xorpd(xmm2, xmm2);
                            var_90 = intrinsic_movapd(var_90, xmm2);
                            var_A0 = intrinsic_movapd(var_A0, xmm2);
                    }
                    if (*(int32_t *)__UIApplicationLinkedOnVersion != 0x0) {
                            rax = *(int32_t *)__UIApplicationLinkedOnVersion;
                            xmm1 = intrinsic_xorpd(xmm1, xmm1);
                            xmm2 = intrinsic_ucomisd(xmm2, xmm1);
                            rdx = rdx - rdx + CARRY(RFLAGS(cf));
                            xmm0 = intrinsic_movapd(xmm0, xmm2);
                            xmm0 = intrinsic_shufpd(xmm0, 0x1);
                            xmm0 = intrinsic_ucomisd(xmm0, xmm1);
                            rcx = (rcx - rcx + CARRY(RFLAGS(cf)) | rdx) & 0x1;
                            if (rax <= 0x8ffff) {
                                    var_160 = intrinsic_movapd(var_160, xmm2);
                                    if (rcx != 0x0) {
                                            rbx = ___UILogGetCategoryCachedImpl("Assert", __getSizingInfosWithExistingSizingDictionary:.__s_category);
                                            if (os_log_type_enabled(*(rbx + 0x8), 0x10) != 0x0) {
                                                    r15 = rsp;
                                                    rax = rsp;
                                                    *(int8_t *)(rax + 0xfffffffffffffff0) = 0x0;
                                                    *(int8_t *)(rax + 0xfffffffffffffff1) = 0x0;
                                                    _os_log_impl(0xffffffffff6521a5, *(rbx + 0x8), 0x10, "negative sizes are not supported in the flow layout", rax + 0xfffffffffffffff0, 0x2);
                                                    rsp = r15;
                                            }
                                    }
                            }
                            else {
                                    var_160 = intrinsic_movapd(var_160, xmm2);
                                    if (rcx != 0x0) {
                                            rbx = [[NSString stringWithUTF8String:"/BuildRoot/Library/Caches/com.apple.xbs/Sources/UIKit_Sim/UIKit-3600.6.21/UICollectionViewFlowLayout.m"] retain];
                                            rdi = @"<Unknown File>";
                                            if (rbx != 0x0) {
                                                    rdi = rbx;
                                            }
                                            r15 = [rdi retain];
                                            [rbx release];
                                            rbx = [[NSAssertionHandler currentHandler] retain];
                                            rdx = var_1C8;
                                            [rbx handleFailureInMethod:rdx object:var_178 file:r15 lineNumber:0x4e9 description:@"negative sizes are not supported in the flow layout"];
                                            rsp = (rsp - 0x10) + 0x10;
                                            rdi = rbx;
                                            [rdi release];
                                            [r15 release];
                                    }
                            }
                    }
                    else {
                            var_160 = intrinsic_movapd(var_160, xmm2);
                            rax = __UIApplicationLinkedOnOrAfter(0x90000);
                            xmm1 = intrinsic_xorpd(xmm1, xmm1);
                            xmm2 = intrinsic_movapd(xmm2, var_160);
                            xmm2 = intrinsic_ucomisd(xmm2, xmm1);
                            rdx = rdx - rdx + CARRY(RFLAGS(cf));
                            xmm0 = intrinsic_movapd(xmm0, xmm2);
                            xmm0 = intrinsic_shufpd(xmm0, 0x1);
                            xmm0 = intrinsic_ucomisd(xmm0, xmm1);
                            rcx = (rcx - rcx + CARRY(RFLAGS(cf)) | rdx) & 0x1;
                            if (rax != 0x0) {
                                    var_160 = intrinsic_movapd(var_160, xmm2);
                                    if (rcx != 0x0) {
                                            rbx = [[NSString stringWithUTF8String:"/BuildRoot/Library/Caches/com.apple.xbs/Sources/UIKit_Sim/UIKit-3600.6.21/UICollectionViewFlowLayout.m"] retain];
                                            rdi = @"<Unknown File>";
                                            if (rbx != 0x0) {
                                                    rdi = rbx;
                                            }
                                            r15 = [rdi retain];
                                            [rbx release];
                                            rbx = [[NSAssertionHandler currentHandler] retain];
                                            rdx = var_1C8;
                                            [rbx handleFailureInMethod:rdx object:var_178 file:r15 lineNumber:0x4e9 description:@"negative sizes are not supported in the flow layout"];
                                            rsp = (rsp - 0x10) + 0x10;
                                            rdi = rbx;
                                            [rdi release];
                                            [r15 release];
                                    }
                            }
                            else {
                                    var_160 = intrinsic_movapd(var_160, xmm2);
                                    if (rcx != 0x0) {
                                            rbx = ___UILogGetCategoryCachedImpl("Assert", __getSizingInfosWithExistingSizingDictionary:.__s_category);
                                            if (os_log_type_enabled(*(rbx + 0x8), 0x10) != 0x0) {
                                                    r15 = rsp;
                                                    rax = rsp;
                                                    *(int8_t *)(rax + 0xfffffffffffffff0) = 0x0;
                                                    *(int8_t *)(rax + 0xfffffffffffffff1) = 0x0;
                                                    _os_log_impl(0xffffffffff6521a5, *(rbx + 0x8), 0x10, "negative sizes are not supported in the flow layout", rax + 0xfffffffffffffff0, 0x2);
                                                    rsp = r15;
                                            }
                                    }
                            }
                    }
                    rax = var_78;
                    COND = *(int8_t *)(rax + 0x18) == 0x0;
                    xmm3 = intrinsic_movapd(xmm3, var_160);
                    if (!COND) {
                            rcx = var_58;
                            xmm1 = intrinsic_movsd(xmm1, *(rcx + 0x20));
                            xmm0 = intrinsic_movsd(xmm0, *(rcx + 0x28));
                            xmm2 = intrinsic_movsd(xmm2, var_1A0);
                            xmm2 = intrinsic_ucomisd(xmm2, xmm1);
                            if ((xmm2 == 0x0) && (!CPU_FLAGS & P)) {
                                    xmm2 = intrinsic_movsd(xmm2, var_1B0);
                                    xmm2 = intrinsic_ucomisd(xmm2, xmm0);
                                    if ((xmm2 == 0x0) && (!CPU_FLAGS & P)) {
                                            *(int128_t *)(rcx + 0x20) = intrinsic_movupd(*(int128_t *)(rcx + 0x20), xmm3);
                                    }
                                    else {
                                            xmm3 = intrinsic_ucomisd(xmm3, xmm1);
                                            if ((xmm3 == 0x0) && (!CPU_FLAGS & P)) {
                                                    xmm1 = intrinsic_movapd(xmm1, xmm3);
                                                    xmm1 = intrinsic_shufpd(xmm1, 0x1);
                                                    xmm1 = intrinsic_ucomisd(xmm1, xmm0);
                                                    if ((xmm1 != 0x0) || (!CPU_FLAGS & NP)) {
                                                            *(int8_t *)(rax + 0x18) = 0x0;
                                                    }
                                            }
                                            else {
                                                    *(int8_t *)(rax + 0x18) = 0x0;
                                            }
                                    }
                            }
                            else {
                                    xmm3 = intrinsic_ucomisd(xmm3, xmm1);
                                    if ((xmm3 == 0x0) && (!CPU_FLAGS & P)) {
                                            xmm1 = intrinsic_movapd(xmm1, xmm3);
                                            xmm1 = intrinsic_shufpd(xmm1, 0x1);
                                            xmm1 = intrinsic_ucomisd(xmm1, xmm0);
                                            if ((xmm1 != 0x0) || (!CPU_FLAGS & NP)) {
                                                    *(int8_t *)(rax + 0x18) = 0x0;
                                            }
                                    }
                                    else {
                                            *(int8_t *)(rax + 0x18) = 0x0;
                                    }
                            }
                    }
                    xmm0 = intrinsic_xorpd(xmm0, xmm0);
                    var_C0 = intrinsic_movapd(var_C0, xmm0);
                    var_B0 = intrinsic_movapd(var_B0, xmm3);
                    rcx = var_B8;
                    [r12 setItemFrame:rdx, rcx];
                    rsp = (rsp - 0x20) + 0x20;
                    [r12 release];
                    r14 = r14 + 0x1;
            } while (r14 < var_170);
    }
    goto loc_9ae9c1;

loc_9ae9c1:
    if (*(int8_t *)(var_78 + 0x18) != 0x0) {
            rbx = [[var_168 items] retain];
            [rbx removeAllObjects];
            [rbx release];
            xmm0 = intrinsic_movsd(xmm0, *(var_58 + 0x20));
            xmm1 = intrinsic_movsd(xmm1, *(var_58 + 0x28));
            [var_168 setItemSize:rdx];
            rdx = 0x1;
            [var_168 setFixedItemSize:rdx];
    }
    _Block_object_dispose(0x0, 0x8);
    _Block_object_dispose(0x0, 0x8);
    r15 = var_178;
    r12 = var_188;
    goto loc_9aea6f;

loc_9aea6f:
    var_188 = r12;
    if ((r15->_gridLayoutFlags & 0x8) == 0x0) {
            r14 = var_168;
            [r14 setSectionMargins:rdx, rcx];
            rsp = (rsp - 0x20) + 0x20;
            r12 = var_1B8;
    }
    else {
            rbx = [[r15 collectionView] retain];
            r12 = var_1B8;
            if (r12 != 0x0) {
                    rcx = rbx;
                    [var_150 collectionView:r12 layout:rcx insetForSectionAtIndex:r15, var_188];
            }
            else {
                    xmm0 = intrinsic_xorpd(xmm0, xmm0);
                    var_140 = intrinsic_movapd(var_140, xmm0);
                    var_150 = intrinsic_movapd(var_150, xmm0);
            }
            r14 = var_168;
            [r14 setSectionMargins:rdx, rcx];
            rsp = (rsp - 0x20) + 0x20;
            [rbx release];
    }
    if ((r15->_gridLayoutFlags & 0x10) == 0x0) {
            [r15 minimumInteritemSpacing];
            [r14 setHorizontalInterstice:rdx];
    }
    else {
            rbx = [[r15 collectionView] retain];
            [r12 collectionView:rbx layout:r15 minimumInteritemSpacingForSectionAtIndex:var_188];
            [r14 setHorizontalInterstice:rdx];
            [rbx release];
    }
    if ((r15->_gridLayoutFlags & 0x20) == 0x0) {
            [r15 minimumLineSpacing];
            [r14 setVerticalInterstice:rdx];
    }
    else {
            rbx = [[r15 collectionView] retain];
            [r12 collectionView:rbx layout:r15 minimumLineSpacingForSectionAtIndex:var_188];
            [r14 setVerticalInterstice:rdx];
            [rbx release];
    }
    if (var_1D4 != 0x0) {
            [r14 setFixedItemSize:0x1];
            [r15 itemSize];
            [r14 setItemSize:rdx];
    }
    if ((r15->_gridLayoutFlags & 0x40) != 0x0) goto loc_9aeccd;

loc_9aecb7:
    rbx = [r15->_rowAlignmentsOptionsDictionary retain];
    goto loc_9aed3f;

loc_9aed3f:
    rax = 0x0;
    r14 = 0x0;
    rcx = 0x0;
    r13 = 0x0;
    if (rbx != 0x0) {
            var_160 = rbx;
            rdi = rbx;
            r13 = rbx;
            r14 = [[rdi objectForKeyedSubscript:@"UIFlowLayoutCommonRowHorizontalAlignmentKey"] retain];
            var_170 = [r14 intValue];
            [r14 release];
            r13 = [[r13 objectForKeyedSubscript:@"UIFlowLayoutLastRowHorizontalAlignmentKey"] retain];
            r14 = [r13 intValue];
            [r13 release];
            r15 = [[var_160 objectForKeyedSubscript:@"UIFlowLayoutRowVerticalAlignmentKey"] retain];
            r13 = [r15 intValue];
            [r15 release];
            rcx = var_170;
            rax = var_160;
    }
    goto loc_9aee1b;

loc_9aee1b:
    var_160 = rax;
    rdx = rcx | r14 << 0x20;
    rbx = var_168;
    rcx = r13;
    [rbx setRowAlignmentOptions:rdx];
    r15 = var_178;
    if ((r15->_gridLayoutFlags & 0x2) == 0x0) {
            xmm1 = intrinsic_movsd(xmm1, r15->_headerReferenceSize);
            xmm0 = intrinsic_movsd(xmm0, *(r15 + *_OBJC_IVAR_$_UICollectionViewFlowLayout._headerReferenceSize + 0x8));
    }
    else {
            r14 = [[r15 collectionView] retain];
            rcx = r15;
            [var_1B8 collectionView:r14 layout:rcx referenceSizeForHeaderInSection:var_188];
            var_170 = intrinsic_movsd(var_170, xmm0);
            var_180 = intrinsic_movsd(var_180, xmm1);
            [r14 release];
            xmm1 = intrinsic_movsd(xmm1, var_170);
            xmm0 = intrinsic_movsd(xmm0, var_180);
    }
    if (r15->_scrollDirection != 0x0) {
            xmm0 = intrinsic_movapd(xmm0, xmm1);
    }
    r14 = rbx;
    r12 = var_188;
    rdx = r12;
    [rbx setHeaderDimension:rdx forSection:rcx];
    if ((r15->_gridLayoutFlags & 0x4) == 0x0) {
            xmm1 = intrinsic_movsd(xmm1, r15->_footerReferenceSize);
            xmm0 = intrinsic_movsd(xmm0, *(r15 + *_OBJC_IVAR_$_UICollectionViewFlowLayout._footerReferenceSize + 0x8));
    }
    else {
            rbx = [[r15 collectionView] retain];
            [var_1B8 collectionView:rbx layout:r15 referenceSizeForFooterInSection:r12];
            var_170 = intrinsic_movsd(var_170, xmm0);
            var_180 = intrinsic_movsd(var_180, xmm1);
            [rbx release];
            xmm1 = intrinsic_movsd(xmm1, var_170);
            xmm0 = intrinsic_movsd(xmm0, var_180);
    }
    rbx = var_160;
    if (r15->_scrollDirection != 0x0) {
            xmm0 = intrinsic_movapd(xmm0, xmm1);
    }
    rdx = r12;
    [r14 setFooterDimension:rdx forSection:rcx];
    rax = var_218;
    if (rax != 0x0) {
            rdx = r12;
            r12 = [rax indexGreaterThanIndex:rdx];
    }
    else {
            r12 = r12 + 0x1;
    }
    rdi = rbx;
    [rdi release];
    [r14 release];
    if (r12 < var_220) goto loc_9adabe;

loc_9aefff:
    [var_218 release];
    [var_298 release];
    [var_1B8 release];
    [var_1D0 release];
    [var_2C0 release];
    if (*___stack_chk_guard != *___stack_chk_guard) {
            __stack_chk_fail();
    }
    return;

loc_9aeccd:
    r14 = [[r15 collectionView] retain];
    rbx = [[r12 _collectionView:r14 layout:r15 flowLayoutRowAlignmentOptionsForSection:var_188] retain];
    [r14 release];
    if (rbx != 0x0) goto loc_9aed5b;

loc_9aed18:
    r14 = [var_178->_rowAlignmentsOptionsDictionary retain];
    [rbx release];
    rbx = r14;
    goto loc_9aed3f;

loc_9aed5b:
    var_160 = rbx;
    rdi = rbx;
    r13 = rbx;
    r14 = [[rdi objectForKeyedSubscript:@"UIFlowLayoutCommonRowHorizontalAlignmentKey"] retain];
    var_170 = [r14 intValue];
    [r14 release];
    r13 = [[r13 objectForKeyedSubscript:@"UIFlowLayoutLastRowHorizontalAlignmentKey"] retain];
    r14 = [r13 intValue];
    [r13 release];
    r15 = [[var_160 objectForKeyedSubscript:@"UIFlowLayoutRowVerticalAlignmentKey"] retain];
    r13 = [r15 intValue];
    [r15 release];
    rcx = var_170;
    rax = var_160;
    goto loc_9aee1b;

loc_9adf43:
    if ((*(int8_t *)(r15 + *_OBJC_IVAR_$_UICollectionViewFlowLayout._gridLayoutFlags + 0x1) & 0x4) != 0x0) goto loc_9ae52e;

loc_9adf56:
    var_188 = r12;
    var_398 = [[var_168 items] retain];
    [var_178 itemSize];
    var_2C8 = intrinsic_movsd(var_2C8, xmm0);
    var_2D0 = intrinsic_movsd(var_2D0, xmm1);
    if (var_170 > 0x0) {
            r13 = 0x0;
            do {
                    r15 = [[var_168 addItem] retain];
                    [r15 release];
                    rdi = var_178;
                    if ((rdi->_gridLayoutFlags & 0x1) == 0x0) {
                            if ([rdi _estimatesSizes] != 0x0) {
                                    rcx = var_188;
                                    rbx = [[NSIndexPath indexPathForRow:r13 inSection:rcx] retain];
                                    rdx = rbx;
                                    r14 = [[var_2C0 objectForKeyedSubscript:rdx] retain];
                                    [rbx release];
                                    if (r14 != 0x0) {
                                            [r14 CGSizeValue];
                                            var_160 = intrinsic_movsd(var_160, xmm0);
                                            var_180 = intrinsic_movsd(var_180, xmm1);
                                            xmm0 = intrinsic_movsd(xmm0, var_180);
                                            if (var_369 == 0x0) {
                                                    xmm0 = intrinsic_movsd(xmm0, var_160);
                                            }
                                            xmm1 = intrinsic_movsd(xmm1, var_378);
                                            xmm1 = intrinsic_ucomisd(xmm1, xmm0);
                                            if (xmm1 <= 0x0) {
                                                    [var_178 _effectiveEstimatedItemSize];
                                                    var_160 = intrinsic_movsd(var_160, xmm0);
                                                    var_180 = intrinsic_movsd(var_180, xmm1);
                                                    var_190 = 0x0;
                                            }
                                            else {
                                                    var_190 = 0x1;
                                            }
                                    }
                                    else {
                                            [var_178 _effectiveEstimatedItemSize];
                                            var_160 = intrinsic_movsd(var_160, xmm0);
                                            var_180 = intrinsic_movsd(var_180, xmm1);
                                            var_190 = 0x0;
                                    }
                                    [r14 release];
                                    r12 = 0x1;
                            }
                            else {
                                    var_190 = 0x1;
                                    r12 = 0x0;
                                    xmm0 = intrinsic_movsd(xmm0, var_2C8);
                                    var_160 = intrinsic_movsd(var_160, xmm0);
                                    xmm0 = intrinsic_movsd(xmm0, var_2D0);
                                    var_180 = intrinsic_movsd(var_180, xmm0);
                            }
                    }
                    else {
                            rbx = [[NSIndexPath indexPathForRow:r13 inSection:var_188] retain];
                            rdx = var_1D0;
                            rcx = var_178;
                            [var_1B8 collectionView:rdx layout:rcx sizeForItemAtIndexPath:rbx];
                            var_160 = intrinsic_movsd(var_160, xmm0);
                            var_180 = intrinsic_movsd(var_180, xmm1);
                            [rbx release];
                            var_190 = 0x1;
                            r12 = 0x0;
                    }
                    if (*(int32_t *)__UIApplicationLinkedOnVersion != 0x0) {
                            rax = *(int32_t *)__UIApplicationLinkedOnVersion;
                            xmm0 = intrinsic_xorpd(xmm0, xmm0);
                            xmm1 = intrinsic_movsd(xmm1, var_160);
                            xmm1 = intrinsic_ucomisd(xmm1, xmm0);
                            rdx = rdx - rdx + CARRY(RFLAGS(cf));
                            xmm1 = intrinsic_movsd(xmm1, var_180);
                            xmm1 = intrinsic_ucomisd(xmm1, xmm0);
                            rcx = (rcx - rcx + CARRY(RFLAGS(cf)) | rdx) & 0x1;
                            if (rax <= 0x8ffff) {
                                    if (rcx != 0x0) {
                                            rbx = ___UILogGetCategoryCachedImpl("Assert", __getSizingInfosWithExistingSizingDictionary:.__s_category.382);
                                            if (os_log_type_enabled(*(rbx + 0x8), 0x10) != 0x0) {
                                                    r14 = rsp;
                                                    rax = rsp;
                                                    *(int8_t *)(rax + 0xfffffffffffffff0) = 0x0;
                                                    *(int8_t *)(rax + 0xfffffffffffffff1) = 0x0;
                                                    _os_log_impl(0xffffffffff651c1b, *(rbx + 0x8), 0x10, "negative sizes are not supported in the flow layout", rax + 0xfffffffffffffff0, 0x2);
                                                    rsp = r14;
                                            }
                                    }
                            }
                            else {
                                    if (rcx != 0x0) {
                                            rbx = [[NSString stringWithUTF8String:"/BuildRoot/Library/Caches/com.apple.xbs/Sources/UIKit_Sim/UIKit-3600.6.21/UICollectionViewFlowLayout.m"] retain];
                                            rdi = @"<Unknown File>";
                                            if (rbx != 0x0) {
                                                    rdi = rbx;
                                            }
                                            r14 = [rdi retain];
                                            [rbx release];
                                            rbx = [[NSAssertionHandler currentHandler] retain];
                                            [rbx handleFailureInMethod:var_1C8 object:var_178 file:r14 lineNumber:0x53f description:@"negative sizes are not supported in the flow layout"];
                                            rsp = (rsp - 0x10) + 0x10;
                                            rdi = rbx;
                                            [rdi release];
                                            [r14 release];
                                    }
                            }
                    }
                    else {
                            rax = __UIApplicationLinkedOnOrAfter(0x90000);
                            xmm0 = intrinsic_xorpd(xmm0, xmm0);
                            xmm1 = intrinsic_movsd(xmm1, var_160);
                            xmm1 = intrinsic_ucomisd(xmm1, xmm0);
                            rdx = rdx - rdx + CARRY(RFLAGS(cf));
                            xmm1 = intrinsic_movsd(xmm1, var_180);
                            xmm1 = intrinsic_ucomisd(xmm1, xmm0);
                            rcx = (rcx - rcx + CARRY(RFLAGS(cf)) | rdx) & 0x1;
                            if (rax != 0x0) {
                                    if (rcx != 0x0) {
                                            rbx = [[NSString stringWithUTF8String:"/BuildRoot/Library/Caches/com.apple.xbs/Sources/UIKit_Sim/UIKit-3600.6.21/UICollectionViewFlowLayout.m"] retain];
                                            rdi = @"<Unknown File>";
                                            if (rbx != 0x0) {
                                                    rdi = rbx;
                                            }
                                            r14 = [rdi retain];
                                            [rbx release];
                                            rbx = [[NSAssertionHandler currentHandler] retain];
                                            [rbx handleFailureInMethod:var_1C8 object:var_178 file:r14 lineNumber:0x53f description:@"negative sizes are not supported in the flow layout"];
                                            rsp = (rsp - 0x10) + 0x10;
                                            rdi = rbx;
                                            [rdi release];
                                            [r14 release];
                                    }
                            }
                            else {
                                    if (rcx != 0x0) {
                                            rbx = ___UILogGetCategoryCachedImpl("Assert", __getSizingInfosWithExistingSizingDictionary:.__s_category.382);
                                            if (os_log_type_enabled(*(rbx + 0x8), 0x10) != 0x0) {
                                                    r14 = rsp;
                                                    rax = rsp;
                                                    *(int8_t *)(rax + 0xfffffffffffffff0) = 0x0;
                                                    *(int8_t *)(rax + 0xfffffffffffffff1) = 0x0;
                                                    _os_log_impl(0xffffffffff651c1b, *(rbx + 0x8), 0x10, "negative sizes are not supported in the flow layout", rax + 0xfffffffffffffff0, 0x2);
                                                    rsp = r14;
                                            }
                                    }
                            }
                    }
                    rax = var_78;
                    if (*(int8_t *)(rax + 0x18) != 0x0) {
                            rcx = var_58;
                            xmm1 = intrinsic_movsd(xmm1, *(rcx + 0x20));
                            xmm0 = intrinsic_movsd(xmm0, *(rcx + 0x28));
                            xmm2 = intrinsic_movsd(xmm2, var_1A0);
                            xmm2 = intrinsic_ucomisd(xmm2, xmm1);
                            if ((xmm2 == 0x0) && (!CPU_FLAGS & P)) {
                                    xmm2 = intrinsic_movsd(xmm2, var_1B0);
                                    xmm2 = intrinsic_ucomisd(xmm2, xmm0);
                                    if ((xmm2 == 0x0) && (!CPU_FLAGS & P)) {
                                            xmm0 = intrinsic_movsd(xmm0, var_160);
                                            *(rcx + 0x20) = intrinsic_movsd(*(rcx + 0x20), xmm0);
                                            xmm0 = intrinsic_movsd(xmm0, var_180);
                                            *(rcx + 0x28) = intrinsic_movsd(*(rcx + 0x28), xmm0);
                                    }
                                    else {
                                            xmm2 = intrinsic_movsd(xmm2, var_160);
                                            xmm2 = intrinsic_ucomisd(xmm2, xmm1);
                                            if ((xmm2 == 0x0) && (!CPU_FLAGS & P)) {
                                                    xmm1 = intrinsic_movsd(xmm1, var_180);
                                                    xmm1 = intrinsic_ucomisd(xmm1, xmm0);
                                                    if ((xmm1 != 0x0) || (!CPU_FLAGS & NP)) {
                                                            *(int8_t *)(rax + 0x18) = 0x0;
                                                    }
                                            }
                                            else {
                                                    *(int8_t *)(rax + 0x18) = 0x0;
                                            }
                                    }
                            }
                            else {
                                    xmm2 = intrinsic_movsd(xmm2, var_160);
                                    xmm2 = intrinsic_ucomisd(xmm2, xmm1);
                                    if ((xmm2 == 0x0) && (!CPU_FLAGS & P)) {
                                            xmm1 = intrinsic_movsd(xmm1, var_180);
                                            xmm1 = intrinsic_ucomisd(xmm1, xmm0);
                                            if ((xmm1 != 0x0) || (!CPU_FLAGS & NP)) {
                                                    *(int8_t *)(rax + 0x18) = 0x0;
                                            }
                                    }
                                    else {
                                            *(int8_t *)(rax + 0x18) = 0x0;
                                    }
                            }
                    }
                    [r15 setSizeHasBeenSet:var_190 & 0xff];
                    rdx = r12 & 0xff;
                    [r15 setSizeEstimated:rdx];
                    xmm0 = intrinsic_xorpd(xmm0, xmm0);
                    var_130 = intrinsic_movapd(var_130, xmm0);
                    xmm0 = intrinsic_movsd(xmm0, var_160);
                    var_120 = intrinsic_movsd(var_120, xmm0);
                    xmm0 = intrinsic_movsd(xmm0, var_180);
                    var_118 = intrinsic_movsd(var_118, xmm0);
                    rcx = var_128;
                    [r15 setItemFrame:rdx, rcx];
                    rsp = (rsp - 0x20) + 0x20;
                    r13 = r13 + 0x1;
            } while (r13 < var_170);
    }
    [var_398 release];
    goto loc_9ae9c1;

loc_9ae52e:
    r8 = r12;
    var_188 = r12;
    r14 = [[var_1B8 _collectionView:r14 layout:r15 sizesForItemsInSection:r8] retain];
    rax = [var_178 retain];
    var_2D0 = rax;
    var_F0 = rax;
    [var_168 retain];
    var_268 = rsp;
    var_E8 = var_168;
    r14 = [r14 retain];
    var_1F0 = r14;
    var_200 = [__NSConcreteStackBlock retain];
    rax = [r14 count];
    var_270 = rsp;
    r15 = rax * 0x8 + 0xf & 0xfffffffffffffff0;
    var_160 = rsp - r15;
    r14 = rax * 0x8;
    r12 = rax;
    memset(rsp - r15, 0x0, r14);
    var_180 = rsp - r15 - r15;
    memset(rsp - r15 - r15, 0x0, r14);
    [var_1F0 getObjects:rsp - r15 - r15 andKeys:rsp - r15];
    rcx = r12;
    r13 = rsp - r15 - r15 - (rcx << 0x4);
    rdi = r13 - r15;
    r12 = rdi - r15;
    rdx = r12 - (rcx << 0x4);
    rsi = 0x0;
    if (rcx == 0x0) goto loc_9ae8bd;

loc_9ae6de:
    var_1F8 = rdx;
    var_2C8 = rdi;
    memset_pattern16(rdi, 0xc506d0, r14);
    rcx = rcx;
    r15 = var_1F8 + 0x8;
    r14 = r13 + 0x8;
    var_210 = r13;
    rbx = 0x0;
    do {
            r13 = rcx;
            [*(var_180 + rbx * 0x8) CGSizeValue];
            *(r14 + 0xfffffffffffffff8) = intrinsic_movsd(*(r14 + 0xfffffffffffffff8), xmm0);
            *r14 = intrinsic_movsd(*r14, xmm1);
            rax = [*(var_160 + rbx * 0x8) rangeCount];
            *(r12 + rbx * 0x8) = rax;
            if (rax != 0x0) {
                    *(r15 + 0xfffffffffffffff8) = [*(var_160 + rbx * 0x8) rangeAtIndex:rdx];
                    *r15 = 0x0;
            }
            rbx = rbx + 0x1;
            r15 = r15 + 0x10;
            r14 = r14 + 0x10;
            rcx = r13;
    } while (rcx != rbx);
    var_180 = @selector(rangeAtIndex:);
    rax = var_210 + 0x8;
    var_210 = rax;
    rdi = var_1F8 + 0x8;
    rsi = 0x0;
    rdx = var_2C8;
    goto loc_9ae81e;

loc_9ae81e:
    r14 = rdi;
    rbx = 0x0;
    goto loc_9ae823;

loc_9ae823:
    r15 = *(rdx + rbx * 0x8);
    r13 = *(r12 + rbx * 0x8);
    if ((r15 > r13) || (*(r14 + 0xfffffffffffffff8) != rsi)) goto loc_9ae836;

loc_9ae848:
    var_190 = rcx;
    var_1E8 = *r14;
    xmm0 = intrinsic_movsd(xmm0, *(rax + 0xfffffffffffffff8));
    xmm1 = intrinsic_movsd(xmm1, *rax);
    var_1A8 = rsi;
    ___74-[UICollectionViewFlowLayout _getSizingInfosWithExistingSizingDictionary:]_block_invoke(var_200, rsi, rdx);
    rdi = rdi;
    if (r15 < r13) {
            var_180 = @selector(rangeAtIndex:);
            *(r14 + 0xfffffffffffffff8) = _objc_msgSend(*(var_160 + rbx * 0x8), var_180);
            *r14 = r15;
            rdi = rdi;
    }
    rsi = var_1A8 + var_1E8;
    rdx = var_2C8;
    *(rdx + rbx * 0x8) = r15 + 0x1;
    rcx = var_190;
    rax = var_210;
    goto loc_9ae81e;

loc_9ae836:
    rbx = rbx + 0x1;
    rax = rax + 0x10;
    r14 = r14 + 0x10;
    if (rbx < rcx) goto loc_9ae823;

loc_9ae8bd:
    rbx = _objc_release;
    [var_200 release];
    [var_1F0 release];
    rsp = var_268;
    if (rsi != var_170) {
            r15 = _objc_release;
            rbx = [[NSString stringWithUTF8String:"/BuildRoot/Library/Caches/com.apple.xbs/Sources/UIKit_Sim/UIKit-3600.6.21/UICollectionViewFlowLayout.m"] retain];
            rdi = @"<Unknown File>";
            if (rbx != 0x0) {
                    rdi = rbx;
            }
            r14 = [rdi retain];
            [rbx release];
            rbx = [[NSAssertionHandler currentHandler] retain];
            rsi = @selector(handleFailureInMethod:object:file:lineNumber:description:);
            rdx = var_1C8;
            rcx = var_2D0;
            r8 = r14;
            _objc_msgSend(rbx, rsi);
            rsp = (rsp - 0x10) + 0x10;
            (r15)(rbx, rsi, rdx);
            rbx = r15;
            (rbx)(r14, rsi, rdx);
    }
    (rbx)(var_E8, rsi, rdx, rcx, r8);
    (rbx)(var_F0, rsi, rdx, rcx, r8);
    (rbx)(var_1F0, rsi, rdx, rcx, r8);
    goto loc_9ae9c1;
}

int ___74-[UICollectionViewFlowLayout _getSizingInfosWithExistingSizingDictionary:]_block_invoke(int arg0, int arg1, int arg2) {
    var_60 = intrinsic_movsd(var_60, xmm1, arg2);
    var_58 = intrinsic_movsd(var_58, xmm0);
    r14 = arg2;
    r15 = arg1;
    rbx = arg0;
    xmm2 = intrinsic_xorpd(xmm2, xmm2);
    xmm0 = intrinsic_ucomisd(xmm0, xmm2);
    if (xmm0 >= 0x0) {
            xmm1 = intrinsic_movsd(xmm1, var_60);
            xmm1 = intrinsic_ucomisd(xmm1, xmm2);
            if (xmm1 < 0x0) {
                    r13 = [[NSString stringWithUTF8String:"/BuildRoot/Library/Caches/com.apple.xbs/Sources/UIKit_Sim/UIKit-3600.6.21/UICollectionViewFlowLayout.m"] retain];
                    rdi = @"<Unknown File>";
                    if (r13 != 0x0) {
                            rdi = r13;
                    }
                    var_68 = [rdi retain];
                    [r13 release];
                    r13 = [[NSAssertionHandler currentHandler] retain];
                    rcx = *(rbx + 0x20);
                    rdx = *(rbx + 0x40);
                    [r13 handleFailureInMethod:rdx object:rcx file:var_68 lineNumber:0x4fb description:@"negative sizes are not supported in the flow layout"];
                    [var_68 release];
                    [r13 release];
            }
    }
    else {
            r13 = [[NSString stringWithUTF8String:"/BuildRoot/Library/Caches/com.apple.xbs/Sources/UIKit_Sim/UIKit-3600.6.21/UICollectionViewFlowLayout.m"] retain];
            rdi = @"<Unknown File>";
            if (r13 != 0x0) {
                    rdi = r13;
            }
            var_68 = [rdi retain];
            [r13 release];
            r13 = [[NSAssertionHandler currentHandler] retain];
            rcx = *(rbx + 0x20);
            rdx = *(rbx + 0x40);
            [r13 handleFailureInMethod:rdx object:rcx file:var_68 lineNumber:0x4fb description:@"negative sizes are not supported in the flow layout"];
            [var_68 release];
            [r13 release];
    }
    rax = r14 + r15;
    if (rax > r15) {
            xmm0 = intrinsic_movsd(xmm0, *_CGSizeZero);
            var_70 = intrinsic_movsd(var_70, xmm0);
            xmm0 = intrinsic_movsd(xmm0, *_CPBitmapCreateImagesFromData);
            var_88 = intrinsic_movsd(var_88, xmm0);
            do {
                    rdi = *(rbx + 0x28);
                    if (*(int8_t *)(rbx + 0x48) != 0x0) {
                            r12 = rbx;
                            r13 = [[rdi items] retain];
                            rdx = r15;
                            rbx = r12;
                            r12 = [[r13 objectAtIndexedSubscript:rdx] retain];
                            [r13 release];
                    }
                    else {
                            r12 = [[rdi addItem] retain];
                    }
                    rax = *(*(rbx + 0x30) + 0x8);
                    if (*(int8_t *)(rax + 0x18) != 0x0) {
                            rcx = *(*(rbx + 0x38) + 0x8);
                            xmm1 = intrinsic_movsd(xmm1, *(rcx + 0x20));
                            xmm0 = intrinsic_movsd(xmm0, *(rcx + 0x28));
                            xmm2 = intrinsic_movsd(xmm2, var_70);
                            xmm2 = intrinsic_ucomisd(xmm2, xmm1);
                            if ((xmm2 == 0x0) && (!CPU_FLAGS & P)) {
                                    xmm2 = intrinsic_movsd(xmm2, var_88);
                                    xmm2 = intrinsic_ucomisd(xmm2, xmm0);
                                    if ((xmm2 == 0x0) && (!CPU_FLAGS & P)) {
                                            xmm0 = intrinsic_movsd(xmm0, var_58);
                                            *(rcx + 0x20) = intrinsic_movsd(*(rcx + 0x20), xmm0);
                                            xmm0 = intrinsic_movsd(xmm0, var_60);
                                            *(rcx + 0x28) = intrinsic_movsd(*(rcx + 0x28), xmm0);
                                    }
                                    else {
                                            xmm1 = intrinsic_ucomisd(xmm1, var_58);
                                            if ((xmm1 == 0x0) && (!CPU_FLAGS & P)) {
                                                    xmm0 = intrinsic_ucomisd(xmm0, var_60);
                                                    if ((xmm0 != 0x0) || (!CPU_FLAGS & NP)) {
                                                            *(int8_t *)(rax + 0x18) = 0x0;
                                                    }
                                            }
                                            else {
                                                    *(int8_t *)(rax + 0x18) = 0x0;
                                            }
                                    }
                            }
                            else {
                                    xmm1 = intrinsic_ucomisd(xmm1, var_58);
                                    if ((xmm1 == 0x0) && (!CPU_FLAGS & P)) {
                                            xmm0 = intrinsic_ucomisd(xmm0, var_60);
                                            if ((xmm0 != 0x0) || (!CPU_FLAGS & NP)) {
                                                    *(int8_t *)(rax + 0x18) = 0x0;
                                            }
                                    }
                                    else {
                                            *(int8_t *)(rax + 0x18) = 0x0;
                                    }
                            }
                    }
                    xmm0 = intrinsic_xorpd(xmm0, xmm0);
                    var_50 = intrinsic_movapd(var_50, xmm0);
                    xmm0 = intrinsic_movsd(xmm0, var_58);
                    var_40 = intrinsic_movsd(var_40, xmm0);
                    xmm0 = intrinsic_movsd(xmm0, var_60);
                    var_38 = intrinsic_movsd(var_38, xmm0);
                    [r12 setItemFrame:rdx, rcx];
                    rax = [r12 release];
                    r15 = r15 + 0x1;
                    r14 = r14 - 0x1;
            } while (r14 != 0x0);
    }
    return rax;
}

void -[UICollectionViewFlowLayout _updateItemsLayoutForRect:allowsPartialUpdate:](void * self, void * _cmd, struct CGRect arg2, bool arg3) {
    r14 = arg2;
    rbx = self;
    if (rbx->_data != 0x0) {
            [rbx _dimensionFromCollectionView];
            xmm1 = intrinsic_xorpd(xmm1, xmm1);
            xmm0 = intrinsic_ucomisd(xmm0, xmm1);
            if ((xmm0 != 0x0) || (!CPU_FLAGS & NP)) {
                    var_A8 = intrinsic_movsd(var_A8, xmm0);
                    r15 = [rbx->_data horizontal];
                    xmm0 = intrinsic_movsd(xmm0, var_A8);
                    [rbx->_data setDimension:rdx];
                    xmm0 = intrinsic_xorpd(xmm0, xmm0);
                    rbx->_currentLayoutSize = intrinsic_movupd(rbx->_currentLayoutSize, xmm0);
                    var_40 = 0x0;
                    r12 = [[rbx->_data sections] retain];
                    var_80 = [rbx retain];
                    rdx = __NSConcreteStackBlock;
                    [r12 enumerateObjectsUsingBlock:rdx];
                    [r12 release];
                    if (r15 != 0x0) {
                            [rbx->_data dimension];
                            xmm1 = intrinsic_movapd(xmm1, xmm0);
                            rbx->_currentLayoutSize = *(var_40 + 0x18);
                            *(rbx + *_OBJC_IVAR_$_UICollectionViewFlowLayout._currentLayoutSize + 0x8) = intrinsic_movsd(*(rbx + *_OBJC_IVAR_$_UICollectionViewFlowLayout._currentLayoutSize + 0x8), xmm1);
                    }
                    else {
                            [rbx->_data dimension];
                            rbx->_currentLayoutSize = intrinsic_movsd(rbx->_currentLayoutSize, xmm0);
                            *(rbx + *_OBJC_IVAR_$_UICollectionViewFlowLayout._currentLayoutSize + 0x8) = *(var_40 + 0x18);
                    }
                    [rbx->_data setContentSize:rdx];
                    [var_80 release];
                    _Block_object_dispose(0x0, 0x8);
            }
    }
    return;
}

int ___76-[UICollectionViewFlowLayout _updateItemsLayoutForRect:allowsPartialUpdate:]_block_invoke(int arg0, int arg1, int arg2) {
    r15 = arg2;
    r14 = arg1;
    rbx = arg0;
    if ([*(rbx + 0x20) _estimatesSizes] != 0x0) {
            rsi = @selector(updateEstimatedSizeForSection:);
            rdi = r14;
            rdx = r15;
            _objc_msgSend(rdi, rsi);
            if (r14 != 0x0) {
                    rdx = @selector(frame);
                    rdi = var_40;
                    rsi = r14;
                    objc_msgSend_stret(rdi, rsi, rdx);
            }
            else {
                    xmm0 = intrinsic_xorpd(xmm0, xmm0);
                    var_30 = intrinsic_movapd(var_30, xmm0);
                    var_40 = intrinsic_movapd(var_40, xmm0);
            }
            if (CGRectIntersectsRect(rdi, rsi) != 0x0) {
                    if (*(int8_t *)(rbx + 0x50) != 0x0) {
                            rdx = var_38;
                            rdi = var_60;
                            CGRectIntersection(rdi, rsi);
                    }
                    else {
                            xmm0 = intrinsic_movapd(xmm0, var_40);
                            xmm1 = intrinsic_movaps(xmm1, var_30);
                            var_50 = intrinsic_movaps(var_50, xmm1);
                            var_60 = intrinsic_movapd(var_60, xmm0);
                    }
                    CGRectGetMinX(rdi);
                    xmm0 = intrinsic_xorpd(xmm0, *(int128_t *)0xc4f600);
                    var_90 = intrinsic_movapd(var_90, xmm0);
                    CGRectGetMinY(rdi);
                    xmm1 = intrinsic_movapd(xmm1, *(int128_t *)0xc4f600);
                    intrinsic_xorpd(xmm1, xmm0);
                    xmm0 = intrinsic_movapd(xmm0, var_90);
                    CGRectOffset(var_80, rsi, rdx);
                    rdx = r15;
                    [r14 computeLayoutInRect:rdx forSection:0x0 invalidating:0x0 invalidationContext:r9];
            }
    }
    else {
            [r14 computeLayout];
    }
    if (r14 != 0x0) {
            [var_40 frame];
    }
    else {
            xmm0 = intrinsic_xorpd(xmm0, xmm0);
            var_30 = intrinsic_movapd(var_30, xmm0);
            var_40 = intrinsic_movapd(var_40, xmm0);
    }
    COND = *(int8_t *)(rbx + 0x51) == 0x0;
    rax = *(rbx + 0x28);
    rcx = *(*(rax + 0x8) + 0x18);
    if (!COND) {
            var_38 = rcx;
            xmm0 = intrinsic_movsd(xmm0, var_28);
    }
    else {
            var_40 = rcx;
            xmm0 = intrinsic_movsd(xmm0, var_30);
    }
    *(*(rax + 0x8) + 0x18) = intrinsic_movsd(*(*(rax + 0x8) + 0x18), intrinsic_addsd(xmm0, *(*(rax + 0x8) + 0x18)));
    rax = [r14 setFrame:rdx, rcx];
    return rax;
}

void -[UICollectionViewFlowLayout _fetchItemsInfoForRect:](void * self, void * _cmd, struct CGRect arg2) {
    rbx = self;
    if ((rbx->_gridLayoutFlags >= 0x0) || ([rbx _estimatesSizes] != 0x0)) {
            if ([rbx _boundsAndInsetsAreValidForReferenceDimension] != 0x0) {
                    r15 = arg_0;
                    [rbx _updateDelegateFlags];
                    r12 = *(int8_t *)(rbx + *_OBJC_IVAR_$_UICollectionViewFlowLayout._gridLayoutFlags + 0x1) & 0xff;
                    r12 = r12 & 0x1;
                    if (r12 == 0x0) {
                            [rbx _getSizingInfosWithExistingSizingDictionary:0x0];
                            *(int8_t *)(rbx + *_OBJC_IVAR_$_UICollectionViewFlowLayout._gridLayoutFlags + 0x1) = *(int8_t *)(rbx + *_OBJC_IVAR_$_UICollectionViewFlowLayout._gridLayoutFlags + 0x1) | 0x1;
                    }
                    [rbx _updateItemsLayoutForRect:(r12 != 0x0 ? 0x1 : 0x0) & 0xff allowsPartialUpdate:rcx];
                    rbx->_gridLayoutFlags = rbx->_gridLayoutFlags | 0x80;
            }
    }
    return;
}

double -[UICollectionViewFlowLayout _dimensionFromCollectionView](void * self, void * _cmd) {
    r15 = objc_unsafeClaimAutoreleasedReturnValue([self collectionView]);
    r14 = [self->_data horizontal];
    if (r15 != 0x0) {
            [var_40 bounds];
            xmm0 = intrinsic_movsd(xmm0, var_30);
            var_68 = intrinsic_movsd(var_68, xmm0);
            xmm0 = intrinsic_movsd(xmm0, var_28);
            var_70 = intrinsic_movsd(var_70, xmm0);
            [var_60 contentInset];
    }
    else {
            xmm0 = intrinsic_xorpd(xmm0, xmm0);
            intrinsic_movapd(var_30, xmm0);
            intrinsic_movapd(var_40, xmm0);
            var_50 = intrinsic_movapd(var_50, xmm0);
            var_60 = intrinsic_movapd(var_60, xmm0);
            xmm0 = intrinsic_xorpd(xmm0, xmm0);
            var_70 = intrinsic_movsd(var_70, xmm0);
            xmm0 = intrinsic_xorpd(xmm0, xmm0);
            var_68 = intrinsic_movsd(var_68, xmm0);
    }
    if (r14 != 0x0) {
            xmm0 = intrinsic_movsd(xmm0, var_70);
            xmm0 = intrinsic_subsd(xmm0, var_60);
            xmm0 = intrinsic_subsd(xmm0, var_50);
            xmm1 = intrinsic_movapd(xmm1, xmm0);
    }
    else {
            xmm1 = intrinsic_movsd(xmm1, var_68);
            xmm1 = intrinsic_subsd(xmm1, var_58);
            xmm1 = intrinsic_subsd(xmm1, var_48);
    }
    xmm0 = intrinsic_xorpd(xmm0, xmm0);
    xmm0 = intrinsic_maxsd(xmm0, xmm1);
    return xmm0;
}

truct CGRect -[UICollectionViewFlowLayout _frameForItem:inSection:usingData:](void * self, void * _cmd, NSInteger arg2, NSInteger arg3, void * arg4) {
    rbx = arg4;
    r13 = arg3;
    var_A8 = _cmd;
    r14 = self;
    r12 = [r9 retain];
    if (r12 != 0x0) {
            [var_50 frame];
    }
    else {
            xmm0 = intrinsic_xorpd(xmm0, xmm0);
            intrinsic_movapd(var_40, xmm0);
            var_50 = intrinsic_movapd(var_50, xmm0);
    }
    rbx = [[NSIndexPath indexPathForItem:r13 inSection:rbx] retain];
    if (r12 != 0x0) {
            var_98 = r14;
            [var_70 frameForItemAtIndexPath:r12, rbx];
    }
    else {
            var_98 = r14;
            xmm0 = intrinsic_xorpd(xmm0, xmm0);
            var_60 = intrinsic_movapd(var_60, xmm0);
            var_70 = intrinsic_movapd(var_70, xmm0);
    }
    [rbx release];
    rbx = [[r12 items] retain];
    rdx = r13;
    r13 = [[rbx objectAtIndex:rdx] retain];
    [rbx release];
    rax = [r13 rowObject];
    rax = [rax retain];
    if (rax != 0x0) {
            var_B8 = r13;
            rdx = @selector(rowFrame);
            var_C0 = rax;
            objc_msgSend_stret(var_90, rax, rdx);
            xmm0 = intrinsic_movapd(xmm0, var_90);
    }
    else {
            var_C0 = rax;
            var_B8 = r13;
            xmm0 = intrinsic_xorpd(xmm0, xmm0);
            intrinsic_movapd(var_80, xmm0);
            intrinsic_movapd(var_90, xmm0);
    }
    r14 = var_98;
    xmm0 = intrinsic_addpd(xmm0, var_50);
    xmm0 = intrinsic_addpd(xmm0, var_70);
    var_70 = intrinsic_movapd(var_70, xmm0);
    r13 = var_A8;
    rbx = [[r13 collectionView] retain];
    [rbx _currentScreenScale];
    var_A0 = intrinsic_movsd(var_A0, xmm0);
    [rbx release];
    xmm0 = intrinsic_movsd(xmm0, var_70);
    var_98 = intrinsic_movsd(var_98, xmm0);
    if ([r13 _roundsToScreenScale] != 0x0) {
            xmm0 = intrinsic_xorpd(xmm0, xmm0);
            xmm1 = intrinsic_movsd(xmm1, var_A0);
            xmm1 = intrinsic_ucomisd(xmm1, xmm0);
            if ((xmm1 == 0x0) && (!CPU_FLAGS & P)) {
                    if (*_AdjustToScale.onceToken != 0xffffffffffffffff) {
                            dispatch_once(_AdjustToScale.onceToken, ^ {/* block implemented at ___AdjustToScale_block_invoke_9b16a4 */ } });
                    }
                    xmm1 = intrinsic_movsd(xmm1, *_AdjustToScale.__s);
            }
            xmm1 = intrinsic_ucomisd(xmm1, *0xc4f410);
            xmm0 = intrinsic_movsd(xmm0, var_98);
            if ((xmm1 == 0x0) && (!CPU_FLAGS & P)) {
                    round(xmm0);
            }
            else {
                    xmm0 = intrinsic_mulsd(xmm0, xmm1);
                    var_98 = intrinsic_movsd(var_98, xmm1);
                    round(xmm0);
                    xmm0 = intrinsic_divsd(xmm0, var_98);
            }
            var_98 = intrinsic_movsd(var_98, xmm0);
            rsi = @selector(_roundsToScreenScale);
    }
    else {
            rsi = @selector(_roundsToScreenScale);
    }
    xmm0 = intrinsic_movsd(xmm0, var_68);
    var_B0 = intrinsic_movsd(var_B0, xmm0);
    if (_objc_msgSend(r13, rsi) != 0x0) {
            xmm0 = intrinsic_xorpd(xmm0, xmm0);
            xmm1 = intrinsic_movsd(xmm1, var_A0);
            xmm1 = intrinsic_ucomisd(xmm1, xmm0);
            if ((xmm1 == 0x0) && (!CPU_FLAGS & P)) {
                    if (*_AdjustToScale.onceToken != 0xffffffffffffffff) {
                            dispatch_once(_AdjustToScale.onceToken, ^ {/* block implemented at ___AdjustToScale_block_invoke_9b16a4 */ } });
                    }
                    xmm1 = intrinsic_movsd(xmm1, *_AdjustToScale.__s);
            }
            xmm1 = intrinsic_ucomisd(xmm1, *0xc4f410);
            rbx = var_B8;
            xmm0 = intrinsic_movsd(xmm0, var_B0);
            if ((xmm1 == 0x0) && (!CPU_FLAGS & P)) {
                    round(xmm0);
            }
            else {
                    xmm0 = intrinsic_mulsd(xmm0, xmm1);
                    var_A0 = intrinsic_movsd(var_A0, xmm1);
                    round(xmm0);
                    xmm0 = intrinsic_divsd(xmm0, var_A0);
            }
            rdi = var_C0;
            xmm1 = intrinsic_movsd(xmm1, var_98);
    }
    else {
            rbx = var_B8;
            rdi = var_C0;
            xmm1 = intrinsic_movsd(xmm1, var_98);
            xmm0 = intrinsic_movsd(xmm0, var_B0);
    }
    var_70 = intrinsic_movsd(var_70, xmm1);
    var_68 = intrinsic_movsd(var_68, xmm0);
    *(r14 + 0x18) = var_58;
    *(r14 + 0x10) = var_60;
    *(r14 + 0x8) = var_68;
    *r14 = var_70;
    [rdi release];
    [rbx release];
    [r12 release];
    rax = r14;
    return rax;
}

struct CGRect -[UICollectionViewFlowLayout _frameForHeaderInSection:usingData:](void * self, void * _cmd, NSInteger arg2, void * arg3) {
    var_118 = arg3;
    var_120 = _cmd;
    r15 = self;
    r13 = [r8 retain];
    r14 = [[r13 sections] retain];
    r12 = [r14 count];
    rbx = var_118;
    [r14 release];
    if (r12 <= rbx) goto loc_9aff2d;

loc_9afebf:
    var_128 = r15;
    var_130 = r13;
    r12 = [[r13 sections] retain];
    r14 = [[r12 objectAtIndexedSubscript:rbx] retain];
    [r12 release];
    if (r14 != 0x0) {
            [var_50 frame];
    }
    else {
            var_40 = intrinsic_movaps(var_40, 0x0);
            var_50 = intrinsic_movaps(var_50, 0x0);
    }
    r12 = var_120;
    if ([r12 _headerFollowsSectionMargins] == 0x0) goto loc_9aff8e;

loc_9aff80:
    if (r14 == 0x0) goto loc_9affa8;

loc_9aff85:
    rdx = @selector(effectiveHeaderFrameWithSectionMarginsApplied);
    goto loc_9aff9a;

loc_9aff9a:
    objc_msgSend_stret(var_70, r14, rdx);
    goto loc_9affb3;

loc_9affb3:
    xmm0 = intrinsic_movapd(0x0, var_50);
    xmm0 = intrinsic_addpd(xmm0, var_70);
    var_70 = intrinsic_movapd(var_70, xmm0);
    if ((*(int8_t *)(r12 + *_OBJC_IVAR_$_UICollectionViewFlowLayout._gridLayoutFlags + 0x1) & 0x8) != 0x0) {
            rsi = r12->_collectionView;
            if (rsi != 0x0) {
                    [var_B0 bounds];
                    rsi = r12->_collectionView;
                    if (rsi != 0x0) {
                            [var_D0 contentInset];
                            xmm0 = intrinsic_movsd(xmm0, var_C8);
                            xmm1 = intrinsic_movsd(xmm1, var_B8);
                            xmm0 = intrinsic_movhpd(xmm0, var_D0);
                            xmm1 = intrinsic_movhpd(xmm1, var_C0);
                    }
                    else {
                            xmm0 = intrinsic_xorpd(xmm0, xmm0);
                            intrinsic_movapd(var_C0, xmm0);
                            intrinsic_movapd(var_D0, xmm0);
                            xmm1 = intrinsic_xorpd(xmm1, xmm1);
                    }
            }
            else {
                    xmm0 = intrinsic_xorpd(xmm0, xmm0);
                    var_A0 = intrinsic_movapd(var_A0, xmm0);
                    var_B0 = intrinsic_movapd(var_B0, xmm0);
                    xmm0 = intrinsic_xorpd(xmm0, xmm0);
                    intrinsic_movapd(var_C0, xmm0);
                    intrinsic_movapd(var_D0, xmm0);
                    xmm1 = intrinsic_xorpd(xmm1, xmm1);
            }
            xmm2 = intrinsic_movapd(xmm2, var_A0);
            xmm3 = intrinsic_movapd(xmm3, var_B0);
            xmm3 = intrinsic_addpd(xmm3, xmm0);
            xmm1 = intrinsic_addpd(xmm1, xmm0);
            xmm2 = intrinsic_subpd(xmm2, xmm1);
            var_90 = intrinsic_movapd(var_90, xmm3);
            var_80 = intrinsic_movapd(var_80, xmm2);
            rdi = r12->_data;
            if ([rdi horizontal] != 0x0) {
                    CGRectGetMinX(rdi);
                    var_118 = intrinsic_movsd(var_118, xmm0);
                    CGRectGetMinX(rdi);
                    xmm1 = intrinsic_movsd(xmm1, var_118);
                    xmm1 = intrinsic_ucomisd(xmm1, xmm0);
                    if (xmm1 > 0x0) {
                            CGRectGetMinX(rdi);
                            var_70 = intrinsic_movsd(var_70, xmm0);
                    }
                    if (r14 != 0x0) {
                            rdi = var_F0;
                            [rdi footerFrame];
                    }
                    else {
                            xmm0 = intrinsic_xorpd(xmm0, xmm0);
                            var_E0 = intrinsic_movapd(var_E0, xmm0);
                            var_F0 = intrinsic_movapd(var_F0, xmm0);
                    }
                    CGRectGetWidth(rdi);
                    var_118 = intrinsic_movsd(var_118, xmm0);
                    CGRectGetMaxX(rdi);
                    xmm0 = intrinsic_addsd(xmm0, var_118);
                    var_120 = intrinsic_movsd(var_120, xmm0);
                    CGRectGetMaxX(rdi);
                    xmm1 = intrinsic_movsd(xmm1, var_120);
                    xmm1 = intrinsic_ucomisd(xmm1, xmm0);
                    if (xmm1 > 0x0) {
                            CGRectGetMaxX(rdi);
                            var_120 = intrinsic_movsd(var_120, xmm0);
                            CGRectGetWidth(rdi);
                            xmm1 = intrinsic_movsd(xmm1, var_118);
                            xmm1 = intrinsic_addsd(xmm1, xmm0);
                            xmm0 = intrinsic_movsd(xmm0, var_120);
                            xmm0 = intrinsic_subsd(xmm0, xmm1);
                            var_70 = intrinsic_movsd(var_70, xmm0);
                    }
            }
            else {
                    CGRectGetMinY(rdi);
                    var_118 = intrinsic_movsd(var_118, xmm0);
                    CGRectGetMinY(rdi);
                    xmm1 = intrinsic_movsd(xmm1, var_118);
                    xmm1 = intrinsic_ucomisd(xmm1, xmm0);
                    if (xmm1 > 0x0) {
                            CGRectGetMinY(rdi);
                            var_68 = intrinsic_movsd(var_68, xmm0);
                    }
                    if (r14 != 0x0) {
                            rdi = var_110;
                            [rdi footerFrame];
                    }
                    else {
                            xmm0 = intrinsic_xorpd(xmm0, xmm0);
                            var_100 = intrinsic_movapd(var_100, xmm0);
                            var_110 = intrinsic_movapd(var_110, xmm0);
                    }
                    CGRectGetHeight(rdi);
                    var_118 = intrinsic_movsd(var_118, xmm0);
                    CGRectGetMaxY(rdi);
                    xmm0 = intrinsic_addsd(xmm0, var_118);
                    var_120 = intrinsic_movsd(var_120, xmm0);
                    CGRectGetMaxY(rdi);
                    xmm1 = intrinsic_movsd(xmm1, var_120);
                    xmm1 = intrinsic_ucomisd(xmm1, xmm0);
                    if (xmm1 > 0x0) {
                            CGRectGetMaxY(rdi);
                            var_120 = intrinsic_movsd(var_120, xmm0);
                            CGRectGetHeight(rdi);
                            xmm1 = intrinsic_movsd(xmm1, var_118);
                            xmm1 = intrinsic_addsd(xmm1, xmm0);
                            xmm0 = intrinsic_movsd(xmm0, var_120);
                            xmm0 = intrinsic_subsd(xmm0, xmm1);
                            var_68 = intrinsic_movsd(var_68, xmm0);
                    }
            }
    }
    rbx = [[r12 collectionView] retain];
    [rbx _currentScreenScale];
    var_120 = intrinsic_movsd(var_120, xmm0);
    [rbx release];
    xmm0 = intrinsic_movsd(xmm0, var_70);
    var_118 = intrinsic_movsd(var_118, xmm0);
    if ([r12 _roundsToScreenScale] != 0x0) {
            xmm0 = intrinsic_xorpd(xmm0, xmm0);
            xmm1 = intrinsic_movsd(xmm1, var_120);
            xmm1 = intrinsic_ucomisd(xmm1, xmm0);
            if ((xmm1 == 0x0) && (!CPU_FLAGS & P)) {
                    if (*_AdjustToScale.onceToken != 0xffffffffffffffff) {
                            dispatch_once(_AdjustToScale.onceToken, ^ {/* block implemented at ___AdjustToScale_block_invoke_9b16a4 */ } });
                    }
                    xmm1 = intrinsic_movsd(xmm1, *_AdjustToScale.__s);
            }
            xmm1 = intrinsic_ucomisd(xmm1, *0xc4f410);
            r15 = var_128;
            xmm0 = intrinsic_movsd(xmm0, var_118);
            if ((xmm1 == 0x0) && (!CPU_FLAGS & P)) {
                    round(xmm0);
            }
            else {
                    xmm0 = intrinsic_mulsd(xmm0, xmm1);
                    var_118 = intrinsic_movsd(var_118, xmm1);
                    round(xmm0);
                    xmm0 = intrinsic_divsd(xmm0, var_118);
            }
            var_118 = intrinsic_movsd(var_118, xmm0);
    }
    else {
            r15 = var_128;
    }
    rbx = var_130;
    xmm0 = intrinsic_movsd(xmm0, var_68);
    var_128 = intrinsic_movsd(var_128, xmm0);
    if ([r12 _roundsToScreenScale] != 0x0) {
            xmm0 = intrinsic_xorpd(xmm0, xmm0);
            xmm1 = intrinsic_movsd(xmm1, var_120);
            xmm1 = intrinsic_ucomisd(xmm1, xmm0);
            if ((xmm1 == 0x0) && (!CPU_FLAGS & P)) {
                    if (*_AdjustToScale.onceToken != 0xffffffffffffffff) {
                            dispatch_once(_AdjustToScale.onceToken, ^ {/* block implemented at ___AdjustToScale_block_invoke_9b16a4 */ } });
                    }
                    xmm1 = intrinsic_movsd(xmm1, *_AdjustToScale.__s);
            }
            xmm1 = intrinsic_ucomisd(xmm1, *0xc4f410);
            xmm0 = intrinsic_movsd(xmm0, var_128);
            if ((xmm1 == 0x0) && (!CPU_FLAGS & P)) {
                    round(xmm0);
            }
            else {
                    xmm0 = intrinsic_mulsd(xmm0, xmm1);
                    var_120 = intrinsic_movsd(var_120, xmm1);
                    round(xmm0);
                    xmm0 = intrinsic_divsd(xmm0, var_120);
            }
            xmm1 = intrinsic_movsd(xmm1, var_118);
    }
    else {
            xmm1 = intrinsic_movsd(xmm1, var_118);
            xmm0 = intrinsic_movsd(xmm0, var_128);
    }
    var_70 = intrinsic_movsd(var_70, xmm1);
    var_68 = intrinsic_movsd(var_68, xmm0);
    *(r15 + 0x18) = var_58;
    *(r15 + 0x10) = var_60;
    *(r15 + 0x8) = var_68;
    *r15 = var_70;
    [r14 release];
    goto loc_9b063e;

loc_9b063e:
    [rbx release];
    rax = r15;
    return rax;

loc_9affa8:
    var_60 = intrinsic_movaps(var_60, 0x0);
    var_70 = intrinsic_movaps(var_70, 0x0);
    goto loc_9affb3;

loc_9aff8e:
    if (r14 == 0x0) goto loc_9affa8;

loc_9aff93:
    rdx = @selector(headerFrame);
    goto loc_9aff9a;

loc_9aff2d:
    *(r15 + 0x18) = *_CGSizeCreateDictionaryRepresentation;
    *(r15 + 0x10) = *_CGShadingRelease;
    *(r15 + 0x8) = *_CGShadingCreateAxial;
    *r15 = *_CGRectZero;
    rbx = r13;
    goto loc_9b063e;
}

struct CGRect -[UICollectionViewFlowLayout _frameForFooterInSection:usingData:](void * self, void * _cmd, NSInteger arg2, void * arg3) {
    var_118 = arg3;
    var_120 = _cmd;
    r15 = self;
    r13 = [r8 retain];
    r14 = [[r13 sections] retain];
    r12 = [r14 count];
    rbx = var_118;
    [r14 release];
    if (r12 <= rbx) goto loc_9b076d;

loc_9b06ff:
    var_128 = r15;
    var_130 = r13;
    r12 = [[r13 sections] retain];
    r14 = [[r12 objectAtIndexedSubscript:rbx] retain];
    [r12 release];
    if (r14 != 0x0) {
            [var_50 frame];
    }
    else {
            var_40 = intrinsic_movaps(var_40, 0x0);
            var_50 = intrinsic_movaps(var_50, 0x0);
    }
    r12 = var_120;
    if ([r12 _footerFollowsSectionMargins] == 0x0) goto loc_9b07ce;

loc_9b07c0:
    if (r14 == 0x0) goto loc_9b07e8;

loc_9b07c5:
    rdx = @selector(effectiveFooterFrameWithSectionMarginsApplied);
    goto loc_9b07da;

loc_9b07da:
    objc_msgSend_stret(var_70, r14, rdx);
    goto loc_9b07f3;

loc_9b07f3:
    xmm0 = intrinsic_movapd(0x0, var_50);
    xmm0 = intrinsic_addpd(xmm0, var_70);
    var_70 = intrinsic_movapd(var_70, xmm0);
    if ((*(int8_t *)(r12 + *_OBJC_IVAR_$_UICollectionViewFlowLayout._gridLayoutFlags + 0x1) & 0x10) != 0x0) {
            rsi = r12->_collectionView;
            if (rsi != 0x0) {
                    [var_B0 bounds];
                    rsi = r12->_collectionView;
                    if (rsi != 0x0) {
                            [var_D0 contentInset];
                            xmm0 = intrinsic_movsd(xmm0, var_C8);
                            xmm1 = intrinsic_movsd(xmm1, var_B8);
                            xmm0 = intrinsic_movhpd(xmm0, var_D0);
                            xmm1 = intrinsic_movhpd(xmm1, var_C0);
                    }
                    else {
                            xmm0 = intrinsic_xorpd(xmm0, xmm0);
                            intrinsic_movapd(var_C0, xmm0);
                            intrinsic_movapd(var_D0, xmm0);
                            xmm1 = intrinsic_xorpd(xmm1, xmm1);
                    }
            }
            else {
                    xmm0 = intrinsic_xorpd(xmm0, xmm0);
                    var_A0 = intrinsic_movapd(var_A0, xmm0);
                    var_B0 = intrinsic_movapd(var_B0, xmm0);
                    xmm0 = intrinsic_xorpd(xmm0, xmm0);
                    intrinsic_movapd(var_C0, xmm0);
                    intrinsic_movapd(var_D0, xmm0);
                    xmm1 = intrinsic_xorpd(xmm1, xmm1);
            }
            xmm2 = intrinsic_movapd(xmm2, var_A0);
            xmm3 = intrinsic_movapd(xmm3, var_B0);
            xmm3 = intrinsic_addpd(xmm3, xmm0);
            xmm1 = intrinsic_addpd(xmm1, xmm0);
            xmm2 = intrinsic_subpd(xmm2, xmm1);
            var_90 = intrinsic_movapd(var_90, xmm3);
            var_80 = intrinsic_movapd(var_80, xmm2);
            rdi = r12->_data;
            if ([rdi horizontal] != 0x0) {
                    CGRectGetMaxX(rdi);
                    var_118 = intrinsic_movsd(var_118, xmm0);
                    CGRectGetMaxX(rdi);
                    xmm0 = intrinsic_ucomisd(xmm0, var_118);
                    if (xmm0 > 0x0) {
                            CGRectGetMaxX(rdi);
                            var_118 = intrinsic_movsd(var_118, xmm0);
                            CGRectGetWidth(rdi);
                            xmm1 = intrinsic_movsd(xmm1, var_118);
                            xmm1 = intrinsic_subsd(xmm1, xmm0);
                            var_70 = intrinsic_movsd(var_70, xmm1);
                    }
                    if (r14 != 0x0) {
                            rdi = var_F0;
                            [rdi headerFrame];
                    }
                    else {
                            xmm0 = intrinsic_xorpd(xmm0, xmm0);
                            var_E0 = intrinsic_movapd(var_E0, xmm0);
                            var_F0 = intrinsic_movapd(var_F0, xmm0);
                    }
                    CGRectGetWidth(rdi);
                    var_118 = intrinsic_movsd(var_118, xmm0);
                    CGRectGetMinX(rdi);
                    xmm0 = intrinsic_subsd(xmm0, var_118);
                    var_120 = intrinsic_movsd(var_120, xmm0);
                    CGRectGetMinX(rdi);
                    xmm0 = intrinsic_ucomisd(xmm0, var_120);
                    if (xmm0 > 0x0) {
                            CGRectGetMinX(rdi);
                            xmm1 = intrinsic_movsd(xmm1, var_118);
                            xmm1 = intrinsic_addsd(xmm1, xmm0);
                            var_70 = intrinsic_movsd(var_70, xmm1);
                    }
            }
            else {
                    CGRectGetMaxY(rdi);
                    var_118 = intrinsic_movsd(var_118, xmm0);
                    CGRectGetMaxY(rdi);
                    xmm0 = intrinsic_ucomisd(xmm0, var_118);
                    if (xmm0 > 0x0) {
                            CGRectGetMaxY(rdi);
                            var_118 = intrinsic_movsd(var_118, xmm0);
                            CGRectGetHeight(rdi);
                            xmm1 = intrinsic_movsd(xmm1, var_118);
                            xmm1 = intrinsic_subsd(xmm1, xmm0);
                            var_68 = intrinsic_movsd(var_68, xmm1);
                    }
                    if (r14 != 0x0) {
                            rdi = var_110;
                            [rdi headerFrame];
                    }
                    else {
                            xmm0 = intrinsic_xorpd(xmm0, xmm0);
                            var_100 = intrinsic_movapd(var_100, xmm0);
                            var_110 = intrinsic_movapd(var_110, xmm0);
                    }
                    CGRectGetHeight(rdi);
                    var_118 = intrinsic_movsd(var_118, xmm0);
                    CGRectGetMinY(rdi);
                    xmm0 = intrinsic_subsd(xmm0, var_118);
                    var_120 = intrinsic_movsd(var_120, xmm0);
                    CGRectGetMinY(rdi);
                    xmm0 = intrinsic_ucomisd(xmm0, var_120);
                    if (xmm0 > 0x0) {
                            CGRectGetMinY(rdi);
                            xmm1 = intrinsic_movsd(xmm1, var_118);
                            xmm1 = intrinsic_addsd(xmm1, xmm0);
                            var_68 = intrinsic_movsd(var_68, xmm1);
                    }
            }
    }
    rbx = [[r12 collectionView] retain];
    [rbx _currentScreenScale];
    var_120 = intrinsic_movsd(var_120, xmm0);
    [rbx release];
    xmm0 = intrinsic_movsd(xmm0, var_70);
    var_118 = intrinsic_movsd(var_118, xmm0);
    if ([r12 _roundsToScreenScale] != 0x0) {
            xmm0 = intrinsic_xorpd(xmm0, xmm0);
            xmm1 = intrinsic_movsd(xmm1, var_120);
            xmm1 = intrinsic_ucomisd(xmm1, xmm0);
            if ((xmm1 == 0x0) && (!CPU_FLAGS & P)) {
                    if (*_AdjustToScale.onceToken != 0xffffffffffffffff) {
                            dispatch_once(_AdjustToScale.onceToken, ^ {/* block implemented at ___AdjustToScale_block_invoke_9b16a4 */ } });
                    }
                    xmm1 = intrinsic_movsd(xmm1, *_AdjustToScale.__s);
            }
            xmm1 = intrinsic_ucomisd(xmm1, *0xc4f410);
            r15 = var_128;
            xmm0 = intrinsic_movsd(xmm0, var_118);
            if ((xmm1 == 0x0) && (!CPU_FLAGS & P)) {
                    round(xmm0);
            }
            else {
                    xmm0 = intrinsic_mulsd(xmm0, xmm1);
                    var_118 = intrinsic_movsd(var_118, xmm1);
                    round(xmm0);
                    xmm0 = intrinsic_divsd(xmm0, var_118);
            }
            var_118 = intrinsic_movsd(var_118, xmm0);
    }
    else {
            r15 = var_128;
    }
    rbx = var_130;
    xmm0 = intrinsic_movsd(xmm0, var_68);
    var_128 = intrinsic_movsd(var_128, xmm0);
    if ([r12 _roundsToScreenScale] != 0x0) {
            xmm0 = intrinsic_xorpd(xmm0, xmm0);
            xmm1 = intrinsic_movsd(xmm1, var_120);
            xmm1 = intrinsic_ucomisd(xmm1, xmm0);
            if ((xmm1 == 0x0) && (!CPU_FLAGS & P)) {
                    if (*_AdjustToScale.onceToken != 0xffffffffffffffff) {
                            dispatch_once(_AdjustToScale.onceToken, ^ {/* block implemented at ___AdjustToScale_block_invoke_9b16a4 */ } });
                    }
                    xmm1 = intrinsic_movsd(xmm1, *_AdjustToScale.__s);
            }
            xmm1 = intrinsic_ucomisd(xmm1, *0xc4f410);
            xmm0 = intrinsic_movsd(xmm0, var_128);
            if ((xmm1 == 0x0) && (!CPU_FLAGS & P)) {
                    round(xmm0);
            }
            else {
                    xmm0 = intrinsic_mulsd(xmm0, xmm1);
                    var_120 = intrinsic_movsd(var_120, xmm1);
                    round(xmm0);
                    xmm0 = intrinsic_divsd(xmm0, var_120);
            }
            xmm1 = intrinsic_movsd(xmm1, var_118);
    }
    else {
            xmm1 = intrinsic_movsd(xmm1, var_118);
            xmm0 = intrinsic_movsd(xmm0, var_128);
    }
    var_70 = intrinsic_movsd(var_70, xmm1);
    var_68 = intrinsic_movsd(var_68, xmm0);
    *(r15 + 0x18) = var_58;
    *(r15 + 0x10) = var_60;
    *(r15 + 0x8) = var_68;
    *r15 = var_70;
    [r14 release];
    goto loc_9b0e6e;

loc_9b0e6e:
    [rbx release];
    rax = r15;
    return rax;

loc_9b07e8:
    var_60 = intrinsic_movaps(var_60, 0x0);
    var_70 = intrinsic_movaps(var_70, 0x0);
    goto loc_9b07f3;

loc_9b07ce:
    if (r14 == 0x0) goto loc_9b07e8;

loc_9b07d3:
    rdx = @selector(footerFrame);
    goto loc_9b07da;

loc_9b076d:
    *(r15 + 0x18) = *_CGSizeCreateDictionaryRepresentation;
    *(r15 + 0x10) = *_CGShadingRelease;
    *(r15 + 0x8) = *_CGShadingCreateAxial;
    *r15 = *_CGRectZero;
    rbx = r13;
    goto loc_9b0e6e;
}

void -[UICollectionViewFlowLayout _setNeedsLayoutComputationWithoutInvalidation](void * self, void * _cmd) {
    self->_gridLayoutFlags = self->_gridLayoutFlags & 0xfe7f;
    return;
}

void -[UICollectionViewFlowLayout finalizeCollectionViewUpdates](void * self, void * _cmd) {
    self->_insertedItemsAttributesDict = 0x0;
    [self->_insertedItemsAttributesDict release];
    self->_insertedSectionHeadersAttributesDict = 0x0;
    [self->_insertedSectionHeadersAttributesDict release];
    self->_insertedSectionFootersAttributesDict = 0x0;
    [self->_insertedSectionFootersAttributesDict release];
    self->_deletedItemsAttributesDict = 0x0;
    [self->_deletedItemsAttributesDict release];
    self->_deletedSectionHeadersAttributesDict = 0x0;
    [self->_deletedSectionHeadersAttributesDict release];
    self->_deletedSectionFootersAttributesDict = 0x0;
    [self->_deletedSectionFootersAttributesDict release];
    [[self super] finalizeCollectionViewUpdates];
    return;
}

void * -[UICollectionViewFlowLayout initialLayoutAttributesForInsertedItemAtIndexPath:](void * self, void * _cmd, void * arg2) {
    rax = [self->_insertedItemsAttributesDict objectForKey:arg2];
    return rax;
}

void * -[UICollectionViewFlowLayout initialLayoutAttributesForHeaderInInsertedSection:](void * self, void * _cmd, NSInteger arg2) {
    rbx = [[NSIndexPath indexPathForItem:0x7fffffffffffffff inSection:arg2] retain];
    r14 = [[self->_insertedSectionHeadersAttributesDict objectForKey:rbx] retain];
    [rbx release];
    rdi = r14;
    rax = [rdi autorelease];
    return rax;
}

void * -[UICollectionViewFlowLayout initialLayoutAttributesForFooterInInsertedSection:](void * self, void * _cmd, NSInteger arg2) {
    rbx = [[NSIndexPath indexPathForItem:0x7fffffffffffffff inSection:arg2] retain];
    r14 = [[self->_insertedSectionFootersAttributesDict objectForKey:rbx] retain];
    [rbx release];
    rdi = r14;
    rax = [rdi autorelease];
    return rax;
}

void * -[UICollectionViewFlowLayout finalLayoutAttributesForDeletedItemAtIndexPath:](void * self, void * _cmd, void * arg2) {
    rax = [self->_deletedItemsAttributesDict objectForKey:arg2];
    return rax;
}

void * -[UICollectionViewFlowLayout finalLayoutAttributesForHeaderInDeletedSection:](void * self, void * _cmd, NSInteger arg2) {
    rbx = [[NSIndexPath indexPathForItem:0x7fffffffffffffff inSection:arg2] retain];
    r14 = [[self->_deletedSectionHeadersAttributesDict objectForKey:rbx] retain];
    [rbx release];
    rdi = r14;
    rax = [rdi autorelease];
    return rax;
}

void * -[UICollectionViewFlowLayout finalLayoutAttributesForFooterInDeletedSection:](void * self, void * _cmd, NSInteger arg2) {
    rbx = [[NSIndexPath indexPathForItem:0x7fffffffffffffff inSection:arg2] retain];
    r14 = [[self->_deletedSectionFootersAttributesDict objectForKey:rbx] retain];
    [rbx release];
    rdi = r14;
    rax = [rdi autorelease];
    return rax;
}

struct CGSize -[UICollectionViewFlowLayout synchronizeLayout](void * self, void * _cmd) {
    intrinsic_movsd(xmm0, *_CGSizeZero);
    intrinsic_movsd(xmm1, *_CPBitmapCreateImagesFromData);
    return _CGSizeZero;
}

void -[UICollectionViewFlowLayout _invalidateButKeepDelegateInfo](void * self, void * _cmd) {
    rbx = [[[[self class] invalidationContextClass] alloc] init];
    [rbx setInvalidateFlowLayoutDelegateMetrics:0x0];
    [self _invalidateLayoutUsingContext:rbx];
    rdi = rbx;
    [rdi release];
    return;
}

void -[UICollectionViewFlowLayout _invalidateButKeepAllInfo](void * self, void * _cmd) {
    rbx = [[[[self class] invalidationContextClass] alloc] init];
    [rbx setInvalidateFlowLayoutDelegateMetrics:0x0];
    [rbx setInvalidateFlowLayoutAttributes:0x0];
    [self _invalidateLayoutUsingContext:rbx];
    rdi = rbx;
    [rdi release];
    return;
}

void -[UICollectionViewFlowLayout _setRowAlignmentsOptions:](void * self, void * _cmd, void * arg2) {
    self->_rowAlignmentsOptionsDictionary = [arg2 retain];
    [self->_rowAlignmentsOptionsDictionary release];
    return;
}

void * -[UICollectionViewFlowLayout _rowAlignmentOptions](void * self, void * _cmd) {
    rax = objc_retainAutoreleaseReturnValue(self->_rowAlignmentsOptionsDictionary);
    return rax;
}

void -[UICollectionViewFlowLayout _updateContentSizeScrollingDimensionWithDelta:](void * self, void * _cmd, double arg2) {
    rdi = self;
    xmm1 = intrinsic_xorpd(xmm1, xmm1);
    xmm0 = intrinsic_ucomisd(arg2, xmm1);
    if ((xmm0 != 0x0) || (!CPU_FLAGS & NP)) {
            if (rdi->_scrollDirection == 0x1) {
                    rdi->_currentLayoutSize = intrinsic_movsd(rdi->_currentLayoutSize, intrinsic_addsd(intrinsic_movsd(xmm1, rdi->_currentLayoutSize), xmm0));
                    rdi->_contentSizeAdjustment = intrinsic_movsd(rdi->_contentSizeAdjustment, xmm0);
            }
            else {
                    *(rdi + *_OBJC_IVAR_$_UICollectionViewFlowLayout._currentLayoutSize + 0x8) = intrinsic_movsd(*(rdi + *_OBJC_IVAR_$_UICollectionViewFlowLayout._currentLayoutSize + 0x8), intrinsic_addsd(intrinsic_movsd(xmm1, *(rdi + *_OBJC_IVAR_$_UICollectionViewFlowLayout._currentLayoutSize + 0x8)), xmm0));
                    *(rdi + *_OBJC_IVAR_$_UICollectionViewFlowLayout._contentSizeAdjustment + 0x8) = intrinsic_movsd(*(rdi + *_OBJC_IVAR_$_UICollectionViewFlowLayout._contentSizeAdjustment + 0x8), xmm0);
            }
    }
    return;
}


NSInteger -[UICollectionViewFlowLayout _sectionArrayIndexForIndexPath:](void * self, void * _cmd, void * arg2) {
    r15 = [arg2 section];
    rbx = [[self _sections] retain];
    r15 = r15 - [rbx firstIndex];
    [rbx release];
    rax = r15;
    return rax;
}

void -[UICollectionViewFlowLayout _setRoundsToScreenScale:](void * self, void * _cmd, bool arg2) {
    self->_gridLayoutFlags = self->_gridLayoutFlags & 0xffff & 0xfdff | (arg2 & 0xff) << 0x9;
    return;
}

bool -[UICollectionViewFlowLayout _roundsToScreenScale](void * self, void * _cmd) {
    rax = *(int8_t *)(self + *_OBJC_IVAR_$_UICollectionViewFlowLayout._gridLayoutFlags + 0x1) & 0x2;
    rax = rax >> 0x1;
    return rax;
}

bool -[UICollectionViewFlowLayout _headerFollowsSectionMargins](void * self, void * _cmd) {
    rax = *(int8_t *)(self + *_OBJC_IVAR_$_UICollectionViewFlowLayout._gridLayoutFlags + 0x1) & 0x20;
    rax = rax >> 0x5;
    return rax;
}

void -[UICollectionViewFlowLayout _setHeaderFollowsSectionMargins:](void * self, void * _cmd, bool arg2) {
    self->_gridLayoutFlags = self->_gridLayoutFlags & 0xffff & 0xdfff | (arg2 & 0xff) << 0xd;
    return;
}

bool -[UICollectionViewFlowLayout _footerFollowsSectionMargins](void * self, void * _cmd) {
    rax = *(int8_t *)(self + *_OBJC_IVAR_$_UICollectionViewFlowLayout._gridLayoutFlags + 0x1) & 0x40;
    rax = rax >> 0x6;
    return rax;
}

void -[UICollectionViewFlowLayout _setFooterFollowsSectionMargins:](void * self, void * _cmd, bool arg2) {
    self->_gridLayoutFlags = self->_gridLayoutFlags & 0xffff & 0xbfff | (arg2 & 0xff) << 0xe;
    return;
}

void -[UICollectionViewFlowLayout setSectionHeadersPinToVisibleBounds:](void * self, void * _cmd, bool arg2) {
    self->_gridLayoutFlags = self->_gridLayoutFlags & 0xffff & 0xf7ff | (arg2 & 0xff) << 0xb;
    return;
}

bool -[UICollectionViewFlowLayout sectionHeadersPinToVisibleBounds](void * self, void * _cmd) {
    rax = *(int8_t *)(self + *_OBJC_IVAR_$_UICollectionViewFlowLayout._gridLayoutFlags + 0x1) & 0x8;
    rax = rax >> 0x3;
    return rax;
}

void -[UICollectionViewFlowLayout setSectionFootersPinToVisibleBounds:](void * self, void * _cmd, bool arg2) {
    self->_gridLayoutFlags = self->_gridLayoutFlags & 0xffff & 0xefff | (arg2 & 0xff) << 0xc;
    return;
}

bool -[UICollectionViewFlowLayout sectionFootersPinToVisibleBounds](void * self, void * _cmd) {
    rax = *(int8_t *)(self + *_OBJC_IVAR_$_UICollectionViewFlowLayout._gridLayoutFlags + 0x1) & 0x10;
    rax = rax >> 0x4;
    return rax;
}

bool -[UICollectionViewFlowLayout _shouldScrollToContentBeginningInRightToLeft](void * self, void * _cmd) {
    rdi = self;
    if ((rdi->_layoutFlags & 0x8) == 0x0) {
            rax = rdi->_scrollDirection == 0x1 ? 0x1 : 0x0;
    }
    else {
            rax = 0x0;
    }
    return rax;
}

double -[UICollectionViewFlowLayout minimumLineSpacing](void * self, void * _cmd) {
    xmm0 = intrinsic_movsd(xmm0, self->_lineSpacing);
    return xmm0;
}

double -[UICollectionViewFlowLayout minimumInteritemSpacing](void * self, void * _cmd) {
    xmm0 = intrinsic_movsd(xmm0, self->_interitemSpacing);
    return xmm0;
}

struct CGSize -[UICollectionViewFlowLayout itemSize](void * self, void * _cmd) {
    intrinsic_movsd(xmm0, self->_itemSize);
    intrinsic_movsd(xmm1, *(self + *_OBJC_IVAR_$_UICollectionViewFlowLayout._itemSize + 0x8));
    return *_OBJC_IVAR_$_UICollectionViewFlowLayout._itemSize;
}

struct CGSize -[UICollectionViewFlowLayout headerReferenceSize](void * self, void * _cmd) {
    intrinsic_movsd(xmm0, self->_headerReferenceSize);
    intrinsic_movsd(xmm1, *(self + *_OBJC_IVAR_$_UICollectionViewFlowLayout._headerReferenceSize + 0x8));
    return *_OBJC_IVAR_$_UICollectionViewFlowLayout._headerReferenceSize;
}

struct CGSize -[UICollectionViewFlowLayout footerReferenceSize](void * self, void * _cmd) {
    intrinsic_movsd(xmm0, self->_footerReferenceSize);
    intrinsic_movsd(xmm1, *(self + *_OBJC_IVAR_$_UICollectionViewFlowLayout._footerReferenceSize + 0x8));
    return *_OBJC_IVAR_$_UICollectionViewFlowLayout._footerReferenceSize;
}

struct UIEdgeInsets -[UICollectionViewFlowLayout sectionInset](void * self, void * _cmd) {
    *(self + 0x18) = *(_cmd + *_OBJC_IVAR_$_UICollectionViewFlowLayout._sectionInset + 0x18);
    *(self + 0x10) = *(_cmd + *_OBJC_IVAR_$_UICollectionViewFlowLayout._sectionInset + 0x10);
    *(self + 0x8) = *(_cmd + *_OBJC_IVAR_$_UICollectionViewFlowLayout._sectionInset + 0x8);
    *self = _cmd->_sectionInset;
    rax = self;
    return rax;
}

struct CGSize -[UICollectionViewFlowLayout estimatedItemSize](void * self, void * _cmd) {
    intrinsic_movsd(xmm0, self->_estimatedItemSize);
    intrinsic_movsd(xmm1, *(self + *_OBJC_IVAR_$_UICollectionViewFlowLayout._estimatedItemSize + 0x8));
    return *_OBJC_IVAR_$_UICollectionViewFlowLayout._estimatedItemSize;
}

void -[UICollectionViewFlowLayout .cxx_destruct](void * self, void * _cmd) {
    objc_storeStrong(*_OBJC_IVAR_$_UICollectionViewFlowLayout._cachedItemFrames + self, 0x0);
    objc_storeStrong(*_OBJC_IVAR_$_UICollectionViewFlowLayout._cachedItemAttributes + self, 0x0);
    objc_storeStrong(*_OBJC_IVAR_$_UICollectionViewFlowLayout._indexPathsToValidate + self, 0x0);
    objc_storeStrong(*_OBJC_IVAR_$_UICollectionViewFlowLayout._rowAlignmentsOptionsDictionary + self, 0x0);
    objc_storeStrong(*_OBJC_IVAR_$_UICollectionViewFlowLayout._deletedSectionFootersAttributesDict + self, 0x0);
    objc_storeStrong(*_OBJC_IVAR_$_UICollectionViewFlowLayout._deletedSectionHeadersAttributesDict + self, 0x0);
    objc_storeStrong(*_OBJC_IVAR_$_UICollectionViewFlowLayout._deletedItemsAttributesDict + self, 0x0);
    objc_storeStrong(*_OBJC_IVAR_$_UICollectionViewFlowLayout._insertedSectionFootersAttributesDict + self, 0x0);
    objc_storeStrong(*_OBJC_IVAR_$_UICollectionViewFlowLayout._insertedSectionHeadersAttributesDict + self, 0x0);
    objc_storeStrong(*_OBJC_IVAR_$_UICollectionViewFlowLayout._insertedItemsAttributesDict + self, 0x0);
    objc_storeStrong(self + *_OBJC_IVAR_$_UICollectionViewFlowLayout._data, 0x0);
    return;
}



