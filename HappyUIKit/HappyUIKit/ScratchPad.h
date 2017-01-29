#if 0




-[UICollectionViewLayout initialLayoutAttributesForAppearingDecorationElementOfKind:atIndexPath:]


Pseudocode:
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





#endif
