void * -[UICollectionViewLayout init](void * self, void * _cmd) {
    rbx = [[self super] init];
    if (rbx != 0x0) {
            _UICollectionViewLayoutCommonInit(rbx);
    }
    rax = rbx;
    return rax;
}

int _UICollectionViewLayoutCommonInit(int arg0) {
    var_30 = [arg0 retain];
    arg0->_initialAnimationLayoutAttributesDict = [[NSMutableDictionary alloc] init];
    [arg0->_initialAnimationLayoutAttributesDict release];
    arg0->_finalAnimationLayoutAttributesDict = [[NSMutableDictionary alloc] init];
    [arg0->_finalAnimationLayoutAttributesDict release];
    arg0->_deletedSupplementaryIndexPathsDict = [[NSMutableDictionary alloc] init];
    [arg0->_deletedSupplementaryIndexPathsDict release];
    arg0->_insertedSupplementaryIndexPathsDict = [[NSMutableDictionary alloc] init];
    [arg0->_insertedSupplementaryIndexPathsDict release];
    arg0->_deletedDecorationIndexPathsDict = [[NSMutableDictionary alloc] init];
    [arg0->_deletedDecorationIndexPathsDict release];
    arg0->_insertedDecorationIndexPathsDict = [[NSMutableDictionary alloc] init];
    [arg0->_insertedDecorationIndexPathsDict release];
    arg0->_deletedSectionsSet = [[NSMutableIndexSet alloc] init];
    [arg0->_deletedSectionsSet release];
    arg0->_insertedSectionsSet = [[NSMutableIndexSet alloc] init];
    [var_30 release];
    rax = [arg0->_insertedSectionsSet release];
    return rax;
}

void * -[UICollectionViewLayout initWithCoder:](void * self, void * _cmd, void * arg2) {
    r14 = [arg2 retain];
    rbx = [[self super] init];
    if (rbx != 0x0) {
            rbx->_decorationViewNibDict = [[r14 decodeObjectForKey:@"UICollectionViewDecorationViewNibDict"] retain];
            [rbx->_decorationViewNibDict release];
            r15 = [[r14 decodeObjectForKey:@"UICollectionViewDecorationViewPrototypeNibExternalObjects"] retain];
            rbx->_decorationViewExternalObjectsTables = [_mutableDictionaryByTransformingLeafDictionariesToWeakValued() retain];
            [rbx->_decorationViewExternalObjectsTables release];
            [r15 release];
            _UICollectionViewLayoutCommonInit(rbx);
    }
    [r14 release];
    rax = rbx;
    return rax;
}

void -[UICollectionViewLayout encodeWithCoder:](void * self, void * _cmd, void * arg2) {
    rbx = self;
    r14 = [arg2 retain];
    if ([rbx->_decorationViewNibDict count] != 0x0) {
            [r14 encodeObject:rbx->_decorationViewNibDict forKey:@"UICollectionViewDecorationViewNibDict"];
    }
    if ([rbx->_decorationViewExternalObjectsTables count] != 0x0) {
            [r14 encodeObject:rbx->_decorationViewExternalObjectsTables forKey:@"UICollectionViewDecorationViewPrototypeNibExternalObjects"];
    }
    rdi = r14;
    [rdi release];
    return;
}

void * -[UICollectionViewLayout layoutAttributesForElementsInRect:](void * self, void * _cmd, struct CGRect arg2) {
    return 0x0;
}

void * -[UICollectionViewLayout layoutAttributesForItemAtIndexPath:](void * self, void * _cmd, void * arg2) {
    return 0x0;
}

void * -[UICollectionViewLayout layoutAttributesForSupplementaryViewOfKind:atIndexPath:](void * self, void * _cmd, void * arg2, void * arg3) {
    return 0x0;
}

void * -[UICollectionViewLayout layoutAttributesForDecorationViewOfKind:atIndexPath:](void * self, void * _cmd, void * arg2, void * arg3) {
    return 0x0;
}

bool -[UICollectionViewLayout shouldInvalidateLayoutForPreferredLayoutAttributes:withOriginalAttributes:](void * self, void * _cmd, void * arg2, void * arg3) {
    return 0x0;
}

void -[UICollectionViewLayout prepareLayout](void * self, void * _cmd) {
    return;
}

void -[UICollectionViewLayout invalidateLayout](void * self, void * _cmd) {
    rbx = self;
    if (rbx->_invalidationContext != 0x0) {
            rdi = rbx;
            [rdi invalidateLayoutWithContext:rdx];
    }
    else {
            r14 = [[[[rbx class] invalidationContextClass] alloc] init];
            [rbx invalidateLayoutWithContext:r14];
            rdi = r14;
            [rdi release];
    }
    return;
}

void -[UICollectionViewLayout invalidateLayoutWithContext:](void * self, void * _cmd, void * arg2) {
    rsi = _cmd;
    var_30 = [arg2 retain];
    r15 = [self retain];
    r13 = objc_loadWeakRetained(*_OBJC_IVAR_$_UICollectionViewLayout._compositionLayout + r15);
    if (r13 != 0x0) {
            rbx = r15;
            do {
                    r15 = [r13 retain];
                    [rbx release];
                    rsi = @selector(_compositionLayout);
                    r13 = [_objc_msgSend(r13, rsi) retain];
                    [r15 release];
                    rbx = r15;
            } while (r13 != 0x0);
    }
    r12 = [[r15 collectionView] retain];
    [r12 _invalidateLayoutWithContext:var_30];
    [var_30 release];
    [r12 release];
    [r13 release];
    rdi = r15;
    [rdi release];
    return;
}

bool -[UICollectionViewLayout shouldInvalidateLayoutForBoundsChange:](void * self, void * _cmd, struct CGRect arg2) {
    return 0x0;
}

void * -[UICollectionViewLayout invalidationContextForBoundsChange:](void * self, void * _cmd, struct CGRect arg2) {
    rax = [self class];
    rax = [rax invalidationContextClass];
    rax = [rax alloc];
    rax = [rax init];
    rax = [rax autorelease];
    return rax;
}

void * -[UICollectionViewLayout invalidationContextForPreferredLayoutAttributes:withOriginalAttributes:](void * self, void * _cmd, void * arg2, void * arg3) {
    rax = [self class];
    rax = [rax invalidationContextClass];
    rax = [rax alloc];
    rax = [rax init];
    rax = [rax autorelease];
    return rax;
}

struct CGPoint -[UICollectionViewLayout targetContentOffsetForProposedContentOffset:withScrollingVelocity:](void * self, void * _cmd, struct CGPoint arg2, struct CGPoint arg3) {
    return rax;
}

struct CGPoint -[UICollectionViewLayout targetContentOffsetForProposedContentOffset:](void * self, void * _cmd, struct CGPoint arg2) {
    return rax;
}

void * -[UICollectionViewLayout _animationForReusableView:toLayoutAttributes:type:](void * self, void * _cmd, void * arg2, void * arg3, NSUInteger arg4) {
    rbx = [arg2 retain];
    r14 = [self _animationForReusableView:rbx toLayoutAttributes:arg3];
    [rbx release];
    rax = [r14 retain];
    rax = [rax autorelease];
    return rax;
}

void * -[UICollectionViewLayout _animationForReusableView:toLayoutAttributes:](void * self, void * _cmd, void * arg2, void * arg3) {
    return 0x0;
}

struct CGSize -[UICollectionViewLayout collectionViewContentSize](void * self, void * _cmd) {
    intrinsic_movsd(xmm0, *_CGSizeZero);
    intrinsic_movsd(xmm1, *_CPBitmapCreateImagesFromData);
    return _CGSizeZero;
}

void -[UICollectionViewLayout prepareForCollectionViewUpdates:](void * self, void * _cmd, void * arg2) {
    var_420 = self;
    var_4C0 = [arg2 retain];
    var_498 = [[self->_collectionView _currentUpdate] retain];
    intrinsic_movaps(var_2C0, 0x0);
    intrinsic_movaps(var_2D0, 0x0);
    var_2E0 = intrinsic_movaps(var_2E0, 0x0);
    var_2F0 = intrinsic_movaps(var_2F0, 0x0);
    rax = [self->_collectionView _visibleViews];
    rax = [rax retain];
    var_480 = rax;
    rdx = var_2F0;
    rcx = var_B0;
    rax = [rax countByEnumeratingWithState:rdx objects:rcx count:0x10];
    var_418 = rax;
    if (rax != 0x0) {
            var_448 = *var_2E0;
            do {
                    r15 = 0x0;
                    do {
                            if (*var_2E0 != var_448) {
                                    objc_enumerationMutation(var_480);
                            }
                            rbx = [[*(var_2E8 + r15 * 0x8) _layoutAttributes] retain];
                            r12 = [rbx copy];
                            [rbx release];
                            if ([r12 _isCell] != 0x0) {
                                    r14 = [[r12 indexPath] retain];
                                    r13 = *(var_498->_oldGlobalItemMap + [var_498->_oldModel globalIndexForItemAtIndexPath:r14] * 0x8);
                                    [r14 release];
                                    if (r13 != 0x7fffffffffffffff) {
                                            if ([var_498->_newModel isGlobalIndexValid:r13] != 0x0) {
                                                    r14 = [[var_498->_newModel indexPathForItemAtGlobalIndex:r13] retain];
                                                    [r12 setIndexPath:r14];
                                                    [r14 release];
                                            }
                                            r13 = [[_UICollectionViewItemKey collectionItemKeyForLayoutAttributes:r12] retain];
                                            [var_420->_initialAnimationLayoutAttributesDict setObject:r12 forKey:r13];
                                            [r13 release];
                                    }
                            }
                            else {
                                    rbx = [[r12 _elementKind] retain];
                                    var_450 = rbx;
                                    rax = [r12 indexPath];
                                    rax = [rax retain];
                                    var_458 = rax;
                                    rbx = [[var_498 newIndexPathForSupplementaryElementOfKind:rbx oldIndexPath:rax] retain];
                                    [r12 setIndexPath:rbx];
                                    [rbx release];
                                    [var_458 release];
                                    [var_450 release];
                                    rbx = [[_UICollectionViewItemKey collectionItemKeyForLayoutAttributes:r12, *_OBJC_IVAR_$_UICollectionViewLayout._initialAnimationLayoutAttributesDict] retain];
                                    [var_420->_initialAnimationLayoutAttributesDict setObject:r12 forKey:rbx];
                                    [rbx release];
                            }
                            [r12 release];
                            r15 = r15 + 0x1;
                    } while (r15 < var_418);
                    rdx = var_2F0;
                    rcx = var_B0;
                    rax = [var_480 countByEnumeratingWithState:rdx objects:rcx count:0x10];
                    var_418 = rax;
            } while (rax != 0x0);
    }
    [var_480 release];
    intrinsic_movaps(var_300, 0x0);
    intrinsic_movaps(var_310, 0x0);
    var_320 = intrinsic_movaps(var_320, 0x0);
    var_330 = intrinsic_movaps(var_330, 0x0);
    rbx = [[var_420->_collectionView _collectionViewData] retain];
    rsi = var_420->_collectionView;
    if (rsi != 0x0) {
            [var_350 visibleBounds];
    }
    else {
            var_340 = intrinsic_movaps(var_340, 0x0);
            var_350 = intrinsic_movaps(var_350, 0x0);
    }
    r15 = _objc_msgSend;
    r14 = [[rbx layoutAttributesForElementsInRect:rdx, rcx] retain];
    var_478 = r14;
    [rbx release];
    rbx = @selector(countByEnumeratingWithState:objects:count:);
    rax = _objc_msgSend(r14, rbx);
    var_428 = rax;
    if (rax != 0x0) {
            var_448 = *var_320;
            do {
                    r12 = 0x0;
                    do {
                            if (*var_320 != var_448) {
                                    objc_enumerationMutation(var_478);
                            }
                            r13 = (r15)(*(var_328 + r12 * 0x8), @selector(copy));
                            if ((r15)(*(var_328 + r12 * 0x8), @selector(_isCell)) != 0x0) {
                                    var_418 = r13;
                                    r13 = [(r15)(r13, @selector(indexPath)) retain];
                                    r14 = r15;
                                    r15 = *(var_498->_newGlobalItemMap + (r15)(var_498->_newModel, @selector(globalIndexForItemAtIndexPath:), r13) * 0x8);
                                    [r13 release];
                                    if (r15 != 0x7fffffffffffffff) {
                                            rbx = [(r14)(var_498->_oldModel, @selector(indexPathForItemAtGlobalIndex:), r15, var_498) retain];
                                            (r14)(var_418, @selector(setIndexPath:), rbx, var_498);
                                            [rbx release];
                                            rbx = [(r14)(@class(_UICollectionViewItemKey), @selector(collectionItemKeyForLayoutAttributes:), var_418, *_OBJC_IVAR_$_UICollectionViewLayout._finalAnimationLayoutAttributesDict) retain];
                                            (r14)(var_420->_finalAnimationLayoutAttributesDict, @selector(setObject:forKey:), var_418, rbx);
                                            [rbx release];
                                    }
                            }
                            else {
                                    r14 = [(r15)(r13, @selector(_elementKind)) retain];
                                    var_450 = r14;
                                    var_418 = r13;
                                    rbx = r13;
                                    r13 = [(r15)(r13, @selector(indexPath)) retain];
                                    r14 = [(r15)(var_498, @selector(oldIndexPathForSupplementaryElementOfKind:newIndexPath:), r14, r13) retain];
                                    (r15)(rbx, @selector(setIndexPath:), r14);
                                    [r14 release];
                                    [r13 release];
                                    [var_450 release];
                                    r13 = [(r15)(@class(_UICollectionViewItemKey), @selector(collectionItemKeyForLayoutAttributes:), var_418, *_OBJC_IVAR_$_UICollectionViewLayout._finalAnimationLayoutAttributesDict) retain];
                                    (r15)(var_420->_finalAnimationLayoutAttributesDict, @selector(setObject:forKey:), var_418, r13);
                                    r14 = r15;
                                    [r13 release];
                            }
                            [var_418 release];
                            r12 = r12 + 0x1;
                            r15 = r14;
                    } while (r12 < var_428);
                    rbx = @selector(countByEnumeratingWithState:objects:count:);
                    rax = _objc_msgSend(var_478, rbx);
                    var_428 = rax;
            } while (rax != 0x0);
    }
    [var_478 release];
    intrinsic_movaps(var_360, 0x0);
    intrinsic_movaps(var_370, 0x0);
    var_380 = intrinsic_movaps(var_380, 0x0);
    var_390 = intrinsic_movaps(var_390, 0x0);
    rax = [var_4C0 retain];
    var_4A0 = rax;
    rdx = var_390;
    rax = _objc_msgSend(rax, rbx);
    var_418 = rax;
    if (rax == 0x0) goto loc_99a6a4;

loc_99a199:
    var_438 = *var_380;
    goto loc_99a1b8;

loc_99a1b8:
    r14 = 0x0;
    goto loc_99a2c5;

loc_99a2c5:
    if (*var_380 != var_438) {
            objc_enumerationMutation(var_4A0);
    }
    r12 = *(var_388 + r14 * 0x8);
    rbx = (r15)(r12, @selector(updateAction));
    if ((r15)(r12, @selector(_isSectionOperation)) == 0x0) goto loc_99a346;

loc_99a310:
    if (rbx == 0x0) goto loc_99a5e6;

loc_99a319:
    r13 = r15;
    if (rbx == 0x2) goto loc_99a545;

loc_99a326:
    r15 = r13;
    if (rbx != 0x1) goto loc_99a65c;

loc_99a333:
    rax = var_420;
    rcx = *_OBJC_IVAR_$_UICollectionViewLayout._deletedSectionsSet;
    goto loc_99a5f4;

loc_99a5f4:
    r13 = *(rax + rcx);
    rbx = [(r15)(r12, @selector(_indexPath)) retain];
    rax = (r15)(rbx, @selector(section));
    rdi = r13;
    goto loc_99a620;

loc_99a620:
    (r15)(rdi, @selector(addIndex:), rax, rcx);
    [rbx release];
    goto loc_99a65c;

loc_99a65c:
    r14 = r14 + 0x1;
    if (r14 < var_418) goto loc_99a2c5;

loc_99a66c:
    rdx = var_390;
    rax = [var_4A0 countByEnumeratingWithState:rdx objects:var_1B0 count:0x10];
    var_418 = rax;
    if (rax != 0x0) goto loc_99a1b8;

loc_99a6a4:
    [var_4A0 release];
    r12 = var_420;
    rbx = [r12->_deletedSectionsSet firstIndex];
    if (rbx == 0x7fffffffffffffff) goto loc_99ab66;

loc_99a73a:
    var_4B0 = rbx;
    var_3A0 = intrinsic_movaps(var_3A0, 0x0);
    var_3B0 = intrinsic_movaps(var_3B0, 0x0);
    var_3C0 = intrinsic_movaps(var_3C0, 0x0);
    var_3D0 = intrinsic_movaps(var_3D0, 0x0);
    r14 = [(r15)(r12->_collectionView, @selector(_currentUpdate), rdx) retain];
    rbx = [(r15)(r14->_oldModel, @selector(existingSupplementaryLayoutAttributesInSection:), rbx) retain];
    var_470 = rbx;
    [r14 release];
    rax = (r15)(rbx, @selector(countByEnumeratingWithState:objects:count:), var_3D0, var_230, 0x10);
    var_428 = rax;
    if (rax == 0x0) goto loc_99ab24;

loc_99a7e7:
    var_450 = *var_3C0;
    goto loc_99a806;

loc_99a806:
    r13 = 0x0;
    goto loc_99a895;

loc_99a895:
    if (*var_3C0 != var_450) {
            objc_enumerationMutation(var_470);
    }
    rbx = *(var_3C8 + r13 * 0x8);
    if ([rbx _isDecorationView] == 0x0) goto loc_99a9b1;

loc_99a8d7:
    r14 = r12->_deletedDecorationIndexPathsDict;
    r12 = [(r15)(rbx, @selector(_elementKind)) retain];
    rdx = r12;
    r14 = [(r15)(r14, @selector(objectForKeyedSubscript:), rdx) retain];
    [r12 release];
    if (r14 != 0x0) goto loc_99aa99;

loc_99a927:
    r12 = (r15)((r15)(@class(NSMutableArray), @selector(alloc), rdx), @selector(init), rdx);
    rdi = r14;
    [rdi release];
    rax = (r15)(rbx, @selector(_elementKind), rdx);
    var_458 = rbx;
    rbx = r15;
    r15 = [rax retain];
    rsi = @selector(setObject:forKeyedSubscript:);
    rdx = r12;
    rcx = r15;
    (rbx)(var_420->_deletedDecorationIndexPathsDict, rsi, rdx, rcx);
    rdi = r15;
    r15 = rbx;
    goto loc_99aa8c;

loc_99aa8c:
    rbx = var_458;
    [rdi release];
    r14 = r12;
    goto loc_99aa99;

loc_99aa99:
    rbx = [(r15)(rbx, @selector(indexPath), rdx) retain];
    (r15)(r14, @selector(addObject:), rbx);
    rdi = rbx;
    [rdi release];
    [r14 release];
    r13 = r13 + 0x1;
    r12 = var_420;
    if (r13 < var_428) goto loc_99a895;

loc_99aaec:
    rax = [var_470 countByEnumeratingWithState:var_3D0 objects:var_230 count:0x10];
    var_428 = rax;
    if (rax != 0x0) goto loc_99a806;

loc_99ab24:
    [var_470 release];
    rdx = var_4B0;
    rbx = [r12->_deletedSectionsSet indexGreaterThanIndex:rdx];
    if (rbx != 0x7fffffffffffffff) goto loc_99a73a;

loc_99ab66:
    rbx = [r12->_insertedSectionsSet firstIndex];
    if (rbx == 0x7fffffffffffffff) goto loc_99b01a;

loc_99abe8:
    var_4B0 = rbx;
    var_3E0 = intrinsic_movaps(var_3E0, 0x0);
    var_3F0 = intrinsic_movaps(var_3F0, 0x0);
    var_400 = intrinsic_movaps(var_400, 0x0);
    var_410 = intrinsic_movaps(var_410, 0x0);
    r14 = [(r15)(r12->_collectionView, @selector(_currentUpdate), rdx) retain];
    rbx = [(r15)(r14->_newModel, @selector(existingSupplementaryLayoutAttributesInSection:), rbx) retain];
    var_470 = rbx;
    [r14 release];
    rax = (r15)(rbx, @selector(countByEnumeratingWithState:objects:count:), var_410, var_2B0, 0x10);
    var_430 = rax;
    if (rax == 0x0) goto loc_99afd8;

loc_99ac95:
    var_458 = *var_400;
    goto loc_99acb4;

loc_99acb4:
    r13 = 0x0;
    goto loc_99ad43;

loc_99ad43:
    if (*var_400 != var_458) {
            objc_enumerationMutation(var_470);
    }
    var_418 = *(var_408 + r13 * 0x8);
    if ([*(var_408 + r13 * 0x8) _isDecorationView] == 0x0) goto loc_99ae67;

loc_99ad89:
    rbx = r15;
    r15 = [(r15)(var_418, @selector(_elementKind)) retain];
    rdx = r15;
    r12 = [(rbx)(r12->_insertedDecorationIndexPathsDict, @selector(objectForKeyedSubscript:), rdx) retain];
    rdi = r15;
    r15 = rbx;
    [rdi release];
    if (r12 != 0x0) goto loc_99af49;

loc_99ade2:
    rbx = (r15)((r15)(@class(NSMutableArray), @selector(alloc), rdx), @selector(init), rdx);
    rdi = r12;
    [rdi release];
    r14 = [(r15)(var_418, @selector(_elementKind), rdx) retain];
    rdx = rbx;
    (r15)(var_420->_insertedDecorationIndexPathsDict, @selector(setObject:forKeyedSubscript:), rdx, r14);
    [r14 release];
    goto loc_99af46;

loc_99af46:
    r12 = rbx;
    goto loc_99af49;

loc_99af49:
    rbx = [(r15)(var_418, @selector(indexPath), rdx) retain];
    (r15)(r12, @selector(addObject:), rbx);
    rdi = rbx;
    [rdi release];
    [r12 release];
    r13 = r13 + 0x1;
    r12 = var_420;
    if (r13 < var_430) goto loc_99ad43;

loc_99afa0:
    rax = [var_470 countByEnumeratingWithState:var_410 objects:var_2B0 count:0x10];
    var_430 = rax;
    if (rax != 0x0) goto loc_99acb4;

loc_99afd8:
    [var_470 release];
    rdx = var_4B0;
    rbx = [r12->_insertedSectionsSet indexGreaterThanIndex:rdx];
    if (rbx != 0x7fffffffffffffff) goto loc_99abe8;

loc_99b01a:
    [var_498 release];
    [var_4A0 release];
    if (*___stack_chk_guard != *___stack_chk_guard) {
            __stack_chk_fail();
    }
    return;

loc_99ae67:
    r14 = [(r15)(var_418, @selector(_elementKind)) retain];
    r15 = r15;
    rdx = r14;
    r12 = [(r15)(r12->_insertedSupplementaryIndexPathsDict, @selector(objectForKeyedSubscript:), rdx) retain];
    [r14 release];
    if (r12 != 0x0) goto loc_99af49;

loc_99aec0:
    var_490 = (r15)((r15)(@class(NSMutableArray), @selector(alloc), rdx), @selector(init), rdx);
    [r12 release];
    r12 = r15;
    r15 = [(r12)(var_418, @selector(_elementKind), rdx) retain];
    rbx = var_490;
    rdx = rbx;
    (r12)(var_420->_insertedSupplementaryIndexPathsDict, @selector(setObject:forKeyedSubscript:), rdx, r15);
    rdi = r15;
    r15 = r12;
    [rdi release];
    goto loc_99af46;

loc_99a9b1:
    r14 = r12->_deletedSupplementaryIndexPathsDict;
    rax = (r15)(rbx, @selector(_elementKind));
    r12 = rbx;
    rbx = r15;
    r15 = [rax retain];
    rdx = r15;
    r14 = [(rbx)(r14, @selector(objectForKeyedSubscript:), rdx) retain];
    rdi = r15;
    r15 = rbx;
    rbx = r12;
    [rdi release];
    if (r14 != 0x0) goto loc_99aa99;

loc_99aa0c:
    r12 = (r15)((r15)(@class(NSMutableArray), @selector(alloc), rdx), @selector(init), rdx);
    rdi = r14;
    [rdi release];
    var_458 = rbx;
    rbx = [(r15)(rbx, @selector(_elementKind), rdx) retain];
    rsi = @selector(setObject:forKeyedSubscript:);
    rdx = r12;
    rcx = rbx;
    (r15)(var_420->_deletedSupplementaryIndexPathsDict, rsi, rdx, rcx);
    rdi = rbx;
    goto loc_99aa8c;

loc_99a545:
    rcx = var_420->_deletedSectionsSet;
    rbx = [(r13)(r12, @selector(indexPathBeforeUpdate)) retain];
    rax = (r13)(rbx, @selector(section));
    (r13)(rcx, @selector(addIndex:), rax);
    [rbx release];
    r15 = r13;
    rbx = [(r15)(r12, @selector(indexPathAfterUpdate)) retain];
    rax = (r15)(rbx, @selector(section));
    rdi = var_420->_insertedSectionsSet;
    goto loc_99a620;

loc_99a5e6:
    rax = var_420;
    rcx = *_OBJC_IVAR_$_UICollectionViewLayout._insertedSectionsSet;
    goto loc_99a5f4;

loc_99a346:
    if (rbx > 0x2) goto loc_99a476;

loc_99a354:
    r13 = r15;
    r15 = [(r15)(r12, @selector(indexPathBeforeUpdate)) retain];
    var_440 = [(r13)(@class(_UICollectionViewItemKey), @selector(collectionItemKeyForCellWithIndexPath:), r15) retain];
    [r15 release];
    rcx = var_420;
    rax = (r13)(r12, @selector(indexPathBeforeUpdate));
    rax = [rax retain];
    var_458 = rax;
    rdx = rax;
    rbx = [(r13)((r13)(rcx->_collectionView, @selector(_visibleCellForIndexPath:), rdx), @selector(_layoutAttributes)) retain];
    r12 = (r13)(rbx, @selector(copy));
    [rbx release];
    [var_458 release];
    if (r12 != 0x0) {
            (r13)(r12, @selector(setAlpha:), rdx, rcx);
            (r13)(var_420->_finalAnimationLayoutAttributesDict, @selector(setObject:forKey:), r12, var_440);
    }
    r15 = r13;
    rdi = r12;
    goto loc_99a651;

loc_99a651:
    [rdi release];
    [var_440 release];
    goto loc_99a65c;

loc_99a476:
    if ((rbx | 0x2) != 0x2) goto loc_99a65c;

loc_99a484:
    rbx = [(r15)(r12, @selector(indexPathAfterUpdate)) retain];
    var_440 = rbx;
    var_458 = [(r15)(@class(_UICollectionViewItemKey), @selector(collectionItemKeyForCellWithIndexPath:), rbx) retain];
    r13 = var_420;
    rdx = rbx;
    rbx = [(r15)(r13, @selector(layoutAttributesForItemAtIndexPath:), rdx) retain];
    r12 = (r15)(rbx, @selector(copy));
    [rbx release];
    if (r12 != 0x0) {
            (r15)(r12, @selector(setAlpha:), rdx);
            (r15)(r13->_initialAnimationLayoutAttributesDict, @selector(setObject:forKey:), r12, var_458);
            r13 = var_458;
    }
    else {
            r13 = var_458;
    }
    [r12 release];
    rdi = r13;
    goto loc_99a651;
}

void -[UICollectionViewLayout finalizeCollectionViewUpdates](void * self, void * _cmd) {
    [self->_initialAnimationLayoutAttributesDict removeAllObjects];
    [self->_finalAnimationLayoutAttributesDict removeAllObjects];
    [self->_deletedSupplementaryIndexPathsDict removeAllObjects];
    [self->_insertedSupplementaryIndexPathsDict removeAllObjects];
    [self->_deletedDecorationIndexPathsDict removeAllObjects];
    [self->_insertedDecorationIndexPathsDict removeAllObjects];
    [self->_deletedSectionsSet removeAllIndexes];
    [self->_insertedSectionsSet removeAllIndexes];
    return;
}

void * -[UICollectionViewLayout snapshottedLayoutAttributeForItemAtIndexPath:](void * self, void * _cmd, void * arg2) {
    return 0x0;
}

void -[UICollectionViewLayout registerClass:forDecorationViewOfKind:](void * self, void * _cmd, void * arg2, void * arg3) {
    r14 = arg2;
    rbx = self;
    r15 = [arg3 retain];
    if (rbx->_decorationViewClassDict == 0x0) {
            rbx->_decorationViewClassDict = [[NSMutableDictionary alloc] init];
            [rbx->_decorationViewClassDict release];
    }
    [rbx->_decorationViewNibDict removeObjectForKey:r15];
    rdi = rbx->_decorationViewClassDict;
    if (r14 != 0x0) {
            [rdi setValue:r14 forKey:r15];
    }
    else {
            [rdi removeObjectForKey:r15];
    }
    rdi = r15;
    [rdi release];
    return;
}

void -[UICollectionViewLayout registerNib:forDecorationViewOfKind:](void * self, void * _cmd, void * arg2, void * arg3) {
    rbx = self;
    r14 = [arg2 retain];
    r15 = [arg3 retain];
    if (rbx->_decorationViewNibDict == 0x0) {
            rbx->_decorationViewNibDict = [[NSMutableDictionary alloc] init];
            [rbx->_decorationViewNibDict release];
    }
    [rbx->_decorationViewClassDict removeObjectForKey:r15];
    rdi = rbx->_decorationViewNibDict;
    if (r14 != 0x0) {
            [rdi setValue:r14 forKey:r15];
    }
    else {
            [rdi removeObjectForKey:r15];
    }
    [r15 release];
    rdi = r14;
    [rdi release];
    return;
}

void -[UICollectionViewLayout _prepareForTransitionToLayout:](void * self, void * _cmd, void * arg2) {
    rax = [arg2 retain];
    self->_transitioningToLayout = rax;
    r14 = [rax retain];
    [self->_transitioningToLayout release];
    rax = [UICollectionViewTransitionLayout class];
    rax = [self->_transitioningToLayout isKindOfClass:rax];
    self->_layoutFlags = self->_layoutFlags & 0xfd | rax + rax;
    [self->_animator _setRunning:0x0];
    [self prepareForTransitionToLayout:r14];
    rdi = r14;
    [rdi release];
    return;
}

void -[UICollectionViewLayout _prepareForTransitionFromLayout:](void * self, void * _cmd, void * arg2) {
    rax = [arg2 retain];
    self->_transitioningFromLayout = rax;
    r14 = [rax retain];
    [self->_transitioningFromLayout release];
    self->_layoutFlags = self->_layoutFlags & 0xfe | [self->_transitioningFromLayout isKindOfClass:[UICollectionViewTransitionLayout class]];
    [self prepareForTransitionFromLayout:r14];
    rdi = r14;
    [rdi release];
    return;
}

void -[UICollectionViewLayout _finalizeLayoutTransition](void * self, void * _cmd) {
    rbx = self;
    rbx->_transitioningFromLayout = 0x0;
    [rbx->_transitioningFromLayout release];
    rbx->_layoutFlags = rbx->_layoutFlags & 0xfe;
    rbx->_transitioningToLayout = 0x0;
    [rbx->_transitioningToLayout release];
    rbx->_layoutFlags = rbx->_layoutFlags & 0xfd;
    [rbx finalizeLayoutTransition];
    r14 = [[rbx collectionView] retain];
    r15 = [[r14 collectionViewLayout] retain];
    [r15 release];
    [r14 release];
    if (r15 == rbx) {
            rdi = rbx->_animator;
            [rdi _tickle];
    }
    return;
}

void -[UICollectionViewLayout prepareForTransitionToLayout:](void * self, void * _cmd, void * arg2) {
    return;
}

void -[UICollectionViewLayout prepareForTransitionFromLayout:](void * self, void * _cmd, void * arg2) {
    return;
}

void -[UICollectionViewLayout finalizeLayoutTransition](void * self, void * _cmd) {
    return;
}

void -[UICollectionViewLayout _didFinishLayoutTransitionAnimations:](void * self, void * _cmd, bool arg2) {
    return;
}

struct CGPoint -[UICollectionViewLayout transitionContentOffsetForProposedContentOffset:keyItemIndexPath:](void * self, void * _cmd, struct CGPoint arg2, void * arg3) {
    return rax;
}

struct CGPoint -[UICollectionViewLayout updatesContentOffsetForProposedContentOffset:](void * self, void * _cmd, struct CGPoint arg2) {
    return rax;
}

void -[UICollectionViewLayout _setCollectionView:](void * self, void * _cmd, void * arg2) {
    self->_collectionView = arg2;
    return;
}

void * -[UICollectionViewLayout collectionView](void * self, void * _cmd) {
    rdi = self;
    rax = rdi->_collectionView;
    if (rax != 0x0) {
            rbx = [rax retain];
    }
    else {
            r14 = objc_loadWeakRetained(rdi + *_OBJC_IVAR_$_UICollectionViewLayout._compositionLayout);
            rbx = [[r14 collectionView] retain];
            [r14 release];
    }
    [rbx autorelease];
    rax = rbx;
    return rax;
}

void -[UICollectionViewLayout _setCollectionViewBoundsSize:](void * self, void * _cmd, struct CGSize arg2) {
    self->_collectionViewBoundsSize = intrinsic_movsd(self->_collectionViewBoundsSize, xmm0, arg2);
    *(self + *_OBJC_IVAR_$_UICollectionViewLayout._collectionViewBoundsSize + 0x8) = intrinsic_movsd(*(self + *_OBJC_IVAR_$_UICollectionViewLayout._collectionViewBoundsSize + 0x8), xmm1);
    return;
}

void -[UICollectionViewLayout prepareForAnimatedBoundsChange:](void * self, void * _cmd, struct CGRect arg2) {
    return;
}

void -[UICollectionViewLayout finalizeAnimatedBoundsChange](void * self, void * _cmd) {
    return;
}

void -[UICollectionViewLayout _setDynamicAnimator:](void * self, void * _cmd, void * arg2) {
    self->_animator = [arg2 retain];
    [self->_animator release];
    return;
}

void * -[UICollectionViewLayout _dynamicAnimator](void * self, void * _cmd) {
    rax = objc_retainAutoreleaseReturnValue(self->_animator);
    return rax;
}

void -[UICollectionViewLayout _prepareToAnimateFromCollectionViewItems:atContentOffset:toItems:atContentOffset:](void * self, void * _cmd, void * arg2, struct CGPoint arg3, void * arg4, struct CGPoint arg5) {
    var_270 = intrinsic_movaps(var_270, xmm3, arg2, arg3, arg4, arg5);
    var_250 = intrinsic_movaps(var_250, xmm2);
    var_290 = intrinsic_movapd(var_290, xmm1);
    var_280 = intrinsic_movaps(var_280, xmm0);
    r14 = self;
    r13 = [arg2 retain];
    r12 = [arg3 retain];
    rax = *(int32_t *)__UIApplicationLinkedOnVersion;
    if (rax != 0x0) {
            if (rax > 0x6ffff) {
                    if (rax >= 0x70100) {
                            var_298 = r14;
                            var_220 = [[NSMutableDictionary alloc] initWithCapacity:[r13 count]];
                            intrinsic_movaps(var_140, 0x0);
                            intrinsic_movaps(var_150, 0x0);
                            var_160 = intrinsic_movaps(var_160, 0x0);
                            var_170 = intrinsic_movaps(var_170, 0x0);
                            rax = [r13 retain];
                            var_228 = rax;
                            rax = [rax countByEnumeratingWithState:var_170 objects:var_B0 count:0x10];
                            var_208 = rax;
                            if (rax != 0x0) {
                                    var_260 = r12;
                                    var_258 = r13;
                                    var_218 = *var_160;
                                    do {
                                            rbx = 0x0;
                                            do {
                                                    if (*var_160 != var_218) {
                                                            objc_enumerationMutation(var_228);
                                                    }
                                                    r12 = [[_UICollectionViewItemKey collectionItemKeyForLayoutAttributes:*(var_168 + rbx * 0x8)] retain];
                                                    [var_220 setObject:*(var_168 + rbx * 0x8) forKey:r12];
                                                    [r12 release];
                                                    rbx = rbx + 0x1;
                                            } while (rbx < var_208);
                                            var_238 = @selector(countByEnumeratingWithState:objects:count:);
                                            rax = _objc_msgSend(var_228, var_238);
                                            var_208 = rax;
                                    } while (rax != 0x0);
                                    r13 = var_258;
                                    r12 = var_260;
                            }
                            else {
                                    var_238 = @selector(countByEnumeratingWithState:objects:count:);
                            }
                            [var_228 release];
                            var_218 = [[NSMutableDictionary alloc] initWithCapacity:[r12 count]];
                            intrinsic_movaps(var_180, 0x0);
                            intrinsic_movaps(var_190, 0x0);
                            var_1A0 = intrinsic_movaps(var_1A0, 0x0);
                            var_1B0 = intrinsic_movaps(var_1B0, 0x0);
                            rax = [r12 retain];
                            var_230 = rax;
                            rax = _objc_msgSend(rax, var_238, var_1B0, var_130, 0x10);
                            r14 = _objc_msgSend;
                            var_208 = rax;
                            if (rax != 0x0) {
                                    var_260 = r12;
                                    var_258 = r13;
                                    var_228 = *var_1A0;
                                    do {
                                            r12 = 0x0;
                                            do {
                                                    if (*var_1A0 != var_228) {
                                                            objc_enumerationMutation(var_230);
                                                    }
                                                    r13 = [(r14)(@class(_UICollectionViewItemKey), @selector(collectionItemKeyForLayoutAttributes:), *(var_1A8 + r12 * 0x8)) retain];
                                                    (r14)(var_218, @selector(setObject:forKey:), *(var_1A8 + r12 * 0x8), r13);
                                                    [r13 release];
                                                    r12 = r12 + 0x1;
                                            } while (r12 < var_208);
                                            rax = [var_230 countByEnumeratingWithState:var_1B0 objects:var_130 count:0x10];
                                            var_208 = rax;
                                    } while (rax != 0x0);
                            }
                            else {
                                    var_260 = r12;
                                    var_258 = r13;
                            }
                            [var_230 release];
                            r12 = r14;
                            rbx = [(r12)(var_218, @selector(allKeys)) retain];
                            r13 = [(r12)(@class(NSMutableSet), @selector(setWithArray:), rbx) retain];
                            [rbx release];
                            rbx = [(r12)(var_220, @selector(allKeys)) retain];
                            (r12)(r13, @selector(addObjectsFromArray:), rbx);
                            [rbx release];
                            xmm1 = intrinsic_movapd(xmm1, var_250);
                            xmm1 = intrinsic_unpcklpd(xmm1, var_270);
                            xmm0 = intrinsic_movapd(0x0, var_280);
                            xmm0 = intrinsic_unpcklpd(xmm0, var_290);
                            var_250 = intrinsic_movapd(var_250, intrinsic_subpd(xmm1, xmm0));
                            var_208 = [var_220 retain];
                            intrinsic_movups(var_1C0, intrinsic_movaps(xmm0, var_250));
                            r15 = [var_218 retain];
                            var_1D0 = [var_230 retain];
                            var_1C8 = [var_298 retain];
                            (r12)(r13, @selector(enumerateObjectsUsingBlock:), __NSConcreteStackBlock);
                            [var_1C8 release];
                            [var_1D0 release];
                            [var_218 release];
                            [var_220 release];
                            [r15 release];
                            [var_208 release];
                            [r13 release];
                            r13 = var_258;
                            r12 = var_260;
                    }
            }
            else {
                    var_298 = r14;
                    var_220 = [[NSMutableDictionary alloc] initWithCapacity:[r13 count]];
                    intrinsic_movaps(var_140, 0x0);
                    intrinsic_movaps(var_150, 0x0);
                    var_160 = intrinsic_movaps(var_160, 0x0);
                    var_170 = intrinsic_movaps(var_170, 0x0);
                    rax = [r13 retain];
                    var_228 = rax;
                    rax = [rax countByEnumeratingWithState:var_170 objects:var_B0 count:0x10];
                    var_208 = rax;
                    if (rax != 0x0) {
                            var_260 = r12;
                            var_258 = r13;
                            var_218 = *var_160;
                            do {
                                    rbx = 0x0;
                                    do {
                                            if (*var_160 != var_218) {
                                                    objc_enumerationMutation(var_228);
                                            }
                                            r12 = [[_UICollectionViewItemKey collectionItemKeyForLayoutAttributes:*(var_168 + rbx * 0x8)] retain];
                                            [var_220 setObject:*(var_168 + rbx * 0x8) forKey:r12];
                                            [r12 release];
                                            rbx = rbx + 0x1;
                                    } while (rbx < var_208);
                                    var_238 = @selector(countByEnumeratingWithState:objects:count:);
                                    rax = _objc_msgSend(var_228, var_238);
                                    var_208 = rax;
                            } while (rax != 0x0);
                            r13 = var_258;
                            r12 = var_260;
                    }
                    else {
                            var_238 = @selector(countByEnumeratingWithState:objects:count:);
                    }
                    [var_228 release];
                    var_218 = [[NSMutableDictionary alloc] initWithCapacity:[r12 count]];
                    intrinsic_movaps(var_180, 0x0);
                    intrinsic_movaps(var_190, 0x0);
                    var_1A0 = intrinsic_movaps(var_1A0, 0x0);
                    var_1B0 = intrinsic_movaps(var_1B0, 0x0);
                    rax = [r12 retain];
                    var_230 = rax;
                    rax = _objc_msgSend(rax, var_238, var_1B0, var_130, 0x10);
                    r14 = _objc_msgSend;
                    var_208 = rax;
                    if (rax != 0x0) {
                            var_260 = r12;
                            var_258 = r13;
                            var_228 = *var_1A0;
                            do {
                                    r12 = 0x0;
                                    do {
                                            if (*var_1A0 != var_228) {
                                                    objc_enumerationMutation(var_230);
                                            }
                                            r13 = [(r14)(@class(_UICollectionViewItemKey), @selector(collectionItemKeyForLayoutAttributes:), *(var_1A8 + r12 * 0x8)) retain];
                                            (r14)(var_218, @selector(setObject:forKey:), *(var_1A8 + r12 * 0x8), r13);
                                            [r13 release];
                                            r12 = r12 + 0x1;
                                    } while (r12 < var_208);
                                    rax = [var_230 countByEnumeratingWithState:var_1B0 objects:var_130 count:0x10];
                                    var_208 = rax;
                            } while (rax != 0x0);
                    }
                    else {
                            var_260 = r12;
                            var_258 = r13;
                    }
                    [var_230 release];
                    r12 = r14;
                    rbx = [(r12)(var_218, @selector(allKeys)) retain];
                    r13 = [(r12)(@class(NSMutableSet), @selector(setWithArray:), rbx) retain];
                    [rbx release];
                    rbx = [(r12)(var_220, @selector(allKeys)) retain];
                    (r12)(r13, @selector(addObjectsFromArray:), rbx);
                    [rbx release];
                    xmm1 = intrinsic_movapd(xmm1, var_250);
                    xmm1 = intrinsic_unpcklpd(xmm1, var_270);
                    xmm0 = intrinsic_movapd(0x0, var_280);
                    xmm0 = intrinsic_unpcklpd(xmm0, var_290);
                    var_250 = intrinsic_movapd(var_250, intrinsic_subpd(xmm1, xmm0));
                    var_208 = [var_220 retain];
                    intrinsic_movups(var_1C0, intrinsic_movaps(xmm0, var_250));
                    r15 = [var_218 retain];
                    var_1D0 = [var_230 retain];
                    var_1C8 = [var_298 retain];
                    (r12)(r13, @selector(enumerateObjectsUsingBlock:), __NSConcreteStackBlock);
                    [var_1C8 release];
                    [var_1D0 release];
                    [var_218 release];
                    [var_220 release];
                    [r15 release];
                    [var_208 release];
                    [r13 release];
                    r13 = var_258;
                    r12 = var_260;
            }
    }
    else {
            if (__UIApplicationLinkedOnOrAfter(0x70000) != 0x0) {
                    rax = *(int32_t *)__UIApplicationLinkedOnVersion;
                    if (rax != 0x0) {
                            if (rax >= 0x70100) {
                                    var_298 = r14;
                                    var_220 = [[NSMutableDictionary alloc] initWithCapacity:[r13 count]];
                                    intrinsic_movaps(var_140, 0x0);
                                    intrinsic_movaps(var_150, 0x0);
                                    var_160 = intrinsic_movaps(var_160, 0x0);
                                    var_170 = intrinsic_movaps(var_170, 0x0);
                                    rax = [r13 retain];
                                    var_228 = rax;
                                    rax = [rax countByEnumeratingWithState:var_170 objects:var_B0 count:0x10];
                                    var_208 = rax;
                                    if (rax != 0x0) {
                                            var_260 = r12;
                                            var_258 = r13;
                                            var_218 = *var_160;
                                            do {
                                                    rbx = 0x0;
                                                    do {
                                                            if (*var_160 != var_218) {
                                                                    objc_enumerationMutation(var_228);
                                                            }
                                                            r12 = [[_UICollectionViewItemKey collectionItemKeyForLayoutAttributes:*(var_168 + rbx * 0x8)] retain];
                                                            [var_220 setObject:*(var_168 + rbx * 0x8) forKey:r12];
                                                            [r12 release];
                                                            rbx = rbx + 0x1;
                                                    } while (rbx < var_208);
                                                    var_238 = @selector(countByEnumeratingWithState:objects:count:);
                                                    rax = _objc_msgSend(var_228, var_238);
                                                    var_208 = rax;
                                            } while (rax != 0x0);
                                            r13 = var_258;
                                            r12 = var_260;
                                    }
                                    else {
                                            var_238 = @selector(countByEnumeratingWithState:objects:count:);
                                    }
                                    [var_228 release];
                                    var_218 = [[NSMutableDictionary alloc] initWithCapacity:[r12 count]];
                                    intrinsic_movaps(var_180, 0x0);
                                    intrinsic_movaps(var_190, 0x0);
                                    var_1A0 = intrinsic_movaps(var_1A0, 0x0);
                                    var_1B0 = intrinsic_movaps(var_1B0, 0x0);
                                    rax = [r12 retain];
                                    var_230 = rax;
                                    rax = _objc_msgSend(rax, var_238, var_1B0, var_130, 0x10);
                                    r14 = _objc_msgSend;
                                    var_208 = rax;
                                    if (rax != 0x0) {
                                            var_260 = r12;
                                            var_258 = r13;
                                            var_228 = *var_1A0;
                                            do {
                                                    r12 = 0x0;
                                                    do {
                                                            if (*var_1A0 != var_228) {
                                                                    objc_enumerationMutation(var_230);
                                                            }
                                                            r13 = [(r14)(@class(_UICollectionViewItemKey), @selector(collectionItemKeyForLayoutAttributes:), *(var_1A8 + r12 * 0x8)) retain];
                                                            (r14)(var_218, @selector(setObject:forKey:), *(var_1A8 + r12 * 0x8), r13);
                                                            [r13 release];
                                                            r12 = r12 + 0x1;
                                                    } while (r12 < var_208);
                                                    rax = [var_230 countByEnumeratingWithState:var_1B0 objects:var_130 count:0x10];
                                                    var_208 = rax;
                                            } while (rax != 0x0);
                                    }
                                    else {
                                            var_260 = r12;
                                            var_258 = r13;
                                    }
                                    [var_230 release];
                                    r12 = r14;
                                    rbx = [(r12)(var_218, @selector(allKeys)) retain];
                                    r13 = [(r12)(@class(NSMutableSet), @selector(setWithArray:), rbx) retain];
                                    [rbx release];
                                    rbx = [(r12)(var_220, @selector(allKeys)) retain];
                                    (r12)(r13, @selector(addObjectsFromArray:), rbx);
                                    [rbx release];
                                    xmm1 = intrinsic_movapd(xmm1, var_250);
                                    xmm1 = intrinsic_unpcklpd(xmm1, var_270);
                                    xmm0 = intrinsic_movapd(0x0, var_280);
                                    xmm0 = intrinsic_unpcklpd(xmm0, var_290);
                                    var_250 = intrinsic_movapd(var_250, intrinsic_subpd(xmm1, xmm0));
                                    var_208 = [var_220 retain];
                                    intrinsic_movups(var_1C0, intrinsic_movaps(xmm0, var_250));
                                    r15 = [var_218 retain];
                                    var_1D0 = [var_230 retain];
                                    var_1C8 = [var_298 retain];
                                    (r12)(r13, @selector(enumerateObjectsUsingBlock:), __NSConcreteStackBlock);
                                    [var_1C8 release];
                                    [var_1D0 release];
                                    [var_218 release];
                                    [var_220 release];
                                    [r15 release];
                                    [var_208 release];
                                    [r13 release];
                                    r13 = var_258;
                                    r12 = var_260;
                            }
                    }
                    else {
                            if (__UIApplicationLinkedOnOrAfter(0x70100) != 0x0) {
                                    var_298 = r14;
                                    var_220 = [[NSMutableDictionary alloc] initWithCapacity:[r13 count]];
                                    intrinsic_movaps(var_140, 0x0);
                                    intrinsic_movaps(var_150, 0x0);
                                    var_160 = intrinsic_movaps(var_160, 0x0);
                                    var_170 = intrinsic_movaps(var_170, 0x0);
                                    rax = [r13 retain];
                                    var_228 = rax;
                                    rax = [rax countByEnumeratingWithState:var_170 objects:var_B0 count:0x10];
                                    var_208 = rax;
                                    if (rax != 0x0) {
                                            var_260 = r12;
                                            var_258 = r13;
                                            var_218 = *var_160;
                                            do {
                                                    rbx = 0x0;
                                                    do {
                                                            if (*var_160 != var_218) {
                                                                    objc_enumerationMutation(var_228);
                                                            }
                                                            r12 = [[_UICollectionViewItemKey collectionItemKeyForLayoutAttributes:*(var_168 + rbx * 0x8)] retain];
                                                            [var_220 setObject:*(var_168 + rbx * 0x8) forKey:r12];
                                                            [r12 release];
                                                            rbx = rbx + 0x1;
                                                    } while (rbx < var_208);
                                                    var_238 = @selector(countByEnumeratingWithState:objects:count:);
                                                    rax = _objc_msgSend(var_228, var_238);
                                                    var_208 = rax;
                                            } while (rax != 0x0);
                                            r13 = var_258;
                                            r12 = var_260;
                                    }
                                    else {
                                            var_238 = @selector(countByEnumeratingWithState:objects:count:);
                                    }
                                    [var_228 release];
                                    var_218 = [[NSMutableDictionary alloc] initWithCapacity:[r12 count]];
                                    intrinsic_movaps(var_180, 0x0);
                                    intrinsic_movaps(var_190, 0x0);
                                    var_1A0 = intrinsic_movaps(var_1A0, 0x0);
                                    var_1B0 = intrinsic_movaps(var_1B0, 0x0);
                                    rax = [r12 retain];
                                    var_230 = rax;
                                    rax = _objc_msgSend(rax, var_238, var_1B0, var_130, 0x10);
                                    r14 = _objc_msgSend;
                                    var_208 = rax;
                                    if (rax != 0x0) {
                                            var_260 = r12;
                                            var_258 = r13;
                                            var_228 = *var_1A0;
                                            do {
                                                    r12 = 0x0;
                                                    do {
                                                            if (*var_1A0 != var_228) {
                                                                    objc_enumerationMutation(var_230);
                                                            }
                                                            r13 = [(r14)(@class(_UICollectionViewItemKey), @selector(collectionItemKeyForLayoutAttributes:), *(var_1A8 + r12 * 0x8)) retain];
                                                            (r14)(var_218, @selector(setObject:forKey:), *(var_1A8 + r12 * 0x8), r13);
                                                            [r13 release];
                                                            r12 = r12 + 0x1;
                                                    } while (r12 < var_208);
                                                    rax = [var_230 countByEnumeratingWithState:var_1B0 objects:var_130 count:0x10];
                                                    var_208 = rax;
                                            } while (rax != 0x0);
                                    }
                                    else {
                                            var_260 = r12;
                                            var_258 = r13;
                                    }
                                    [var_230 release];
                                    r12 = r14;
                                    rbx = [(r12)(var_218, @selector(allKeys)) retain];
                                    r13 = [(r12)(@class(NSMutableSet), @selector(setWithArray:), rbx) retain];
                                    [rbx release];
                                    rbx = [(r12)(var_220, @selector(allKeys)) retain];
                                    (r12)(r13, @selector(addObjectsFromArray:), rbx);
                                    [rbx release];
                                    xmm1 = intrinsic_movapd(xmm1, var_250);
                                    xmm1 = intrinsic_unpcklpd(xmm1, var_270);
                                    xmm0 = intrinsic_movapd(0x0, var_280);
                                    xmm0 = intrinsic_unpcklpd(xmm0, var_290);
                                    var_250 = intrinsic_movapd(var_250, intrinsic_subpd(xmm1, xmm0));
                                    var_208 = [var_220 retain];
                                    intrinsic_movups(var_1C0, intrinsic_movaps(xmm0, var_250));
                                    r15 = [var_218 retain];
                                    var_1D0 = [var_230 retain];
                                    var_1C8 = [var_298 retain];
                                    (r12)(r13, @selector(enumerateObjectsUsingBlock:), __NSConcreteStackBlock);
                                    [var_1C8 release];
                                    [var_1D0 release];
                                    [var_218 release];
                                    [var_220 release];
                                    [r15 release];
                                    [var_208 release];
                                    [r13 release];
                                    r13 = var_258;
                                    r12 = var_260;
                            }
                    }
            }
            else {
                    var_298 = r14;
                    var_220 = [[NSMutableDictionary alloc] initWithCapacity:[r13 count]];
                    intrinsic_movaps(var_140, 0x0);
                    intrinsic_movaps(var_150, 0x0);
                    var_160 = intrinsic_movaps(var_160, 0x0);
                    var_170 = intrinsic_movaps(var_170, 0x0);
                    rax = [r13 retain];
                    var_228 = rax;
                    rax = [rax countByEnumeratingWithState:var_170 objects:var_B0 count:0x10];
                    var_208 = rax;
                    if (rax != 0x0) {
                            var_260 = r12;
                            var_258 = r13;
                            var_218 = *var_160;
                            do {
                                    rbx = 0x0;
                                    do {
                                            if (*var_160 != var_218) {
                                                    objc_enumerationMutation(var_228);
                                            }
                                            r12 = [[_UICollectionViewItemKey collectionItemKeyForLayoutAttributes:*(var_168 + rbx * 0x8)] retain];
                                            [var_220 setObject:*(var_168 + rbx * 0x8) forKey:r12];
                                            [r12 release];
                                            rbx = rbx + 0x1;
                                    } while (rbx < var_208);
                                    var_238 = @selector(countByEnumeratingWithState:objects:count:);
                                    rax = _objc_msgSend(var_228, var_238);
                                    var_208 = rax;
                            } while (rax != 0x0);
                            r13 = var_258;
                            r12 = var_260;
                    }
                    else {
                            var_238 = @selector(countByEnumeratingWithState:objects:count:);
                    }
                    [var_228 release];
                    var_218 = [[NSMutableDictionary alloc] initWithCapacity:[r12 count]];
                    intrinsic_movaps(var_180, 0x0);
                    intrinsic_movaps(var_190, 0x0);
                    var_1A0 = intrinsic_movaps(var_1A0, 0x0);
                    var_1B0 = intrinsic_movaps(var_1B0, 0x0);
                    rax = [r12 retain];
                    var_230 = rax;
                    rax = _objc_msgSend(rax, var_238, var_1B0, var_130, 0x10);
                    r14 = _objc_msgSend;
                    var_208 = rax;
                    if (rax != 0x0) {
                            var_260 = r12;
                            var_258 = r13;
                            var_228 = *var_1A0;
                            do {
                                    r12 = 0x0;
                                    do {
                                            if (*var_1A0 != var_228) {
                                                    objc_enumerationMutation(var_230);
                                            }
                                            r13 = [(r14)(@class(_UICollectionViewItemKey), @selector(collectionItemKeyForLayoutAttributes:), *(var_1A8 + r12 * 0x8)) retain];
                                            (r14)(var_218, @selector(setObject:forKey:), *(var_1A8 + r12 * 0x8), r13);
                                            [r13 release];
                                            r12 = r12 + 0x1;
                                    } while (r12 < var_208);
                                    rax = [var_230 countByEnumeratingWithState:var_1B0 objects:var_130 count:0x10];
                                    var_208 = rax;
                            } while (rax != 0x0);
                    }
                    else {
                            var_260 = r12;
                            var_258 = r13;
                    }
                    [var_230 release];
                    r12 = r14;
                    rbx = [(r12)(var_218, @selector(allKeys)) retain];
                    r13 = [(r12)(@class(NSMutableSet), @selector(setWithArray:), rbx) retain];
                    [rbx release];
                    rbx = [(r12)(var_220, @selector(allKeys)) retain];
                    (r12)(r13, @selector(addObjectsFromArray:), rbx);
                    [rbx release];
                    xmm1 = intrinsic_movapd(xmm1, var_250);
                    xmm1 = intrinsic_unpcklpd(xmm1, var_270);
                    xmm0 = intrinsic_movapd(0x0, var_280);
                    xmm0 = intrinsic_unpcklpd(xmm0, var_290);
                    var_250 = intrinsic_movapd(var_250, intrinsic_subpd(xmm1, xmm0));
                    var_208 = [var_220 retain];
                    intrinsic_movups(var_1C0, intrinsic_movaps(xmm0, var_250));
                    r15 = [var_218 retain];
                    var_1D0 = [var_230 retain];
                    var_1C8 = [var_298 retain];
                    (r12)(r13, @selector(enumerateObjectsUsingBlock:), __NSConcreteStackBlock);
                    [var_1C8 release];
                    [var_1D0 release];
                    [var_218 release];
                    [var_220 release];
                    [r15 release];
                    [var_208 release];
                    [r13 release];
                    r13 = var_258;
                    r12 = var_260;
            }
    }
    [r12 release];
    [r13 release];
    if (*___stack_chk_guard != *___stack_chk_guard) {
            __stack_chk_fail();
    }
    return;
}

int ___107-[UICollectionViewLayout _prepareToAnimateFromCollectionViewItems:atContentOffset:toItems:atContentOffset:]_block_invoke(int arg0, int arg1) {
    var_1F0 = arg0;
    rbx = [[arg1 retain] retain];
    var_178 = rbx;
    r15 = [[*(arg0 + 0x20) objectForKey:rbx] retain];
    var_1D0 = r15;
    rdx = rbx;
    r14 = [[*(arg0 + 0x28) objectForKey:rdx] retain];
    rbx = [r15 copy];
    var_1D8 = rbx;
    [rbx center];
    xmm0 = intrinsic_addsd(xmm0, *(arg0 + 0x40));
    xmm1 = intrinsic_addsd(xmm1, *(arg0 + 0x48));
    [rbx setCenter:rdx];
    r15 = r14;
    r14 = [r14 copy];
    var_1E8 = r14;
    [r14 center];
    xmm0 = intrinsic_subsd(xmm0, *(arg0 + 0x40));
    intrinsic_subsd(xmm1, *(arg0 + 0x48));
    rbx = var_1D0;
    [r14 setCenter:rdx];
    if ((rbx == 0x0) || (r15 == 0x0)) goto loc_99bd25;

loc_99bcfa:
    r14 = var_1D8;
    if (r14 != 0x0) {
            [var_D0 frame];
    }
    else {
            xmm0 = intrinsic_xorpd(xmm0, xmm0);
            var_C0 = intrinsic_movapd(var_C0, xmm0);
            var_D0 = intrinsic_movapd(var_D0, xmm0);
    }
    r12 = r15;
    [var_F0 frame];
    CGRectUnion(var_110, r12);
    if (CGRectIntersectsRect(var_110, r12) != 0x0) goto loc_99c2fc;

loc_99bf45:
    var_1E0 = r12;
    xmm0 = intrinsic_xorpd(xmm0, xmm0);
    intrinsic_movapd(var_120, xmm0);
    intrinsic_movapd(var_130, xmm0);
    var_140 = intrinsic_movapd(var_140, xmm0);
    var_150 = intrinsic_movapd(var_150, xmm0);
    rbx = [*(var_1F0 + 0x30) retain];
    var_1B0 = rbx;
    rax = [rbx countByEnumeratingWithState:var_150 objects:var_B0 count:0x10];
    var_198 = rax;
    if (rax == 0x0) goto loc_99c2ec;

loc_99bfbf:
    var_1A0 = *var_140;
    goto loc_99bfe5;

loc_99bfe5:
    r12 = 0x0;
    goto loc_99c02e;

loc_99c02e:
    if (*var_140 != var_1A0) {
            objc_enumerationMutation(var_1B0);
    }
    rdx = *(var_148 + r12 * 0x8);
    var_180 = rdx;
    r15 = [[_UICollectionViewItemKey collectionItemKeyForLayoutAttributes:rdx] retain];
    if ([var_178 type] != [r15 type]) goto loc_99c1b9;

loc_99c0a4:
    r13 = [[var_178 identifier] retain];
    var_1A8 = r15;
    rbx = [[r15 identifier] retain];
    r14 = [r13 isEqualToString:rbx];
    rdi = rbx;
    [rdi release];
    rdi = r13;
    [rdi release];
    r15 = var_1A8;
    COND = r14 == 0x0;
    if (COND) goto loc_99c1b9;

loc_99c11c:
    rsi = var_180;
    if (rsi != 0x0) {
            rdi = var_170;
            [rdi frame];
    }
    else {
            xmm0 = intrinsic_xorpd(xmm0, xmm0);
            var_160 = intrinsic_movapd(var_160, xmm0);
            var_170 = intrinsic_movapd(var_170, xmm0);
    }
    if (CGRectIntersectsRect(rdi, rsi) != 0x0) goto loc_99c229;

loc_99c1b9:
    [r15 release];
    r12 = r12 + 0x1;
    if (r12 < var_198) goto loc_99c02e;

loc_99c1d2:
    rbx = var_1B0;
    rax = [rbx countByEnumeratingWithState:var_150 objects:var_B0 count:0x10];
    var_198 = rax;
    if (rax != 0x0) goto loc_99bfe5;

loc_99c20d:
    [rbx release];
    r12 = var_1E0;
    r14 = var_1D8;
    goto loc_99c2fc;

loc_99c2fc:
    var_1D8 = r14;
    var_1E0 = r12;
    rbx = var_178;
    [*(var_1F0 + 0x38)->_initialAnimationLayoutAttributesDict setObject:var_1D0 forKey:rbx];
    [*(var_1F0 + 0x38)->_finalAnimationLayoutAttributesDict setObject:r12 forKey:rbx];
    goto loc_99c363;

loc_99c363:
    r12 = rbx;
    r14 = var_1D8;
    goto loc_99c377;

loc_99c377:
    [var_1E8 release];
    [r14 release];
    [var_1E0 release];
    [var_1D0 release];
    [r12 release];
    rax = [r12 release];
    if (*___stack_chk_guard != *___stack_chk_guard) {
            rax = __stack_chk_fail();
    }
    return rax;

loc_99c229:
    r14 = [var_1D8 copy];
    r12 = [var_1E8 copy];
    rbx = var_178;
    xmm0 = intrinsic_xorpd(xmm0, xmm0);
    [r14 setAlpha:rdx];
    intrinsic_xorpd(xmm0, xmm0);
    [r12 setAlpha:rdx];
    [*(var_1F0 + 0x38)->_initialAnimationLayoutAttributesDict setObject:r12 forKey:rbx];
    [*(var_1F0 + 0x38)->_finalAnimationLayoutAttributesDict setObject:r14 forKey:rbx];
    [r12 release];
    [r14 release];
    [var_1A8 release];
    [var_1B0 release];
    goto loc_99c363;

loc_99c2ec:
    [rbx release];
    r12 = var_1E0;
    goto loc_99c2fc;

loc_99bd25:
    var_1E0 = r15;
    if (rbx != 0x0) {
            intrinsic_xorpd(xmm0, xmm0);
            r14 = var_1D8;
            [r14 setAlpha:rdx];
            r12 = var_178;
            [*(var_1F0 + 0x38)->_initialAnimationLayoutAttributesDict setObject:rbx forKey:r12];
            [*(var_1F0 + 0x38)->_finalAnimationLayoutAttributesDict setObject:r14 forKey:r12];
    }
    else {
            rbx = [var_1E8 copy];
            intrinsic_xorpd(xmm0, xmm0);
            [rbx setAlpha:rdx];
            r12 = var_178;
            [*(var_1F0 + 0x38)->_initialAnimationLayoutAttributesDict setObject:rbx forKey:r12];
            [*(var_1F0 + 0x38)->_finalAnimationLayoutAttributesDict setObject:var_1E0 forKey:r12];
            [rbx release];
            r14 = var_1D8;
    }
    goto loc_99c377;
}

void * -[UICollectionViewLayout initialLayoutAttributesForAppearingItemAtIndexPath:](void * self, void * _cmd, void * arg2) {
    r13 = self;
    rbx = [arg2 retain];
    var_30 = rbx;
    rax = [_UICollectionViewItemKey collectionItemKeyForCellWithIndexPath:rbx];
    rax = [rax retain];
    var_38 = rax;
    rdx = rax;
    r15 = [[r13->_initialAnimationLayoutAttributesDict objectForKey:rdx] retain];
    r14 = [rbx section];
    rax = *_OBJC_IVAR_$_UICollectionViewLayout._collectionView;
    r12 = r15;
    if (r15 == 0x0) {
            COND = r14 >= [r13->_collectionView numberOfSections];
            rax = *_OBJC_IVAR_$_UICollectionViewLayout._collectionView;
            r12 = r15;
            if (!COND) {
                    rdx = r14;
                    COND = [var_30 item] >= [r13->_collectionView numberOfItemsInSection:rdx];
                    rax = *_OBJC_IVAR_$_UICollectionViewLayout._collectionView;
                    r12 = r15;
                    if (!COND) {
                            rdi = r13->_transitioningFromLayout;
                            if ((rdi != 0x0) && ((r13->_layoutFlags & 0x1) == 0x0)) {
                                    rdx = var_30;
                                    r14 = [[rdi layoutAttributesForItemAtIndexPath:rdx] retain];
                                    var_40 = 0x1;
                                    var_44 = 0x0;
                            }
                            else {
                                    rdx = var_30;
                                    r14 = [[r13 layoutAttributesForItemAtIndexPath:rdx] retain];
                                    var_44 = 0x1;
                                    var_40 = 0x0;
                            }
                            r12 = [r14 retain];
                            [r15 release];
                            if (var_44 != 0x0) {
                                    [r14 release];
                            }
                            rax = *_OBJC_IVAR_$_UICollectionViewLayout._collectionView;
                            if (var_40 != 0x0) {
                                    [r14 release];
                                    rax = *_OBJC_IVAR_$_UICollectionViewLayout._collectionView;
                            }
                    }
            }
    }
    r14 = [[*(r13 + rax) _currentUpdate] retain];
    if (r14 != 0x0) {
            rdx = [var_30 section];
            if ([r13->_insertedSectionsSet containsIndex:rdx] != 0x0) {
                    if (r13->_transitioningFromLayout == 0x0) {
                            rbx = [r12 copy];
                            [r12 release];
                            [rbx setAlpha:rdx];
                            r12 = rbx;
                    }
            }
    }
    else {
            if (r13->_transitioningFromLayout == 0x0) {
                    rbx = [r12 copy];
                    [r12 release];
                    [rbx setAlpha:rdx];
                    r12 = rbx;
            }
    }
    [r14 release];
    [var_38 release];
    [var_30 release];
    rdi = r12;
    rax = [rdi autorelease];
    return rax;
}

void * -[UICollectionViewLayout finalLayoutAttributesForDisappearingItemAtIndexPath:](void * self, void * _cmd, void * arg2) {
    r12 = self;
    rax = [arg2 retain];
    var_30 = rax;
    rax = [_UICollectionViewItemKey collectionItemKeyForCellWithIndexPath:rax];
    rax = [rax retain];
    var_38 = rax;
    rdx = rax;
    rbx = [[r12->_finalAnimationLayoutAttributesDict objectForKey:rdx] retain];
    r13 = rbx;
    if (rbx == 0x0) {
            rdi = r12->_transitioningToLayout;
            if ((rdi != 0x0) && ((r12->_layoutFlags & 0x2) == 0x0)) {
                    rdx = var_30;
                    r14 = [[rdi layoutAttributesForItemAtIndexPath:rdx] retain];
                    var_3C = 0x1;
                    var_40 = 0x0;
                    var_48 = 0x1;
            }
            else {
                    rax = [r12->_collectionView cellForItemAtIndexPath:var_30];
                    rax = [rax retain];
                    var_48 = rax;
                    r14 = [[rax _layoutAttributes] retain];
                    var_40 = 0x1;
                    var_3C = 0x0;
            }
            r13 = [r14 retain];
            [rbx release];
            if (var_40 != 0x0) {
                    [r14 release];
                    [var_48 release];
            }
            if (var_3C != 0x0) {
                    [r14 release];
            }
    }
    r14 = [[r12->_collectionView _currentUpdate] retain];
    if ((r14 == 0x0) || ([r12->_deletedSectionsSet containsIndex:[var_30 section]] != 0x0)) {
            if (r12->_transitioningToLayout == 0x0) {
                    rbx = [r13 copy];
                    [r13 release];
                    [rbx setAlpha:rdx];
                    r13 = rbx;
            }
    }
    [r14 release];
    [var_38 release];
    [var_30 release];
    rdi = r13;
    rax = [rdi autorelease];
    return rax;
}

void * -[UICollectionViewLayout initialLayoutAttributesForAppearingSupplementaryElementOfKind:atIndexPath:](void * self, void * _cmd, void * arg2, void * arg3) {
    r13 = self;
    rbx = [arg2 retain];
    var_38 = rbx;
    r12 = [arg3 retain];
    rax = [_UICollectionViewItemKey collectionItemKeyForSupplementaryViewOfKind:rbx andIndexPath:r12];
    rax = [rax retain];
    var_40 = rax;
    rdx = rax;
    r15 = [[r13->_initialAnimationLayoutAttributesDict objectForKey:rdx] retain];
    rbx = r15;
    if (r15 == 0x0) {
            if ([r12 length] != 0x1) {
                    COND = [r12 section] >= [r13->_collectionView numberOfSections];
                    r13 = r13;
                    rbx = r15;
                    if (!COND) {
                            rdi = r13->_transitioningFromLayout;
                            if ((rdi != 0x0) && ((r13->_layoutFlags & 0x1) == 0x0)) {
                                    rdx = var_38;
                                    rax = [rdi layoutAttributesForSupplementaryViewOfKind:rdx atIndexPath:r12];
                                    rax = [rax retain];
                                    var_48 = 0x1;
                                    var_58 = 0x0;
                            }
                            else {
                                    rdx = var_38;
                                    rax = [r13 layoutAttributesForSupplementaryViewOfKind:rdx atIndexPath:r12];
                                    rax = [rax retain];
                                    var_58 = 0x1;
                                    var_48 = 0x0;
                            }
                            var_30 = rax;
                            rbx = [rax retain];
                            [r15 release];
                            if (var_58 != 0x0) {
                                    [var_30 release];
                            }
                            if (var_48 != 0x0) {
                                    [var_30 release];
                            }
                    }
            }
            else {
                    rdi = r13->_transitioningFromLayout;
                    if ((rdi != 0x0) && ((r13->_layoutFlags & 0x1) == 0x0)) {
                            rdx = var_38;
                            rax = [rdi layoutAttributesForSupplementaryViewOfKind:rdx atIndexPath:r12];
                            rax = [rax retain];
                            var_48 = 0x1;
                            var_58 = 0x0;
                    }
                    else {
                            rdx = var_38;
                            rax = [r13 layoutAttributesForSupplementaryViewOfKind:rdx atIndexPath:r12];
                            rax = [rax retain];
                            var_58 = 0x1;
                            var_48 = 0x0;
                    }
                    var_30 = rax;
                    rbx = [rax retain];
                    [r15 release];
                    if (var_58 != 0x0) {
                            [var_30 release];
                    }
                    if (var_48 != 0x0) {
                            [var_30 release];
                    }
            }
    }
    var_48 = rbx;
    var_50 = r13;
    rdi = r13->_collectionView;
    var_30 = [[rdi _currentUpdate] retain];
    rax = 0x7fffffffffffffff;
    r14 = r12;
    if ([r12 length] >= 0x2) {
            rax = [r14 section];
    }
    if (var_30 != 0x0) {
            if (rax != 0x7fffffffffffffff) {
                    rdx = [r14 section];
                    if ([var_50->_insertedSectionsSet containsIndex:rdx] == 0x0) {
                            rax = [r14 section];
                            rax = [var_30->_insertedSupplementaryIndexesSectionArray objectAtIndexedSubscript:rax, var_30];
                            rax = [rax retain];
                            var_58 = rax;
                            rbx = [[rax valueForKey:var_38, var_30] retain];
                            r15 = [rbx containsIndex:[r14 item], var_30];
                            [rbx release];
                            [var_58 release];
                            if (r15 != 0x0) {
                                    if (var_50->_transitioningFromLayout != 0x0) {
                                            r12 = var_48;
                                    }
                                    else {
                                            r12 = [var_48 copy];
                                            [var_48 release];
                                            [r12 setAlpha:rdx];
                                    }
                            }
                            else {
                                    r12 = var_48;
                            }
                    }
                    else {
                            if (var_50->_transitioningFromLayout != 0x0) {
                                    r12 = var_48;
                            }
                            else {
                                    r12 = [var_48 copy];
                                    [var_48 release];
                                    [r12 setAlpha:rdx];
                            }
                    }
            }
            else {
                    r12 = var_48;
            }
    }
    else {
            if (var_50->_transitioningFromLayout != 0x0) {
                    r12 = var_48;
            }
            else {
                    r12 = [var_48 copy];
                    [var_48 release];
                    [r12 setAlpha:rdx];
            }
    }
    [var_30 release];
    [var_40 release];
    [r14 release];
    [var_38 release];
    rdi = r12;
    rax = [rdi autorelease];
    return rax;
}

void * -[UICollectionViewLayout finalLayoutAttributesForDisappearingSupplementaryElementOfKind:atIndexPath:](void * self, void * _cmd, void * arg2, void * arg3) {
    r13 = self;
    rbx = [arg2 retain];
    var_30 = rbx;
    r14 = [arg3 retain];
    rax = [_UICollectionViewItemKey collectionItemKeyForSupplementaryViewOfKind:rbx andIndexPath:r14];
    rax = [rax retain];
    var_38 = rax;
    rcx = *_OBJC_IVAR_$_UICollectionViewLayout._finalAnimationLayoutAttributesDict;
    rdx = rax;
    r12 = [[*(r13 + rcx) objectForKey:rdx] retain];
    rbx = r12;
    if (r12 == 0x0) {
            rdi = r13->_transitioningToLayout;
            if ((rdi != 0x0) && ((r13->_layoutFlags & 0x2) == 0x0)) {
                    rdx = var_30;
                    rcx = [[rdi layoutAttributesForSupplementaryViewOfKind:rdx atIndexPath:r14] retain];
                    var_40 = 0x1;
                    var_48 = 0x0;
                    var_58 = 0x1;
            }
            else {
                    var_40 = 0x0;
                    rdx = var_30;
                    rax = [r13->_collectionView _visibleSupplementaryViewOfKind:rdx atIndexPath:r14 isDecorationView:0x0];
                    rax = [rax retain];
                    var_58 = rax;
                    rcx = [[rax _layoutAttributes] retain];
                    var_48 = 0x1;
            }
            var_50 = rcx;
            rbx = [rcx retain];
            [r12 release];
            if (var_48 != 0x0) {
                    [var_50 release];
                    [var_58 release];
            }
            if (var_40 != 0x0) {
                    [var_50 release];
            }
    }
    var_40 = rbx;
    rdi = r13->_collectionView;
    var_48 = r13;
    r13 = _objc_msgSend;
    r15 = [[rdi _currentUpdate] retain];
    rax = 0x7fffffffffffffff;
    if ([r14 length] >= 0x2) {
            rax = [r14 section];
    }
    if (r15 != 0x0) {
            if (rax != 0x7fffffffffffffff) {
                    rcx = var_48;
                    rdx = (r13)(r14, @selector(section));
                    if ((r13)(rcx->_deletedSectionsSet, @selector(containsIndex:), rdx) == 0x0) {
                            rax = (r13)(r14, @selector(section), rdx, rcx);
                            rax = (r13)(r15->_deletedSupplementaryIndexesSectionArray, @selector(objectAtIndexedSubscript:), rax, rcx);
                            rax = [rax retain];
                            var_58 = rax;
                            rbx = [(r13)(rax, @selector(valueForKey:), var_30, rcx) retain];
                            var_50 = (r13)(rbx, @selector(containsIndex:), (r13)(r14, @selector(item), var_30, rcx), rcx);
                            [rbx release];
                            [var_58 release];
                            if (var_50 != 0x0) {
                                    if (var_48->_transitioningToLayout != 0x0) {
                                            r12 = var_40;
                                    }
                                    else {
                                            r12 = (r13)(var_40, @selector(copy));
                                            [var_40 release];
                                            (r13)(r12, @selector(setAlpha:));
                                    }
                            }
                            else {
                                    r12 = var_40;
                            }
                    }
                    else {
                            if (var_48->_transitioningToLayout != 0x0) {
                                    r12 = var_40;
                            }
                            else {
                                    r12 = (r13)(var_40, @selector(copy));
                                    [var_40 release];
                                    (r13)(r12, @selector(setAlpha:));
                            }
                    }
            }
            else {
                    r12 = var_40;
            }
    }
    else {
            if (var_48->_transitioningToLayout != 0x0) {
                    r12 = var_40;
            }
            else {
                    r12 = (r13)(var_40, @selector(copy));
                    [var_40 release];
                    (r13)(r12, @selector(setAlpha:));
            }
    }
    [r15 release];
    [var_38 release];
    [r14 release];
    [var_30 release];
    rdi = r12;
    rax = [rdi autorelease];
    return rax;
}

void * -[UICollectionViewLayout initialLayoutAttributesForAppearingDecorationElementOfKind:atIndexPath:](void * self, void * _cmd, void * arg2, void * arg3) {
    r13 = self;
    rbx = [arg2 retain];
    var_38 = rbx;
    r12 = [arg3 retain];
    rax = [_UICollectionViewItemKey collectionItemKeyForDecorationViewOfKind:rbx andIndexPath:r12];
    rax = [rax retain];
    var_40 = rax;
    rdx = rax;
    r15 = [[r13->_initialAnimationLayoutAttributesDict objectForKey:rdx] retain];
    rbx = r15;
    if (r15 == 0x0) {
            if ([r12 length] != 0x1) {
                    COND = [r12 section] >= [r13->_collectionView numberOfSections];
                    r13 = r13;
                    rbx = r15;
                    if (!COND) {
                            rdi = r13->_transitioningFromLayout;
                            if ((rdi != 0x0) && ((r13->_layoutFlags & 0x1) == 0x0)) {
                                    rdx = var_38;
                                    rax = [rdi layoutAttributesForDecorationViewOfKind:rdx atIndexPath:r12];
                                    rax = [rax retain];
                                    var_48 = 0x1;
                                    var_58 = 0x0;
                            }
                            else {
                                    rdx = var_38;
                                    rax = [r13 layoutAttributesForDecorationViewOfKind:rdx atIndexPath:r12];
                                    rax = [rax retain];
                                    var_58 = 0x1;
                                    var_48 = 0x0;
                            }
                            var_30 = rax;
                            rbx = [rax retain];
                            [r15 release];
                            if (var_58 != 0x0) {
                                    [var_30 release];
                            }
                            if (var_48 != 0x0) {
                                    [var_30 release];
                            }
                    }
            }
            else {
                    rdi = r13->_transitioningFromLayout;
                    if ((rdi != 0x0) && ((r13->_layoutFlags & 0x1) == 0x0)) {
                            rdx = var_38;
                            rax = [rdi layoutAttributesForDecorationViewOfKind:rdx atIndexPath:r12];
                            rax = [rax retain];
                            var_48 = 0x1;
                            var_58 = 0x0;
                    }
                    else {
                            rdx = var_38;
                            rax = [r13 layoutAttributesForDecorationViewOfKind:rdx atIndexPath:r12];
                            rax = [rax retain];
                            var_58 = 0x1;
                            var_48 = 0x0;
                    }
                    var_30 = rax;
                    rbx = [rax retain];
                    [r15 release];
                    if (var_58 != 0x0) {
                            [var_30 release];
                    }
                    if (var_48 != 0x0) {
                            [var_30 release];
                    }
            }
    }
    var_48 = rbx;
    var_50 = r13;
    rdi = r13->_collectionView;
    var_30 = [[rdi _currentUpdate] retain];
    rax = 0x7fffffffffffffff;
    r14 = r12;
    if ([r12 length] >= 0x2) {
            rax = [r14 section];
    }
    if (var_30 != 0x0) {
            if (rax != 0x7fffffffffffffff) {
                    rdx = [r14 section];
                    if ([var_50->_insertedSectionsSet containsIndex:rdx] == 0x0) {
                            rax = [r14 section];
                            rax = [var_30->_insertedSupplementaryIndexesSectionArray objectAtIndexedSubscript:rax, var_30];
                            rax = [rax retain];
                            var_58 = rax;
                            rbx = [[rax valueForKey:var_38, var_30] retain];
                            r15 = [rbx containsIndex:[r14 item], var_30];
                            [rbx release];
                            [var_58 release];
                            if (r15 != 0x0) {
                                    if (var_50->_transitioningFromLayout != 0x0) {
                                            r12 = var_48;
                                    }
                                    else {
                                            r12 = [var_48 copy];
                                            [var_48 release];
                                            [r12 setAlpha:rdx];
                                    }
                            }
                            else {
                                    r12 = var_48;
                            }
                    }
                    else {
                            if (var_50->_transitioningFromLayout != 0x0) {
                                    r12 = var_48;
                            }
                            else {
                                    r12 = [var_48 copy];
                                    [var_48 release];
                                    [r12 setAlpha:rdx];
                            }
                    }
            }
            else {
                    r12 = var_48;
            }
    }
    else {
            if (var_50->_transitioningFromLayout != 0x0) {
                    r12 = var_48;
            }
            else {
                    r12 = [var_48 copy];
                    [var_48 release];
                    [r12 setAlpha:rdx];
            }
    }
    [var_30 release];
    [var_40 release];
    [r14 release];
    [var_38 release];
    rdi = r12;
    rax = [rdi autorelease];
    return rax;
}

void * -[UICollectionViewLayout finalLayoutAttributesForDisappearingDecorationElementOfKind:atIndexPath:](void * self, void * _cmd, void * arg2, void * arg3) {
    r13 = self;
    rbx = [arg2 retain];
    var_30 = rbx;
    r14 = [arg3 retain];
    rax = [_UICollectionViewItemKey collectionItemKeyForDecorationViewOfKind:rbx andIndexPath:r14];
    rax = [rax retain];
    var_38 = rax;
    rcx = *_OBJC_IVAR_$_UICollectionViewLayout._finalAnimationLayoutAttributesDict;
    rdx = rax;
    r12 = [[*(r13 + rcx) objectForKey:rdx] retain];
    rbx = r12;
    if (r12 == 0x0) {
            rdi = r13->_transitioningToLayout;
            if ((rdi != 0x0) && ((r13->_layoutFlags & 0x2) == 0x0)) {
                    rdx = var_30;
                    rax = [rdi layoutAttributesForDecorationViewOfKind:rdx atIndexPath:r14];
                    rax = [rax retain];
                    rcx = 0x1;
                    var_40 = rcx;
                    var_48 = 0x0;
                    var_58 = rcx;
            }
            else {
                    rdx = var_30;
                    rax = [r13->_collectionView _visibleSupplementaryViewOfKind:rdx atIndexPath:r14 isDecorationView:0x1];
                    rax = [rax retain];
                    var_58 = rax;
                    rax = [rax _layoutAttributes];
                    rax = [rax retain];
                    rcx = 0x1;
                    var_48 = rcx;
                    var_40 = 0x0;
            }
            var_50 = rax;
            rbx = [rax retain];
            [r12 release];
            if (var_48 != 0x0) {
                    [var_50 release];
                    [var_58 release];
            }
            if (var_40 != 0x0) {
                    [var_50 release];
            }
    }
    var_40 = rbx;
    rdi = r13->_collectionView;
    var_48 = r13;
    r13 = _objc_msgSend;
    r15 = [[rdi _currentUpdate] retain];
    rax = 0x7fffffffffffffff;
    if ([r14 length] >= 0x2) {
            rax = [r14 section];
    }
    if (r15 != 0x0) {
            if (rax != 0x7fffffffffffffff) {
                    rcx = var_48;
                    rdx = (r13)(r14, @selector(section));
                    if ((r13)(rcx->_deletedSectionsSet, @selector(containsIndex:), rdx) == 0x0) {
                            rax = (r13)(r14, @selector(section), rdx, rcx);
                            rax = (r13)(r15->_deletedSupplementaryIndexesSectionArray, @selector(objectAtIndexedSubscript:), rax, rcx);
                            rax = [rax retain];
                            var_58 = rax;
                            rbx = [(r13)(rax, @selector(valueForKey:), var_30, rcx) retain];
                            var_50 = (r13)(rbx, @selector(containsIndex:), (r13)(r14, @selector(item), var_30, rcx), rcx);
                            [rbx release];
                            [var_58 release];
                            if (var_50 != 0x0) {
                                    if (var_48->_transitioningToLayout != 0x0) {
                                            r12 = var_40;
                                    }
                                    else {
                                            r12 = (r13)(var_40, @selector(copy));
                                            [var_40 release];
                                            (r13)(r12, @selector(setAlpha:));
                                    }
                            }
                            else {
                                    r12 = var_40;
                            }
                    }
                    else {
                            if (var_48->_transitioningToLayout != 0x0) {
                                    r12 = var_40;
                            }
                            else {
                                    r12 = (r13)(var_40, @selector(copy));
                                    [var_40 release];
                                    (r13)(r12, @selector(setAlpha:));
                            }
                    }
            }
            else {
                    r12 = var_40;
            }
    }
    else {
            if (var_48->_transitioningToLayout != 0x0) {
                    r12 = var_40;
            }
            else {
                    r12 = (r13)(var_40, @selector(copy));
                    [var_40 release];
                    (r13)(r12, @selector(setAlpha:));
            }
    }
    [r15 release];
    [var_38 release];
    [r14 release];
    [var_30 release];
    rdi = r12;
    rax = [rdi autorelease];
    return rax;
}

void * -[UICollectionViewLayout _indexPathsToDeleteForSupplementaryViewOfKind:](void * self, void * _cmd, void * arg2) {
    rbx = [[self->_deletedSupplementaryIndexPathsDict objectForKeyedSubscript:arg2] retain];
    if (rbx != 0x0) {
            rbx = [rbx retain];
            r14 = rbx;
    }
    else {
            r14 = [[NSArray array] retain];
    }
    [rbx release];
    [r14 autorelease];
    rax = r14;
    return rax;
}

void * -[UICollectionViewLayout _indexPathsToDeleteForDecorationViewOfKind:](void * self, void * _cmd, void * arg2) {
    rbx = [[self->_deletedDecorationIndexPathsDict objectForKeyedSubscript:arg2] retain];
    if (rbx != 0x0) {
            rbx = [rbx retain];
            r14 = rbx;
    }
    else {
            r14 = [[NSArray array] retain];
    }
    [rbx release];
    [r14 autorelease];
    rax = r14;
    return rax;
}

void * -[UICollectionViewLayout _indexPathsToInsertForSupplementaryViewOfKind:](void * self, void * _cmd, void * arg2) {
    rbx = [[self->_insertedSupplementaryIndexPathsDict objectForKeyedSubscript:arg2] retain];
    if (rbx != 0x0) {
            rbx = [rbx retain];
            r14 = rbx;
    }
    else {
            r14 = [[NSArray array] retain];
    }
    [rbx release];
    [r14 autorelease];
    rax = r14;
    return rax;
}

void * -[UICollectionViewLayout _indexPathsToInsertForDecorationViewOfKind:](void * self, void * _cmd, void * arg2) {
    rbx = [[self->_insertedDecorationIndexPathsDict objectForKeyedSubscript:arg2] retain];
    if (rbx != 0x0) {
            rbx = [rbx retain];
            r14 = rbx;
    }
    else {
            r14 = [[NSArray array] retain];
    }
    [rbx release];
    [r14 autorelease];
    rax = r14;
    return rax;
}

void * -[UICollectionViewLayout indexPathsToDeleteForSupplementaryViewOfKind:](void * self, void * _cmd, void * arg2) {
    rax = [self _indexPathsToDeleteForSupplementaryViewOfKind:arg2];
    return rax;
}

void * -[UICollectionViewLayout indexPathsToDeleteForDecorationViewOfKind:](void * self, void * _cmd, void * arg2) {
    rax = [self _indexPathsToDeleteForDecorationViewOfKind:arg2];
    return rax;
}

void * -[UICollectionViewLayout indexPathsToInsertForSupplementaryViewOfKind:](void * self, void * _cmd, void * arg2) {
    rax = [self _indexPathsToInsertForSupplementaryViewOfKind:arg2];
    return rax;
}

void * -[UICollectionViewLayout indexPathsToInsertForDecorationViewOfKind:](void * self, void * _cmd, void * arg2) {
    rax = [self _indexPathsToInsertForDecorationViewOfKind:arg2];
    return rax;
}

void -[UICollectionViewLayout _finalizeCollectionViewItemAnimations](void * self, void * _cmd) {
    [self->_initialAnimationLayoutAttributesDict removeAllObjects];
    [self->_finalAnimationLayoutAttributesDict removeAllObjects];
    return;
}

void * -[UICollectionViewLayout _decorationViewForLayoutAttributes:](void * self, void * _cmd, void * arg2) {
    var_98 = _cmd;
    r14 = self;
    r12 = [arg2 retain];
    rbx = [[r12 _elementKind] retain];
    rdx = rbx;
    r13 = [[r14->_decorationViewNibDict valueForKey:rdx] retain];
    if (r13 != 0x0) {
            var_90 = r12;
            var_A0 = r14;
            var_88 = rbx;
            rbx = [[r14->_decorationViewExternalObjectsTables valueForKey:rbx] retain];
            rax = 0x0;
            if (rbx != 0x0) {
                    rax = [NSDictionary dictionaryWithObject:rbx forKey:@"UINibExternalObjects"];
                    rax = [rax retain];
            }
            var_B8 = rax;
            var_B0 = rbx;
            r12 = 0x0;
            var_A8 = r13;
            rcx = rax;
            r15 = [[r13 instantiateWithOwner:0x0 options:rcx] retain];
            if ([r15 count] == 0x1) {
                    r12 = 0x0;
                    rbx = [[r15 objectAtIndex:0x0] retain];
                    if (rbx != 0x0) {
                            rdx = [UICollectionReusableView class];
                            r12 = rbx;
                            if ([rbx isKindOfClass:rdx] == 0x0) {
                                    var_C0 = r12;
                                    rbx = [[NSString stringWithUTF8String:"/BuildRoot/Library/Caches/com.apple.xbs/Sources/UIKit_Sim/UIKit-3600.6.21/UICollectionViewLayout.m", rcx] retain];
                                    rdi = @"<Unknown File>";
                                    if (rbx != 0x0) {
                                            rdi = rbx;
                                    }
                                    r13 = [rdi retain];
                                    r12 = r15;
                                    [rbx release];
                                    rbx = [[NSAssertionHandler currentHandler] retain];
                                    rdx = var_98;
                                    rcx = var_A0;
                                    r8 = r13;
                                    [rbx handleFailureInMethod:rdx object:rcx file:r8 lineNumber:0x500 description:@"invalid nib registered for identifier (%@) - nib must contain exactly one top level object which must be a UICollectionReusableView instance", var_88];
                                    [r13 release];
                                    [rbx release];
                                    r15 = r12;
                                    r12 = var_C0;
                            }
                    }
                    else {
                            var_C0 = r12;
                            rbx = [[NSString stringWithUTF8String:"/BuildRoot/Library/Caches/com.apple.xbs/Sources/UIKit_Sim/UIKit-3600.6.21/UICollectionViewLayout.m", rcx] retain];
                            rdi = @"<Unknown File>";
                            if (rbx != 0x0) {
                                    rdi = rbx;
                            }
                            r13 = [rdi retain];
                            r12 = r15;
                            [rbx release];
                            rbx = [[NSAssertionHandler currentHandler] retain];
                            rdx = var_98;
                            rcx = var_A0;
                            r8 = r13;
                            [rbx handleFailureInMethod:rdx object:rcx file:r8 lineNumber:0x500 description:@"invalid nib registered for identifier (%@) - nib must contain exactly one top level object which must be a UICollectionReusableView instance", var_88];
                            [r13 release];
                            [rbx release];
                            r15 = r12;
                            r12 = var_C0;
                    }
            }
            else {
                    var_C0 = r12;
                    rbx = [[NSString stringWithUTF8String:"/BuildRoot/Library/Caches/com.apple.xbs/Sources/UIKit_Sim/UIKit-3600.6.21/UICollectionViewLayout.m", rcx] retain];
                    rdi = @"<Unknown File>";
                    if (rbx != 0x0) {
                            rdi = rbx;
                    }
                    r13 = [rdi retain];
                    r12 = r15;
                    [rbx release];
                    rbx = [[NSAssertionHandler currentHandler] retain];
                    rdx = var_98;
                    rcx = var_A0;
                    r8 = r13;
                    [rbx handleFailureInMethod:rdx object:rcx file:r8 lineNumber:0x500 description:@"invalid nib registered for identifier (%@) - nib must contain exactly one top level object which must be a UICollectionReusableView instance", var_88];
                    [r13 release];
                    [rbx release];
                    r15 = r12;
                    r12 = var_C0;
            }
            r14 = _objc_msgSend;
            r13 = [[r12 reuseIdentifier] retain];
            if (([r13 length] != 0x0) && ([r13 isEqualToString:var_88] == 0x0)) {
                    var_C0 = r15;
                    r15 = [[NSString stringWithUTF8String:"/BuildRoot/Library/Caches/com.apple.xbs/Sources/UIKit_Sim/UIKit-3600.6.21/UICollectionViewLayout.m"] retain];
                    rdi = @"<Unknown File>";
                    if (r15 != 0x0) {
                            rdi = r15;
                    }
                    r14 = _objc_msgSend;
                    var_C8 = [rdi retain];
                    rdi = r15;
                    r15 = var_C0;
                    [rdi release];
                    rcx = [[NSAssertionHandler currentHandler] retain];
                    var_D0 = rcx;
                    rdi = rcx;
                    rcx = var_A0;
                    r8 = var_C8;
                    [rdi handleFailureInMethod:var_98 object:rcx file:r8 lineNumber:0x502 description:@"view reuse identifier in nib (%@) does not match the element kind used to register the nib (%@)", r13, var_88];
                    [var_C8 release];
                    [var_D0 release];
            }
            [r13 release];
            [r15 release];
            [var_B8 release];
            [var_B0 release];
    }
    else {
            var_A0 = r14;
            rax = [r14->_decorationViewClassDict valueForKey:rbx];
            rax = objc_unsafeClaimAutoreleasedReturnValue(rax);
            rax = [rax alloc];
            r14 = _objc_msgSend;
            if (r12 != 0x0) {
                    var_A8 = r13;
                    var_88 = rbx;
                    rbx = rax;
                    var_90 = r12;
                    [var_50 frame];
                    rax = rbx;
            }
            else {
                    var_90 = r12;
                    var_A8 = r13;
                    var_88 = rbx;
                    var_40 = intrinsic_movaps(var_40, 0x0);
                    var_50 = intrinsic_movaps(var_50, 0x0);
            }
            rcx = var_48;
            r12 = [rax initWithFrame:rdx, rcx];
    }
    if (r12 == 0x0) {
            rbx = [(r14)(@class(NSString), @selector(stringWithUTF8String:), "/BuildRoot/Library/Caches/com.apple.xbs/Sources/UIKit_Sim/UIKit-3600.6.21/UICollectionViewLayout.m") retain];
            rdi = @"<Unknown File>";
            if (rbx != 0x0) {
                    rdi = rbx;
            }
            var_B0 = [rdi retain];
            [rbx release];
            r15 = [(r14)(@class(NSAssertionHandler), @selector(currentHandler), "/BuildRoot/Library/Caches/com.apple.xbs/Sources/UIKit_Sim/UIKit-3600.6.21/UICollectionViewLayout.m") retain];
            r13 = [(r14)(var_90, @selector(_elementKind), "/BuildRoot/Library/Caches/com.apple.xbs/Sources/UIKit_Sim/UIKit-3600.6.21/UICollectionViewLayout.m") retain];
            rcx = var_A0;
            r8 = var_B0;
            (r14)(r15, @selector(handleFailureInMethod:object:file:lineNumber:description:), var_98, rcx, r8, 0x508, @"could not dequeue a decoration view of kind: %@ - must register as a class or nib or connect a prototype in a storyboard", r13);
            [var_B0 release];
            [r13 release];
            [r15 release];
    }
    (r14)(r12, @selector(_setReuseIdentifier:), var_88, rcx, r8);
    rbx = [r12 retain];
    var_60 = rbx;
    r15 = [var_90 retain];
    (r14)(@class(UIView), @selector(_performWithoutAnimation:), __NSConcreteStackBlock, rcx, r8);
    (r14)(rbx, @selector(setAutoresizingMask:), 0x0, rcx, r8);
    (r14)(rbx, @selector(setTranslatesAutoresizingMaskIntoConstraints:), 0x1, rcx, r8);
    (r14)(rbx, @selector(_setHostsLayoutEngine:), 0x1, rcx, r8);
    (r14)(rbx, @selector(_markAsDequeued), 0x1, rcx, r8);
    r14 = objc_retainAutoreleaseReturnValue(rbx);
    [var_90 release];
    [var_60 release];
    [r14 release];
    [r15 release];
    [var_A8 release];
    [var_88 release];
    rax = r14;
    return rax;
}

int ___61-[UICollectionViewLayout _decorationViewForLayoutAttributes:]_block_invoke(int arg0) {
    rax = [*(arg0 + 0x20) _setLayoutAttributes:*(arg0 + 0x28)];
    return rax;
}

void -[UICollectionViewLayout _setExternalObjectTable:forNibLoadingOfDecorationViewOfKind:](void * self, void * _cmd, void * arg2, void * arg3) {
    r12 = self;
    r14 = [arg2 retain];
    r15 = [arg3 retain];
    rdi = r12->_decorationViewExternalObjectsTables;
    if (rdi == 0x0) {
            r12->_decorationViewExternalObjectsTables = [[NSMutableDictionary alloc] init];
            [r12->_decorationViewExternalObjectsTables release];
            rdi = r12->_decorationViewExternalObjectsTables;
    }
    [rdi setObject:r14 forKey:r15];
    [r15 release];
    rdi = r14;
    [rdi release];
    return;
}

bool -[UICollectionViewLayout _supportsAdvancedTransitionAnimations](void * self, void * _cmd) {
    if (*(int32_t *)__UIApplicationLinkedOnVersion != 0x0) {
            rax = *(int32_t *)__UIApplicationLinkedOnVersion;
            rax = rax > 0x6ffff ? 0x1 : 0x0;
    }
    else {
            stack[2047] = rbp;
            rax = __UIApplicationLinkedOnOrAfter(0x70000);
    }
    return rax;
}

void -[UICollectionViewLayout _invalidateLayoutUsingContext:](void * self, void * _cmd, void * arg2) {
    rax = [arg2 retain];
    self->_invalidationContext = rax;
    r15 = [rax retain];
    [self->_invalidationContext release];
    [self invalidateLayout];
    self->_invalidationContext = 0x0;
    [self->_invalidationContext release];
    rdi = r15;
    [rdi release];
    return;
}

bool -[UICollectionViewLayout canBeEdited](void * self, void * _cmd) {
    return 0x0;
}

bool -[UICollectionViewLayout isEditing](void * self, void * _cmd) {
    return 0x0;
}

void -[UICollectionViewLayout setEditing:](void * self, void * _cmd, bool arg2) {
    return;
}

void -[UICollectionViewLayout _setFrame:](void * self, void * _cmd, struct CGRect arg2) {
    *(self + *_OBJC_IVAR_$_UICollectionViewLayout._frame + 0x18) = arg_18;
    *(self + *_OBJC_IVAR_$_UICollectionViewLayout._frame + 0x10) = arg_10;
    *(self + *_OBJC_IVAR_$_UICollectionViewLayout._frame + 0x8) = arg_8;
    self->_frame = arg_0;
    return;
}

struct CGRect -[UICollectionViewLayout _frame](void * self, void * _cmd) {
    *(self + 0x18) = *(_cmd + *_OBJC_IVAR_$_UICollectionViewLayout._frame + 0x18);
    *(self + 0x10) = *(_cmd + *_OBJC_IVAR_$_UICollectionViewLayout._frame + 0x10);
    *(self + 0x8) = *(_cmd + *_OBJC_IVAR_$_UICollectionViewLayout._frame + 0x8);
    *self = _cmd->_frame;
    rax = self;
    return rax;
}

struct CGRect -[UICollectionViewLayout _bounds](void * self, void * _cmd) {
    r15 = _cmd;
    r14 = self;
    rbx = objc_loadWeakRetained(*_OBJC_IVAR_$_UICollectionViewLayout._compositionLayout + r15);
    [rbx release];
    if (rbx != 0x0) {
            *(r14 + 0x18) = *(r15 + *_OBJC_IVAR_$_UICollectionViewLayout._frame + 0x18);
            *(r14 + 0x10) = *(r15 + *_OBJC_IVAR_$_UICollectionViewLayout._frame + 0x10);
            *(r14 + 0x8) = *_CGRectApplyAffineTransform;
            *r14 = *_CGPointZero;
    }
    else {
            rsi = r15->_collectionView;
            if (rsi != 0x0) {
                    [r14 bounds];
            }
            else {
                    *(r14 + 0x18) = 0x0;
                    *(r14 + 0x10) = 0x0;
                    *(r14 + 0x8) = 0x0;
                    *r14 = 0x0;
            }
    }
    rax = r14;
    return rax;
}

struct CGRect -[UICollectionViewLayout _dynamicReferenceBounds](void * self, void * _cmd) {
    [_cmd collectionViewContentSize];
    *(self + 0x8) = 0x0;
    *self = 0x0;
    *(self + 0x10) = intrinsic_movsd(*(self + 0x10), xmm0);
    *(self + 0x18) = intrinsic_movsd(*(self + 0x18), xmm1);
    rax = self;
    return rax;
}

void -[UICollectionViewLayout _setSections:](void * self, void * _cmd, void * arg2) {
    rdx = arg2;
    rbx = self;
    if (rbx->_sections != rdx) {
            rax = [rdx copy];
            rdi = rbx->_sections;
            rbx->_sections = rax;
            [rdi release];
    }
    return;
}

void * -[UICollectionViewLayout _sections](void * self, void * _cmd) {
    rax = objc_retainAutorelease(self->_sections);
    rax = objc_retainAutoreleaseReturnValue(rax);
    return rax;
}

void -[UICollectionViewLayout _setItems:](void * self, void * _cmd, void * arg2) {
    rdx = arg2;
    rbx = self;
    if (rbx->_items != rdx) {
            rax = [rdx copy];
            rdi = rbx->_items;
            rbx->_items = rax;
            [rdi release];
    }
    return;
}

void * -[UICollectionViewLayout _items](void * self, void * _cmd) {
    rax = objc_retainAutorelease(self->_items);
    rax = objc_retainAutoreleaseReturnValue(rax);
    return rax;
}

void -[UICollectionViewLayout _setElementKinds:](void * self, void * _cmd, void * arg2) {
    rdx = arg2;
    rbx = self;
    if (rbx->_elementKinds != rdx) {
            rax = [rdx copy];
            rdi = rbx->_elementKinds;
            rbx->_elementKinds = rax;
            [rdi release];
    }
    return;
}

void * -[UICollectionViewLayout _elementKinds](void * self, void * _cmd) {
    rax = objc_retainAutorelease(self->_elementKinds);
    rax = objc_retainAutoreleaseReturnValue(rax);
    return rax;
}

void -[UICollectionViewLayout _setCompositionLayout:](void * self, void * _cmd, struct _UICollectionViewCompositionLayout * arg2) {
    objc_storeWeak(self + *_OBJC_IVAR_$_UICollectionViewLayout._compositionLayout, arg2);
    return;
}

struct _UICollectionViewCompositionLayout * -[UICollectionViewLayout _compositionLayout](void * self, void * _cmd) {
    rax = objc_loadWeakRetained(self + *_OBJC_IVAR_$_UICollectionViewLayout._compositionLayout);
    rax = [rax autorelease];
    return rax;
}

void -[UICollectionViewLayout _setSiblingLayout:](void * self, void * _cmd, void * arg2) {
    objc_storeWeak(self + *_OBJC_IVAR_$_UICollectionViewLayout._siblingLayout, arg2);
    return;
}

void * -[UICollectionViewLayout _siblingLayout](void * self, void * _cmd) {
    rax = objc_loadWeakRetained(self + *_OBJC_IVAR_$_UICollectionViewLayout._siblingLayout);
    rax = [rax autorelease];
    return rax;
}

void -[UICollectionViewLayout _setLayoutOffset:](void * self, void * _cmd, struct CGPoint arg2) {
    self->_layoutOffset = intrinsic_movsd(self->_layoutOffset, xmm0, arg2);
    *(self + *_OBJC_IVAR_$_UICollectionViewLayout._layoutOffset + 0x8) = intrinsic_movsd(*(self + *_OBJC_IVAR_$_UICollectionViewLayout._layoutOffset + 0x8), xmm1);
    return;
}

struct CGPoint -[UICollectionViewLayout _layoutOffset](void * self, void * _cmd) {
    intrinsic_movsd(xmm0, self->_layoutOffset);
    intrinsic_movsd(xmm1, *(self + *_OBJC_IVAR_$_UICollectionViewLayout._layoutOffset + 0x8));
    return *_OBJC_IVAR_$_UICollectionViewLayout._layoutOffset;
}

void -[UICollectionViewLayout _setLayoutOffsetEdges:](void * self, void * _cmd, NSUInteger arg2) {
    self->_layoutOffsetEdges = arg2;
    return;
}

NSUInteger -[UICollectionViewLayout _layoutOffsetEdges](void * self, void * _cmd) {
    rax = self->_layoutOffsetEdges;
    return rax;
}

struct CGPoint -[UICollectionViewLayout _offsetInTopParentLayout:](void * self, void * _cmd, struct _UICollectionViewCompositionLayout * * arg2) {
    r14 = arg2;
    r15 = self;
    xmm0 = intrinsic_movupd(xmm0, r15->_frame, arg2);
    var_60 = intrinsic_movapd(var_60, xmm0);
    r12 = [[self _compositionLayout] retain];
    if (r12 != 0x0) {
            [var_50 _frame];
            xmm0 = intrinsic_movapd(xmm0, var_60);
            xmm0 = intrinsic_addpd(xmm0, var_50);
            var_60 = intrinsic_movapd(var_60, xmm0);
            rax = [r12 _compositionLayout];
            rax = [rax retain];
            if (rax != 0x0) {
                    var_68 = r14;
                    r14 = var_50;
                    do {
                            rbx = rax;
                            [r12 release];
                            [r14 _frame];
                            xmm0 = intrinsic_movapd(xmm0, var_60);
                            xmm0 = intrinsic_addpd(xmm0, var_50);
                            var_60 = intrinsic_movapd(var_60, xmm0);
                            rax = [rbx _compositionLayout];
                            rax = [rax retain];
                            r12 = rbx;
                    } while (rax != 0x0);
            }
            else {
                    var_68 = r14;
                    rbx = r12;
            }
            [rax release];
            r14 = var_68;
    }
    else {
            rbx = 0x0;
            if ([r15 isKindOfClass:[_UICollectionViewCompositionLayout class]] != 0x0) {
                    rbx = [r15 retain];
                    [r12 release];
            }
    }
    rax = objc_retainAutorelease(rbx);
    *r14 = rax;
    rax = [rax release];
    xmm1 = intrinsic_movapd(xmm1, intrinsic_movapd(xmm0, var_60));
    intrinsic_shufpd(xmm1, 0x1);
    return rax;
}

struct CGRect -[UICollectionViewLayout convertRect:toLayout:](void * self, void * _cmd, struct CGRect arg2, void * arg3) {
    rcx = arg3;
    var_70 = arg2;
    var_78 = _cmd;
    var_40 = self;
    var_68 = [rcx retain];
    [_cmd _offsetInTopParentLayout:0x0];
    var_48 = intrinsic_movsd(var_48, xmm0);
    var_50 = intrinsic_movsd(var_50, xmm1);
    rbx = [0x0 retain];
    rdx = 0x0;
    rsi = @selector(_offsetInTopParentLayout:);
    _objc_msgSend(rcx, rsi);
    r13 = rbx;
    var_60 = intrinsic_movsd(var_60, xmm0);
    var_58 = intrinsic_movsd(var_58, xmm1);
    [var_68 release];
    if ((r13 == 0x0) || (r13 != 0x0)) {
            var_68 = [0x0 retain];
            rbx = [[NSString stringWithUTF8String:"/BuildRoot/Library/Caches/com.apple.xbs/Sources/UIKit_Sim/UIKit-3600.6.21/UICollectionViewLayout.m", rcx] retain];
            rdi = @"<Unknown File>";
            if (rbx != 0x0) {
                    rdi = rbx;
            }
            r15 = [rdi retain];
            [rbx release];
            rbx = [[NSAssertionHandler currentHandler] retain];
            rsi = @selector(handleFailureInMethod:object:file:lineNumber:description:);
            rdx = var_70;
            _objc_msgSend(rbx, rsi);
            [r15 release];
            [var_68 release];
            [rbx release];
    }
    xmm0 = intrinsic_movsd(xmm0, var_48);
    intrinsic_subsd(xmm0, var_60);
    xmm1 = intrinsic_movsd(xmm1, var_50);
    intrinsic_subsd(xmm1, var_58);
    CGRectOffset(var_40, rsi, rdx);
    [r13 release];
    rax = var_40;
    return rax;
}

struct CGRect -[UICollectionViewLayout convertRect:fromLayout:](void * self, void * _cmd, struct CGRect arg2, void * arg3) {
    rcx = arg3;
    var_70 = arg2;
    var_78 = _cmd;
    var_40 = self;
    var_68 = [rcx retain];
    [_cmd _offsetInTopParentLayout:0x0];
    var_50 = intrinsic_movsd(var_50, xmm0);
    var_48 = intrinsic_movsd(var_48, xmm1);
    rbx = [0x0 retain];
    rdx = 0x0;
    rsi = @selector(_offsetInTopParentLayout:);
    _objc_msgSend(rcx, rsi);
    r13 = rbx;
    var_58 = intrinsic_movsd(var_58, xmm0);
    var_60 = intrinsic_movsd(var_60, xmm1);
    [var_68 release];
    if ((r13 == 0x0) || (r13 != 0x0)) {
            var_68 = [0x0 retain];
            rbx = [[NSString stringWithUTF8String:"/BuildRoot/Library/Caches/com.apple.xbs/Sources/UIKit_Sim/UIKit-3600.6.21/UICollectionViewLayout.m", rcx] retain];
            rdi = @"<Unknown File>";
            if (rbx != 0x0) {
                    rdi = rbx;
            }
            r15 = [rdi retain];
            [rbx release];
            rbx = [[NSAssertionHandler currentHandler] retain];
            rsi = @selector(handleFailureInMethod:object:file:lineNumber:description:);
            rdx = var_70;
            _objc_msgSend(rbx, rsi);
            [r15 release];
            [var_68 release];
            [rbx release];
    }
    xmm0 = intrinsic_movsd(xmm0, var_58);
    intrinsic_subsd(xmm0, var_50);
    xmm1 = intrinsic_movsd(xmm1, var_60);
    intrinsic_subsd(xmm1, var_48);
    CGRectOffset(var_40, rsi, rdx);
    [r13 release];
    rax = var_40;
    return rax;
}

void -[UICollectionViewLayout _setPrepared:](void * self, void * _cmd, bool arg2) {
    self->_layoutFlags = self->_layoutFlags & 0xfb | arg2 << 0x2;
    return;
}

bool -[UICollectionViewLayout _isPrepared](void * self, void * _cmd) {
    rax = (self->_layoutFlags & 0x4) >> 0x2;
    return rax;
}

bool -[UICollectionViewLayout _estimatesSizes](void * self, void * _cmd) {
    return 0x0;
}

bool -[UICollectionViewLayout _cellsShouldConferWithAutolayoutEngineForSizingInfo](void * self, void * _cmd) {
    return 0x1;
}

void * -[UICollectionViewLayout _reorderingTargetItemIndexPathForPosition:withPreviousIndexPath:](void * self, void * _cmd, struct CGPoint arg2, void * arg3) {
    rax = [self targetIndexPathForInteractivelyMovingItem:arg2 withPosition:arg3];
    return rax;
}

void * -[UICollectionViewLayout _layoutAttributesForReorderedItemAtIndexPath:withTargetPosition:](void * self, void * _cmd, void * arg2, struct CGPoint arg3) {
    rax = [self layoutAttributesForInteractivelyMovingItemAtIndexPath:arg2 withTargetPosition:arg3];
    return rax;
}

void * -[UICollectionViewLayout _invalidationContextForReorderingTargetPosition:targetIndexPaths:withPreviousPosition:previousIndexPaths:](void * self, void * _cmd, struct CGPoint arg2, void * arg3, struct CGPoint arg4, void * arg5) {
    var_20 = intrinsic_movsd(var_20, xmm3, arg2, arg3, arg4, arg5);
    var_28 = intrinsic_movsd(var_28, xmm2);
    var_30 = intrinsic_movsd(var_30, xmm1);
    var_38 = intrinsic_movsd(var_38, xmm0);
    rbx = [arg2 retain];
    intrinsic_movsd(xmm0, var_38, rbx);
    intrinsic_movsd(xmm1, var_30);
    intrinsic_movsd(xmm2, var_28);
    intrinsic_movsd(xmm3, var_20);
    r14 = [self invalidationContextForInteractivelyMovingItems:rdx withTargetPosition:arg3 previousIndexPaths:r8 previousPosition:r9];
    [rbx release];
    rax = [r14 retain];
    rax = [rax autorelease];
    return rax;
}

void * -[UICollectionViewLayout _invalidationContextForEndingReorderingItemToFinalIndexPaths:previousIndexPaths:reorderingCancelled:](void * self, void * _cmd, void * arg2, void * arg3, bool arg4) {
    rbx = [arg2 retain];
    r14 = [self invalidationContextForEndingInteractiveMovementOfItemsToFinalIndexPaths:rbx previousIndexPaths:arg3 movementCancelled:arg4 & 0xff];
    [rbx release];
    rax = [r14 retain];
    rax = [rax autorelease];
    return rax;
}

void * -[UICollectionViewLayout targetIndexPathForInteractivelyMovingItem:withPosition:](void * self, void * _cmd, void * arg2, struct CGPoint arg3) {
    var_118 = intrinsic_movsd(var_118, xmm1, arg2, arg3);
    var_120 = intrinsic_movsd(var_120, xmm0);
    var_30 = *___stack_chk_guard;
    r12 = [arg2 retain];
    xmm0 = intrinsic_movsd(xmm0, var_120);
    var_D0 = intrinsic_movsd(var_D0, xmm0);
    xmm0 = intrinsic_movsd(xmm0, var_118);
    var_C8 = intrinsic_movsd(var_C8, xmm0);
    intrinsic_movups(var_C0, intrinsic_movaps(xmm0, *(int128_t *)0xc4f920));
    rbx = [[self layoutAttributesForElementsInRect:rdx, rcx] retain];
    var_138 = rbx;
    intrinsic_movaps(var_E0, 0x0);
    intrinsic_movaps(var_F0, 0x0);
    var_100 = intrinsic_movaps(var_100, 0x0);
    var_110 = intrinsic_movaps(var_110, 0x0);
    rax = [rbx countByEnumeratingWithState:var_110 objects:var_B0 count:0x10];
    var_120 = rax;
    if (rax != 0x0) {
            var_148 = r12;
            r12 = *var_100;
            var_118 = 0x0;
            do {
                    r13 = 0x0;
                    do {
                            if (*var_100 != r12) {
                                    objc_enumerationMutation(rbx);
                            }
                            r15 = *(var_108 + r13 * 0x8);
                            if ([r15 representedElementCategory] == 0x0) {
                                    if (var_118 != 0x0) {
                                            rbx = var_138;
                                            if ([r15 zIndex] > [var_118 zIndex]) {
                                                    rax = [r15 retain];
                                                    r15 = rbx;
                                                    rbx = rax;
                                                    [var_118 release];
                                                    var_118 = rbx;
                                                    rbx = r15;
                                            }
                                    }
                                    else {
                                            rax = [r15 retain];
                                            r15 = rbx;
                                            rbx = rax;
                                            [var_118 release];
                                            var_118 = rbx;
                                            rbx = r15;
                                    }
                            }
                            r13 = r13 + 0x1;
                    } while (r13 < var_120);
                    rax = [rbx countByEnumeratingWithState:var_110 objects:var_B0 count:0x10];
                    var_120 = rax;
            } while (rax != 0x0);
            r12 = var_148;
            if (var_118 != 0x0) {
                    r13 = rbx;
                    rbx = [[var_118 indexPath] retain];
                    [var_118 release];
            }
            else {
                    r13 = rbx;
                    rbx = [r12 retain];
            }
    }
    else {
            r13 = rbx;
            rbx = [r12 retain];
    }
    [r13 release];
    [r12 release];
    [rbx autorelease];
    if (*___stack_chk_guard == var_30) {
            rax = rbx;
    }
    else {
            rax = __stack_chk_fail();
    }
    return rax;
}

void * -[UICollectionViewLayout layoutAttributesForInteractivelyMovingItemAtIndexPath:withTargetPosition:](void * self, void * _cmd, void * arg2, struct CGPoint arg3) {
    var_20 = intrinsic_movsd(var_20, xmm1, arg2, arg3);
    var_28 = intrinsic_movsd(var_28, xmm0);
    rbx = [[self layoutAttributesForItemAtIndexPath:rdx] retain];
    r14 = [rbx copy];
    [rbx release];
    intrinsic_movsd(xmm0, var_28);
    intrinsic_movsd(xmm1, var_20);
    [r14 setCenter:rdx];
    [r14 setZIndex:0x7fffffffffffffff];
    rdi = r14;
    rax = [rdi autorelease];
    return rax;
}

void * -[UICollectionViewLayout invalidationContextForInteractivelyMovingItems:withTargetPosition:previousIndexPaths:previousPosition:](void * self, void * _cmd, void * arg2, struct CGPoint arg3, void * arg4, struct CGPoint arg5) {
    var_30 = intrinsic_movsd(var_30, xmm1, arg2, arg3, arg4, arg5);
    var_38 = intrinsic_movsd(var_38, xmm0);
    r12 = [arg2 retain];
    r15 = [arg3 retain];
    rbx = [[[[self class] invalidationContextClass] alloc] init];
    [rbx _setPreviousIndexPathsForInteractivelyMovingItems:r15];
    [rbx _setTargetIndexPathsForInteractivelyMovingItems:r12];
    intrinsic_movsd(xmm0, var_38);
    intrinsic_movsd(xmm1, var_30);
    [rbx _setInteractiveMovementTarget:r12];
    r14 = [r12 isEqual:arg3];
    [r15 release];
    if (r14 != 0x0) {
            [rbx invalidateItemsAtIndexPaths:r12];
    }
    [r12 release];
    rdi = rbx;
    rax = [rdi autorelease];
    return rax;
}

void * -[UICollectionViewLayout invalidationContextForEndingInteractiveMovementOfItemsToFinalIndexPaths:previousIndexPaths:movementCancelled:](void * self, void * _cmd, void * arg2, void * arg3, bool arg4) {
    r12 = [arg2 retain];
    r15 = [arg3 retain];
    r13 = [[[[self class] invalidationContextClass] alloc] init];
    [r13 _setPreviousIndexPathsForInteractivelyMovingItems:r15];
    [r13 _setTargetIndexPathsForInteractivelyMovingItems:r12];
    rbx = [r12 isEqual:arg3];
    [r15 release];
    if (rbx != 0x0) {
            [r13 invalidateItemsAtIndexPaths:r12];
    }
    [r12 release];
    rdi = r13;
    rax = [rdi autorelease];
    return rax;
}

bool -[UICollectionViewLayout _shouldScrollToContentBeginningInRightToLeft](void * self, void * _cmd) {
    return 0x0;
}

struct UIEdgeInsets -[UICollectionViewLayout _preferredLayoutMargins](void * self, void * _cmd) {
    xmm0 = intrinsic_movaps(xmm0, *(int128_t *)0xc52cb0);
    *(int128_t *)self = intrinsic_movups(*(int128_t *)self, xmm0);
    *(int128_t *)(self + 0x10) = intrinsic_movups(*(int128_t *)(self + 0x10), xmm0);
    rax = self;
    return rax;
}

bool -[UICollectionViewLayout _wantsRightToLeftHorizontalMirroringIfNeeded](void * self, void * _cmd) {
    return 0x0;
}

void -[UICollectionViewLayout _setWantsRightToLeftHorizontalMirroringIfNeeded:](void * self, void * _cmd, bool arg2) {
    rdi = self;
    rax = rdi->_layoutFlags;
    if ((rax >> 0x3 & 0x1 & 0xff) != (arg2 & 0xff)) {
            rdi->_layoutFlags = rax & 0xf7;
    }
    return;
}

NSInteger -[UICollectionViewLayout _sublayoutType](void * self, void * _cmd) {
    rax = self->_sublayoutType;
    return rax;
}

void -[UICollectionViewLayout _setSublayoutType:](void * self, void * _cmd, NSInteger arg2) {
    self->_sublayoutType = arg2;
    return;
}

void -[UICollectionViewLayout .cxx_destruct](void * self, void * _cmd) {
    objc_destroyWeak(*_OBJC_IVAR_$_UICollectionViewLayout._siblingLayout + self);
    objc_destroyWeak(*_OBJC_IVAR_$_UICollectionViewLayout._compositionLayout + self);
    objc_storeStrong(*_OBJC_IVAR_$_UICollectionViewLayout._elementKinds + self, 0x0);
    objc_storeStrong(*_OBJC_IVAR_$_UICollectionViewLayout._items + self, 0x0);
    objc_storeStrong(*_OBJC_IVAR_$_UICollectionViewLayout._sections + self, 0x0);
    objc_storeStrong(*_OBJC_IVAR_$_UICollectionViewLayout._invalidationContext + self, 0x0);
    objc_storeStrong(*_OBJC_IVAR_$_UICollectionViewLayout._animator + self, 0x0);
    objc_storeStrong(*_OBJC_IVAR_$_UICollectionViewLayout._transitioningToLayout + self, 0x0);
    objc_storeStrong(*_OBJC_IVAR_$_UICollectionViewLayout._transitioningFromLayout + self, 0x0);
    objc_storeStrong(*_OBJC_IVAR_$_UICollectionViewLayout._decorationViewExternalObjectsTables + self, 0x0);
    objc_storeStrong(*_OBJC_IVAR_$_UICollectionViewLayout._decorationViewNibDict + self, 0x0);
    objc_storeStrong(*_OBJC_IVAR_$_UICollectionViewLayout._decorationViewClassDict + self, 0x0);
    objc_storeStrong(*_OBJC_IVAR_$_UICollectionViewLayout._insertedSectionsSet + self, 0x0);
    objc_storeStrong(*_OBJC_IVAR_$_UICollectionViewLayout._deletedSectionsSet + self, 0x0);
    objc_storeStrong(*_OBJC_IVAR_$_UICollectionViewLayout._insertedDecorationIndexPathsDict + self, 0x0);
    objc_storeStrong(*_OBJC_IVAR_$_UICollectionViewLayout._deletedDecorationIndexPathsDict + self, 0x0);
    objc_storeStrong(*_OBJC_IVAR_$_UICollectionViewLayout._insertedSupplementaryIndexPathsDict + self, 0x0);
    objc_storeStrong(*_OBJC_IVAR_$_UICollectionViewLayout._deletedSupplementaryIndexPathsDict + self, 0x0);
    objc_storeStrong(*_OBJC_IVAR_$_UICollectionViewLayout._finalAnimationLayoutAttributesDict + self, 0x0);
    objc_storeStrong(self + *_OBJC_IVAR_$_UICollectionViewLayout._initialAnimationLayoutAttributesDict, 0x0);
    return;
}


