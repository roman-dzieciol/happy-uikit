void * +[UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:](void * self, void * _cmd, void * arg2) {
    r14 = [arg2 retain];
    rbx = [[self alloc] init];
    rbx->_layoutFlags = rbx->_layoutFlags | 0x1;
    objc_storeStrong(*_OBJC_IVAR_$_UICollectionViewLayoutAttributes._elementKind + rbx, @"UICollectionElementKindCell");
    rbx->_indexPath = r14;
    [rbx->_indexPath release];
    rdi = rbx;
    rax = [rdi autorelease];
    return rax;
}

void * +[UICollectionViewLayoutAttributes layoutAttributesForSupplementaryViewOfKind:withIndexPath:](void * self, void * _cmd, void * arg2, void * arg3) {
    r12 = [arg2 retain];
    var_30 = [arg3 retain];
    rbx = [[self alloc] init];
    r14 = [arg2 copy];
    [r12 release];
    rbx->_elementKind = r14;
    [rbx->_elementKind release];
    rbx->_indexPath = var_30;
    [rbx->_indexPath release];
    rdi = rbx;
    rax = [rdi autorelease];
    return rax;
}

void * +[UICollectionViewLayoutAttributes layoutAttributesForDecorationViewOfKind:withIndexPath:](void * self, void * _cmd, void * arg2, void * arg3) {
    var_30 = [arg2 retain];
    r13 = [arg3 retain];
    rbx = [[self alloc] init];
    rbx->_indexPath = r13;
    var_38 = [r13 retain];
    [rbx->_indexPath release];
    rbx->_elementKind = [arg2 copy];
    [rbx->_elementKind release];
    r14 = [arg2 copy];
    [var_30 release];
    rbx->_reuseIdentifier = r14;
    [rbx->_reuseIdentifier release];
    [var_38 release];
    rbx->_layoutFlags = rbx->_layoutFlags | 0x2;
    rdi = rbx;
    rax = [rdi autorelease];
    return rax;
}

void * -[UICollectionViewLayoutAttributes init](void * self, void * _cmd) {
    rbx = [[self super] init];
    if (rbx != 0x0) {
            rdi = rbx + *_OBJC_IVAR_$_UICollectionViewLayoutAttributes._transform;
            *rdi = rep intrinsic_movsq(*rdi, *_CATransform3DIdentity);
            rbx->_alpha = 0x3ff0000000000000;
            *(rbx + *_OBJC_IVAR_$_UICollectionViewLayoutAttributes._frame + 0x18) = *_CGRectUnion;
            *(rbx + *_OBJC_IVAR_$_UICollectionViewLayoutAttributes._frame + 0x10) = *_CGRectStandardize;
            *(rbx + *_OBJC_IVAR_$_UICollectionViewLayoutAttributes._frame + 0x8) = *_CGRectOffset;
            rbx->_frame = *_CGRectNull;
            rbx->_layoutFlags = rbx->_layoutFlags & 0xf7;
            [@"_UICollectionElementIsOriginal" retain];
            rbx->_isCloneString = @"_UICollectionElementIsOriginal";
            [rbx->_isCloneString release];
    }
    rax = rbx;
    return rax;
}

void -[UICollectionViewLayoutAttributes setHidden:](void * self, void * _cmd, bool arg2) {
    self->_layoutFlags = self->_layoutFlags & 0xfb | arg2 << 0x2;
    return;
}

bool -[UICollectionViewLayoutAttributes isHidden](void * self, void * _cmd) {
    rax = (self->_layoutFlags & 0x4) >> 0x2;
    return rax;
}

void -[UICollectionViewLayoutAttributes _setIsClone:](void * self, void * _cmd, bool arg2) {
    rbx = self;
    rbx->_layoutFlags = rbx->_layoutFlags & 0xf7 | arg2 << 0x3;
    rdi = @"_UICollectionElementIsOriginal";
    if (arg2 != 0x0) {
            rdi = @"_UICollectionElementIsClone";
    }
    rax = [rdi retain];
    rdi = rbx->_isCloneString;
    rbx->_isCloneString = rax;
    [rdi release];
    return;
}

bool -[UICollectionViewLayoutAttributes _isClone](void * self, void * _cmd) {
    rax = (self->_layoutFlags & 0x8) >> 0x3;
    return rax;
}

void -[UICollectionViewLayoutAttributes _setElementKind:](void * self, void * _cmd, void * arg2) {
    r14 = self;
    rbx = [arg2 retain];
    r15 = r14->_elementKind;
    if (r15 != rbx) {
            r14->_elementKind = [rbx retain];
            [r15 release];
    }
    rdi = rbx;
    [rdi release];
    return;
}

void * -[UICollectionViewLayoutAttributes _elementKind](void * self, void * _cmd) {
    rax = objc_retainAutoreleaseReturnValue(self->_elementKind);
    return rax;
}

void -[UICollectionViewLayoutAttributes _setReuseIdentifier:](void * self, void * _cmd, void * arg2) {
    rdx = arg2;
    rbx = self;
    if (rbx->_reuseIdentifier != rdx) {
            rax = [rdx copy];
            rdi = rbx->_reuseIdentifier;
            rbx->_reuseIdentifier = rax;
            [rdi release];
    }
    return;
}

void * -[UICollectionViewLayoutAttributes _reuseIdentifier](void * self, void * _cmd) {
    rax = objc_retainAutoreleaseReturnValue(self->_reuseIdentifier);
    return rax;
}

void * -[UICollectionViewLayoutAttributes indexPath](void * self, void * _cmd) {
    rbx = self;
    rdi = rbx->_indexPath;
    if (rdi != 0x0) {
            if (*(int32_t *)__UIApplicationLinkedOnVersion != 0x0) {
                    if (*(int32_t *)__UIApplicationLinkedOnVersion < 0x70100) {
                            rdi = objc_retainAutorelease(rdi);
                    }
            }
            else {
                    rax = __UIApplicationLinkedOnOrAfter(0x70100);
                    rdi = rbx->_indexPath;
                    if (rax == 0x0) {
                            rdi = objc_retainAutorelease(rdi);
                    }
            }
    }
    else {
            rdi = *_indexPath.sharedNotFoundPath;
            if (rdi == 0x0) {
                    rax = [NSIndexPath indexPathForItem:rdx inSection:0x7fffffffffffffff];
                    rax = [rax retain];
                    rdi = *_indexPath.sharedNotFoundPath;
                    *_indexPath.sharedNotFoundPath = rax;
                    [rdi release];
                    rdi = *_indexPath.sharedNotFoundPath;
            }
    }
    rax = [rdi retain];
    rax = [rax autorelease];
    return rax;
}

void * -[UICollectionViewLayoutAttributes copyWithZone:](void * self, void * _cmd, struct _NSZone * arg2) {
    rbx = [[[self class] alloc] init];
    rbx->_alpha = self->_alpha;
    rbx->_layoutFlags = rbx->_layoutFlags & 0xfb | self->_layoutFlags & 0x4;
    objc_storeStrong(*_OBJC_IVAR_$_UICollectionViewLayoutAttributes._indexPath + rbx, self->_indexPath);
    rbx->_reuseIdentifier = [self->_reuseIdentifier copy];
    [rbx->_reuseIdentifier release];
    rbx->_elementKind = [self->_elementKind copy];
    [rbx->_elementKind release];
    rbx->_zIndex = self->_zIndex;
    rbx->_layoutFlags = rbx->_layoutFlags & 0xfe | self->_layoutFlags & 0x1;
    rbx->_layoutFlags = (rbx->_layoutFlags & 0xfe | self->_layoutFlags & 0x1) & 0xfd | self->_layoutFlags & 0x2;
    rbx->_layoutFlags = ((rbx->_layoutFlags & 0xfe | self->_layoutFlags & 0x1) & 0xfd | self->_layoutFlags & 0x2) & 0xf7 | self->_layoutFlags & 0x8;
    rdi = rbx + *_OBJC_IVAR_$_UICollectionViewLayoutAttributes._transform;
    *rdi = rep intrinsic_movsq(*rdi, self->_transform);
    *(rbx + *_OBJC_IVAR_$_UICollectionViewLayoutAttributes._center + 0x8) = *(self + *_OBJC_IVAR_$_UICollectionViewLayoutAttributes._center + 0x8);
    rbx->_center = self->_center;
    *(rbx + *_OBJC_IVAR_$_UICollectionViewLayoutAttributes._size + 0x8) = *(self + *_OBJC_IVAR_$_UICollectionViewLayoutAttributes._size + 0x8);
    rbx->_size = self->_size;
    *(rbx + *_OBJC_IVAR_$_UICollectionViewLayoutAttributes._frame + 0x18) = *(self + *_OBJC_IVAR_$_UICollectionViewLayoutAttributes._frame + 0x18);
    *(rbx + *_OBJC_IVAR_$_UICollectionViewLayoutAttributes._frame + 0x10) = *(self + *_OBJC_IVAR_$_UICollectionViewLayoutAttributes._frame + 0x10);
    *(rbx + *_OBJC_IVAR_$_UICollectionViewLayoutAttributes._frame + 0x8) = *(self + *_OBJC_IVAR_$_UICollectionViewLayoutAttributes._frame + 0x8);
    rbx->_frame = self->_frame;
    rax = rbx;
    return rax;
}

struct CGRect -[UICollectionViewLayoutAttributes frame](void * self, void * _cmd) {
    rbx = _cmd;
    r14 = self;
    r15 = rbx + *_OBJC_IVAR_$_UICollectionViewLayoutAttributes._frame;
    if (CGRectIsNull(self) != 0x0) {
            if (*___geometryCalculationLayer == 0x0) {
                    rax = [CALayer alloc];
                    rax = [rax init];
                    rdi = *___geometryCalculationLayer;
                    *___geometryCalculationLayer = rax;
                    [rdi release];
            }
            rdi = *___geometryCalculationLayer;
            xmm0 = intrinsic_movsd(xmm0, rbx->_center);
            xmm1 = intrinsic_movsd(xmm1, *(rbx + *_OBJC_IVAR_$_UICollectionViewLayoutAttributes._center + 0x8));
            [rdi setPosition:rdx];
            rdi = *___geometryCalculationLayer;
            xmm0 = intrinsic_movups(xmm0, rbx->_size);
            var_40 = intrinsic_movapd(var_40, intrinsic_xorpd(xmm1, xmm1));
            intrinsic_movaps(var_30, xmm0);
            [rdi setBounds:rdx, rcx];
            rax = *___geometryCalculationLayer;
            *var_C0 = rep intrinsic_movsq(*var_C0, rbx->_transform, var_C0, 0x10);
            *rsp = rep intrinsic_movsq(*rsp, *var_C0);
            [rax setTransform:rdx];
            if (*___geometryCalculationLayer != 0x0) {
                    rbx = var_E0;
                    [rbx frame];
            }
            else {
                    rbx = var_E0;
                    intrinsic_movaps(var_D0, 0x0);
                    intrinsic_movaps(var_E0, 0x0);
            }
            *(r15 + 0x18) = *(rbx + 0x18);
            *(r15 + 0x10) = *(rbx + 0x10);
            *(r15 + 0x8) = *(rbx + 0x8);
            *r15 = *rbx;
    }
    *(r14 + 0x18) = *(r15 + 0x18);
    *(r14 + 0x10) = *(r15 + 0x10);
    *(r14 + 0x8) = *(r15 + 0x8);
    *r14 = *r15;
    rax = r14;
    return rax;
}

void * -[UICollectionViewLayoutAttributes initialLayoutAttributesForInsertedDecorationElementOfKind:atIndexPath:](void * self, void * _cmd, void * arg2, void * arg3) {
    return 0x0;
}

struct CGRect -[UICollectionViewLayoutAttributes bounds](void * self, void * _cmd) {
    [_cmd size];
    *(self + 0x8) = 0x0;
    *self = 0x0;
    *(self + 0x10) = intrinsic_movsd(*(self + 0x10), xmm0);
    *(self + 0x18) = intrinsic_movsd(*(self + 0x18), xmm1);
    rax = self;
    return rax;
}

void -[UICollectionViewLayoutAttributes setBounds:](void * self, void * _cmd, struct CGRect arg2) {
    rsi = _cmd;
    r12 = self;
    r14 = arg_0;
    xmm1 = intrinsic_movsd(xmm1, arg_0, arg2);
    xmm1 = intrinsic_ucomisd(xmm1, 0x0);
    if ((xmm1 == 0x0) && (!CPU_FLAGS & P)) {
            xmm1 = intrinsic_movsd(xmm1, *(r14 + 0x8));
            xmm1 = intrinsic_ucomisd(xmm1, 0x0);
            if ((xmm1 != 0x0) || (!CPU_FLAGS & NP)) {
                    var_30 = rsi;
                    rbx = [[NSString stringWithUTF8String:"/BuildRoot/Library/Caches/com.apple.xbs/Sources/UIKit_Sim/UIKit-3600.6.21/UICollectionViewLayout.m"] retain];
                    rdi = @"<Unknown File>";
                    if (rbx != 0x0) {
                            rdi = rbx;
                    }
                    r15 = [rdi retain];
                    [rbx release];
                    rdi = [NSAssertionHandler currentHandler];
                    r13 = [rdi retain];
                    r14 = [_NSStringFromCGRect(rdi, @selector(currentHandler)) retain];
                    rdx = var_30;
                    [r13 handleFailureInMethod:rdx object:r12 file:r15 lineNumber:0xdd description:@"UICollectionViewLayoutAttributes bounds must be set with a (0,0) origin %@ - %@"];
                    [r15 release];
                    rdi = r14;
                    r14 = arg_0;
                    [rdi release];
                    [r13 release];
            }
    }
    else {
            var_30 = rsi;
            rbx = [[NSString stringWithUTF8String:"/BuildRoot/Library/Caches/com.apple.xbs/Sources/UIKit_Sim/UIKit-3600.6.21/UICollectionViewLayout.m"] retain];
            rdi = @"<Unknown File>";
            if (rbx != 0x0) {
                    rdi = rbx;
            }
            r15 = [rdi retain];
            [rbx release];
            rdi = [NSAssertionHandler currentHandler];
            r13 = [rdi retain];
            r14 = [_NSStringFromCGRect(rdi, @selector(currentHandler)) retain];
            rdx = var_30;
            [r13 handleFailureInMethod:rdx object:r12 file:r15 lineNumber:0xdd description:@"UICollectionViewLayoutAttributes bounds must be set with a (0,0) origin %@ - %@"];
            [r15 release];
            rdi = r14;
            r14 = arg_0;
            [rdi release];
            [r13 release];
    }
    intrinsic_movsd(0x0, *(r14 + 0x10));
    intrinsic_movsd(xmm1, *(r14 + 0x18));
    [r12 setSize:rdx];
    return;
}

void -[UICollectionViewLayoutAttributes setFrame:](void * self, void * _cmd, struct CGRect arg2) {
    rdx = arg2;
    rsi = _cmd;
    rdi = self;
    var_30 = rsi;
    r12 = rdi;
    r13 = arg_0;
    if (*(int32_t *)__UIApplicationLinkedOnVersion != 0x0) {
            if (*(int32_t *)__UIApplicationLinkedOnVersion >= 0xa0000) {
                    if (CGRectEqualToRect(rdi, rsi) != 0x0) {
                            rbx = [[NSString stringWithUTF8String:"/BuildRoot/Library/Caches/com.apple.xbs/Sources/UIKit_Sim/UIKit-3600.6.21/UICollectionViewLayout.m"] retain];
                            rdi = @"<Unknown File>";
                            if (rbx != 0x0) {
                                    rdi = rbx;
                            }
                            r15 = [rdi retain];
                            [rbx release];
                            rbx = [[NSAssertionHandler currentHandler] retain];
                            rsi = @selector(handleFailureInMethod:object:file:lineNumber:description:);
                            rdx = var_30;
                            _objc_msgSend(rbx, rsi);
                            [r15 release];
                            rdi = rbx;
                            [rdi release];
                    }
                    if (CGRectEqualToRect(rdi, rsi) != 0x0) {
                            rbx = [[NSString stringWithUTF8String:"/BuildRoot/Library/Caches/com.apple.xbs/Sources/UIKit_Sim/UIKit-3600.6.21/UICollectionViewLayout.m"] retain];
                            rdi = @"<Unknown File>";
                            if (rbx != 0x0) {
                                    rdi = rbx;
                            }
                            r15 = [rdi retain];
                            [rbx release];
                            rbx = [[NSAssertionHandler currentHandler] retain];
                            rdx = var_30;
                            [rbx handleFailureInMethod:rdx object:r12 file:r15 lineNumber:0xe5 description:@"UICollectionViewLayoutAttributes: -setFrame: with CGRectNull is undefined."];
                            [r15 release];
                            [rbx release];
                    }
            }
    }
    else {
            rdi = 0xa0000;
            if (__UIApplicationLinkedOnOrAfter(rdi) != 0x0) {
                    if (CGRectEqualToRect(rdi, rsi) != 0x0) {
                            rbx = [[NSString stringWithUTF8String:"/BuildRoot/Library/Caches/com.apple.xbs/Sources/UIKit_Sim/UIKit-3600.6.21/UICollectionViewLayout.m"] retain];
                            rdi = @"<Unknown File>";
                            if (rbx != 0x0) {
                                    rdi = rbx;
                            }
                            r15 = [rdi retain];
                            [rbx release];
                            rbx = [[NSAssertionHandler currentHandler] retain];
                            rsi = @selector(handleFailureInMethod:object:file:lineNumber:description:);
                            rdx = var_30;
                            _objc_msgSend(rbx, rsi);
                            [r15 release];
                            rdi = rbx;
                            [rdi release];
                    }
                    if (CGRectEqualToRect(rdi, rsi) != 0x0) {
                            rbx = [[NSString stringWithUTF8String:"/BuildRoot/Library/Caches/com.apple.xbs/Sources/UIKit_Sim/UIKit-3600.6.21/UICollectionViewLayout.m"] retain];
                            rdi = @"<Unknown File>";
                            if (rbx != 0x0) {
                                    rdi = rbx;
                            }
                            r15 = [rdi retain];
                            [rbx release];
                            rbx = [[NSAssertionHandler currentHandler] retain];
                            rdx = var_30;
                            [rbx handleFailureInMethod:rdx object:r12 file:r15 lineNumber:0xe5 description:@"UICollectionViewLayoutAttributes: -setFrame: with CGRectNull is undefined."];
                            [r15 release];
                            [rbx release];
                    }
            }
    }
    intrinsic_movsd(xmm0, *(r13 + 0x10));
    intrinsic_movsd(xmm1, *(r13 + 0x18));
    [r12 setSize:rdx];
    _UIRectGetCenter();
    [r12 setCenter:rdx];
    rbx = *_OBJC_IVAR_$_UICollectionViewLayoutAttributes._frame + r12;
    *rsp = rep intrinsic_movsq(*rsp, r12->_transform);
    if (CATransform3DIsIdentity(rsp) != 0x0) {
            *(rbx + 0x18) = *(r13 + 0x18);
            *(rbx + 0x10) = *(r13 + 0x10);
            *(rbx + 0x8) = *(r13 + 0x8);
            *rbx = *r13;
    }
    else {
            *(rbx + 0x18) = *_CGRectUnion;
            *(rbx + 0x10) = *_CGRectStandardize;
            *(rbx + 0x8) = *_CGRectOffset;
            *rbx = *_CGRectNull;
    }
    return;
}

void -[UICollectionViewLayoutAttributes setSize:](void * self, void * _cmd, struct CGSize arg2) {
    rdi = self;
    xmm2 = intrinsic_movsd(xmm2, rdi->_size, arg2);
    xmm2 = intrinsic_ucomisd(xmm2, xmm0);
    if ((xmm2 == 0x0) && (!CPU_FLAGS & P)) {
            xmm2 = intrinsic_movsd(xmm2, *(rdi + *_OBJC_IVAR_$_UICollectionViewLayoutAttributes._size + 0x8));
            xmm2 = intrinsic_ucomisd(xmm2, xmm1);
            if (xmm2 == 0x0) {
                    if (!CPU_FLAGS & NP) {
                            rdi->_size = intrinsic_movsd(rdi->_size, xmm0);
                            *(rdi + *_OBJC_IVAR_$_UICollectionViewLayoutAttributes._size + 0x8) = intrinsic_movsd(*(rdi + *_OBJC_IVAR_$_UICollectionViewLayoutAttributes._size + 0x8), xmm1);
                            *(rdi + *_OBJC_IVAR_$_UICollectionViewLayoutAttributes._frame + 0x18) = *_CGRectUnion;
                            *(rdi + *_OBJC_IVAR_$_UICollectionViewLayoutAttributes._frame + 0x10) = *_CGRectStandardize;
                            *(rdi + *_OBJC_IVAR_$_UICollectionViewLayoutAttributes._frame + 0x8) = *_CGRectOffset;
                            rdi->_frame = *_CGRectNull;
                    }
            }
            else {
                    rdi->_size = intrinsic_movsd(rdi->_size, xmm0);
                    *(rdi + *_OBJC_IVAR_$_UICollectionViewLayoutAttributes._size + 0x8) = intrinsic_movsd(*(rdi + *_OBJC_IVAR_$_UICollectionViewLayoutAttributes._size + 0x8), xmm1);
                    *(rdi + *_OBJC_IVAR_$_UICollectionViewLayoutAttributes._frame + 0x18) = *_CGRectUnion;
                    *(rdi + *_OBJC_IVAR_$_UICollectionViewLayoutAttributes._frame + 0x10) = *_CGRectStandardize;
                    *(rdi + *_OBJC_IVAR_$_UICollectionViewLayoutAttributes._frame + 0x8) = *_CGRectOffset;
                    rdi->_frame = *_CGRectNull;
            }
    }
    else {
            rdi->_size = intrinsic_movsd(rdi->_size, xmm0);
            *(rdi + *_OBJC_IVAR_$_UICollectionViewLayoutAttributes._size + 0x8) = intrinsic_movsd(*(rdi + *_OBJC_IVAR_$_UICollectionViewLayoutAttributes._size + 0x8), xmm1);
            *(rdi + *_OBJC_IVAR_$_UICollectionViewLayoutAttributes._frame + 0x18) = *_CGRectUnion;
            *(rdi + *_OBJC_IVAR_$_UICollectionViewLayoutAttributes._frame + 0x10) = *_CGRectStandardize;
            *(rdi + *_OBJC_IVAR_$_UICollectionViewLayoutAttributes._frame + 0x8) = *_CGRectOffset;
            rdi->_frame = *_CGRectNull;
    }
    return;
}

void -[UICollectionViewLayoutAttributes setCenter:](void * self, void * _cmd, struct CGPoint arg2) {
    rdi = self;
    rbx = rdi;
    xmm2 = intrinsic_movsd(xmm2, rbx->_center, arg2);
    xmm2 = intrinsic_ucomisd(xmm2, xmm0);
    if ((xmm2 == 0x0) && (!CPU_FLAGS & P)) {
            xmm2 = intrinsic_movsd(xmm2, *(rbx + *_OBJC_IVAR_$_UICollectionViewLayoutAttributes._center + 0x8));
            xmm2 = intrinsic_ucomisd(xmm2, xmm1);
            if ((xmm2 != 0x0) || (!CPU_FLAGS & NP)) {
                    var_20 = intrinsic_movsd(var_20, xmm1);
                    var_28 = intrinsic_movsd(var_28, xmm0);
                    rax = CGRectIsNull(rdi);
                    xmm2 = intrinsic_movsd(xmm2, var_28);
                    xmm1 = intrinsic_movsd(xmm1, var_20);
                    if (rax == 0x0) {
                            xmm0 = intrinsic_movapd(xmm0, xmm2);
                            xmm0 = intrinsic_subsd(xmm0, rbx->_center);
                            xmm0 = intrinsic_addsd(xmm0, rbx->_frame);
                            rbx->_frame = intrinsic_movsd(rbx->_frame, xmm0);
                            *(0x8 + *_OBJC_IVAR_$_UICollectionViewLayoutAttributes._frame + rbx) = intrinsic_movsd(*(0x8 + *_OBJC_IVAR_$_UICollectionViewLayoutAttributes._frame + rbx), intrinsic_addsd(intrinsic_subsd(intrinsic_movapd(xmm0, xmm1), *(rbx + *_OBJC_IVAR_$_UICollectionViewLayoutAttributes._center + 0x8)), *(0x8 + *_OBJC_IVAR_$_UICollectionViewLayoutAttributes._frame + rbx)));
                    }
                    rbx->_center = intrinsic_movsd(rbx->_center, xmm2);
                    *(rbx + *_OBJC_IVAR_$_UICollectionViewLayoutAttributes._center + 0x8) = intrinsic_movsd(*(rbx + *_OBJC_IVAR_$_UICollectionViewLayoutAttributes._center + 0x8), xmm1);
            }
    }
    else {
            var_20 = intrinsic_movsd(var_20, xmm1);
            var_28 = intrinsic_movsd(var_28, xmm0);
            rax = CGRectIsNull(rdi);
            xmm2 = intrinsic_movsd(xmm2, var_28);
            xmm1 = intrinsic_movsd(xmm1, var_20);
            if (rax == 0x0) {
                    xmm0 = intrinsic_movapd(xmm0, xmm2);
                    xmm0 = intrinsic_subsd(xmm0, rbx->_center);
                    xmm0 = intrinsic_addsd(xmm0, rbx->_frame);
                    rbx->_frame = intrinsic_movsd(rbx->_frame, xmm0);
                    *(0x8 + *_OBJC_IVAR_$_UICollectionViewLayoutAttributes._frame + rbx) = intrinsic_movsd(*(0x8 + *_OBJC_IVAR_$_UICollectionViewLayoutAttributes._frame + rbx), intrinsic_addsd(intrinsic_subsd(intrinsic_movapd(xmm0, xmm1), *(rbx + *_OBJC_IVAR_$_UICollectionViewLayoutAttributes._center + 0x8)), *(0x8 + *_OBJC_IVAR_$_UICollectionViewLayoutAttributes._frame + rbx)));
            }
            rbx->_center = intrinsic_movsd(rbx->_center, xmm2);
            *(rbx + *_OBJC_IVAR_$_UICollectionViewLayoutAttributes._center + 0x8) = intrinsic_movsd(*(rbx + *_OBJC_IVAR_$_UICollectionViewLayoutAttributes._center + 0x8), xmm1);
    }
    return;
}

void -[UICollectionViewLayoutAttributes setTransform3D:](void * self, void * _cmd, struct CATransform3D arg2) {
    r15 = self;
    r14 = arg_0;
    rbx = *_OBJC_IVAR_$_UICollectionViewLayoutAttributes._transform + r15;
    *rsp = rep intrinsic_movsq(*rsp, *r14, arg2, 0x10);
    *(rsp - 0xffffffffffffff80) = rep intrinsic_movsq(*(rsp - 0xffffffffffffff80), *rbx);
    if (CATransform3DEqualToTransform(rsp - 0xffffffffffffff80, rbx) == 0x0) {
            *rbx = rep intrinsic_movsq(*rbx, *r14);
            *(r15 + *_OBJC_IVAR_$_UICollectionViewLayoutAttributes._frame + 0x18) = *_CGRectUnion;
            *(r15 + *_OBJC_IVAR_$_UICollectionViewLayoutAttributes._frame + 0x10) = *_CGRectStandardize;
            *(r15 + *_OBJC_IVAR_$_UICollectionViewLayoutAttributes._frame + 0x8) = *_CGRectOffset;
            r15->_frame = *_CGRectNull;
    }
    return;
}

void -[UICollectionViewLayoutAttributes setTransform:](void * self, void * _cmd, struct CGAffineTransform arg2) {
    CATransform3DMakeAffineTransform(var_90);
    *rsp = rep intrinsic_movsq(*rsp, *var_90);
    [self setTransform3D:arg2];
    return;
}

struct CGAffineTransform -[UICollectionViewLayoutAttributes transform](void * self, void * _cmd) {
    r14 = self;
    rbx = _cmd + *_OBJC_IVAR_$_UICollectionViewLayoutAttributes._transform;
    *rsp = rep intrinsic_movsq(*rsp, *rbx);
    if (CATransform3DIsAffine(rsp) != 0x0) {
            *rsp = rep intrinsic_movsq(*rsp, *rbx);
            CATransform3DGetAffineTransform(r14);
    }
    else {
            *(r14 + 0x28) = *_CGAffineTransformMakeTranslation;
            *(r14 + 0x20) = *_CGAffineTransformMakeScale;
            *(r14 + 0x18) = *_CGAffineTransformMakeRotation;
            *(r14 + 0x10) = *_CGAffineTransformIsIdentity;
            *(r14 + 0x8) = *_CGAffineTransformInvert;
            *r14 = *_CGAffineTransformIdentity;
    }
    rax = r14;
    return rax;
}

void * -[UICollectionViewLayoutAttributes description](void * self, void * _cmd) {
    r12 = self;
    rbx = [[[r12 super] description] retain];
    r14 = [[NSMutableString stringWithFormat:@"%@ ", rbx] retain];
    [rbx release];
    [r14 appendFormat:@"index path: (%@); "];
    if ((r12->_layoutFlags & 0x1) == 0x0) {
            [r14 appendFormat:@"element kind: (%@); "];
    }
    [var_58 frame];
    xmm0 = intrinsic_movsd(xmm0, var_58);
    intrinsic_movsd(xmm1, var_50);
    intrinsic_movsd(xmm2, var_48);
    intrinsic_movsd(xmm3, var_40);
    [r14 appendFormat:@"frame = (%g %g; %g %g); "];
    [var_D8 transform3D];
    *rsp = rep intrinsic_movsq(*rsp, *var_D8);
    if (CATransform3DIsIdentity(rsp) == 0x0) {
            *rsp = rep intrinsic_movsq(*rsp, *var_D8);
            if (CATransform3DIsAffine(rsp) != 0x0) {
                    *rsp = rep intrinsic_movsq(*rsp, *var_D8);
                    CATransform3DGetAffineTransform(var_108);
                    rbx = [_NSStringFromCGAffineTransform(var_108, var_D8) retain];
                    [r14 appendFormat:@"transform = %@; "];
                    [rbx release];
            }
            else {
                    [r14 appendString:@"non-affine transform; "];
            }
    }
    if ([r12 isHidden] != 0x0) {
            [r14 appendFormat:@"hidden = YES; "];
    }
    [r12 alpha];
    xmm0 = intrinsic_ucomisd(xmm0, *0xc4f410);
    if ((xmm0 != 0x0) || (!CPU_FLAGS & NP)) {
            [r14 appendFormat:@"alpha = %g; "];
    }
    if (r12->_zIndex != 0x0) {
            [r14 appendFormat:@"zIndex = %ld; "];
    }
    if ((r12->_layoutFlags & 0x8) != 0x0) {
            [r14 appendFormat:@"IS CLONE; "];
    }
    rdi = r14;
    rax = [rdi autorelease];
    return rax;
}

bool -[UICollectionViewLayoutAttributes isEqual:](void * self, void * _cmd, void * arg2) {
    rbx = arg2;
    r14 = self;
    rax = 0x1;
    if (rbx != r14) {
            if (([rbx isKindOfClass:[UICollectionViewLayoutAttributes class]] != 0x0) && ([r14->_indexPath isEqual:rbx->_indexPath] != 0x0)) {
                    rax = [r14 _isEquivalentTo:rbx];
            }
            else {
                    rax = 0x0;
            }
    }
    return rax;
}

bool -[UICollectionViewLayoutAttributes _isEquivalentTo:](void * self, void * _cmd, void * arg2) {
    rbx = arg2;
    r14 = self;
    if (rbx != 0x0) {
            xmm1 = intrinsic_movsd(xmm1, r14->_alpha);
            rax = 0x1;
            xmm0 = intrinsic_xorpd(xmm0, xmm0);
            xmm1 = intrinsic_ucomisd(xmm1, xmm0);
            if ((xmm1 != 0x0) || (!CPU_FLAGS & NP)) {
                    rax = (r14->_layoutFlags & 0x4) >> 0x2;
            }
            xmm1 = intrinsic_movsd(xmm1, rbx->_alpha);
            xmm1 = intrinsic_ucomisd(xmm1, xmm0);
            if ((xmm1 == 0x0) && (!CPU_FLAGS & P)) {
                    if (rax != 0x0) {
                            xmm0 = intrinsic_movsd(xmm0, r14->_center);
                            xmm1 = intrinsic_movsd(xmm1, *(r14 + *_OBJC_IVAR_$_UICollectionViewLayoutAttributes._center + 0x8));
                            xmm2 = intrinsic_movsd(xmm2, rbx->_center);
                            xmm3 = intrinsic_movsd(xmm3, *(rbx + *_OBJC_IVAR_$_UICollectionViewLayoutAttributes._center + 0x8));
                            if (__UIPointEquivalentToPoint() != 0x0) {
                                    xmm0 = intrinsic_movsd(xmm0, r14->_size);
                                    intrinsic_movsd(xmm1, *(r14 + *_OBJC_IVAR_$_UICollectionViewLayoutAttributes._size + 0x8));
                                    intrinsic_movsd(xmm2, rbx->_size);
                                    intrinsic_movsd(xmm3, *(rbx + *_OBJC_IVAR_$_UICollectionViewLayoutAttributes._size + 0x8));
                                    if (__UISizeEquivalentToSize() != 0x0) {
                                            rsi = r14 + *_OBJC_IVAR_$_UICollectionViewLayoutAttributes._transform;
                                            rax = *_OBJC_IVAR_$_UICollectionViewLayoutAttributes._transform + rbx;
                                            *rsp = rep intrinsic_movsq(*rsp, *rsi, rsp, 0x10);
                                            *(rsp - 0xffffffffffffff80) = rep intrinsic_movsq(*(rsp - 0xffffffffffffff80), *rax, rsp - 0xffffffffffffff80, 0x10);
                                            if ((CATransform3DEqualToTransform(rsp - 0xffffffffffffff80, rax) != 0x0) && (r14->_zIndex == rbx->_zIndex)) {
                                                    if ([r14->_elementKind isEqualToString:rbx->_elementKind] != 0x0) {
                                                            if ((r14->_layoutFlags >> 0x3 & 0x1 & 0xff) == ([rbx _isClone] & 0xff)) {
                                                                    xmm0 = intrinsic_movsd(xmm0, r14->_alpha);
                                                                    var_28 = intrinsic_movsd(var_28, xmm0);
                                                                    [rbx alpha];
                                                                    asm { cmpeqsd    xmm0, qword [rbp+var_28] };
                                                                    rax = zero_extend_64(xmm0) & 0x1;
                                                            }
                                                            else {
                                                                    rax = 0x0;
                                                            }
                                                    }
                                                    else {
                                                            rax = 0x0;
                                                    }
                                            }
                                            else {
                                                    rax = 0x0;
                                            }
                                    }
                                    else {
                                            rax = 0x0;
                                    }
                            }
                            else {
                                    rax = 0x0;
                            }
                    }
                    else {
                            rax = 0x0;
                    }
            }
            else {
                    if ((rax & 0xff) == ((rbx->_layoutFlags & 0x4) >> 0x2 & 0xff)) {
                            xmm0 = intrinsic_movsd(xmm0, r14->_center);
                            xmm1 = intrinsic_movsd(xmm1, *(r14 + *_OBJC_IVAR_$_UICollectionViewLayoutAttributes._center + 0x8));
                            xmm2 = intrinsic_movsd(xmm2, rbx->_center);
                            xmm3 = intrinsic_movsd(xmm3, *(rbx + *_OBJC_IVAR_$_UICollectionViewLayoutAttributes._center + 0x8));
                            if (__UIPointEquivalentToPoint() != 0x0) {
                                    xmm0 = intrinsic_movsd(xmm0, r14->_size);
                                    intrinsic_movsd(xmm1, *(r14 + *_OBJC_IVAR_$_UICollectionViewLayoutAttributes._size + 0x8));
                                    intrinsic_movsd(xmm2, rbx->_size);
                                    intrinsic_movsd(xmm3, *(rbx + *_OBJC_IVAR_$_UICollectionViewLayoutAttributes._size + 0x8));
                                    if (__UISizeEquivalentToSize() != 0x0) {
                                            rsi = r14 + *_OBJC_IVAR_$_UICollectionViewLayoutAttributes._transform;
                                            rax = *_OBJC_IVAR_$_UICollectionViewLayoutAttributes._transform + rbx;
                                            *rsp = rep intrinsic_movsq(*rsp, *rsi, rsp, 0x10);
                                            *(rsp - 0xffffffffffffff80) = rep intrinsic_movsq(*(rsp - 0xffffffffffffff80), *rax, rsp - 0xffffffffffffff80, 0x10);
                                            if ((CATransform3DEqualToTransform(rsp - 0xffffffffffffff80, rax) != 0x0) && (r14->_zIndex == rbx->_zIndex)) {
                                                    if ([r14->_elementKind isEqualToString:rbx->_elementKind] != 0x0) {
                                                            if ((r14->_layoutFlags >> 0x3 & 0x1 & 0xff) == ([rbx _isClone] & 0xff)) {
                                                                    xmm0 = intrinsic_movsd(xmm0, r14->_alpha);
                                                                    var_28 = intrinsic_movsd(var_28, xmm0);
                                                                    [rbx alpha];
                                                                    asm { cmpeqsd    xmm0, qword [rbp+var_28] };
                                                                    rax = zero_extend_64(xmm0) & 0x1;
                                                            }
                                                            else {
                                                                    rax = 0x0;
                                                            }
                                                    }
                                                    else {
                                                            rax = 0x0;
                                                    }
                                            }
                                            else {
                                                    rax = 0x0;
                                            }
                                    }
                                    else {
                                            rax = 0x0;
                                    }
                            }
                            else {
                                    rax = 0x0;
                            }
                    }
                    else {
                            rax = 0x0;
                    }
            }
    }
    else {
            rax = 0x0;
    }
    return rax;
}

bool -[UICollectionViewLayoutAttributes _isTransitionVisibleTo:](void * self, void * _cmd, void * arg2) {
    r14 = arg2;
    r15 = self;
    [self alpha];
    xmm0 = intrinsic_ucomisd(xmm0, 0x0);
    if ((xmm0 == 0x0) && (!CPU_FLAGS & P)) {
            rbx = 0x0;
    }
    else {
            rbx = [r15 isHidden] ^ 0x1;
    }
    [r14 alpha];
    xmm0 = intrinsic_ucomisd(xmm0, *0xc4ff40);
    if ((xmm0 == 0x0) && (!CPU_FLAGS & P)) {
            rax = 0x0;
    }
    else {
            rax = [r14 isHidden];
            rax = rax ^ 0x1;
    }
    if (((rbx | rax) & 0xff) == 0x1) {
            [r15 size];
            xmm2 = intrinsic_movsd(xmm2, *_CGSizeZero);
            xmm0 = intrinsic_ucomisd(xmm0, xmm2);
            if ((xmm0 == 0x0) && (!CPU_FLAGS & P)) {
                    xmm0 = intrinsic_movsd(xmm0, *_CPBitmapCreateImagesFromData);
                    xmm1 = intrinsic_ucomisd(0x0, xmm0);
                    if ((xmm1 == 0x0) && (!CPU_FLAGS & P)) {
                            var_30 = intrinsic_movsd(var_30, xmm2);
                            var_28 = intrinsic_movsd(var_28, xmm0);
                            [r14 size];
                            xmm0 = intrinsic_ucomisd(xmm0, var_30);
                            COND = xmm0 != 0x0;
                            xmm0 = intrinsic_movsd(xmm0, var_28);
                            if ((!COND) && (!CPU_FLAGS & P)) {
                                    xmm1 = intrinsic_ucomisd(xmm1, xmm0);
                                    if (xmm1 == 0x0) {
                                            if (!CPU_FLAGS & NP) {
                                                    rax = [r15 _isEquivalentTo:r14];
                                                    rax = rax ^ 0x1;
                                            }
                                            else {
                                                    rax = 0x0;
                                            }
                                    }
                                    else {
                                            rax = [r15 _isEquivalentTo:r14];
                                            rax = rax ^ 0x1;
                                    }
                            }
                            else {
                                    rax = [r15 _isEquivalentTo:r14];
                                    rax = rax ^ 0x1;
                            }
                    }
                    else {
                            rax = [r15 _isEquivalentTo:r14];
                            rax = rax ^ 0x1;
                    }
            }
            else {
                    rax = [r15 _isEquivalentTo:r14];
                    rax = rax ^ 0x1;
            }
    }
    else {
            rax = 0x0;
    }
    return rax;
}

NSUInteger -[UICollectionViewLayoutAttributes hash](void * self, void * _cmd) {
    rbx = [self->_elementKind hash] ^ [self->_indexPath hash];
    rax = [self->_isCloneString hash];
    rax = rax ^ rbx;
    return rax;
}

bool -[UICollectionViewLayoutAttributes _isCell](void * self, void * _cmd) {
    rax = self->_layoutFlags & 0x1;
    return rax;
}

bool -[UICollectionViewLayoutAttributes _isDecorationView](void * self, void * _cmd) {
    rax = (self->_layoutFlags & 0x2) >> 0x1;
    return rax;
}

bool -[UICollectionViewLayoutAttributes _isSupplementaryView](void * self, void * _cmd) {
    rax = (self->_layoutFlags & 0x3) == 0x0 ? 0x1 : 0x0;
    return rax;
}

NSUInteger -[UICollectionViewLayoutAttributes representedElementCategory](void * self, void * _cmd) {
    rcx = self->_layoutFlags;
    rax = 0x0;
    if ((rcx & 0x1) == 0x0) {
            rax = ((rcx & 0x2 & 0xff) >> 0x1) + 0x1;
    }
    return rax;
}

void * -[UICollectionViewLayoutAttributes representedElementKind](void * self, void * _cmd) {
    rax = self;
    rdi = 0x0;
    if ((rax->_layoutFlags & 0x1) == 0x0) {
            rdi = rax->_elementKind;
    }
    stack[2047] = rbp;
    rax = objc_retainAutorelease(rdi);
    rax = objc_retainAutoreleaseReturnValue(rax);
    return rax;
}

struct CGPoint -[UICollectionViewLayoutAttributes center](void * self, void * _cmd) {
    intrinsic_movsd(xmm0, self->_center);
    intrinsic_movsd(xmm1, *(self + *_OBJC_IVAR_$_UICollectionViewLayoutAttributes._center + 0x8));
    return *_OBJC_IVAR_$_UICollectionViewLayoutAttributes._center;
}

struct CGSize -[UICollectionViewLayoutAttributes size](void * self, void * _cmd) {
    intrinsic_movsd(xmm0, self->_size);
    intrinsic_movsd(xmm1, *(self + *_OBJC_IVAR_$_UICollectionViewLayoutAttributes._size + 0x8));
    return *_OBJC_IVAR_$_UICollectionViewLayoutAttributes._size;
}

struct CATransform3D -[UICollectionViewLayoutAttributes transform3D](void * self, void * _cmd) {
    rax = self;
    *self = rep intrinsic_movsq(*self, _cmd->_transform);
    return rax;
}

double -[UICollectionViewLayoutAttributes alpha](void * self, void * _cmd) {
    xmm0 = intrinsic_movsd(xmm0, self->_alpha);
    return xmm0;
}

void -[UICollectionViewLayoutAttributes setAlpha:](void * self, void * _cmd, double arg2) {
    self->_alpha = intrinsic_movsd(self->_alpha, arg2);
    return;
}

NSInteger -[UICollectionViewLayoutAttributes zIndex](void * self, void * _cmd) {
    rax = self->_zIndex;
    return rax;
}

void -[UICollectionViewLayoutAttributes setZIndex:](void * self, void * _cmd, NSInteger arg2) {
    self->_zIndex = arg2;
    return;
}

void -[UICollectionViewLayoutAttributes setIndexPath:](void * self, void * _cmd, void * arg2) {
    self->_indexPath = [arg2 retain];
    [self->_indexPath release];
    return;
}

void -[UICollectionViewLayoutAttributes .cxx_destruct](void * self, void * _cmd) {
    objc_storeStrong(*_OBJC_IVAR_$_UICollectionViewLayoutAttributes._isCloneString + self, 0x0);
    objc_storeStrong(*_OBJC_IVAR_$_UICollectionViewLayoutAttributes._reuseIdentifier + self, 0x0);
    objc_storeStrong(*_OBJC_IVAR_$_UICollectionViewLayoutAttributes._indexPath + self, 0x0);
    objc_storeStrong(self + *_OBJC_IVAR_$_UICollectionViewLayoutAttributes._elementKind, 0x0);
    return;
}

void * -[UICollectionViewLayoutAttributes __elementKind](void * self, void * _cmd) {
    rax = self->_elementKind;
    return rax;
}

void * -[UICollectionViewLayoutAttributes __indexPath](void * self, void * _cmd) {
    rax = self->_indexPath;
    if (rax == 0x0) {
            rax = *___indexPath.sharedNotFoundPath;
            if (rax == 0x0) {
                    stack[2047] = rbp;
                    stack[2046] = rbx;
                    rax = [NSIndexPath indexPathForItem:rdx inSection:0x7fffffffffffffff];
                    rax = [rax retain];
                    *___indexPath.sharedNotFoundPath = rax;
            }
    }
    return rax;
}



