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
- (BOOL)canBeEdited;
- (id)collectionView;
- (CGSize)collectionViewContentSize;

- (CGRect)convertRect:(CGRect)arg1 fromLayout:(id)arg2;
- (CGRect)convertRect:(CGRect)arg1 toLayout:(id)arg2;

- (void)encodeWithCoder:(NSCoder *)aCoder;

- (nullable UICollectionViewLayoutAttributes *)finalLayoutAttributesForDisappearingDecorationElementOfKind:(NSString *)elementKind atIndexPath:(NSIndexPath *)decorationIndexPath;

- (nullable UICollectionViewLayoutAttributes *)finalLayoutAttributesForDisappearingItemAtIndexPath:(NSIndexPath *)itemIndexPath;


- (nullable UICollectionViewLayoutAttributes *)finalLayoutAttributesForDisappearingSupplementaryElementOfKind:(NSString *)elementKind atIndexPath:(NSIndexPath *)elementIndexPath;

- (void)finalizeAnimatedBoundsChange;
- (void)finalizeCollectionViewUpdates;
- (void)finalizeLayoutTransition;

- (NSArray<NSIndexPath *> *)indexPathsToDeleteForDecorationViewOfKind:(NSString *)elementKind;

- (NSArray<NSIndexPath *> *)indexPathsToDeleteForSupplementaryViewOfKind:(NSString *)elementKind;

- (NSArray<NSIndexPath *> *)indexPathsToInsertForDecorationViewOfKind:(NSString *)elementKind;

- (NSArray<NSIndexPath *> *)indexPathsToInsertForSupplementaryViewOfKind:(NSString *)elementKind;

- (id)init;

- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder;

- (nullable UICollectionViewLayoutAttributes *)initialLayoutAttributesForAppearingDecorationElementOfKind:(NSString *)elementKind atIndexPath:(NSIndexPath *)decorationIndexPath;

- (nullable UICollectionViewLayoutAttributes *)initialLayoutAttributesForAppearingItemAtIndexPath:(NSIndexPath *)itemIndexPath;
- (nullable UICollectionViewLayoutAttributes *)initialLayoutAttributesForAppearingSupplementaryElementOfKind:(NSString *)elementKind atIndexPath:(NSIndexPath *)elementIndexPath;

- (void)invalidateLayout;
- (void)invalidateLayoutWithContext:(UICollectionViewLayoutInvalidationContext *)context

- (UICollectionViewLayoutInvalidationContext *)invalidationContextForBoundsChange:(CGRect)newBounds;

- (UICollectionViewLayoutInvalidationContext *)invalidationContextForEndingInteractiveMovementOfItemsToFinalIndexPaths:(NSArray<NSIndexPath *> *)indexPaths previousIndexPaths:(NSArray<NSIndexPath *> *)previousIndexPaths movementCancelled:(BOOL)movementCancelled;

- (UICollectionViewLayoutInvalidationContext *)invalidationContextForInteractivelyMovingItems:(NSArray<NSIndexPath *> *)targetIndexPaths withTargetPosition:(CGPoint)targetPosition previousIndexPaths:(NSArray<NSIndexPath *> *)previousIndexPaths previousPosition:(CGPoint)previousPosition;

- (UICollectionViewLayoutInvalidationContext *)invalidationContextForPreferredLayoutAttributes:(UICollectionViewLayoutAttributes *)preferredAttributes withOriginalAttributes:(UICollectionViewLayoutAttributes *)originalAttributes;
- (BOOL)isEditing;
- (nullable UICollectionViewLayoutAttributes *)layoutAttributesForDecorationViewOfKind:(NSString*)elementKind atIndexPath:(NSIndexPath *)indexPath;
#endif


- (nullable NSArray<__kindof UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect {
    return nil;
}

#if 0
- (UICollectionViewLayoutAttributes *)layoutAttributesForInteractivelyMovingItemAtIndexPath:(NSIndexPath *)indexPath withTargetPosition:(CGPoint)position;
- (nullable UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath;
- (nullable UICollectionViewLayoutAttributes *)layoutAttributesForSupplementaryViewOfKind:(NSString *)elementKind atIndexPath:(NSIndexPath *)indexPath;
- (void)prepareForAnimatedBoundsChange:(CGRect)oldBounds;


#endif

// TODO: Refactor so it outputs the same binary
- (void)prepareForCollectionViewUpdates:(NSArray<UICollectionViewUpdateItem *> *)updateItems {
    
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

- (void)prepareForTransitionFromLayout:(UICollectionViewLayout *)oldLayout {
    // not implementated
}

- (void)prepareForTransitionToLayout:(UICollectionViewLayout *)newLayout {
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
        if (UICollectionElementCategoryCell == [attribute representedElementCategory]) {
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
