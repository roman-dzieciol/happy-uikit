-[UICollectionView touchesEnded:withEvent:]


Pseudocode:
rbx = self;
r12 = [arg2 retain];
r13 = [arg3 retain];
r14 = [[rbx _currentTouch] retain];
rdx = r14;
rax = [r12 containsObject:rdx];
if (rax == 0x0) goto loc_98b885;

loc_98b2ce:
[rbx _setCurrentTouch:0x0, rcx];
[[rbx super] touchesEnded:rdx withEvent:_objc_msgSend];
rax = [rbx isDragging];
r15 = rbx;
if (r14 == 0x0) goto loc_98b465;

loc_98b327:
rax = rax ^ 0x1;
if (rax == 0x0) goto loc_98b465;

loc_98b32f:
var_220 = r13;
var_218 = r12;
rbx = [[r14 view] retain];
r13 = 0x0;
if (r15->_pendingSelectionIndexPath == 0x0) goto loc_98b3f4;

loc_98b36f:
r13 = [[r15 cellForItemAtIndexPath:rdx] retain];
if (r13 == 0x0) goto loc_98b3f4;

loc_98b38f:
[var_160 bounds];
rdx = r13;
[r14 locationInView:rdx];
if (CGRectContainsPoint(r14, @selector(locationInView:)) == 0x0) goto loc_98b4e6;

loc_98b3f4:
if (rbx == 0x0) goto loc_98b486;

loc_98b3fd:
var_228 = r14;
rdx = rbx;
var_1F0 = rbx;
rbx = r15;
r15 = [[r15 _selectableIndexPathForItemContainingHitView:rdx] retain];
if (r15 == 0x0) goto loc_98b507;

loc_98b435:
r14 = [rbx _allowsEffectiveSelection];
[r15 release];
r15 = rbx;
rbx = var_1F0;
if (r14 != 0x0) goto loc_98b4a1;

loc_98b511:
[r13 release];
[rbx release];
goto loc_98b524;

loc_98b524:
if (r15->_pendingSelectionIndexPath != 0x0) {
    [r15 _unhighlightItemAtIndexPath:rdx animated:0x0 notifyDelegate:0x1];
    r15->_pendingSelectionIndexPath = 0x0;
    [r15->_pendingSelectionIndexPath release];
}
intrinsic_movaps(var_170, 0x0);
intrinsic_movaps(var_180, 0x0);
var_190 = intrinsic_movaps(var_190, 0x0);
var_1A0 = intrinsic_movaps(var_1A0, 0x0);
rax = [r15->_indexPathsForSelectedItems retain];
var_200 = rax;
rbx = @selector(countByEnumeratingWithState:objects:count:);
rax = _objc_msgSend(rax, rbx);
var_1F0 = rax;
if (rax != 0x0) {
    var_1E8 = r15;
    var_1F8 = *var_190;
    do {
        r14 = 0x0;
        do {
            if (*var_190 != var_1F8) {
                objc_enumerationMutation(var_200);
            }
            r15 = [[var_1E8 cellForItemAtIndexPath:*(var_198 + r14 * 0x8)] retain];
            if ([r15 isSelected] == 0x0) {
                [r15 _setSelected:0x1 animated:0x0];
            }
            [r15 release];
            r14 = r14 + 0x1;
        } while (r14 < var_1F0);
        rbx = @selector(countByEnumeratingWithState:objects:count:);
        rax = _objc_msgSend(var_200, rbx);
        var_1F0 = rax;
    } while (rax != 0x0);
    r15 = var_1E8;
}
var_1E8 = r15;
[var_200 release];
intrinsic_movaps(var_1B0, 0x0);
intrinsic_movaps(var_1C0, 0x0);
var_1D0 = intrinsic_movaps(var_1D0, 0x0);
var_1E0 = intrinsic_movaps(var_1E0, 0x0);
rax = [r15->_pendingDeselectionIndexPaths retain];
var_200 = rax;
rax = _objc_msgSend(rax, rbx);
var_1F0 = rax;
if (rax != 0x0) {
    var_1F8 = *var_1D0;
    do {
        r14 = 0x0;
        do {
            if (*var_1D0 != var_1F8) {
                objc_enumerationMutation(var_200);
            }
            r12 = [[var_1E8 cellForItemAtIndexPath:*(var_1D8 + r14 * 0x8)] retain];
            if ([r12 isSelected] != 0x0) {
                [r12 _setSelected:0x0 animated:0x0];
            }
            [r12 release];
            r14 = r14 + 0x1;
        } while (r14 < var_1F0);
        rax = [var_200 countByEnumeratingWithState:var_1E0 objects:var_130 count:0x10];
        var_1F0 = rax;
    } while (rax != 0x0);
}
[var_200 release];
var_1E8->_pendingDeselectionIndexPaths = 0x0;
[var_1E8->_pendingDeselectionIndexPaths release];
r12 = var_218;
r13 = var_220;
r14 = var_228;
goto loc_98b885;

loc_98b885:
[r14 release];
[r13 release];
[r12 release];
if (*___stack_chk_guard != *___stack_chk_guard) {
    __stack_chk_fail();
}
return;

loc_98b4a1:
if (r15->_pendingSelectionIndexPath != 0x0) goto loc_98b4c2;

loc_98b4aa:
if ([r15 _allowsEffectiveMultipleSelection] != 0x0) goto loc_98b4d2;

loc_98b4be:
rdx = r15->_pendingSelectionIndexPath;
goto loc_98b4c2;

loc_98b4c2:
[r15 _userSelectItemAtIndexPath:rdx];
goto loc_98b4d2;

loc_98b4d2:
r15->_pendingSelectionIndexPath = 0x0;
[r15->_pendingSelectionIndexPath release];
goto loc_98b511;

loc_98b507:
r15 = rbx;
rbx = var_1F0;
goto loc_98b511;

loc_98b486:
var_228 = r14;
if ([r15 _allowsEffectiveSelection] == 0x0) goto loc_98b511;
goto loc_98b4a1;

loc_98b4e6:
var_228 = r14;
[r15->_pendingDeselectionIndexPaths removeAllObjects];
goto loc_98b511;

loc_98b465:
var_228 = r14;
var_220 = r13;
var_218 = r12;
goto loc_98b524;

