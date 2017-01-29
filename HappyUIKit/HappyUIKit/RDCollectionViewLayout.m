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




@implementation RDCollectionViewLayout

#if 0

+ (Class)invalidationContextClass;
+ (Class)layoutAttributesClass;

- (void).cxx_destruct;
- (id /* block */)_animationForReusableView:(id)arg1 toLayoutAttributes:(id)arg2;
- (id /* block */)_animationForReusableView:(id)arg1 toLayoutAttributes:(id)arg2 type:(NSUInteger)arg3;
- (CGRect)_bounds;
- (bool)_cellsShouldConferWithAutolayoutEngineForSizingInfo;
- (struct _RDCollectionViewCompositionLayout { Class x1; }*)_compositionLayout;
- (id)_decorationViewForLayoutAttributes:(id)arg1;
- (void)_didFinishLayoutTransitionAnimations:(bool)arg1;
- (id)_dynamicAnimator;
- (CGRect)_dynamicReferenceBounds;
- (id)_elementKinds;
- (bool)_estimatesSizes;
- (void)_finalizeCollectionViewItemAnimations;
- (void)_finalizeLayoutTransition;
- (CGRect)_frame;
- (id)_indexPathsToDeleteForDecorationViewOfKind:(id)arg1;
- (id)_indexPathsToDeleteForSupplementaryViewOfKind:(id)arg1;
- (id)_indexPathsToInsertForDecorationViewOfKind:(id)arg1;
- (id)_indexPathsToInsertForSupplementaryViewOfKind:(id)arg1;
- (void)_invalidateLayoutUsingContext:(id)arg1;
- (id)_invalidationContextForEndingReorderingItemToFinalIndexPaths:(id)arg1 previousIndexPaths:(id)arg2 reorderingCancelled:(bool)arg3;
- (id)_invalidationContextForReorderingTargetPosition:(CGPoint)arg1 targetIndexPaths:(id)arg2 withPreviousPosition:(CGPoint)arg3 previousIndexPaths:(id)arg4;
- (bool)_isPrepared;
- (id)_items;
- (id)_layoutAttributesForReorderedItemAtIndexPath:(id)arg1 withTargetPosition:(CGPoint)arg2;
- (CGPoint)_layoutOffset;
- (NSUInteger)_layoutOffsetEdges;
- (CGPoint)_offsetInTopParentLayout:(_RDCollectionViewCompositionLayout *)arg1;
- (UIEdgeInsets)_preferredLayoutMargins;
- (void)_prepareForTransitionFromLayout:(id)arg1;
- (void)_prepareForTransitionToLayout:(id)arg1;
- (void)_prepareToAnimateFromCollectionViewItems:(id)arg1 atContentOffset:(CGPoint)arg2 toItems:(id)arg3 atContentOffset:(CGPoint)arg4;
- (id)_reorderingTargetItemIndexPathForPosition:(CGPoint)arg1 withPreviousIndexPath:(id)arg2;
- (id)_sections;
- (void)_setCollectionView:(id)arg1;
- (void)_setCollectionViewBoundsSize:(CGSize)arg1;
- (void)_setCompositionLayout:(struct _RDCollectionViewCompositionLayout { Class x1; }*)arg1;
- (void)_setDynamicAnimator:(id)arg1;
- (void)_setElementKinds:(id)arg1;
- (void)_setExternalObjectTable:(id)arg1 forNibLoadingOfDecorationViewOfKind:(id)arg2;
- (void)_setFrame:(CGRect)arg1;
- (void)_setItems:(id)arg1;
- (void)_setLayoutOffset:(CGPoint)arg1;
- (void)_setLayoutOffsetEdges:(NSUInteger)arg1;
- (void)_setPrepared:(bool)arg1;
- (void)_setSections:(id)arg1;
- (void)_setSiblingLayout:(id)arg1;
- (void)_setSublayoutType:(NSInteger)arg1;
- (void)_setWantsRightToLeftHorizontalMirroringIfNeeded:(bool)arg1;
- (BOOL)_shouldScrollToContentBeginningInRightToLeft;
- (id)_siblingLayout;
- (NSInteger)_sublayoutType;
- (BOOL)_supportsAdvancedTransitionAnimations;
- (BOOL)_wantsRightToLeftHorizontalMirroringIfNeeded;

- (BOOL)canBeEdited {
    return NO;
}

- (id)collectionView {
    return _collectionView ?: [_compositionLayout collectionView];
}

- (CGSize)collectionViewContentSize {
    return CGSizeZero;
}

- (CGRect)convertRect:(CGRect)arg1 fromLayout:(RDCollectionViewLayout *)arg2;


- (CGRect)convertRect:(CGRect)arg1 toLayout:(RDCollectionViewLayout *)arg2;

#endif

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


- (id)init {
    self = [super init];
    if (self) {
        //_RDCollectionViewLayoutCommonInit();
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
//        _RDCollectionViewLayoutCommonInit();
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
