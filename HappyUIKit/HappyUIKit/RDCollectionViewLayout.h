//
//  RDCollectionViewLayout.h
//  HappyUIKit
//
//  Created by Roman Dzieciol on 1/15/17.
//  Copyright © 2017 R3PI. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class RDDynamicAnimator;
@class RDCollectionView;
@class RDCollectionViewLayoutInvalidationContext;
@class RDCollectionViewUpdateItem;
@class RDCollectionViewLayoutAttributes;
@class _RDCollectionViewCompositionLayout;

@interface RDCollectionViewLayout : NSObject <NSCoding> {
    RDDynamicAnimator * _animator;
    RDCollectionView * _collectionView;
    CGSize  _collectionViewBoundsSize;
    __weak _RDCollectionViewCompositionLayout  * _compositionLayout;
    NSMutableDictionary * _decorationViewClassDict;
    NSMutableDictionary * _decorationViewExternalObjectsTables;
    NSMutableDictionary * _decorationViewNibDict;
    NSMutableDictionary * _deletedDecorationIndexPathsDict;
    NSMutableIndexSet * _deletedSectionsSet;
    NSMutableDictionary * _deletedSupplementaryIndexPathsDict;
    NSArray * _elementKinds;
    NSMutableDictionary * _finalAnimationLayoutAttributesDict;
    CGRect  _frame;
    NSMutableDictionary * _initialAnimationLayoutAttributesDict;
    NSMutableDictionary * _insertedDecorationIndexPathsDict;
    NSMutableIndexSet * _insertedSectionsSet;
    NSMutableDictionary * _insertedSupplementaryIndexPathsDict;
    RDCollectionViewLayoutInvalidationContext * _invalidationContext;
    NSIndexSet * _items;
    struct {
        unsigned int inTransitionFromTransitionLayout : 1;
        unsigned int inTransitionToTransitionLayout : 1;
        unsigned int prepared : 1;
        unsigned int wantsRightToLeftHorizontalMirroringIfNeeded : 1;
    }  _layoutFlags;
    CGPoint  _layoutOffset;
    NSUInteger  _layoutOffsetEdges;
    NSIndexSet * _sections;
    RDCollectionViewLayout * _siblingLayout;
    NSInteger  _sublayoutType;
    RDCollectionViewLayout * _transitioningFromLayout;
    RDCollectionViewLayout * _transitioningToLayout;
}

@property (setter=_setWantsRightToLeftHorizontalMirroringIfNeeded:, nonatomic) bool _wantsRightToLeftHorizontalMirroringIfNeeded;
@property (nonatomic, readonly) RDCollectionView *collectionView;
@property (getter=_compositionLayout, setter=_setCompositionLayout:, nonatomic, weak) _RDCollectionViewCompositionLayout *compositionLayout;
@property (getter=_elementKinds, setter=_setElementKinds:, nonatomic, copy) NSArray *elementKinds;
@property (getter=_frame, setter=_setFrame:, nonatomic) CGRect frame;
@property (getter=_items, setter=_setItems:, nonatomic, copy) NSIndexSet *items;
@property (getter=_layoutOffset, setter=_setLayoutOffset:, nonatomic) CGPoint layoutOffset;
@property (getter=_layoutOffsetEdges, setter=_setLayoutOffsetEdges:, nonatomic) NSUInteger layoutOffsetEdges;
@property (getter=_isPrepared, setter=_setPrepared:, nonatomic) bool prepared;
@property (getter=_sections, setter=_setSections:, nonatomic, copy) NSIndexSet *sections;
@property (getter=_siblingLayout, setter=_setSiblingLayout:, nonatomic) RDCollectionViewLayout *siblingLayout;
@property (getter=_sublayoutType, setter=_setSublayoutType:, nonatomic) NSInteger sublayoutType;

// Image: /System/Library/Frameworks/UIKit.framework/UIKit

+ (Class)invalidationContextClass;
+ (Class)layoutAttributesClass;

//- (void).cxx_destruct;
- (id /* block */)_animationForReusableView:(id)arg1 toLayoutAttributes:(id)arg2;
- (id /* block */)_animationForReusableView:(id)arg1 toLayoutAttributes:(id)arg2 type:(NSUInteger)arg3;
- (CGRect)_bounds;
- (bool)_cellsShouldConferWithAutolayoutEngineForSizingInfo;
- (__weak _RDCollectionViewCompositionLayout *)_compositionLayout;
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
- (CGPoint)_offsetInTopParentLayout:( _RDCollectionViewCompositionLayout *)arg1;
- (UIEdgeInsets)_preferredLayoutMargins;
- (void)_prepareForTransitionFromLayout:(id)arg1;
- (void)_prepareForTransitionToLayout:(id)arg1;
- (void)_prepareToAnimateFromCollectionViewItems:(id)arg1 atContentOffset:(CGPoint)arg2 toItems:(id)arg3 atContentOffset:(CGPoint)arg4;
- (id)_reorderingTargetItemIndexPathForPosition:(CGPoint)arg1 withPreviousIndexPath:(id)arg2;
- (id)_sections;
- (void)_setCollectionView:(id)arg1;
- (void)_setCollectionViewBoundsSize:(CGSize)arg1;
- (void)_setCompositionLayout:( _RDCollectionViewCompositionLayout *)arg1;
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
- (bool)_shouldScrollToContentBeginningInRightToLeft;
- (id)_siblingLayout;
- (NSInteger)_sublayoutType;
- (bool)_supportsAdvancedTransitionAnimations;
- (bool)_wantsRightToLeftHorizontalMirroringIfNeeded;
- (bool)canBeEdited;
- (id)collectionView;
- (CGSize)collectionViewContentSize;
- (CGRect)convertRect:(CGRect)arg1 fromLayout:(id)arg2;
- (CGRect)convertRect:(CGRect)arg1 toLayout:(id)arg2;
- (void)encodeWithCoder:(id)arg1;
- (nullable RDCollectionViewLayoutAttributes *)finalLayoutAttributesForDisappearingDecorationElementOfKind:(id)arg1 atIndexPath:(id)arg2;
- (nullable RDCollectionViewLayoutAttributes *)finalLayoutAttributesForDisappearingItemAtIndexPath:(id)arg1;
- (nullable RDCollectionViewLayoutAttributes *)finalLayoutAttributesForDisappearingSupplementaryElementOfKind:(id)arg1 atIndexPath:(id)arg2;
- (void)finalizeAnimatedBoundsChange;
- (void)finalizeCollectionViewUpdates;
- (void)finalizeLayoutTransition;
- (id)indexPathsToDeleteForDecorationViewOfKind:(id)arg1;
- (id)indexPathsToDeleteForSupplementaryViewOfKind:(id)arg1;
- (id)indexPathsToInsertForDecorationViewOfKind:(id)arg1;
- (id)indexPathsToInsertForSupplementaryViewOfKind:(id)arg1;
- (id)init;
- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder;
- (nullable RDCollectionViewLayoutAttributes *)initialLayoutAttributesForAppearingDecorationElementOfKind:(id)arg1 atIndexPath:(id)arg2;
- (nullable RDCollectionViewLayoutAttributes *)initialLayoutAttributesForAppearingItemAtIndexPath:(id)arg1;
- (nullable RDCollectionViewLayoutAttributes *)initialLayoutAttributesForAppearingSupplementaryElementOfKind:(id)arg1 atIndexPath:(id)arg2;
- (void)invalidateLayout;
- (void)invalidateLayoutWithContext:(id)arg1;
- (id)invalidationContextForBoundsChange:(CGRect)arg1;
- (id)invalidationContextForEndingInteractiveMovementOfItemsToFinalIndexPaths:(id)arg1 previousIndexPaths:(id)arg2 movementCancelled:(bool)arg3;
- (id)invalidationContextForInteractivelyMovingItems:(id)arg1 withTargetPosition:(CGPoint)arg2 previousIndexPaths:(id)arg3 previousPosition:(CGPoint)arg4;
- (id)invalidationContextForPreferredLayoutAttributes:(id)arg1 withOriginalAttributes:(id)arg2;
- (bool)isEditing;
- (nullable RDCollectionViewLayoutAttributes *)layoutAttributesForDecorationViewOfKind:(id)arg1 atIndexPath:(id)arg2;
- (nullable NSArray<__kindof UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect;
- (id)layoutAttributesForInteractivelyMovingItemAtIndexPath:(id)arg1 withTargetPosition:(CGPoint)arg2;
- (nullable UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(id)arg1;
- (nullable UICollectionViewLayoutAttributes *)layoutAttributesForSupplementaryViewOfKind:(id)arg1 atIndexPath:(id)arg2;
- (void)prepareForAnimatedBoundsChange:(CGRect)arg1;
- (void)prepareForCollectionViewUpdates:(id)arg1;
- (void)prepareForTransitionFromLayout:(id)arg1;
- (void)prepareForTransitionToLayout:(id)arg1;
- (void)prepareLayout;
- (void)registerClass:(nullable Class)viewClass forDecorationViewOfKind:(NSString *)elementKind;
- (void)registerNib:(nullable UINib *)nib forDecorationViewOfKind:(NSString *)elementKind;
- (void)setEditing:(bool)arg1;
- (bool)shouldInvalidateLayoutForBoundsChange:(CGRect)arg1;
- (bool)shouldInvalidateLayoutForPreferredLayoutAttributes:(id)arg1 withOriginalAttributes:(id)arg2;
- (id)snapshottedLayoutAttributeForItemAtIndexPath:(id)arg1;
- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)arg1;
- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)arg1 withScrollingVelocity:(CGPoint)arg2;
- (id)targetIndexPathForInteractivelyMovingItem:(id)arg1 withPosition:(CGPoint)arg2;
- (CGPoint)transitionContentOffsetForProposedContentOffset:(CGPoint)arg1 keyItemIndexPath:(id)arg2;
- (CGPoint)updatesContentOffsetForProposedContentOffset:(CGPoint)arg1;


@end

NS_ASSUME_NONNULL_END

