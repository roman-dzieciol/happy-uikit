//
//  RDCollectionViewLayout.m
//  MinimalObjC
//
//  Created by Roman Dzieciol on 1/24/17.
//  Copyright © 2017 R3PI. All rights reserved.
//

#import "RDCollectionViewLayout.h"
#import "HappyUIKitDefinitions.h"
#import "RDCollectionViewLayoutAttributes.h"
#import "RDCollectionReusableView.h"
#import "RDCollectionView.h"
#import "RDCollectionViewUpdate.h"
#import "RDCollectionViewData.h"
#import "_RDCollectionViewItemKey.h"
#import "RDCollectionViewUpdateItem.h"
#import "RDCollectionViewLayoutInvalidationContext.h"
#import "RDCollectionViewTransitionLayout.h"
#import "_RDCollectionViewCompositionLayout.h"





@implementation RDCollectionViewLayout

void _RDCollectionViewLayoutCommonInit(RDCollectionViewLayout *self) {
    self->_initialAnimationLayoutAttributesDict = [[NSMutableDictionary alloc] init];
    self->_finalAnimationLayoutAttributesDict = [[NSMutableDictionary alloc] init];
    self->_deletedSupplementaryIndexPathsDict = [[NSMutableDictionary alloc] init];
    self->_insertedSupplementaryIndexPathsDict = [[NSMutableDictionary alloc] init];
    self->_deletedDecorationIndexPathsDict = [[NSMutableDictionary alloc] init];
    self->_insertedDecorationIndexPathsDict = [[NSMutableDictionary alloc] init];
    self->_deletedSectionsSet = [[NSMutableIndexSet alloc] init];
    self->_insertedSectionsSet = [[NSMutableIndexSet alloc] init];
}

+ (Class)invalidationContextClass {
    return [UICollectionViewLayoutInvalidationContext class];
}

+ (Class)layoutAttributesClass {
    return [UICollectionViewLayoutAttributes class];
}

- (id /* block */)_animationForReusableView:(RDCollectionReusableView *)reusableView toLayoutAttributes:(RDCollectionViewLayoutAttributes *)attributes {
    return nil;
}

- (id /* block */)_animationForReusableView:(RDCollectionReusableView *)reusableView toLayoutAttributes:(RDCollectionViewLayoutAttributes *)attributes type:(NSUInteger)type {
    return [self _animationForReusableView:reusableView toLayoutAttributes:attributes];
}

- (CGRect)_bounds {
    if (_compositionLayout) {
        return CGRectMake(0, 0, _compositionLayout._frame.size.width, _compositionLayout._frame.size.height);
    } else {
        return [_collectionView bounds];
    }
}

- (BOOL)_cellsShouldConferWithAutolayoutEngineForSizingInfo {
    return YES;
}

- (RDCollectionReusableView *)_decorationViewForLayoutAttributes:(RDCollectionViewLayoutAttributes *)attributes {
    RDCollectionReusableView *reusableView = nil;
    NSString *identifier = [attributes _elementKind];
    UINib *nib = [_decorationViewNibDict valueForKey:identifier];
    if (nib) {
        NSDictionary *options = nil;
        NSDictionary *externalObjects = [_decorationViewExternalObjectsTables valueForKey:identifier];
        if (externalObjects) {
            options = [NSDictionary dictionaryWithObject:externalObjects forKey:@"UINibExternalObjects"];
        }
        NSArray *nibObjects = [nib instantiateWithOwner:nil options:options];
        id nibObject = nibObjects[0];
        NSAssert1(nibObjects.count == 1 &&
                  nibObjects[0] != nil &&
                  [nibObjects[0] isKindOfClass:[RDCollectionReusableView class]],
                  @"invalid nib registered for identifier (%@) - nib must contain exactly one top level object which must be a UICollectionReusableView instance", identifier);
        
        reusableView = (RDCollectionReusableView *)nibObjects[0];
        NSAssert2([[reusableView reuseIdentifier] length] != 0 &&
                  [[reusableView reuseIdentifier] isEqualToString:identifier], @"view reuse identifier in nib (%@) does not match the element kind used to register the nib (%@)", [reusableView reuseIdentifier], identifier);
        
    } else {
        Class viewClass = [_decorationViewClassDict valueForKey:identifier];
        reusableView = [[viewClass alloc] initWithFrame:[attributes frame]];
    }
    
    NSAssert1(reusableView != nil, @"could not dequeue a decoration view of kind: %@ - must register as a class or nib or connect a prototype in a storyboard", identifier);
    
    [reusableView _setReuseIdentifier:identifier];
    
    [UIView performWithoutAnimation:^{ // TODO: [UIView _performWithoutAnimation:^{
        [reusableView _setLayoutAttributes:attributes];
    }];
    [reusableView setAutoresizingMask:UIViewAutoresizingNone];
    [reusableView setTranslatesAutoresizingMaskIntoConstraints:YES];
    //[reusableView _setHostsLayoutEngine:YES];
    [reusableView _markAsDequeued];
    
    return reusableView;
}


- (void)_didFinishLayoutTransitionAnimations:(BOOL)bFlag {
    // no implementation
}

- (RDDynamicAnimator *)_dynamicAnimator {
    return _animator;
}

- (CGRect)_dynamicReferenceBounds {
    return CGRectZero;
}

- (BOOL)_estimatesSizes {
    return NO;
}


- (void)_finalizeCollectionViewItemAnimations {
    [_initialAnimationLayoutAttributesDict removeAllObjects];
    [_finalAnimationLayoutAttributesDict removeAllObjects];
}


- (void)_finalizeLayoutTransition {
    _transitioningFromLayout = nil;
    _layoutFlags.inTransitionFromTransitionLayout = NO;
    _transitioningToLayout = nil;
    _layoutFlags.inTransitionToTransitionLayout = NO;
    [self finalizeLayoutTransition];
    if ([[self collectionView] collectionViewLayout] == self) {
//        [_animator _tickle];
    }
}


- (NSArray<NSIndexPath *> *)_indexPathsToDeleteForDecorationViewOfKind:(NSString *)elementKind {
    return _deletedDecorationIndexPathsDict[elementKind] ?: [NSArray array];
}

- (NSArray<NSIndexPath *> *)_indexPathsToDeleteForSupplementaryViewOfKind:(NSString *)elementKind {
    return _deletedSupplementaryIndexPathsDict[elementKind] ?: [NSArray array];
}

- (NSArray<NSIndexPath *> *)_indexPathsToInsertForDecorationViewOfKind:(NSString *)elementKind {
    return _insertedDecorationIndexPathsDict[elementKind] ?: [NSArray array];
}

- (NSArray<NSIndexPath *> *)_indexPathsToInsertForSupplementaryViewOfKind:(NSString *)elementKind {
    return _insertedSupplementaryIndexPathsDict[elementKind] ?: [NSArray array];
}

- (void)_invalidateLayoutUsingContext:(RDCollectionViewLayoutInvalidationContext *)invalidationContext {
    _invalidationContext = invalidationContext;
    [self invalidateLayout];
    _invalidationContext = nil;
}

- (RDCollectionViewLayoutInvalidationContext *)_invalidationContextForEndingReorderingItemToFinalIndexPaths:(NSArray<NSIndexPath *> *)indexPaths previousIndexPaths:(NSArray<NSIndexPath *> *)previousIndexPaths reorderingCancelled:(BOOL)reorderingCancelled {
    return [self invalidationContextForEndingInteractiveMovementOfItemsToFinalIndexPaths:indexPaths previousIndexPaths:previousIndexPaths movementCancelled:reorderingCancelled];
}

- (RDCollectionViewLayoutInvalidationContext *)_invalidationContextForReorderingTargetPosition:(CGPoint)targetPosition targetIndexPaths:(NSArray<NSIndexPath *> *)indexPaths withPreviousPosition:(CGPoint)previousPosition previousIndexPaths:(NSArray<NSIndexPath *> *)previousIndexPaths {
    return [self invalidationContextForInteractivelyMovingItems:indexPaths withTargetPosition:targetPosition previousIndexPaths:previousIndexPaths previousPosition:previousPosition];
}

- (BOOL)_isPrepared {
    return _layoutFlags.prepared;
}


- (RDCollectionViewLayoutAttributes *)_layoutAttributesForReorderedItemAtIndexPath:(NSIndexPath *)indexPath withTargetPosition:(CGPoint)targetPosition {
    return [self layoutAttributesForInteractivelyMovingItemAtIndexPath:indexPath withTargetPosition:targetPosition];
}

- (CGPoint)_offsetInTopParentLayout:(_RDCollectionViewCompositionLayout *)compositionLayout {
    CGPoint offset = _frame.origin;
    _RDCollectionViewCompositionLayout *layout = [layout _compositionLayout];
    while (layout) { // TODO: Verify
        offset.x += [layout _frame].origin.x;
        offset.y += [layout _frame].origin.y;
        layout = [layout _compositionLayout];
    }
    return offset;
}

- (UIEdgeInsets)_preferredLayoutMargins {
    return UIEdgeInsetsMake(_RD_AutomaticDimension,
                            _RD_AutomaticDimension,
                            _RD_AutomaticDimension,
                            _RD_AutomaticDimension); // Verify
}

- (void)_prepareForTransitionFromLayout:(RDCollectionViewLayout *)transitioningFromLayout {
    _transitioningFromLayout = transitioningFromLayout;
    _layoutFlags.inTransitionFromTransitionLayout = [_transitioningFromLayout isKindOfClass:[RDCollectionViewTransitionLayout class]];
    [self prepareForTransitionToLayout:transitioningFromLayout];
}

- (void)_prepareForTransitionToLayout:(RDCollectionViewLayout *)transitioningToLayout {
    _transitioningToLayout = transitioningToLayout;
    _layoutFlags.inTransitionToTransitionLayout = [_transitioningToLayout isKindOfClass:[RDCollectionViewTransitionLayout class]];
//    [_animator _setRunning:NO];
    [self prepareForTransitionToLayout:transitioningToLayout];
}

// TODO
- (void)_prepareToAnimateFromCollectionViewItems:(id)fromItems atContentOffset:(CGPoint)fromOffset toItems:(id)toItems atContentOffset:(CGPoint)toOffset {
    
    // for all versions except >=0x70000 to <0x70100
    
    if ((_RDApplicationLinkedOnVersion != NULL && (_RDApplicationLinkedOnVersion < 0x6ffff || _RDApplicationLinkedOnVersion >= 0x70100)) || // Optimized check
        !_RDApplicationLinkedOnOrAfter(0x70000) || (_RDApplicationLinkedOnVersion != NULL && _RDApplicationLinkedOnVersion >= 0x70100)  // Unoptimized check
        ) {
        
        NSMutableDictionary *fromItemsByKey = [[NSMutableDictionary alloc] initWithCapacity:[fromItems count]];
        
        for (id item in fromItems) {
            _RDCollectionViewItemKey *key = [_RDCollectionViewItemKey collectionItemKeyForLayoutAttributes:item];
            [fromItemsByKey setObject:item forKey:key];
        }
        
        NSMutableDictionary *toItemsByKey = [[NSMutableDictionary alloc] initWithCapacity:[toItems count]];
        
        for (id item in toItems) {
            _RDCollectionViewItemKey *key = [_RDCollectionViewItemKey collectionItemKeyForLayoutAttributes:item];
            [toItemsByKey setObject:item forKey:key];
        }
        
        NSMutableSet *itemKeySet = [NSMutableSet setWithArray:[toItemsByKey allKeys]];
        [itemKeySet addObjectsFromArray:[fromItemsByKey allKeys]];
        
        [itemKeySet enumerateObjectsUsingBlock:^(id  _Nonnull item, BOOL * _Nonnull stop) {
            // TODO
        }];
    }
    
}

- (NSIndexPath *)_reorderingTargetItemIndexPathForPosition:(CGPoint)position withPreviousIndexPath:(NSIndexPath *)indexPath {
    return [self targetIndexPathForInteractivelyMovingItem:indexPath withPosition:position];
}

- (void)_setExternalObjectTable:(NSDictionary *)externalObjectTable forNibLoadingOfDecorationViewOfKind:(NSString *)elementKind {
    if (_decorationViewExternalObjectsTables == nil) {
        _decorationViewExternalObjectsTables = [[NSMutableDictionary alloc] init];
    }
    [_decorationViewExternalObjectsTables setObject:externalObjectTable forKey:elementKind];
}

- (void)_setPrepared:(BOOL)bFlag {
    _layoutFlags.prepared = bFlag;
}

- (void)_setWantsRightToLeftHorizontalMirroringIfNeeded:(BOOL)bFlag {
    if(_layoutFlags.wantsRightToLeftHorizontalMirroringIfNeeded != bFlag) {
        _layoutFlags.wantsRightToLeftHorizontalMirroringIfNeeded = NO;
    }
}

- (BOOL)_shouldScrollToContentBeginningInRightToLeft {
    return NO;
}

- (BOOL)_supportsAdvancedTransitionAnimations {
    return (_RDApplicationLinkedOnVersion != NULL && _RDApplicationLinkedOnVersion > 0x6ffff) || _RDApplicationLinkedOnOrAfter(0x70000);
}

- (BOOL)_wantsRightToLeftHorizontalMirroringIfNeeded {
    return NO;
}

- (BOOL)canBeEdited {
    return NO;
}

- (RDCollectionView *)collectionView {
    return _collectionView ?: [_compositionLayout collectionView];
}

- (CGSize)collectionViewContentSize {
    return CGSizeZero;
}

// TODO: Verify & Refactor for same output
- (CGRect)convertRect:(CGRect)rect fromLayout:(RDCollectionViewLayout *)layout {
    CGPoint thisOffset = [self _offsetInTopParentLayout:_compositionLayout];
    CGPoint otherOffset = [layout _offsetInTopParentLayout:layout->_compositionLayout];
    NSAssert(_compositionLayout != nil && _compositionLayout == layout->_compositionLayout, @"to convert between layouts, both layouts must have non-nil parent composition layouts and have the same parent at the top of their layout tree");
    return CGRectOffset(rect, otherOffset.x - thisOffset.x, otherOffset.y - thisOffset.y);
}

// TODO: Verify & Refactor for same output
- (CGRect)convertRect:(CGRect)rect toLayout:(RDCollectionViewLayout *)layout {
    CGPoint thisOffset = [self _offsetInTopParentLayout:_compositionLayout];
    CGPoint otherOffset = [layout _offsetInTopParentLayout:layout->_compositionLayout];
    NSAssert(_compositionLayout != nil && _compositionLayout == layout->_compositionLayout, @"to convert between layouts, both layouts must have non-nil parent composition layouts and have the same parent at the top of their layout tree");
    return CGRectOffset(rect, thisOffset.x - otherOffset.x, thisOffset.y - otherOffset.y);
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    if ([_decorationViewNibDict count] != 0) {
        [aCoder encodeObject:_decorationViewNibDict forKey:@"UICollectionViewDecorationViewNibDict"];
    }
    if ([_decorationViewExternalObjectsTables count] != 0) {
        [aCoder encodeObject:_decorationViewExternalObjectsTables forKey:@"UICollectionViewDecorationViewPrototypeNibExternalObjects"];
    }
}

- (nullable RDCollectionViewLayoutAttributes *)finalLayoutAttributesForDisappearingDecorationElementOfKind:(NSString *)elementKind atIndexPath:(NSIndexPath *)decorationIndexPath {
    
    _RDCollectionViewItemKey *key = [_RDCollectionViewItemKey collectionItemKeyForDecorationViewOfKind:elementKind andIndexPath:decorationIndexPath];
    
    RDCollectionViewLayoutAttributes *attribute = [_finalAnimationLayoutAttributesDict objectForKey:key];
    
    
    if (attribute == nil) {
        if (_transitioningToLayout != nil && _layoutFlags.inTransitionToTransitionLayout == NO) {
            attribute = [_transitioningToLayout layoutAttributesForDecorationViewOfKind:elementKind atIndexPath:decorationIndexPath];
        } else {
            attribute = [[_collectionView _visibleSupplementaryViewOfKind:elementKind atIndexPath:decorationIndexPath isDecorationView:YES] _layoutAttributes];
        }
    }
    
    NSInteger sectionIndex = NSIntegerMax;
    if (decorationIndexPath.length >= 2) {
        sectionIndex = decorationIndexPath.section;
    }
    
    RDCollectionViewUpdate *update = [_collectionView _currentUpdate];
    if (update) {
        if (sectionIndex != NSIntegerMax) {
            if ([_deletedSectionsSet containsIndex:decorationIndexPath.section] == NO) {
                NSDictionary *sectionDictionary = update->_deletedSupplementaryIndexesSectionArray[decorationIndexPath.section];
                NSIndexSet *sectionArray = [sectionDictionary valueForKey:elementKind];
                if ([sectionArray containsIndex:decorationIndexPath.item]) {
                    if (_transitioningToLayout) {
                        return attribute;
                    } else {
                        attribute = [attribute copy];
                        attribute.alpha = 0.0; // TODO: Verify
                        return attribute;
                    }
                } else {
                    return attribute;
                }
            } else {
                if (_transitioningToLayout) {
                    return attribute;
                } else {
                    attribute = [attribute copy];
                    attribute.alpha = 0.0; // TODO: Verify
                    return attribute;
                }
            }
        } else {
            return attribute;
        }
    } else {
        if (_transitioningToLayout) {
            return attribute;
        } else {
            attribute = [attribute copy];
            attribute.alpha = 0.0; // TODO: Verify
            return attribute;
        }
    }
}


// TODO: Verify & Refactor for same output
- (nullable RDCollectionViewLayoutAttributes *)finalLayoutAttributesForDisappearingItemAtIndexPath:(NSIndexPath *)itemIndexPath {
    _RDCollectionViewItemKey *key = [_RDCollectionViewItemKey collectionItemKeyForCellWithIndexPath:itemIndexPath];
    
    RDCollectionViewLayoutAttributes *attribute = [_finalAnimationLayoutAttributesDict objectForKey:key];
    if (attribute == nil) {
        if (_transitioningToLayout != nil && _layoutFlags.inTransitionToTransitionLayout == NO) {
            attribute = [_transitioningToLayout layoutAttributesForItemAtIndexPath:itemIndexPath];
        } else {
            attribute = [[_collectionView cellForItemAtIndexPath:itemIndexPath] _layoutAttributes];
        }
    }
    
    RDCollectionViewUpdate *update = [_collectionView _currentUpdate];
    if (update == nil || [_deletedSectionsSet containsIndex:itemIndexPath.section]) {
        if (_transitioningToLayout == nil) {
            attribute = [attribute copy];
            attribute.alpha = 0.0; // Verify
        }
    }
    return attribute;

}


// TODO: Verify & Refactor for same output
- (nullable RDCollectionViewLayoutAttributes *)finalLayoutAttributesForDisappearingSupplementaryElementOfKind:(NSString *)elementKind atIndexPath:(NSIndexPath *)elementIndexPath {
    
    _RDCollectionViewItemKey *key = [_RDCollectionViewItemKey collectionItemKeyForSupplementaryViewOfKind:elementKind andIndexPath:elementIndexPath];
    
    RDCollectionViewLayoutAttributes *attribute = [_finalAnimationLayoutAttributesDict objectForKey:key];
    if (attribute == nil) {
        if (_transitioningToLayout != nil && _layoutFlags.inTransitionToTransitionLayout == NO) {
            attribute = [_transitioningToLayout layoutAttributesForSupplementaryViewOfKind:elementKind atIndexPath:elementIndexPath];
        } else {
            attribute = [[_collectionView _visibleSupplementaryViewOfKind:elementKind atIndexPath:elementIndexPath isDecorationView:NO] _layoutAttributes];
        }
    }
    
    NSInteger sectionIndex = NSIntegerMax;
    if (elementIndexPath.length >= 2) {
        sectionIndex = elementIndexPath.section;
    }
    
    RDCollectionViewUpdate *update = [_collectionView _currentUpdate];
    if (update) {
        if (sectionIndex != NSIntegerMax) {
            if ([_deletedSectionsSet containsIndex:elementIndexPath.section] == NO) {
                NSDictionary *sectionDictionary = update->_deletedSupplementaryIndexesSectionArray[elementIndexPath.section];
                NSIndexSet *sectionArray = [sectionDictionary valueForKey:elementKind];
                if ([sectionArray containsIndex:elementIndexPath.item]) {
                    if (_transitioningToLayout) {
                        return attribute;
                    } else {
                        attribute = [attribute copy];
                        attribute.alpha = 0.0; // TODO: Verify
                        return attribute;
                    }
                } else {
                    return attribute;
                }
            } else {
                if (_transitioningToLayout) {
                    return attribute;
                } else {
                    attribute = [attribute copy];
                    attribute.alpha = 0.0; // TODO: Verify
                    return attribute;
                }
            }
        } else {
            return attribute;
        }
    } else {
        if (_transitioningToLayout) {
            return attribute;
        } else {
            attribute = [attribute copy];
            attribute.alpha = 0.0; // TODO: Verify
            return attribute;
        }
    }
}

- (void)finalizeAnimatedBoundsChange {
    // no implementation
}

- (void)finalizeCollectionViewUpdates {
    [self->_initialAnimationLayoutAttributesDict removeAllObjects];
    [self->_finalAnimationLayoutAttributesDict removeAllObjects];
    [self->_deletedSupplementaryIndexPathsDict removeAllObjects];
    [self->_insertedSupplementaryIndexPathsDict removeAllObjects];
    [self->_deletedDecorationIndexPathsDict removeAllObjects];
    [self->_insertedDecorationIndexPathsDict removeAllObjects];
    [self->_deletedSectionsSet removeAllIndexes];
    [self->_insertedSectionsSet removeAllIndexes];
}

- (void)finalizeLayoutTransition {
    // no implementation
}


- (NSArray<NSIndexPath *> *)indexPathsToDeleteForDecorationViewOfKind:(NSString *)elementKind {
    return [self _indexPathsToDeleteForDecorationViewOfKind:elementKind];
}

- (NSArray<NSIndexPath *> *)indexPathsToDeleteForSupplementaryViewOfKind:(NSString *)elementKind {
    return [self _indexPathsToDeleteForSupplementaryViewOfKind:elementKind];
}

- (NSArray<NSIndexPath *> *)indexPathsToInsertForDecorationViewOfKind:(NSString *)elementKind {
    return [self _indexPathsToInsertForDecorationViewOfKind:elementKind];
}

- (NSArray<NSIndexPath *> *)indexPathsToInsertForSupplementaryViewOfKind:(NSString *)elementKind {
    return [self _indexPathsToInsertForSupplementaryViewOfKind:elementKind];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _RDCollectionViewLayoutCommonInit(self);
    }
    return self;
}

// TODO: Verify & Refactor for same output
- (nullable RDCollectionViewLayoutAttributes *)initialLayoutAttributesForAppearingDecorationElementOfKind:(NSString *)elementKind atIndexPath:(NSIndexPath *)decorationIndexPath {
    
    _RDCollectionViewItemKey *key = [_RDCollectionViewItemKey collectionItemKeyForDecorationViewOfKind:elementKind andIndexPath:decorationIndexPath];
    
    RDCollectionViewLayoutAttributes *attribute = [_initialAnimationLayoutAttributesDict objectForKey:key];
    
    
    if (attribute == nil) {
        if (decorationIndexPath.length != 1) {
            if (decorationIndexPath.section < _collectionView.numberOfSections) {
                
                if (_transitioningFromLayout != nil && _layoutFlags.prepared == NO) {
                    attribute = [_transitioningFromLayout layoutAttributesForDecorationViewOfKind:elementKind atIndexPath:decorationIndexPath];
                } else {
                    attribute = [self layoutAttributesForDecorationViewOfKind:elementKind atIndexPath:decorationIndexPath];
                }
            }
        }
        else {
            
            if (_transitioningFromLayout != nil && _layoutFlags.prepared == NO) {
                attribute = [_transitioningFromLayout layoutAttributesForDecorationViewOfKind:elementKind atIndexPath:decorationIndexPath];
            } else {
                attribute = [self layoutAttributesForDecorationViewOfKind:elementKind atIndexPath:decorationIndexPath];
            }
            
        }
    }
    
    NSInteger sectionIndex = NSIntegerMax;
    if (decorationIndexPath.length >= 2) {
        sectionIndex = decorationIndexPath.section;
    }
    
    RDCollectionViewUpdate *update = [_collectionView _currentUpdate];
    if (update) {
        if (sectionIndex != NSIntegerMax) {
            if ([_insertedSectionsSet containsIndex:decorationIndexPath.section] == NO) {
                NSDictionary *sectionDictionary = update->_insertedSupplementaryIndexesSectionArray[decorationIndexPath.section];
                NSIndexSet *sectionArray = [sectionDictionary valueForKey:elementKind];
                if ([sectionArray containsIndex:decorationIndexPath.item]) {
                    if (_transitioningFromLayout) {
                        return attribute;
                    } else {
                        attribute = [attribute copy];
                        attribute.alpha = 0.0; // TODO: Verify
                        return attribute;
                    }
                } else {
                    return attribute;
                }
            } else {
                if (_transitioningFromLayout) {
                    return attribute;
                } else {
                    attribute = [attribute copy];
                    attribute.alpha = 0.0; // TODO: Verify
                    return attribute;
                }
            }
        } else {
            return attribute;
        }
    } else {
        if (_transitioningFromLayout) {
            return attribute;
        } else {
            attribute = [attribute copy];
            attribute.alpha = 0.0; // TODO: Verify
            return attribute;
        }
    }
}


// TODO: Verify & Refactor for same output
- (nullable RDCollectionViewLayoutAttributes *)initialLayoutAttributesForAppearingItemAtIndexPath:(NSIndexPath *)itemIndexPath {
    _RDCollectionViewItemKey *key = [_RDCollectionViewItemKey collectionItemKeyForCellWithIndexPath:itemIndexPath];
    
    RDCollectionViewLayoutAttributes *attribute = [_initialAnimationLayoutAttributesDict objectForKey:key];
    if (attribute == nil) {
        if (itemIndexPath.section < _collectionView.numberOfSections) {
            if (itemIndexPath.item < [_collectionView numberOfItemsInSection:itemIndexPath.section]) {
                
                if (_transitioningFromLayout != nil && _layoutFlags.inTransitionFromTransitionLayout == NO) {
                    attribute = [_transitioningFromLayout layoutAttributesForItemAtIndexPath:itemIndexPath];
                } else {
                    attribute = [self layoutAttributesForItemAtIndexPath:itemIndexPath];
                }
            }
        }
    }
    
    
    RDCollectionViewUpdate *update = [_collectionView _currentUpdate];
    if (update) {
        if ([_insertedSectionsSet containsIndex:itemIndexPath.section]) {
            if (_transitioningFromLayout == NO) {
                attribute = [attribute copy];
                attribute.alpha = 0.0; // Verify
            }
        }
    } else {
        if (_transitioningFromLayout == NO) {
            attribute = [attribute copy];
            attribute.alpha = 0.0; // Verify
        }
    }
    return attribute;
}

// TODO: Verify & Refactor for same output
- (nullable RDCollectionViewLayoutAttributes *)initialLayoutAttributesForAppearingSupplementaryElementOfKind:(NSString *)elementKind atIndexPath:(NSIndexPath *)elementIndexPath {
    
    _RDCollectionViewItemKey *key = [_RDCollectionViewItemKey collectionItemKeyForSupplementaryViewOfKind:elementKind andIndexPath:elementIndexPath];
    
    RDCollectionViewLayoutAttributes *attribute = [_initialAnimationLayoutAttributesDict objectForKey:key];
    if (attribute == nil) {
        if (elementIndexPath.length != 1) {
            if (elementIndexPath.section < _collectionView.numberOfSections) {
                
                if (_transitioningFromLayout != nil && _layoutFlags.inTransitionFromTransitionLayout == NO) {
                    attribute = [_transitioningFromLayout layoutAttributesForSupplementaryViewOfKind:elementKind atIndexPath:elementIndexPath];
                } else {
                    attribute = [self layoutAttributesForSupplementaryViewOfKind:elementKind atIndexPath:elementIndexPath];
                }
            }
        }
        else {
            
            if (_transitioningFromLayout != nil && _layoutFlags.inTransitionFromTransitionLayout == NO) {
                attribute = [_transitioningFromLayout layoutAttributesForSupplementaryViewOfKind:elementKind atIndexPath:elementIndexPath];
            } else {
                attribute = [self layoutAttributesForSupplementaryViewOfKind:elementKind atIndexPath:elementIndexPath];
            }
            
        }
    }
    
    NSInteger sectionIndex = NSIntegerMax;
    if (elementIndexPath.length >= 2) {
        sectionIndex = elementIndexPath.section;
    }
    
    RDCollectionViewUpdate *update = [_collectionView _currentUpdate];
    if (update) {
        if (sectionIndex != NSIntegerMax) {
            if ([_insertedSectionsSet containsIndex:elementIndexPath.section] == NO) {
                NSDictionary *sectionDictionary = update->_insertedSupplementaryIndexesSectionArray[elementIndexPath.section];
                NSIndexSet *sectionArray = [sectionDictionary valueForKey:elementKind];
                if ([sectionArray containsIndex:elementIndexPath.item]) {
                    if (_transitioningFromLayout) {
                        return attribute;
                    } else {
                        attribute = [attribute copy];
                        attribute.alpha = 0.0; // TODO: Verify
                        return attribute;
                    }
                } else {
                    return attribute;
                }
            } else {
                if (_transitioningFromLayout) {
                    return attribute;
                } else {
                    attribute = [attribute copy];
                    attribute.alpha = 0.0; // TODO: Verify
                    return attribute;
                }
            }
        } else {
            return attribute;
        }
    } else {
        if (_transitioningFromLayout) {
            return attribute;
        } else {
            attribute = [attribute copy];
            attribute.alpha = 0.0; // TODO: Verify
            return attribute;
        }
    }
}

- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if (self) {
        _decorationViewNibDict = [aDecoder decodeObjectForKey:@"UICollectionViewDecorationViewNibDict"];
        _decorationViewExternalObjectsTables = [aDecoder decodeObjectForKey:@"UICollectionViewDecorationViewPrototypeNibExternalObjects"];
        // TODO
//        _decorationViewExternalObjectsTables = _mutableDictionaryByTransformingLeafDictionariesToWeakValued();
        _RDCollectionViewLayoutCommonInit(self);
    }
    return self;
}

- (void)invalidateLayout {
    if (_invalidationContext) {
        [self invalidateLayoutWithContext:_invalidationContext];
    } else {
        [self invalidateLayoutWithContext:[[[[self class] invalidationContextClass] alloc] init]];
    }
}

- (void)invalidateLayoutWithContext:(RDCollectionViewLayoutInvalidationContext *)context {
    // TODO: Verify
    RDCollectionViewLayout *layout = self;
    while ([layout _compositionLayout] != nil) {
        layout = [layout _compositionLayout];
    }
    
    [[layout collectionView] _invalidateLayoutWithContext:context];
}

- (RDCollectionViewLayoutInvalidationContext *)invalidationContextForBoundsChange:(CGRect)newBounds {
    return [[[[self class] invalidationContextClass] alloc] init];
}

- (RDCollectionViewLayoutInvalidationContext *)invalidationContextForEndingInteractiveMovementOfItemsToFinalIndexPaths:(NSArray<NSIndexPath *> *)indexPaths previousIndexPaths:(NSArray<NSIndexPath *> *)previousIndexPaths movementCancelled:(BOOL)movementCancelled {
    
    RDCollectionViewLayoutInvalidationContext *context = [[[[self class] invalidationContextClass] alloc] init];
    
    [context _setPreviousIndexPathsForInteractivelyMovingItems:previousIndexPaths];
    [context _setTargetIndexPathsForInteractivelyMovingItems:indexPaths];
    if ([indexPaths isEqual:previousIndexPaths]) {
        [context invalidateItemsAtIndexPaths:indexPaths];
    }
    return context;
}

- (RDCollectionViewLayoutInvalidationContext *)invalidationContextForInteractivelyMovingItems:(NSArray<NSIndexPath *> *)targetIndexPaths withTargetPosition:(CGPoint)targetPosition previousIndexPaths:(NSArray<NSIndexPath *> *)previousIndexPaths previousPosition:(CGPoint)previousPosition {
    
    RDCollectionViewLayoutInvalidationContext *context = [[[[self class] invalidationContextClass] alloc] init];
    
    [context _setPreviousIndexPathsForInteractivelyMovingItems:previousIndexPaths];
    [context _setTargetIndexPathsForInteractivelyMovingItems:targetIndexPaths];
    [context _setInteractiveMovementTarget:targetPosition];
    if ([targetIndexPaths isEqual:previousIndexPaths]) {
        [context invalidateItemsAtIndexPaths:targetIndexPaths];
    }
    
    return context;
}

- (RDCollectionViewLayoutInvalidationContext *)invalidationContextForPreferredLayoutAttributes:(RDCollectionViewLayoutAttributes *)preferredAttributes withOriginalAttributes:(RDCollectionViewLayoutAttributes *)originalAttributes {
    return [[[[self class] invalidationContextClass] alloc] init];
}

- (BOOL)isEditing {
    return NO;
}

- (nullable RDCollectionViewLayoutAttributes *)layoutAttributesForDecorationViewOfKind:(NSString*)elementKind atIndexPath:(NSIndexPath *)indexPath {
    return nil;
}

- (nullable NSArray<__kindof RDCollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect {
    return nil;
}

- (RDCollectionViewLayoutAttributes *)layoutAttributesForInteractivelyMovingItemAtIndexPath:(NSIndexPath *)indexPath withTargetPosition:(CGPoint)position {
    RDCollectionViewLayoutAttributes *attributes = [[self layoutAttributesForItemAtIndexPath:indexPath] copy];
    [attributes setCenter:position];
    [attributes setZIndex:NSIntegerMax];
    return attributes;
}

- (nullable RDCollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath {
    return nil;
}

- (nullable RDCollectionViewLayoutAttributes *)layoutAttributesForSupplementaryViewOfKind:(NSString *)elementKind atIndexPath:(NSIndexPath *)indexPath {
    return nil;
}

- (void)prepareForAnimatedBoundsChange:(CGRect)oldBounds {
    // no implementation
}

// TODO: Refactor so it outputs the same binary
- (void)prepareForCollectionViewUpdates:(NSArray<RDCollectionViewUpdateItem *> *)updateItems {
    
    RDCollectionViewUpdate *update = [_collectionView _currentUpdate];
    
    for (RDCollectionReusableView *visibleView in _collectionView.visibleViews) {
        RDCollectionViewLayoutAttributes *attributes = [[visibleView _layoutAttributes] copy];
        if ([attributes _isCell]) {
            
            NSInteger globalItemIndex = *(update->_oldGlobalItemMap + [update->_oldModel globalIndexForItemAtIndexPath:[attributes indexPath]]);
            
            if (globalItemIndex != NSNotFound) {
                if ([update->_newModel isGlobalIndexValid:globalItemIndex]) {
                    [attributes setIndexPath:[update->_newModel indexPathForItemAtGlobalIndex:globalItemIndex]];
                }
                
                id key = [_RDCollectionViewItemKey collectionItemKeyForLayoutAttributes:attributes];
                
                [_initialAnimationLayoutAttributesDict setObject:attributes forKey:key];
            }
        } else {
            [attributes setIndexPath:[update newIndexPathForSupplementaryElementOfKind:[attributes _elementKind] oldIndexPath:[attributes indexPath]]];
            
            id key = [_RDCollectionViewItemKey collectionItemKeyForLayoutAttributes:attributes];
            
            [_initialAnimationLayoutAttributesDict setObject:attributes forKey:key];
        }
    }
    
    RDCollectionViewData *data = [_collectionView _collectionViewData];
    
    NSArray *attributes = [data layoutAttributesForElementsInRect:_collectionView._visibleBounds]; // Verify
    
    for (RDCollectionViewLayoutAttributes *attribute in attributes) {
        RDCollectionViewLayoutAttributes *attributes = [attribute copy];
        if ([attributes _isCell]) {
            
            NSInteger globalItemIndex = *(update->_newGlobalItemMap + [update->_newModel globalIndexForItemAtIndexPath:[attributes indexPath]]);
            
            if (globalItemIndex != NSNotFound) {
                [attributes setIndexPath:[update->_oldModel indexPathForItemAtGlobalIndex:globalItemIndex]];
                
                id key = [_RDCollectionViewItemKey collectionItemKeyForLayoutAttributes:attributes];
                
                [_finalAnimationLayoutAttributesDict setObject:attributes forKey:key];
            }
        } else {
            [attributes setIndexPath:[update oldIndexPathForSupplementaryElementOfKind:[attributes _elementKind] newIndexPath:[attributes indexPath]]];
            
            id key = [_RDCollectionViewItemKey collectionItemKeyForLayoutAttributes:attributes];
            
            [_finalAnimationLayoutAttributesDict setObject:attributes forKey:key];
        }
    }
    
    for (RDCollectionViewUpdateItem *updateItem in updateItems) {
        
        // loc_99a2c5
        
        if ([updateItem _isSectionOperation]) {
            // loc_99a310
            switch ([updateItem updateAction]) {
                case 0: { // RDCollectionUpdateActionInsert
                    // loc_99a5e6
                    [_insertedSectionsSet addIndex:[[updateItem _indexPath] section]];
                    break;
                    
                }
                case 1: { // RDCollectionUpdateActionDelete
                    // loc_99a333
                    [_deletedSectionsSet addIndex:[[updateItem _indexPath] section]];
                    break;
                }
                case 2: { // RDCollectionUpdateActionReload
                    // loc_99a545
                    [_deletedSectionsSet addIndex:[[updateItem indexPathBeforeUpdate] section]];
                    [_insertedSectionsSet addIndex:[[updateItem indexPathAfterUpdate] section]];
                    break;
                }
                case 3: { // RDCollectionUpdateActionMove
                    break;
                }
                case 4: { // RDCollectionUpdateActionNone
                    break;
                }
                    
                default:
                    break;
            }
        } else {
            
            if ([updateItem updateAction] > 2) {
                if ([updateItem updateAction] == 3) { // RDCollectionUpdateActionMove
                    
                    id key = [_RDCollectionViewItemKey collectionItemKeyForCellWithIndexPath:[updateItem indexPathAfterUpdate]];
                    RDCollectionViewLayoutAttributes *attributes = [[self layoutAttributesForItemAtIndexPath:[updateItem indexPathAfterUpdate]] copy];
                    if (attributes) {
                        attributes.alpha = 0.0; // TODO: Verify
                        [_initialAnimationLayoutAttributesDict setObject:attributes forKey:key];
                    }
                }
                
            } else {
                id key = [_RDCollectionViewItemKey collectionItemKeyForCellWithIndexPath:[updateItem indexPathBeforeUpdate]];
                RDCollectionViewLayoutAttributes *attributes = [[[_collectionView _visibleCellForIndexPath:[updateItem indexPathBeforeUpdate]] _layoutAttributes] copy];
                if (attributes) {
                    attributes.alpha = 0.0; // TODO: Verify
                    [_finalAnimationLayoutAttributesDict setObject:attributes forKey:key];
                }
            }
        }
    }

    for (NSInteger deletedSectionIndex = [_deletedSectionsSet firstIndex]; deletedSectionIndex != NSNotFound; deletedSectionIndex = [_deletedSectionsSet indexGreaterThanIndex:deletedSectionIndex]) {
        
        
        RDCollectionViewUpdate *update = [_collectionView _currentUpdate];
        NSArray* attributes = [update->_oldModel existingSupplementaryLayoutAttributesInSection:deletedSectionIndex];
        for (RDCollectionViewLayoutAttributes *attribute in attributes) {
            
            if ([attribute _isDecorationView]) {
                NSMutableArray *indexPaths = _deletedDecorationIndexPathsDict[[attribute _elementKind]];
                if (!indexPaths) {
                    indexPaths = [NSMutableArray array];
                    [_deletedDecorationIndexPathsDict setObject:indexPaths forKeyedSubscript:[attribute _elementKind]];
                }
                
                [indexPaths addObject:[attribute indexPath]];
            } else {
                NSMutableArray *indexPaths = _deletedSupplementaryIndexPathsDict[[attribute _elementKind]];
                if (!indexPaths) {
                    indexPaths = [NSMutableArray array];
                    [_deletedSupplementaryIndexPathsDict setObject:indexPaths forKeyedSubscript:[attribute _elementKind]];
                }
                
                [indexPaths addObject:[attribute indexPath]];
            }
        }
    }
    
    for (NSInteger insertedSectionIndex = [_insertedSectionsSet firstIndex]; insertedSectionIndex != NSNotFound; insertedSectionIndex = [_insertedSectionsSet indexGreaterThanIndex:insertedSectionIndex]) {
        
        RDCollectionViewUpdate *update = [_collectionView _currentUpdate];
        NSArray* attributes = [update->_oldModel existingSupplementaryLayoutAttributesInSection:insertedSectionIndex];
        for (RDCollectionViewLayoutAttributes *attribute in attributes) {
            if ([attribute _isDecorationView]) {
                NSMutableArray *indexPaths = _insertedDecorationIndexPathsDict[[attribute _elementKind]];
                if (!indexPaths) {
                    indexPaths = [NSMutableArray array];
                    [_insertedDecorationIndexPathsDict setObject:indexPaths forKeyedSubscript:[attribute _elementKind]];
                }
                
                [indexPaths addObject:[attribute indexPath]];
            } else {
                NSMutableArray *indexPaths = _insertedSupplementaryIndexPathsDict[[attribute _elementKind]];
                if (!indexPaths) {
                    indexPaths = [NSMutableArray array];
                    [_insertedSupplementaryIndexPathsDict setObject:indexPaths forKeyedSubscript:[attribute _elementKind]];
                }
                [indexPaths addObject:[attribute indexPath]];
            }
        }
    }
}

- (void)prepareForTransitionFromLayout:(RDCollectionViewLayout *)oldLayout {
    // not implementated
}

- (void)prepareForTransitionToLayout:(RDCollectionViewLayout *)newLayout {
    // not implementated
}

- (void)prepareLayout {
    // not implementated
}

- (void)registerClass:(nullable Class)viewClass forDecorationViewOfKind:(NSString *)elementKind {
    if (_decorationViewClassDict == nil) {
        _decorationViewClassDict = [[NSMutableDictionary alloc] init];
    }
    [_decorationViewNibDict removeObjectForKey:elementKind];
    if (viewClass) {
        [_decorationViewClassDict setValue:viewClass forKey:elementKind];
    } else {
        [_decorationViewClassDict removeObjectForKey:elementKind];
    }
}

- (void)registerNib:(nullable UINib *)nib forDecorationViewOfKind:(NSString *)elementKind {
    if (_decorationViewNibDict == nil) {
        _decorationViewNibDict = [[NSMutableDictionary alloc] init];
    }
    [_decorationViewClassDict removeObjectForKey:elementKind];
    if (nib) {
        [_decorationViewNibDict setValue:nib forKey:elementKind];
    } else {
        [_decorationViewNibDict removeObjectForKey:elementKind];
    }
}

- (void)setEditing:(BOOL)bEditing {
    // not implementated
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds {
    return NO;
}

- (BOOL)shouldInvalidateLayoutForPreferredLayoutAttributes:(RDCollectionViewLayoutAttributes *)preferredAttributes withOriginalAttributes:(RDCollectionViewLayoutAttributes *)originalAttributes {
    return NO;
}

- (RDCollectionViewLayoutAttributes *)snapshottedLayoutAttributeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return nil;
}

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset {
    return proposedContentOffset;
}

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity {
    return proposedContentOffset;
}

- (NSIndexPath *)targetIndexPathForInteractivelyMovingItem:(NSIndexPath *)previousIndexPath withPosition:(CGPoint)position {
    
    CGRect positionRect;
    positionRect.origin = position;
    positionRect.size = UICollectionViewFlowLayoutAutomaticSize; // TODO: Verify
    
    NSMutableArray<RDCollectionViewLayoutAttributes *> *attributes = [self layoutAttributesForElementsInRect:positionRect];
    
    RDCollectionViewLayoutAttributes *topmostAttribute = nil;
    for (RDCollectionViewLayoutAttributes *attribute in attributes) {
        if (RDCollectionElementCategoryCell == [attribute representedElementCategory]) {
            if (topmostAttribute != nil) {
                if (attribute.zIndex > topmostAttribute.zIndex) {
                    topmostAttribute = attribute;
                }
            } else {
                topmostAttribute = attribute;
            }
        }
    }
    return [topmostAttribute indexPath];
}

- (CGPoint)transitionContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset keyItemIndexPath:(NSIndexPath *)indexPath {
    return proposedContentOffset;
}

- (CGPoint)updatesContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset {
    return proposedContentOffset;
}


@end
