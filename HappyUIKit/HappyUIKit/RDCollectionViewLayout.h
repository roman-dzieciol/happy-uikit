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
@class RDCollectionReusableView;
@class _RDCollectionViewCompositionLayout;

@interface RDCollectionViewLayout : NSObject <NSCoding> {
    RDDynamicAnimator * _animator;
    RDCollectionView * _collectionView;
    CGSize  _collectionViewBoundsSize;
    __weak _RDCollectionViewCompositionLayout  * _compositionLayout;
    NSMutableDictionary * _decorationViewClassDict;
    NSMutableDictionary * _decorationViewExternalObjectsTables;
    NSMutableDictionary<NSString *, UINib *>* _decorationViewNibDict;
    NSMutableDictionary * _deletedDecorationIndexPathsDict;
    NSMutableIndexSet * _deletedSectionsSet;
    NSMutableDictionary * _deletedSupplementaryIndexPathsDict;
    NSArray<NSString *> * _elementKinds;
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

+ (Class)invalidationContextClass;
+ (Class)layoutAttributesClass;

- (id /* block */)_animationForReusableView:(RDCollectionReusableView *)reusableView toLayoutAttributes:(RDCollectionViewLayoutAttributes *)attributes;
- (id /* block */)_animationForReusableView:(RDCollectionReusableView *)reusableView toLayoutAttributes:(RDCollectionViewLayoutAttributes *)attributes type:(NSUInteger)type;
- (CGRect)_bounds;
- (BOOL)_cellsShouldConferWithAutolayoutEngineForSizingInfo;
- (RDCollectionReusableView *)_decorationViewForLayoutAttributes:(RDCollectionViewLayoutAttributes *)attributes;
- (void)_didFinishLayoutTransitionAnimations:(BOOL)bFlag;
- (RDDynamicAnimator *)_dynamicAnimator;
- (CGRect)_dynamicReferenceBounds;
- (BOOL)_estimatesSizes;
- (void)_finalizeCollectionViewItemAnimations;
- (void)_finalizeLayoutTransition;
- (NSArray<NSIndexPath *> *)_indexPathsToDeleteForDecorationViewOfKind:(NSString *)elementKind;
- (NSArray<NSIndexPath *> *)_indexPathsToDeleteForSupplementaryViewOfKind:(NSString *)elementKind;
- (NSArray<NSIndexPath *> *)_indexPathsToInsertForDecorationViewOfKind:(NSString *)elementKind ;
- (NSArray<NSIndexPath *> *)_indexPathsToInsertForSupplementaryViewOfKind:(NSString *)elementKind;
- (void)_invalidateLayoutUsingContext:(RDCollectionViewLayoutInvalidationContext *)invalidationContext;
- (RDCollectionViewLayoutInvalidationContext *)_invalidationContextForEndingReorderingItemToFinalIndexPaths:(NSArray<NSIndexPath *> *)indexPaths previousIndexPaths:(NSArray<NSIndexPath *> *)previousIndexPaths reorderingCancelled:(BOOL)reorderingCancelled;
- (RDCollectionViewLayoutInvalidationContext *)_invalidationContextForReorderingTargetPosition:(CGPoint)targetPosition targetIndexPaths:(NSArray<NSIndexPath *> *)indexPaths withPreviousPosition:(CGPoint)previousPosition previousIndexPaths:(NSArray<NSIndexPath *> *)previousIndexPaths;
- (BOOL)_isPrepared;
- (RDCollectionViewLayoutAttributes *)_layoutAttributesForReorderedItemAtIndexPath:(NSIndexPath *)indexPath withTargetPosition:(CGPoint)targetPosition;
- (CGPoint)_offsetInTopParentLayout:(_RDCollectionViewCompositionLayout *)compositionLayout;
- (UIEdgeInsets)_preferredLayoutMargins;
- (void)_prepareForTransitionFromLayout:(RDCollectionViewLayout *)transitioningFromLayout;
- (void)_prepareForTransitionToLayout:(RDCollectionViewLayout *)transitioningToLayout;
- (void)_prepareToAnimateFromCollectionViewItems:(id)fromItems atContentOffset:(CGPoint)fromOffset toItems:(id)toItems atContentOffset:(CGPoint)toOffset;
- (NSIndexPath *)_reorderingTargetItemIndexPathForPosition:(CGPoint)position withPreviousIndexPath:(NSIndexPath *)indexPath;
- (void)_setExternalObjectTable:(NSDictionary *)externalObjectTable forNibLoadingOfDecorationViewOfKind:(NSString *)elementKind;
- (void)_setPrepared:(BOOL)bFlag;
- (void)_setWantsRightToLeftHorizontalMirroringIfNeeded:(BOOL)bFlag;
- (BOOL)_shouldScrollToContentBeginningInRightToLeft;
- (BOOL)_supportsAdvancedTransitionAnimations;
- (BOOL)_wantsRightToLeftHorizontalMirroringIfNeeded;
- (BOOL)canBeEdited;
- (RDCollectionView *)collectionView;
- (CGSize)collectionViewContentSize;
- (CGRect)convertRect:(CGRect)rect fromLayout:(RDCollectionViewLayout *)layout;
- (CGRect)convertRect:(CGRect)rect toLayout:(RDCollectionViewLayout *)layout;
- (void)encodeWithCoder:(NSCoder *)aCoder;
- (nullable RDCollectionViewLayoutAttributes *)finalLayoutAttributesForDisappearingDecorationElementOfKind:(NSString *)elementKind atIndexPath:(NSIndexPath *)decorationIndexPath;
- (nullable RDCollectionViewLayoutAttributes *)finalLayoutAttributesForDisappearingItemAtIndexPath:(NSIndexPath *)itemIndexPath;
- (nullable RDCollectionViewLayoutAttributes *)finalLayoutAttributesForDisappearingSupplementaryElementOfKind:(NSString *)elementKind atIndexPath:(NSIndexPath *)elementIndexPath;
- (void)finalizeAnimatedBoundsChange;
- (void)finalizeCollectionViewUpdates;
- (void)finalizeLayoutTransition;
- (NSArray<NSIndexPath *> *)indexPathsToDeleteForDecorationViewOfKind:(NSString *)elementKind;
- (NSArray<NSIndexPath *> *)indexPathsToDeleteForSupplementaryViewOfKind:(NSString *)elementKind;
- (NSArray<NSIndexPath *> *)indexPathsToInsertForDecorationViewOfKind:(NSString *)elementKind;
- (NSArray<NSIndexPath *> *)indexPathsToInsertForSupplementaryViewOfKind:(NSString *)elementKind;
- (nullable RDCollectionViewLayoutAttributes *)initialLayoutAttributesForAppearingDecorationElementOfKind:(NSString *)elementKind atIndexPath:(NSIndexPath *)decorationIndexPath;
- (nullable RDCollectionViewLayoutAttributes *)initialLayoutAttributesForAppearingItemAtIndexPath:(NSIndexPath *)itemIndexPath;
- (nullable RDCollectionViewLayoutAttributes *)initialLayoutAttributesForAppearingSupplementaryElementOfKind:(NSString *)elementKind atIndexPath:(NSIndexPath *)elementIndexPath;
- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder;
- (void)invalidateLayout;
- (void)invalidateLayoutWithContext:(RDCollectionViewLayoutInvalidationContext *)context;
- (RDCollectionViewLayoutInvalidationContext *)invalidationContextForBoundsChange:(CGRect)newBounds;
- (RDCollectionViewLayoutInvalidationContext *)invalidationContextForEndingInteractiveMovementOfItemsToFinalIndexPaths:(NSArray<NSIndexPath *> *)indexPaths previousIndexPaths:(NSArray<NSIndexPath *> *)previousIndexPaths movementCancelled:(BOOL)movementCancelled;
- (RDCollectionViewLayoutInvalidationContext *)invalidationContextForInteractivelyMovingItems:(NSArray<NSIndexPath *> *)targetIndexPaths withTargetPosition:(CGPoint)targetPosition previousIndexPaths:(NSArray<NSIndexPath *> *)previousIndexPaths previousPosition:(CGPoint)previousPosition;
- (RDCollectionViewLayoutInvalidationContext *)invalidationContextForPreferredLayoutAttributes:(RDCollectionViewLayoutAttributes *)preferredAttributes withOriginalAttributes:(RDCollectionViewLayoutAttributes *)originalAttributes;
- (BOOL)isEditing;
- (nullable RDCollectionViewLayoutAttributes *)layoutAttributesForDecorationViewOfKind:(NSString*)elementKind atIndexPath:(NSIndexPath *)indexPath;
- (nullable NSArray<__kindof RDCollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect;
- (RDCollectionViewLayoutAttributes *)layoutAttributesForInteractivelyMovingItemAtIndexPath:(NSIndexPath *)indexPath withTargetPosition:(CGPoint)position;
- (nullable RDCollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath;
- (nullable RDCollectionViewLayoutAttributes *)layoutAttributesForSupplementaryViewOfKind:(NSString *)elementKind atIndexPath:(NSIndexPath *)indexPath;
- (void)prepareForAnimatedBoundsChange:(CGRect)oldBounds;
- (void)prepareForCollectionViewUpdates:(NSArray<RDCollectionViewUpdateItem *> *)updateItems;
- (void)prepareForTransitionFromLayout:(RDCollectionViewLayout *)oldLayout;
- (void)prepareForTransitionToLayout:(RDCollectionViewLayout *)newLayout;
- (void)prepareLayout;
- (void)registerClass:(nullable Class)viewClass forDecorationViewOfKind:(NSString *)elementKind;
- (void)registerNib:(nullable UINib *)nib forDecorationViewOfKind:(NSString *)elementKind;
- (void)setEditing:(BOOL)bEditing;
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds;
- (BOOL)shouldInvalidateLayoutForPreferredLayoutAttributes:(RDCollectionViewLayoutAttributes *)preferredAttributes withOriginalAttributes:(RDCollectionViewLayoutAttributes *)originalAttributes;
- (RDCollectionViewLayoutAttributes *)snapshottedLayoutAttributeForItemAtIndexPath:(NSIndexPath *)indexPath;
- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset;
- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity;
- (NSIndexPath *)targetIndexPathForInteractivelyMovingItem:(NSIndexPath *)previousIndexPath withPosition:(CGPoint)position;
- (CGPoint)transitionContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset keyItemIndexPath:(NSIndexPath *)indexPath;
- (CGPoint)updatesContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset;

@end

NS_ASSUME_NONNULL_END

