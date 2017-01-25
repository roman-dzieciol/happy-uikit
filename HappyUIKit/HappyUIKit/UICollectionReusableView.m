void * -[UICollectionReusableView initWithCoder:](void * self, void * _cmd, void * arg2) {
    r14 = [arg2 retain];
    rbx = [[self super] initWithCoder:r14];
    if (rbx != 0x0) {
            r15 = [[r14 decodeObjectForKey:@"UIReuseIdentifier"] retain];
            rbx->_reuseIdentifier = [r15 copy];
            [rbx->_reuseIdentifier release];
            [r15 release];
    }
    [r14 release];
    rax = rbx;
    return rax;
}

void -[UICollectionReusableView encodeWithCoder:](void * self, void * _cmd, void * arg2) {
    r14 = [arg2 retain];
    rdx = r14;
    [[self super] encodeWithCoder:rdx];
    if (self->_reuseIdentifier != 0x0) {
            [r14 encodeObject:rdx forKey:@"UIReuseIdentifier"];
    }
    [r14 release];
    return;
}

void -[UICollectionReusableView prepareForReuse](void * self, void * _cmd) {
    self->_reusableViewFlags = self->_reusableViewFlags & 0xfd;
    return;
}

void -[UICollectionReusableView applyLayoutAttributes:](void * self, void * _cmd, void * arg2) {
    return;
}

void -[UICollectionReusableView willTransitionFromLayout:toLayout:](void * self, void * _cmd, void * arg2, void * arg3) {
    return;
}

void -[UICollectionReusableView didTransitionFromLayout:toLayout:](void * self, void * _cmd, void * arg2, void * arg3) {
    return;
}

void -[UICollectionReusableView _setBaseLayoutAttributes:](void * self, void * _cmd, void * arg2) {
    r12 = self;
    r14 = [arg2 retain];
    if ([r12->_layoutAttributes isEqual:r14] == 0x0) {
            r12->_layoutAttributes = [r14 copy];
            [r12->_layoutAttributes release];
            rbx = [[r12->_layoutAttributes _reuseIdentifier] retain];
            [rbx release];
            if (rbx != 0x0) {
                    rbx = [[r14 _reuseIdentifier] retain];
                    [r12 _setReuseIdentifier:rbx];
                    [rbx release];
            }
    }
    rdi = r14;
    [rdi release];
    return;
}

oid -[UICollectionReusableView _setLayoutAttributes:](void * self, void * _cmd, void * arg2) {
    r15 = self;
    r14 = [arg2 retain];
    rdx = r14;
    if ([r15->_layoutAttributes isEqual:rdx] == 0x0) {
            r15->_layoutAttributes = [r14 copy];
            [r15->_layoutAttributes release];
            rbx = [[r15->_layoutAttributes _reuseIdentifier] retain];
            [rbx release];
            if (rbx != 0x0) {
                    rbx = [[r14 _reuseIdentifier] retain];
                    rdx = rbx;
                    [r15 _setReuseIdentifier:rdx];
                    [rbx release];
            }
            [r14 center];
            [r15 setCenter:rdx];
            [var_48 bounds];
            [r14 size];
            var_38 = intrinsic_movsd(var_38, xmm0);
            intrinsic_movsd(var_30, xmm1);
            [r15 setBounds:@selector(bounds), rcx];
            [r14 alpha];
            [r15 setAlpha:@selector(bounds)];
            r12 = [[r15 layer] retain];
            if (r14 != 0x0) {
                    r13 = var_D0;
                    [r13 transform3D];
            }
            else {
                    r13 = var_D0;
                    xmm0 = intrinsic_xorpd(xmm0, xmm0);
                    intrinsic_movapd(var_60, xmm0);
                    intrinsic_movapd(var_70, xmm0);
                    intrinsic_movapd(var_80, xmm0);
                    intrinsic_movapd(var_90, xmm0);
                    intrinsic_movapd(var_A0, xmm0);
                    intrinsic_movapd(var_B0, xmm0);
                    intrinsic_movapd(var_C0, xmm0);
                    intrinsic_movapd(var_D0, xmm0);
            }
            *rsp = rep intrinsic_movsq(*rsp, *r13);
            [r12 setTransform:rdx];
            [r12 release];
            if (!(BIT_TEST(*(r15 + *_OBJC_IVAR_$_UIView._viewFlags + 0x8), 0x32))) {
                    r12 = [[r15 layer] retain];
                    if (r12 != 0x0) {
                            [var_150 transform];
                            xmm0 = intrinsic_movsd(xmm0, *0xc4f838);
                            xmm0 = intrinsic_ucomisd(xmm0, var_150);
                            rcx = (xmm0 > 0x0 ? 0x1 : 0x0) & 0xff;
                    }
                    else {
                            xmm0 = intrinsic_xorpd(xmm0, xmm0);
                            intrinsic_movapd(var_E0, xmm0);
                            intrinsic_movapd(var_F0, xmm0);
                            intrinsic_movapd(var_100, xmm0);
                            intrinsic_movapd(var_110, xmm0);
                            intrinsic_movapd(var_120, xmm0);
                            intrinsic_movapd(var_130, xmm0);
                            intrinsic_movapd(var_140, xmm0);
                            intrinsic_movapd(var_150, xmm0);
                            rcx = 0x0;
                    }
                    rsi = *(r15 + *_OBJC_IVAR_$_UIView._viewFlags + 0x10) & 0xfffffffffffffffe;
                    rdx = 0x0 | *(r15 + *_OBJC_IVAR_$_UIView._viewFlags + 0x8);
                    r15->_viewFlags = r15->_viewFlags | 0x0;
                    *(r15 + *_OBJC_IVAR_$_UIView._viewFlags + 0x8) = rdx;
                    *(r15 + *_OBJC_IVAR_$_UIView._viewFlags + 0x10) = rsi | rcx;
                    [r12 release];
            }
            [r15 applyLayoutAttributes:r14];
    }
    [r14 release];
    return;
}

void * -[UICollectionReusableView _layoutAttributes](void * self, void * _cmd) {
    rax = objc_retainAutoreleaseReturnValue(self->_layoutAttributes);
    return rax;
}

void * -[UICollectionReusableView _collectionView](void * self, void * _cmd) {
    rax = objc_retainAutoreleaseReturnValue(self->_collectionView);
    return rax;
}

void -[UICollectionReusableView _setCollectionView:](void * self, void * _cmd, void * arg2) {
    self->_collectionView = arg2;
    return;
}

bool -[UICollectionReusableView _isInUpdateAnimation](void * self, void * _cmd) {
    rax = self->_updateAnimationCount <= 0x0 ? 0x1 : 0x0;
    return rax;
}

void -[UICollectionReusableView _addUpdateAnimation](void * self, void * _cmd) {
    self->_updateAnimationCount = self->_updateAnimationCount + 0x1;
    return;
}

void -[UICollectionReusableView _clearUpdateAnimation](void * self, void * _cmd) {
    rsi = _cmd;
    r12 = self;
    rax = r12->_updateAnimationCount;
    if (rax <= 0x0) {
            var_30 = rsi;
            rbx = [[NSString stringWithUTF8String:"/BuildRoot/Library/Caches/com.apple.xbs/Sources/UIKit_Sim/UIKit-3600.6.21/UICollectionViewCell.m"] retain];
            rdi = @"<Unknown File>";
            if (rbx != 0x0) {
                    rdi = rbx;
            }
            r15 = [rdi retain];
            [rbx release];
            rbx = [[NSAssertionHandler currentHandler] retain];
            [rbx handleFailureInMethod:var_30 object:r12 file:r15 lineNumber:0x87 description:@"unbalanced ending to update animation which apparently never began for this view (%@)"];
            [r15 release];
            [rbx release];
            rax = r12->_updateAnimationCount;
    }
    r12->_updateAnimationCount = rax - 0x1;
    return;
}

void -[UICollectionReusableView _markAsDequeued](void * self, void * _cmd) {
    self->_reusableViewFlags = self->_reusableViewFlags | 0x1;
    return;
}

bool -[UICollectionReusableView _wasDequeued](void * self, void * _cmd) {
    rax = self->_reusableViewFlags & 0x1;
    return rax;
}

bool -[UICollectionReusableView _disableRasterizeInAnimations](void * self, void * _cmd) {
    return 0x0;
}

void * -[UICollectionReusableView _preferredLayoutAttributesFittingAttributes:](void * self, void * _cmd, void * arg2) {
    self->_reusableViewFlags = self->_reusableViewFlags | 0x6;
    rax = [self preferredLayoutAttributesFittingAttributes:arg2];
    self->_reusableViewFlags = self->_reusableViewFlags & 0xfb;
    return rax;
}

void * -[UICollectionReusableView preferredLayoutAttributesFittingAttributes:](void * self, void * _cmd, void * arg2) {
    r12 = self;
    r14 = [arg2 retain];
    rbx = [[r12->_collectionView collectionViewLayout] retain];
    [rbx release];
    if (rbx != 0x0) {
            rbx = [[r12->_collectionView collectionViewLayout] retain];
            r15 = [rbx _cellsShouldConferWithAutolayoutEngineForSizingInfo];
            [rbx release];
            if (r15 != 0x0) {
                    [r14 size];
                    var_30 = intrinsic_movsd(var_30, xmm0);
                    var_38 = intrinsic_movsd(var_38, xmm1);
                    [r12 systemLayoutSizeFittingSize:rdx];
                    xmm2 = intrinsic_movsd(xmm2, var_30);
                    xmm2 = intrinsic_ucomisd(xmm2, xmm0);
                    if ((xmm2 == 0x0) && (!CPU_FLAGS & P)) {
                            xmm2 = intrinsic_movsd(xmm2, var_38);
                            xmm2 = intrinsic_ucomisd(xmm2, xmm1);
                            if (xmm2 == 0x0) {
                                    if (!CPU_FLAGS & NP) {
                                            var_38 = intrinsic_movsd(var_38, xmm0);
                                            var_30 = intrinsic_movsd(var_30, xmm1);
                                            rbx = [r14 copy];
                                            intrinsic_movsd(xmm0, var_38);
                                            intrinsic_movsd(xmm1, var_30);
                                            [rbx setSize:rdx];
                                    }
                                    else {
                                            rbx = [r14 retain];
                                    }
                            }
                            else {
                                    var_38 = intrinsic_movsd(var_38, xmm0);
                                    var_30 = intrinsic_movsd(var_30, xmm1);
                                    rbx = [r14 copy];
                                    intrinsic_movsd(xmm0, var_38);
                                    intrinsic_movsd(xmm1, var_30);
                                    [rbx setSize:rdx];
                            }
                    }
                    else {
                            var_38 = intrinsic_movsd(var_38, xmm0);
                            var_30 = intrinsic_movsd(var_30, xmm1);
                            rbx = [r14 copy];
                            intrinsic_movsd(xmm0, var_38);
                            intrinsic_movsd(xmm1, var_30);
                            [rbx setSize:rdx];
                    }
            }
            else {
                    rbx = [r14 retain];
            }
    }
    else {
            [r14 size];
            var_30 = intrinsic_movsd(var_30, xmm0);
            var_38 = intrinsic_movsd(var_38, xmm1);
            [r12 systemLayoutSizeFittingSize:rdx];
            xmm2 = intrinsic_movsd(xmm2, var_30);
            xmm2 = intrinsic_ucomisd(xmm2, xmm0);
            if ((xmm2 == 0x0) && (!CPU_FLAGS & P)) {
                    xmm2 = intrinsic_movsd(xmm2, var_38);
                    xmm2 = intrinsic_ucomisd(xmm2, xmm1);
                    if (xmm2 == 0x0) {
                            if (!CPU_FLAGS & NP) {
                                    var_38 = intrinsic_movsd(var_38, xmm0);
                                    var_30 = intrinsic_movsd(var_30, xmm1);
                                    rbx = [r14 copy];
                                    intrinsic_movsd(xmm0, var_38);
                                    intrinsic_movsd(xmm1, var_30);
                                    [rbx setSize:rdx];
                            }
                            else {
                                    rbx = [r14 retain];
                            }
                    }
                    else {
                            var_38 = intrinsic_movsd(var_38, xmm0);
                            var_30 = intrinsic_movsd(var_30, xmm1);
                            rbx = [r14 copy];
                            intrinsic_movsd(xmm0, var_38);
                            intrinsic_movsd(xmm1, var_30);
                            [rbx setSize:rdx];
                    }
            }
            else {
                    var_38 = intrinsic_movsd(var_38, xmm0);
                    var_30 = intrinsic_movsd(var_30, xmm1);
                    rbx = [r14 copy];
                    intrinsic_movsd(xmm0, var_38);
                    intrinsic_movsd(xmm1, var_30);
                    [rbx setSize:rdx];
            }
    }
    [r14 release];
    rdi = rbx;
    rax = [rdi autorelease];
    return rax;
}

bool -[UICollectionReusableView _arePreferredAttributesValid](void * self, void * _cmd) {
    rax = (self->_reusableViewFlags & 0x2) >> 0x1;
    return rax;
}

void -[UICollectionReusableView _invalidatePreferredAttributes](void * self, void * _cmd) {
    rdi = self;
    rcx = rdi->_reusableViewFlags;
    if ((rcx & 0x4) == 0x0) {
            rdi->_reusableViewFlags = rcx & 0xfd;
    }
    return;
}

bool -[UICollectionReusableView canBeEdited](void * self, void * _cmd) {
    return 0x0;
}

bool -[UICollectionReusableView isEditing](void * self, void * _cmd) {
    return 0x0;
}

void -[UICollectionReusableView setEditing:](void * self, void * _cmd, bool arg2) {
    return;
}

void * -[UICollectionReusableView reuseIdentifier](void * self, void * _cmd) {
    rax = objc_getProperty(self, _cmd, *_OBJC_IVAR_$_UICollectionReusableView._reuseIdentifier, 0x0);
    return rax;
}

void -[UICollectionReusableView _setReuseIdentifier:](void * self, void * _cmd, void * arg2) {
    objc_setProperty_nonatomic_copy(self, _cmd, arg2, *_OBJC_IVAR_$_UICollectionReusableView._reuseIdentifier);
    return;
}

void -[UICollectionReusableView setPreferredAttributesValid:](void * self, void * _cmd, bool arg2) {
    self->_preferredAttributesValid = arg2;
    return;
}

void -[UICollectionReusableView .cxx_destruct](void * self, void * _cmd) {
    objc_storeStrong(*_OBJC_IVAR_$_UICollectionReusableView._reuseIdentifier + self, 0x0);
    objc_storeStrong(self + *_OBJC_IVAR_$_UICollectionReusableView._layoutAttributes, 0x0);
    return;
}