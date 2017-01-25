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

@class RDCollectionView;
@class RDCollectionViewLayoutInvalidationContext;
@class RDCollectionViewUpdateItem;
@class RDCollectionViewLayoutAttributes;

@interface RDCollectionViewLayout : NSObject<NSCoding> {
    UIDynamicAnimator * _animator;
    RDCollectionView * _collectionView;
    CGSize  _collectionViewBoundsSize;
    //struct _RDCollectionViewCompositionLayout { Class x1; } * _compositionLayout;
    id _compositionLayout;
    NSMutableDictionary * _decorationViewClassDict;
    NSMutableDictionary * _decorationViewExternalObjectsTables;
    NSMutableDictionary * _decorationViewNibDict;
    NSMutableDictionary * _deletedDecorationIndexPathsDict;
    NSMutableIndexSet * _deletedSectionsSet;
    NSMutableDictionary * _deletedSupplementaryIndexPathsDict;
    NSArray * _elementKinds;
    NSMutableDictionary * _finalAnimationLayoutAttributesDict;
    CGRect _frame;
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
    @public NSIndexSet * _sections;
    __weak RDCollectionViewLayout * _siblingLayout;
    NSInteger  _sublayoutType;
    RDCollectionViewLayout * _transitioningFromLayout;
    RDCollectionViewLayout * _transitioningToLayout;
}

- (instancetype)init NS_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder NS_DESIGNATED_INITIALIZER;

// Methods in this class are meant to be overridden and will be called by its collection view to gather layout information.
// To get the truth on the current state of the collection view, call methods on RDCollectionView rather than these.

@property (nullable, nonatomic, readonly) RDCollectionView *collectionView;

// Call -invalidateLayout to indicate that the collection view needs to requery the layout information.
// Subclasses must always call super if they override.
- (void)invalidateLayout;
- (void)invalidateLayoutWithContext:(RDCollectionViewLayoutInvalidationContext *)context;

- (void)registerClass:(nullable Class)viewClass forDecorationViewOfKind:(NSString *)elementKind;
- (void)registerNib:(nullable UINib *)nib forDecorationViewOfKind:(NSString *)elementKind;

@end

@interface RDCollectionViewLayout (UISubclassingHooks)

#if UIKIT_DEFINE_AS_PROPERTIES
@property(class, nonatomic, readonly) Class layoutAttributesClass; // override this method to provide a custom class to be used when instantiating instances of RDCollectionViewLayoutAttributes
@property(class, nonatomic, readonly) Class invalidationContextClass; // override this method to provide a custom class to be used for invalidation contexts
#else
+ (Class)layoutAttributesClass; // override this method to provide a custom class to be used when instantiating instances of RDCollectionViewLayoutAttributes
+ (Class)invalidationContextClass; // override this method to provide a custom class to be used for invalidation contexts
#endif

// The collection view calls -prepareLayout once at its first layout as the first message to the layout instance.
// The collection view calls -prepareLayout again after layout is invalidated and before requerying the layout information.
// Subclasses should always call super if they override.
- (void)prepareLayout;

// RDCollectionView calls these four methods to determine the layout information.
// Implement -layoutAttributesForElementsInRect: to return layout attributes for for supplementary or decoration views, or to perform layout in an as-needed-on-screen fashion.
// Additionally, all layout subclasses should implement -layoutAttributesForItemAtIndexPath: to return layout attributes instances on demand for specific index paths.
// If the layout supports any supplementary or decoration view types, it should also implement the respective atIndexPath: methods for those types.
- (nullable NSArray<__kindof RDCollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect; // return an array layout attributes instances for all the views in the given rect
- (nullable RDCollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath;
- (nullable RDCollectionViewLayoutAttributes *)layoutAttributesForSupplementaryViewOfKind:(NSString *)elementKind atIndexPath:(NSIndexPath *)indexPath;
- (nullable RDCollectionViewLayoutAttributes *)layoutAttributesForDecorationViewOfKind:(NSString*)elementKind atIndexPath:(NSIndexPath *)indexPath;

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds; // return YES to cause the collection view to requery the layout for geometry information
- (RDCollectionViewLayoutInvalidationContext *)invalidationContextForBoundsChange:(CGRect)newBounds;

- (BOOL)shouldInvalidateLayoutForPreferredLayoutAttributes:(RDCollectionViewLayoutAttributes *)preferredAttributes withOriginalAttributes:(RDCollectionViewLayoutAttributes *)originalAttributes;
- (RDCollectionViewLayoutInvalidationContext *)invalidationContextForPreferredLayoutAttributes:(RDCollectionViewLayoutAttributes *)preferredAttributes withOriginalAttributes:(RDCollectionViewLayoutAttributes *)originalAttributes;

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity; // return a point at which to rest after scrolling - for layouts that want snap-to-point scrolling behavior
- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset; // a layout can return the content offset to be applied during transition or update animations

#if UIKIT_DEFINE_AS_PROPERTIES
@property(nonatomic, readonly) CGSize collectionViewContentSize; // Subclasses must override this method and use it to return the width and height of the collection view’s content. These values represent the width and height of all the content, not just the content that is currently visible. The collection view uses this information to configure its own content size to facilitate scrolling.
#else
- (CGSize)collectionViewContentSize; // Subclasses must override this method and use it to return the width and height of the collection view’s content. These values represent the width and height of all the content, not just the content that is currently visible. The collection view uses this information to configure its own content size to facilitate scrolling.
#endif

@end

@interface RDCollectionViewLayout (UIUpdateSupportHooks)

// This method is called when there is an update with deletes/inserts to the collection view.
// It will be called prior to calling the initial/final layout attribute methods below to give the layout an opportunity to do batch computations for the insertion and deletion layout attributes.
// The updateItems parameter is an array of RDCollectionViewUpdateItem instances for each element that is moving to a new index path.
- (void)prepareForCollectionViewUpdates:(NSArray<RDCollectionViewUpdateItem *> *)updateItems;
- (void)finalizeCollectionViewUpdates; // called inside an animation block after the update

- (void)prepareForAnimatedBoundsChange:(CGRect)oldBounds; // RDCollectionView calls this when its bounds have changed inside an animation block before displaying cells in its new bounds
- (void)finalizeAnimatedBoundsChange; // also called inside the animation block

// RDCollectionView calls this when prior the layout transition animation on the incoming and outgoing layout
- (void)prepareForTransitionToLayout:(RDCollectionViewLayout *)newLayout;
- (void)prepareForTransitionFromLayout:(RDCollectionViewLayout *)oldLayout;
- (void)finalizeLayoutTransition;  // called inside an animation block after the transition


// This set of methods is called when the collection view undergoes an animated transition such as a batch update block or an animated bounds change.
// For each element on screen before the invalidation, finalLayoutAttributesForDisappearingXXX will be called and an animation setup from what is on screen to those final attributes.
// For each element on screen after the invalidation, initialLayoutAttributesForAppearingXXX will be called and an animation setup from those initial attributes to what ends up on screen.
- (nullable RDCollectionViewLayoutAttributes *)initialLayoutAttributesForAppearingItemAtIndexPath:(NSIndexPath *)itemIndexPath;
- (nullable RDCollectionViewLayoutAttributes *)finalLayoutAttributesForDisappearingItemAtIndexPath:(NSIndexPath *)itemIndexPath;
- (nullable RDCollectionViewLayoutAttributes *)initialLayoutAttributesForAppearingSupplementaryElementOfKind:(NSString *)elementKind atIndexPath:(NSIndexPath *)elementIndexPath;
- (nullable RDCollectionViewLayoutAttributes *)finalLayoutAttributesForDisappearingSupplementaryElementOfKind:(NSString *)elementKind atIndexPath:(NSIndexPath *)elementIndexPath;
- (nullable RDCollectionViewLayoutAttributes *)initialLayoutAttributesForAppearingDecorationElementOfKind:(NSString *)elementKind atIndexPath:(NSIndexPath *)decorationIndexPath;
- (nullable RDCollectionViewLayoutAttributes *)finalLayoutAttributesForDisappearingDecorationElementOfKind:(NSString *)elementKind atIndexPath:(NSIndexPath *)decorationIndexPath;

// These methods are called by collection view during an update block.
// Return an array of index paths to indicate views that the layout is deleting or inserting in response to the update.
- (NSArray<NSIndexPath *> *)indexPathsToDeleteForSupplementaryViewOfKind:(NSString *)elementKind;
- (NSArray<NSIndexPath *> *)indexPathsToDeleteForDecorationViewOfKind:(NSString *)elementKind;
- (NSArray<NSIndexPath *> *)indexPathsToInsertForSupplementaryViewOfKind:(NSString *)elementKind;
- (NSArray<NSIndexPath *> *)indexPathsToInsertForDecorationViewOfKind:(NSString *)elementKind;

@end

@interface RDCollectionViewLayout (UIReorderingSupportHooks)

- (NSIndexPath *)targetIndexPathForInteractivelyMovingItem:(NSIndexPath *)previousIndexPath withPosition:(CGPoint)position;
- (RDCollectionViewLayoutAttributes *)layoutAttributesForInteractivelyMovingItemAtIndexPath:(NSIndexPath *)indexPath withTargetPosition:(CGPoint)position;

- (RDCollectionViewLayoutInvalidationContext *)invalidationContextForInteractivelyMovingItems:(NSArray<NSIndexPath *> *)targetIndexPaths withTargetPosition:(CGPoint)targetPosition previousIndexPaths:(NSArray<NSIndexPath *> *)previousIndexPaths previousPosition:(CGPoint)previousPosition;
- (RDCollectionViewLayoutInvalidationContext *)invalidationContextForEndingInteractiveMovementOfItemsToFinalIndexPaths:(NSArray<NSIndexPath *> *)indexPaths previousIndexPaths:(NSArray<NSIndexPath *> *)previousIndexPaths movementCancelled:(BOOL)movementCancelled;

@end

@interface RDCollectionViewLayout (Private)

@property (setter=_setWantsRightToLeftHorizontalMirroringIfNeeded:, nonatomic) bool _wantsRightToLeftHorizontalMirroringIfNeeded;
//@property (getter=_compositionLayout, setter=_setCompositionLayout:, nonatomic) _RDCollectionViewCompositionLayout *compositionLayout;
@property (getter=_elementKinds, setter=_setElementKinds:, nonatomic, copy) NSArray *elementKinds;
@property (getter=_frame, setter=_setFrame:, nonatomic) CGRect frame;
@property (getter=_items, setter=_setItems:, nonatomic, copy) NSIndexSet *items;
@property (getter=_layoutOffset, setter=_setLayoutOffset:, nonatomic) CGPoint layoutOffset;
@property (getter=_layoutOffsetEdges, setter=_setLayoutOffsetEdges:, nonatomic) NSUInteger layoutOffsetEdges;
@property (getter=_isPrepared, setter=_setPrepared:, nonatomic) bool prepared;
@property (getter=_sections, setter=_setSections:, nonatomic, copy) NSIndexSet *sections;
@property (getter=_siblingLayout, setter=_setSiblingLayout:, nonatomic) RDCollectionViewLayout *siblingLayout;
@property (getter=_sublayoutType, setter=_setSublayoutType:, nonatomic) NSInteger sublayoutType;

@end

NS_ASSUME_NONNULL_END

