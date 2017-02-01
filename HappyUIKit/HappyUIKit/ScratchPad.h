
if ((_pendingSelectionIndexPath == nil ||
    [self cellForItemAtIndexPath:_pendingSelectionIndexPath]) == nil ||
    CGRectContainsPoint(self.bounds,  [_currentTouch locationInView:[self cellForItemAtIndexPath:_pendingSelectionIndexPath]])) {
    // loc_98b3f4
}
