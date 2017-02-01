- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event {
    
    if (![touches containsObject:_currentTouch]) {
        // loc_98b885
        return;
    }
        // loc_98b2ce
        [self _setCurrentTouch:nil];
        [super touchesEnded:touches withEvent:event];
        if ([self isDragging]) {
            
            // loc_98b327
            if (_pendingSelectionIndexPath != nil) {
                // loc_98b36f
                RDCollectionViewCell *cell = [self cellForItemAtIndexPath:_pendingSelectionIndexPath];
                if (cell != nil) {
                    // loc_98b38f
                    if (CGRectContainsPoint(self.bounds,  [_currentTouch locationInView:cell])) {
                        // loc_98b3f4
                        UIView *currentTouchView = [_currentTouch view];
                        if (currentTouchView != nil) {
                            // loc_98b3fd
                            NSIndexPath *indexPath = [self _selectableIndexPathForItemContainingHitView:currentTouchView];
                            if (indexPath != nil) {
                                // loc_98b435
                                if ([self _allowsEffectiveSelection]) {
                                    // loc_98b4a1
                                    if (_pendingSelectionIndexPath != nil) {
                                        // loc_98b4c2
                                    } else {
                                        // loc_98b4aa
                                        if (_allowsEffectiveMultipleSelection != nil) {
                                            // loc_98b4d2
                                        } else {
                                            // loc_98b4be
                                            
                                            // loc_98b4c2
                                            [self _userSelectItemAtIndexPath:_pendingSelectionIndexPath];
                                            // loc_98b4d2
                                            _pendingSelectionIndexPath = nil;
                                            // loc_98b511
                                        }
                                    }
                                } else {
                                    // loc_98b511
                                    // loc_98b524
                                    if (_pendingSelectionIndexPath != nil) {
                                        [self _unhighlightItemAtIndexPath:_pendingSelectionIndexPath animated:NO notifyDelegate:YES];
                                        _pendingSelectionIndexPath = nil;
                                    }
                                    
                                    for (NSIndexPath *selectedIndexPath in _indexPathsForSelectedItems) {
                                        RDCollectionViewCell *cell = [self cellForItemAtIndexPath:selectedIndexPath];
                                        if ([cell isSelected] == NO) {
                                            [cell _setSelected:YES animated:NO];
                                        }
                                    }
                                    
                                    
                                    for (NSIndexPath *pendingDeselectionIndexPath in _pendingDeselectionIndexPaths) {
                                        RDCollectionViewCell *cell = [self cellForItemAtIndexPath:pendingDeselectionIndexPath];
                                        if ([cell isSelected] == YES) {
                                            [cell _setSelected:NO animated:NO];
                                        }
                                    }
                                    _pendingDeselectionIndexPaths = nil;
                                    return
                                }
                            } else {
                                // loc_98b507
                                // loc_98b511
                            }
                        } else {
                            // loc_98b486
                            if ([self _allowsEffectiveSelection]) {
                                // loc_98b4a1
                            } else {
                                // loc_98b511
                            }
                        }
                    } else {
                        // loc_98b4e6
                        [_pendingDeselectionIndexPaths removeAllObjects];
                        // loc_98b511
                    }
                } else {
                    // loc_98b3f4
                }
            } else {
                // loc_98b3f4
            }
        }
    
    
        // loc_98b511
        // loc_98b524
        if (_pendingSelectionIndexPath != nil) {
            [self _unhighlightItemAtIndexPath:_pendingSelectionIndexPath animated:NO notifyDelegate:YES];
            _pendingSelectionIndexPath = nil;
        }
        
        for (NSIndexPath *selectedIndexPath in _indexPathsForSelectedItems) {
            RDCollectionViewCell *cell = [self cellForItemAtIndexPath:selectedIndexPath];
            if ([cell isSelected] == NO) {
                [cell _setSelected:YES animated:NO];
            }
        }
    
        for (NSIndexPath *pendingDeselectionIndexPath in _pendingDeselectionIndexPaths) {
            RDCollectionViewCell *cell = [self cellForItemAtIndexPath:pendingDeselectionIndexPath];
            if ([cell isSelected] == YES) {
                [cell _setSelected:NO animated:NO];
            }
        }
        _pendingDeselectionIndexPaths = nil;
        return
    }
}
