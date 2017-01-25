void * +[UICollectionViewCell _contentViewClass](void * self, void * _cmd) {
    rax = [UIView class];
    return rax;
}

struct CGRect -[UICollectionViewCell _contentViewFrame](void * self, void * _cmd) {
    [self bounds];
    rax = self;
    return rax;
}

void * -[UICollectionViewCell initWithFrame:](void * self, void * _cmd, struct CGRect arg2) {
    rdx = arg2;
    rbx = [[self super] initWithFrame:rdx, rcx];
    if (rbx != 0x0) {
            r15 = [[[rbx class] _contentViewClass] alloc];
            [var_50 bounds];
            r14 = [r15 initWithFrame:rdx, rcx];
            [rbx setContentView:r14];
            [r14 release];
            _UICollectionViewCellCommonInit(rbx);
    }
    rax = rbx;
    return rax;
}

void * -[UICollectionViewCell initWithCoder:](void * self, void * _cmd, void * arg2) {
    r14 = [arg2 retain];
    rbx = [[self super] initWithCoder:r14];
    if (rbx != 0x0) {
            rdx = @"UIContentView";
            rbx->_contentView = [[r14 decodeObjectForKey:rdx] retain];
            [rbx->_contentView release];
            if (rbx->_contentView != 0x0) {
                    [rbx addSubview:rdx];
            }
            else {
                    r12 = [[[rbx class] _contentViewClass] alloc];
                    [var_58 bounds];
                    r12 = [r12 initWithFrame:rdx, rcx];
                    [rbx setContentView:r12];
                    [r12 release];
            }
            rbx->_backgroundView = [[r14 decodeObjectForKey:@"UIBackgroundView"] retain];
            [rbx->_backgroundView release];
            rbx->_selectedBackgroundView = [[r14 decodeObjectForKey:@"UISelectedBackgroundView"] retain];
            [rbx->_selectedBackgroundView release];
            _UICollectionViewCellCommonInit(rbx);
    }
    [r14 release];
    rax = rbx;
    return rax;
}

void -[UICollectionViewCell _setContentView:addToHierarchy:](void * self, void * _cmd, void * arg2, bool arg3) {
    r15 = arg3;
    rbx = self;
    r13 = [arg2 retain];
    r12 = rbx->_contentView;
    if (r12 != r13) {
            r14 = *_OBJC_IVAR_$_UICollectionViewCell._contentView + rbx;
            var_4C = r15;
            if (r15 != 0x0) {
                    [r12 removeFromSuperview];
                    r12 = *r14;
            }
            r15 = r13;
            r13 = [r13 retain];
            *r14 = r13;
            [r12 release];
            rdi = r13;
            r13 = r15;
            rdx = [rbx semanticContentAttribute];
            [rdi setSemanticContentAttribute:rdx];
            if (var_4C != 0x0) {
                    if (*(int32_t *)__UIApplicationLinkedOnVersion != 0x0) {
                            if (*(int32_t *)__UIApplicationLinkedOnVersion <= 0x7ffff) {
                                    [var_48 bounds];
                                    [*r14 setFrame:rdx, rcx];
                                    [*r14 setAutoresizingMask:0x12];
                            }
                    }
                    else {
                            if (__UIApplicationLinkedOnOrAfter(0x80000) == 0x0) {
                                    [var_48 bounds];
                                    [*r14 setFrame:rdx, rcx];
                                    [*r14 setAutoresizingMask:0x12];
                            }
                    }
                    [rbx addSubview:*r14];
            }
    }
    [r13 release];
    return;
}

void -[UICollectionViewCell setContentView:](void * self, void * _cmd, void * arg2) {
    [self _setContentView:arg2 addToHierarchy:0x1];
    return;
}

void * -[UICollectionViewCell _encodableSubviews](void * self, void * _cmd) {
    r14 = self;
    r15 = [[r14->_focusedFloatingContentView contentView] retain];
    r12 = [[r15 subviews] retain];
    if (r12 != 0x0) {
            rax = [r12 retain];
    }
    else {
            rax = [r14 subviews];
            rax = [rax retain];
    }
    rbx = rax;
    [r12 release];
    [r15 release];
    [rbx autorelease];
    rax = rbx;
    return rax;
}

void -[UICollectionViewCell encodeWithCoder:](void * self, void * _cmd, void * arg2) {
    rbx = self;
    r14 = [arg2 retain];
    rdx = r14;
    [[rbx super] encodeWithCoder:rdx];
    if (rbx->_contentView != 0x0) {
            [r14 encodeObject:rdx forKey:@"UIContentView"];
    }
    if (rbx->_backgroundView != 0x0) {
            [r14 encodeObject:rdx forKey:@"UIBackgroundView"];
    }
    if (rbx->_selectedBackgroundView != 0x0) {
            [r14 encodeObject:rdx forKey:@"UISelectedBackgroundView"];
    }
    [r14 release];
    return;
}

void -[UICollectionViewCell dealloc](void * self, void * _cmd) {
    rbx = [[NSNotificationCenter defaultCenter] retain];
    [rbx removeObserver:self];
    [rbx release];
    [[self super] dealloc];
    return;
}

void -[UICollectionViewCell prepareForReuse](void * self, void * _cmd) {
    rbx = self;
    [[rbx super] prepareForReuse];
    [rbx setHighlighted:0x0];
    [rbx setSelected:0x0];
    if (*(int32_t *)__UIApplicationLinkedOnVersion != 0x0) {
            if (*(int32_t *)__UIApplicationLinkedOnVersion >= 0xa0000) {
                    [rbx _removeAllAnimations:0x1];
            }
            else {
                    r14 = [[rbx layer] retain];
                    [r14 removeAllAnimations];
                    [r14 release];
            }
    }
    else {
            if (__UIApplicationLinkedOnOrAfter(0xa0000) != 0x0) {
                    [rbx _removeAllAnimations:0x1];
            }
            else {
                    r14 = [[rbx layer] retain];
                    [r14 removeAllAnimations];
                    [r14 release];
            }
    }
    [rbx _updateHighlightColorsForView:rbx highlight:(rbx->_collectionCellFlags & 0x2) >> 0x1 & 0xff];
    return;
}

void -[UICollectionViewCell _updateHighlightColorsForView:highlight:](void * self, void * _cmd, void * arg2, bool arg3) {
    rdx = arg2;
    rbx = self;
    if (arg3 != 0x0) {
            r15 = [rdx retain];
            [rbx _setupHighlightingSupport];
            [rbx->_highlightingSupport highlightView:r15];
            rdi = r15;
    }
    else {
            r15 = rbx->_highlightingSupport;
            rbx = [rdx retain];
            [r15 applyState:0x1 toView:rbx];
            rdi = rbx;
    }
    [rdi release];
    return;
}

void -[UICollectionViewCell _updateHighlightColorsForAnimationHalfwayPoint](void * self, void * _cmd) {
    rax = [self _descendantsShouldHighlight];
    [self _updateHighlightColorsForView:self highlight:rax & 0xff];
    self->_collectionCellFlags = self->_collectionCellFlags & 0xef;
    return;
}

void -[UICollectionViewCell _setOpaque:forSubview:](void * self, void * _cmd, bool arg2, void * arg3) {
    var_10C = arg2;
    var_F8 = self;
    var_30 = *___stack_chk_guard;
    r13 = [arg3 retain];
    rdi = self->_highlightingSupport;
    if (arg2 != 0x0) {
            [rdi applyState:0xff toView:r13];
    }
    else {
            [rdi applyState:0x1 toView:r13];
            [r13 setOpaque:0x0];
            rbx = [[UIColor clearColor] retain];
            [r13 setBackgroundColor:rbx];
            [rbx release];
    }
    rdx = [UIControl class];
    if ((([r13 isKindOfClass:rdx] == 0x0) && ([r13 isKindOfClass:[UITableViewCellDeleteConfirmationView class]] == 0x0)) && (var_F8->_selectedBackgroundView != r13)) {
            intrinsic_movaps(var_C0, 0x0);
            intrinsic_movaps(var_D0, 0x0);
            var_E0 = intrinsic_movaps(var_E0, 0x0);
            var_F0 = intrinsic_movaps(var_F0, 0x0);
            var_118 = r13;
            rax = [r13 subviews];
            rax = [rax retain];
            var_100 = rax;
            r15 = [rax countByEnumeratingWithState:var_F0 objects:var_B0 count:0x10];
            if (r15 != 0x0) {
                    r12 = *var_E0;
                    r14 = var_10C & 0xff;
                    do {
                            rbx = 0x0;
                            do {
                                    if (*var_E0 != r12) {
                                            objc_enumerationMutation(var_100);
                                    }
                                    [var_F8 _setOpaque:r14 forSubview:*(var_E8 + rbx * 0x8)];
                                    rbx = rbx + 0x1;
                            } while (rbx < r15);
                            r15 = [var_100 countByEnumeratingWithState:var_F0 objects:var_B0 count:0x10];
                    } while (r15 != 0x0);
            }
            [var_100 release];
            r13 = var_118;
    }
    [r13 release];
    if (*___stack_chk_guard != var_30) {
            __stack_chk_fail();
    }
    return;
}

void -[UICollectionViewCell _descendent:willMoveFromSuperview:toSuperview:](void * self, void * _cmd, void * arg2, void * arg3, void * arg4) {
    r12 = self;
    rbx = [arg3 retain];
    r14 = [arg4 retain];
    r13 = [r12 containsView:rbx];
    [rbx release];
    if ((r13 != 0x0) && ([r12 containsView:r14] == 0x0)) {
            [r12->_highlightingSupport applyState:0xff toView:r12];
    }
    rdi = r14;
    [rdi release];
    return;
}

void -[UICollectionViewCell _descendent:didMoveFromSuperview:toSuperview:](void * self, void * _cmd, void * arg2, void * arg3, void * arg4) {
    var_30 = self;
    var_48 = [arg2 retain];
    var_58 = [arg3 retain];
    r12 = [[arg4 retain] retain];
    var_60 = r12;
    goto loc_9a0bcb;

loc_9a0bcb:
    rbx = var_30;
    if ((r12 == rbx) || (r12 == 0x0)) goto loc_9a0c69;

loc_9a0be1:
    rbx = @selector(isKindOfClass:);
    rdx = [UIControl class];
    if (_objc_msgSend(r12, rbx, rdx) != 0x0) {
            rbx = 0x1;
    }
    else {
            rax = [UITableViewCellDeleteConfirmationView class];
            rax = _objc_msgSend(r12, rbx, rax);
            rbx = 0x1;
            if (rax == 0x0) {
                    rbx = var_30->_selectedBackgroundView == var_48 ? 0x1 : 0x0;
            }
    }
    r13 = [[r12 superview] retain];
    [r12 release];
    r12 = r13;
    if (rbx == 0x0) goto loc_9a0bcb;

loc_9a0cef:
    [r13 release];
    [var_60 release];
    [var_58 release];
    [var_48 release];
    return;

loc_9a0c69:
    if (([rbx containsView:var_58] == 0x0) && ([rbx containsView:var_60] != 0x0)) {
            [rbx->_highlightingSupport cacheState:0xff forView:var_48];
            [rbx _updateHighlightColorsForView:var_48 highlight:(rbx->_collectionCellFlags & 0x2) >> 0x1 & 0xff];
            [rbx _setOpaque:0x0 forSubview:var_48];
    }
    r13 = r12;
    goto loc_9a0cef;
}

void -[UICollectionViewCell _updateBackgroundView](void * self, void * _cmd) {
    rbx = self;
    rax = [self class];
    r8 = 0x0;
    rdx = rbx;
    [rax cancelPreviousPerformRequestsWithTarget:rdx selector:@selector(_updateHighlightColorsForAnimationHalfwayPoint:) object:r8];
    rax = rbx->_collectionCellFlags;
    if (((rax & 0x1) == 0x0) && ((rax & 0x2) == 0x0)) {
            xmm0 = intrinsic_xorpd(xmm0, xmm0);
    }
    else {
            xmm0 = intrinsic_movsd(xmm0, *0xc4f410);
    }
    var_30 = intrinsic_movsd(var_30, xmm0);
    r14 = [rbx _descendantsShouldHighlight];
    if (r14 != 0x0) {
            [rbx _setupHighlightingSupport];
    }
    xmm0 = intrinsic_movsd(xmm0, var_30);
    [rbx->_selectedBackgroundView setAlpha:rdx];
    if ([UIView _isInAnimationBlock] != 0x0) {
            r14 = [[UIView _currentAnimationAttributes] retain];
            [r14 _delay];
            var_30 = intrinsic_movsd(var_30, xmm0);
            [r14 _duration];
            xmm0 = intrinsic_mulsd(xmm0, *0xc4f4a0);
            xmm0 = intrinsic_addsd(xmm0, var_30);
            var_30 = intrinsic_movsd(var_30, xmm0);
            _UIAnimationDragCoefficient();
            xmm1 = intrinsic_cvtss2sd(xmm1, xmm0);
            xmm0 = intrinsic_movsd(xmm0, var_30);
            intrinsic_mulsd(xmm0, xmm1);
            [rbx performSelector:@selector(_updateHighlightColorsForAnimationHalfwayPoint) withObject:0x0 afterDelay:r8];
            rbx->_collectionCellFlags = rbx->_collectionCellFlags | 0x10;
            rdi = r14;
            [rdi release];
    }
    else {
            [rbx _updateHighlightColorsForView:rbx highlight:r14 & 0xff];
            rbx->_collectionCellFlags = rbx->_collectionCellFlags & 0xef;
    }
    return;
}

bool -[UICollectionViewCell _highlightDescendantsWhenSelected](void * self, void * _cmd) {
    return 0x1;
}

bool -[UICollectionViewCell _descendantsShouldHighlight](void * self, void * _cmd) {
    rbx = self;
    rax = 0x1;
    if ((rbx->_collectionCellFlags & 0x2) == 0x0) {
            if ([rbx _highlightDescendantsWhenSelected] != 0x0) {
                    rax = rbx->_collectionCellFlags & 0x1;
            }
            else {
                    rax = 0x0;
            }
    }
    return rax;
}

double -[UICollectionViewCell _selectionAnimationDuration](void * self, void * _cmd) {
    xmm0 = intrinsic_movsd(xmm0, *0xc4f4c0);
    return xmm0;
}

void -[UICollectionViewCell _setupHighlightingSupport](void * self, void * _cmd) {
    rbx = self;
    if (rbx->_highlightingSupport == 0x0) {
            rbx->_highlightingSupport = [[UICellHighlightingSupport alloc] initWithCell:rbx];
            [rbx->_highlightingSupport release];
            rdi = rbx->_highlightingSupport;
            rcx = rbx;
            [rdi cacheState:0xff forView:rcx];
    }
    return;
}

void -[UICollectionViewCell _teardownHighlightingSupportIfReady](void * self, void * _cmd) {
    rdi = self;
    if ((rdi->_collectionCellFlags & 0x13) == 0x0) {
            rdi->_highlightingSupport = 0x0;
            [rdi->_highlightingSupport release];
    }
    return;
}

void -[UICollectionViewCell _setSelected:animated:](void * self, void * _cmd, bool arg2, bool arg3) {
    r15 = arg2;
    rbx = self;
    if (arg3 != 0x0) {
            [rbx _selectionAnimationDuration];
            var_90 = intrinsic_movsd(var_90, xmm0);
            rax = [rbx retain];
            var_38 = rax;
            var_60 = [rax retain];
            intrinsic_movsd(xmm0, var_90, __NSConcreteStackBlock, __NSConcreteStackBlock);
            [UIView animateWithDuration:rdx animations:rcx completion:r8];
            [var_60 release];
            [var_38 release];
    }
    else {
            [rbx setSelected:r15 & 0xff];
            rdi = rbx;
            [rdi _teardownHighlightingSupportIfReady];
    }
    return;
}

int ___46-[UICollectionViewCell _setSelected:animated:]_block_invoke(int arg0) {
    rax = [*(arg0 + 0x20) setSelected:*(int8_t *)(arg0 + 0x28) & 0xff];
    return rax;
}

void ___46-[UICollectionViewCell _setSelected:animated:]_block_invoke.222(int arg0) {
    [*(arg0 + 0x20) _teardownHighlightingSupportIfReady];
    return;
}

void -[UICollectionViewCell setSelected:](void * self, void * _cmd, bool arg2) {
    rdx = arg2;
    rbx = self;
    rax = rbx->_collectionCellFlags;
    if (rdx != 0x0) {
            rbx->_collectionCellFlags = rax & 0xf6 | rdx;
            if ((rax & 0x3) == 0x0) {
                    [rbx _updateBackgroundView];
            }
    }
    else {
            COND = (rbx->_collectionCellFlags & 0x3) != 0x0;
            rbx->_collectionCellFlags = rbx->_collectionCellFlags & 0xfe | rdx;
            if (((rax & 0x2) >> 0x1 & 0xff) != ((COND ? 0x1 : 0x0) & 0xff)) {
                    [rbx _updateBackgroundView];
            }
    }
    rdi = rbx;
    [rdi _updateFocusedFloatingContentControlStateAnimated:[UIView _isInAnimationBlock] & 0xff];
    return;
}

bool -[UICollectionViewCell isSelected](void * self, void * _cmd) {
    rax = self->_collectionCellFlags & 0x1;
    return rax;
}

void -[UICollectionViewCell _setHighlighted:animated:](void * self, void * _cmd, bool arg2, bool arg3) {
    r15 = arg2;
    rbx = self;
    if (arg3 != 0x0) {
            [rbx _selectionAnimationDuration];
            var_90 = intrinsic_movsd(var_90, xmm0);
            rax = [rbx retain];
            var_38 = rax;
            var_60 = [rax retain];
            intrinsic_movsd(xmm0, var_90, __NSConcreteStackBlock, __NSConcreteStackBlock);
            [UIView animateWithDuration:rdx animations:rcx completion:r8];
            [var_60 release];
            [var_38 release];
    }
    else {
            [rbx setHighlighted:r15 & 0xff];
            rdi = rbx;
            [rdi _teardownHighlightingSupportIfReady];
    }
    return;
}

int ___49-[UICollectionViewCell _setHighlighted:animated:]_block_invoke(int arg0) {
    rax = [*(arg0 + 0x20) setHighlighted:*(int8_t *)(arg0 + 0x28) & 0xff];
    return rax;
}

void ___49-[UICollectionViewCell _setHighlighted:animated:]_block_invoke.238(int arg0) {
    [*(arg0 + 0x20) _teardownHighlightingSupportIfReady];
    return;
}

void -[UICollectionViewCell setHighlighted:](void * self, void * _cmd, bool arg2) {
    rbx = arg2;
    r14 = self;
    if ([self _highlightDescendantsWhenSelected] != 0x0) {
            r14->_collectionCellFlags = r14->_collectionCellFlags & 0xfd | rbx + rbx;
            rax = ((r14->_collectionCellFlags & 0x3) != 0x0 ? 0x1 : 0x0) ^ (r14->_collectionCellFlags & 0x1 | rbx);
            if (rax != 0x0) {
                    [r14 _updateBackgroundView];
            }
    }
    else {
            r14->_collectionCellFlags = r14->_collectionCellFlags & 0xfd | (rbx & 0xff) + (rbx & 0xff);
            if ((rbx & 0xff) != (r14->_collectionCellFlags >> 0x1 & 0x1 & 0xff)) {
                    [r14 _updateBackgroundView];
            }
    }
    rdi = r14;
    [rdi _updateFocusedFloatingContentControlStateAnimated:[UIView _isInAnimationBlock] & 0xff];
    return;
}

bool -[UICollectionViewCell isHighlighted](void * self, void * _cmd) {
    rax = (self->_collectionCellFlags & 0x2) >> 0x1;
    return rax;
}

void -[UICollectionViewCell setSelectedBackgroundView:](void * self, void * _cmd, void * arg2) {
    r13 = self;
    r14 = [arg2 retain];
    rdi = r13->_selectedBackgroundView;
    if (rdi != r14) {
            [rdi removeFromSuperview];
            r13->_selectedBackgroundView = [r14 retain];
            [r13->_selectedBackgroundView release];
            rdi = r13->_selectedBackgroundView;
            if ((r13->_collectionCellFlags & 0x1) == 0x0) {
                    intrinsic_xorpd(xmm0, xmm0);
            }
            else {
                    intrinsic_movsd(xmm0, *0xc4f410);
            }
            [rdi setAlpha:rdx];
            [var_48 bounds];
            [r13->_selectedBackgroundView setFrame:rdx, rcx];
            [r13->_selectedBackgroundView setAutoresizingMask:0x12];
            rbx = [[r13->_focusedFloatingContentView contentView] retain];
            r12 = r13;
            if (rbx != 0x0) {
                    r12 = rbx;
            }
            r15 = [r12 retain];
            [rbx release];
            if (r13->_backgroundView != 0x0) {
                    rsi = @selector(insertSubview:above:);
            }
            else {
                    rsi = @selector(insertSubview:atIndex:);
            }
            _objc_msgSend(r12, rsi);
            [r15 release];
    }
    [r14 release];
    return;
}

void -[UICollectionViewCell setBackgroundView:](void * self, void * _cmd, void * arg2) {
    r13 = self;
    r14 = [arg2 retain];
    rdi = r13->_backgroundView;
    if (rdi != r14) {
            [rdi removeFromSuperview];
            rax = [r14 retain];
            var_50 = rax;
            r13->_backgroundView = rax;
            [r13->_backgroundView release];
            [var_48 bounds];
            [r13->_backgroundView setFrame:rdx, rcx];
            [r13->_backgroundView setAutoresizingMask:0x12];
            rbx = [[r13->_focusedFloatingContentView contentView] retain];
            if (rbx != 0x0) {
                    r13 = rbx;
            }
            r12 = [r13 retain];
            rdi = rbx;
            [rdi release];
            [r13 insertSubview:var_50 atIndex:0x0];
            [r12 release];
    }
    [r14 release];
    return;
}

bool -[UICollectionViewCell _shouldSaveOpaqueStateForView:](void * self, void * _cmd, void * arg2) {
    r14 = self;
    rbx = [arg2 retain];
    if (([rbx isKindOfClass:[UICollectionViewCell class]] == 0x0) && (r14->_backgroundView != rbx)) {
            r14 = r14->_selectedBackgroundView != rbx ? 0x1 : 0x0;
    }
    else {
            r14 = 0x0;
    }
    [rbx release];
    rax = r14;
    return rax;
}

bool -[UICollectionViewCell _isUsingOldStyleMultiselection](void * self, void * _cmd) {
    return 0x0;
}

bool -[UICollectionViewCell _gestureRecognizerShouldBegin:](void * self, void * _cmd, void * arg2) {
    rcx = self;
    rax = 0x1;
    if (rcx->_menuGesture == arg2) {
            stack[2047] = rbp;
            rax = [rcx->_collectionView _shouldShowMenuForCell:rcx];
    }
    return rax;
}

void -[UICollectionViewCell _handleMenuGesture:](void * self, void * _cmd, void * arg2) {
    r15 = self;
    if ([arg2 state] == 0x1) {
            r14 = [[UIMenuController sharedMenuController] retain];
            if ([r14 isMenuVisible] == 0x0) {
                    [r15 _setSelected:0x1 animated:0x0];void -[UICollectionViewCell _menuDismissed:](void * self, void * _cmd, void * arg2) {
    r14 = self;
    rbx = [[NSNotificationCenter defaultCenter] retain];
    rcx = @"UIMenuControllerDidHideMenuNotification";
    rdx = r14;
    [rbx removeObserver:rdx name:rcx object:0x0];
    [rbx release];
    if ((r14->_collectionCellFlags & 0x8) != 0x0) {
            rdx = 0x0;
            rcx = 0x0;
            [r14 _setSelected:rdx animated:rcx];
    }
    rbx = [[UICalloutBar sharedCalloutBar] retain];
    [rbx setResponderTarget:0x0, rcx, 0x0];
    [rbx release];
    r14->_collectionCellFlags = r14->_collectionCellFlags & 0xf3;
    rdi = r14->_collectionView;
    [rdi _cellMenuDismissed];
    return;
}

bool -[UICollectionViewCell canPerformAction:withSender:](void * self, void * _cmd, void * arg2, void * arg3) {
    r14 = arg2;
    rbx = self;
    if ([rbx->_collectionView _canPerformAction:rdx forCell:rbx sender:arg3] != 0x0) {
            rax = [rbx respondsToSelector:r14];
    }
    else {
            rax = 0x0;
    }
    return rax;
}

void -[UICollectionViewCell _performAction:sender:](void * self, void * _cmd, void * arg2, void * arg3) {
    rdx = arg2;
    rax = arg3;
    rcx = self;
    if ((rcx->_collectionCellFlags & 0x4) == 0x0) {
            *((rsp - 0x8) + 0xfffffffffffffff0) = rcx;
            *((rsp - 0x8) + 0xfffffffffffffff8) = _OBJC_CLASS_$_UICollectionViewCell;
            [[(rsp - 0x8) + 0xfffffffffffffff0 super] performSelector:rdx];
    }
    else {
            [rcx->_collectionView _performAction:rdx forCell:rcx sender:rax];
    }
    return;
}

void -[UICollectionViewCell cut:](void * self, void * _cmd, void * arg2) {
    [self _performAction:_cmd sender:arg2];
    return;
}

void -[UICollectionViewCell copy:](void * self, void * _cmd, void * arg2) {
    [self _performAction:_cmd sender:arg2];
    return;
}

void -[UICollectionViewCell paste:](void * self, void * _cmd, void * arg2) {
    [self _performAction:_cmd sender:arg2];
    return;
}

void -[UICollectionViewCell _setSelectionSegueTemplate:](void * self, void * _cmd, void * arg2) {
    r14 = self;
    rbx = [arg2 retain];
    r15 = r14->_selectionSegueTemplate;
    if (r15 != rbx) {
            r14->_selectionSegueTemplate = [rbx retain];
            [r15 release];
    }
    rdi = rbx;
    [rdi release];
    return;
}

void * -[UICollectionViewCell _selectionSegueTemplate](void * self, void * _cmd) {
    rax = objc_retainAutorelease(self->_selectionSegueTemplate);
    rax = objc_retainAutoreleaseReturnValue(rax);
    return rax;
}

void -[UICollectionViewCell layoutSubviews](void * self, void * _cmd) {
    rbx = self;
    [[rbx super] layoutSubviews];
    [var_48 bounds];
    [rbx->_focusedFloatingContentView setFrame:rdx, rcx];
    if (*(int32_t *)__UIApplicationLinkedOnVersion != 0x0) {
            if (*(int32_t *)__UIApplicationLinkedOnVersion >= 0x80000) {
                    [var_68 _contentViewFrame];
                    [rbx->_contentView setFrame:rdx, rcx];
            }
    }
    else {
            if (__UIApplicationLinkedOnOrAfter(0x80000) != 0x0) {
                    [var_68 _contentViewFrame];
                    [rbx->_contentView setFrame:rdx, rcx];
            }
    }
    return;
}

void -[UICollectionViewCell setSemanticContentAttribute:](void * self, void * _cmd, NSInteger arg2) {
    [[self super] setSemanticContentAttribute:rdx];
    rbx = [[self contentView] retain];
    [rbx setSemanticContentAttribute:arg2];
    [rbx release];
    return;
}

bool -[UICollectionViewCell _forwardsSystemLayoutFittingSizeToContentView:](void * self, void * _cmd, void * arg2) {
    rdx = arg2;
    if (self->_contentView != rdx) {
            rax = 0x0;
    }
    else {
            stack[2047] = rbp;
            rax = [rdx _wantsAutolayout];
    }
    return rax;
}

struct CGSize -[UICollectionViewCell systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](void * self, void * _cmd, struct CGSize arg2, float arg3, float arg4) {
    xmm1 = arg4;
    xmm0 = arg3;
    var_60 = intrinsic_movss(var_60, xmm3, arg2);
    var_68 = intrinsic_movss(var_68, xmm2);
    var_58 = intrinsic_movsd(var_58, xmm1);
    var_70 = intrinsic_movsd(var_70, xmm0);
    rbx = self;
    r14 = [[rbx->_contentView _templateLayoutView] retain];
    if (r14 == 0x0) goto loc_9a1dd6;

loc_9a1d57:
    xmm0 = intrinsic_movsd(xmm0, var_70);
    xmm1 = intrinsic_movsd(xmm1, var_58);
    intrinsic_movss(xmm2, var_68);
    intrinsic_movss(xmm3, var_60);
    [r14 systemLayoutSizeFittingSize:rdx withHorizontalFittingPriority:rcx verticalFittingPriority:r8];
    var_60 = intrinsic_movsd(var_60, xmm0);
    rax = 0x1;
    goto loc_9a1d82;

loc_9a1d82:
    var_68 = intrinsic_movsd(var_68, xmm1);
    xmm0 = intrinsic_xorpd(xmm0, xmm0);
    xmm1 = intrinsic_ucomisd(xmm1, xmm0);
    if (((xmm1 == 0x0) && (!CPU_FLAGS & P)) && (rax != 0x0)) {
            xmm0 = intrinsic_movsd(xmm0, var_70);
            xmm1 = intrinsic_movsd(xmm1, var_58);
            [rbx sizeThatFits:rdx];
            rax = *(int8_t *)_systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:.warnOnce;
            rax = rax & 0x1;
            if (rax != 0x0) {
                    var_68 = intrinsic_movsd(var_68, xmm1);
                    var_60 = intrinsic_movsd(var_60, xmm0);
            }
            else {
                    var_68 = intrinsic_movsd(var_68, xmm1);
                    var_60 = intrinsic_movsd(var_60, xmm0);
                    *(int8_t *)_systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:.warnOnce = 0x1;
                    NSLog(@"Warning once only: Detected a case where constraints ambiguously suggest a size of zero for a collection view cell's content view. We're considering the collapse unintentional and using standard size instead.");
            }
    }
    goto loc_9a1e8f;

loc_9a1e8f:
    rax = [r14 release];
    intrinsic_movsd(xmm0, var_60);
    intrinsic_movsd(xmm1, var_68);
    return rax;

loc_9a1dd6:
    rdi = rbx->_contentView;
    if ([rdi _wantsAutolayout] == 0x0) goto loc_9a1e52;

loc_9a1deb:
    if (*(int32_t *)__UIApplicationLinkedOnVersion == 0x0) goto loc_9a1e22;

loc_9a1df8:
    if (*(int32_t *)__UIApplicationLinkedOnVersion < 0x80000) goto loc_9a1e52;

loc_9a1e30:
    r15 = rbx->_contentView;
    if (r15 != 0x0) {
            rdi = var_40;
            [rdi frame];
    }
    else {
            xmm0 = intrinsic_xorpd(xmm0, xmm0);
            var_30 = intrinsic_movapd(var_30, xmm0);
            var_40 = intrinsic_movapd(var_40, xmm0);
    }
    CGRectGetWidth(rdi);
    xmm3 = intrinsic_movss(xmm3, var_60);
    xmm3 = intrinsic_ucomiss(xmm3, *(int32_t *)0xc50194);
    rdx = 0x1;
    if (xmm3 != 0x0) {
            rdx = 0x0;
    }
    if (CPU_FLAGS & P) {
            rdx = 0x0;
    }
    xmm1 = intrinsic_movsd(xmm1, var_58);
    xmm1 = intrinsic_ucomisd(xmm1, 0x0);
    if (xmm1 != 0x0) {
            rdx = 0x0;
    }
    if (CPU_FLAGS & P) {
            rdx = 0x0;
    }
    intrinsic_movss(0x0, var_68);
    [r15 _systemLayoutSizeFittingSize:rdx withHorizontalFittingPriority:rcx verticalFittingPriority:r8 hasIntentionallyCollapsedHeight:r9];
    var_60 = intrinsic_movsd(var_60, xmm0);
    rax = 0x1 == 0x0 ? 0x1 : 0x0;
    goto loc_9a1d82;

loc_9a1e52:
    xmm0 = intrinsic_movsd(xmm0, var_70);
    xmm1 = intrinsic_movsd(xmm1, var_58);
    intrinsic_movss(xmm2, var_68);
    intrinsic_movss(xmm3, var_60);
    [[rbx super] systemLayoutSizeFittingSize:rdx withHorizontalFittingPriority:rcx verticalFittingPriority:r8];
    var_60 = intrinsic_movsd(var_60, xmm0);
    var_68 = intrinsic_movsd(var_68, xmm1);
    goto loc_9a1e8f;

loc_9a1e22:
    rdi = 0x80000;
    if (__UIApplicationLinkedOnOrAfter(rdi) == 0x0) goto loc_9a1e52;
}

void -[UICollectionViewCell _setLayoutEngineSuspended:](void * self, void * _cmd, bool arg2) {
    rbx = self;
    rax = rbx->_isLayoutEngineSuspended;
    if (arg2 != 0x0) {
            if ((rax == 0x0) && ([rbx _shouldSuspendLayoutEngine] != 0x0)) {
                    rbx->_isLayoutEngineSuspended = 0x1;
            }
    }
    else {
            if (rax != 0x0) {
                    rbx->_isLayoutEngineSuspended = 0x0;
                    rdi = rbx;
                    [rdi _resumeLayoutEngine];
            }
    }
    return;
}

struct CGSize -[UICollectionViewCell sizeThatFits:](void * self, void * _cmd, struct CGSize arg2) {
    rdx = arg2;
    rbx = self;
    if (*(int32_t *)__UIApplicationLinkedOnVersion != 0x0) {
            rax = *(int32_t *)__UIApplicationLinkedOnVersion;
            if (rax <= 0x7ffff) {
                    rax = [[rbx super] sizeThatFits:rdx];
            }
    }
    else {
            var_20 = intrinsic_movsd(var_20, xmm1);
            var_28 = intrinsic_movsd(var_28, xmm0);
            rax = __UIApplicationLinkedOnOrAfter(0x80000);
            intrinsic_movsd(xmm0, var_28);
            intrinsic_movsd(xmm1, var_20);
            if (rax == 0x0) {
                    rax = [[rbx super] sizeThatFits:rdx];
            }
    }
    return rax;
}

bool -[UICollectionViewCell isEditing](void * self, void * _cmd) {
    return 0x0;
}

void -[UICollectionViewCell setEditing:](void * self, void * _cmd, bool arg2) {
    return;
}

void -[UICollectionViewCell _ensureFocusedFloatingContentView](void * self, void * _cmd) {
    return;
}

void -[UICollectionViewCell _updateFocusedFloatingContentControlStateAnimated:](void * self, void * _cmd, bool arg2) {
    [self _updateFocusedFloatingContentControlStateInContext:0x0 withAnimationCoordinator:0x0 animated:arg2 & 0xff];
    return;
}

void -[UICollectionViewCell _updateFocusedFloatingContentControlStateInContext:withAnimationCoordinator:animated:](void * self, void * _cmd, void * arg2, void * arg3, bool arg4) {
    r13 = arg4;
    r15 = self;
    r14 = [arg2 retain];
    r12 = [arg3 retain];
    if ([r15 _canFocusProgrammatically] != 0x0) {
            [r15 _ensureFocusedFloatingContentView];
    }
    if (r15->_focusedFloatingContentView != 0x0) {
            var_2C = r13;
            if (r14 != 0x0) {
                    rax = [r14 nextFocusedView];
                    rax = [rax retain];
                    r13 = rax == r15 ? 0x1 : 0x0;
                    [rax release];
            }
            else {
                    r13 = [r15 isFocused];
            }
            rbx = r13 & 0xff;
            rcx = rbx * 0x8 + 0x4;
            rbx = rbx * 0x8;
            if ([r15 isSelected] != 0x0) {
                    rbx = rcx;
            }
            rdx = [r15 isHighlighted] & 0xff | rbx;
            rdi = r15->_focusedFloatingContentView;
            if (r12 != 0x0) {
                    [rdi setControlState:rdx withAnimationCoordinator:r12];
            }
            else {
                    [rdi setControlState:rdx animated:var_2C & 0xff];
            }
    }
    [r12 release];
    rdi = r14;
    [rdi release];
    return;
}


                    rbx = [[UICalloutBar sharedCalloutBar] retain];
                    [rbx setResponderTarget:r15];
                    [rbx release];
                    [var_48 bounds];
                    [r14 setTargetRect:r15 inView:var_40];
                    [r14 setMenuVisible:0x1 animated:0x1];
                    rbx = [[NSNotificationCenter defaultCenter] retain];
                    [rbx addObserver:r15 selector:@selector(_menuDismissed:) name:@"UIMenuControllerDidHideMenuNotification" object:0x0];
                    [rbx release];
                    r15->_collectionCellFlags = r15->_collectionCellFlags | 0xc;
            }
            [r14 release];
    }
    return;
}

bool -[UICollectionViewCell _canFocusProgrammatically](void * self, void * _cmd) {
    return 0x0;
}

bool -[UICollectionViewCell canBecomeFocused](void * self, void * _cmd) {
    r15 = self;
    r14 = [[self _collectionView] retain];
    rbx = 0x1;
    if ([r14 _cellCanBecomeFocused:r15] == 0x0) {
            rbx = [r15 _isFocusableElement];
    }
    [r14 release];
    rax = rbx;
    return rax;
}

void -[UICollectionViewCell _didUpdateFocusInContext:withAnimationCoordinator:](void * self, void * _cmd, void * arg2, void * arg3) {
    r13 = self;
    r15 = [arg2 retain];
    r14 = [arg3 retain];
    rbx = [[r15 nextFocusedView] retain];
    [rbx release];
    if (rbx == r13) {
            [r13 _ensureFocusedFloatingContentView];
            if (r13->_focusedFloatingContentView != 0x0) {
                    rbx = [[r13 superview] retain];
                    [rbx bringSubviewToFront:r13];
                    [rbx release];
            }
    }
    rdx = r15;
    rcx = r14;
    [r13 _updateFocusedFloatingContentControlStateInContext:rdx withAnimationCoordinator:rcx animated:0x1];
    rbx = [[r15 previouslyFocusedView] retain];
    [rbx release];
    if (rbx == r13) {
            rbx = [[r13 _collectionView] retain];
            [rbx _cellDidBecomeUnfocused:r13, rcx, 0x1];
            [rbx release];
    }
    rbx = [[r15 nextFocusedView] retain];
    [rbx release];
    if (rbx == r13) {
            rbx = [[r13 _collectionView] retain];
            [rbx _cellDidBecomeFocused:r13];
            [rbx release];
    }
    [[r13 super] _didUpdateFocusInContext:r15 withAnimationCoordinator:r14];
    [r14 release];
    [r15 release];
    return;
}

void * -[UICollectionViewCell _preferredConfigurationForFocusAnimation:inContext:](void * self, void * _cmd, NSInteger arg2, void * arg3) {
    r14 = arg2;
    rbx = self;
    r15 = [arg3 retain];
    [rbx _ensureFocusedFloatingContentView];
    rdi = rbx->_focusedFloatingContentView;
    if (rdi != 0x0) {
            rax = [rdi _preferredConfigurationForFocusAnimation:r14 inContext:r15];
    }
    else {
            rax = [[rbx super] _preferredConfigurationForFocusAnimation:r14 inContext:r15];
    }
    rbx = rax;
    [r15 release];
    rax = [rbx retain];
    rax = [rax autorelease];
    return rax;
}

void * -[UICollectionViewCell contentView](void * self, void * _cmd) {
    rax = self->_contentView;
    return rax;
}

void * -[UICollectionViewCell backgroundView](void * self, void * _cmd) {
    rax = self->_backgroundView;
    return rax;
}

void * -[UICollectionViewCell selectedBackgroundView](void * self, void * _cmd) {
    rax = self->_selectedBackgroundView;
    return rax;
}

bool -[UICollectionViewCell _isLayoutEngineSuspended](void * self, void * _cmd) {
    rax = self->_isLayoutEngineSuspended;
    return rax;
}

NSInteger -[UICollectionViewCell _focusStyle](void * self, void * _cmd) {
    rax = self->_focusStyle;
    return rax;
}

void -[UICollectionViewCell _setFocusStyle:](void * self, void * _cmd, NSInteger arg2) {
    self->_focusStyle = arg2;
    return;
}

void -[UICollectionViewCell .cxx_destruct](void * self, void * _cmd) {
    objc_storeStrong(*_OBJC_IVAR_$_UICollectionViewCell._highlightingSupport + self, 0x0);
    objc_storeStrong(*_OBJC_IVAR_$_UICollectionViewCell._selectionSegueTemplate + self, 0x0);
    objc_storeStrong(*_OBJC_IVAR_$_UICollectionViewCell._menuGesture + self, 0x0);
    objc_storeStrong(*_OBJC_IVAR_$_UICollectionViewCell._focusedFloatingContentView + self, 0x0);
    objc_storeStrong(*_OBJC_IVAR_$_UICollectionViewCell._selectedBackgroundView + self, 0x0);
    objc_storeStrong(*_OBJC_IVAR_$_UICollectionViewCell._backgroundView + self, 0x0);
    objc_storeStrong(self + *_OBJC_IVAR_$_UICollectionViewCell._contentView, 0x0);
    return;
}

