#if 0
Pseudocode:
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
#endif
