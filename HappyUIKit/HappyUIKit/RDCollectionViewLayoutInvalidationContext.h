//
//  RDCollectionViewLayoutInvalidationContext.h
//  MinimalObjC
//
//  Created by Roman Dzieciol on 1/24/17.
//  Copyright © 2017 R3PI. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface RDCollectionViewLayoutInvalidationContext : NSObject

@property (nonatomic, readonly) BOOL invalidateEverything; // set to YES when invalidation occurs because the collection view is sent -reloadData
@property (nonatomic, readonly) BOOL invalidateDataSourceCounts; // if YES, the layout should requery section and item counts from the collection view - set to YES when the collection view is sent -reloadData and when items are inserted or deleted

- (void)invalidateItemsAtIndexPaths:(NSArray<NSIndexPath *> *)indexPaths;
- (void)invalidateSupplementaryElementsOfKind:(NSString *)elementKind atIndexPaths:(NSArray<NSIndexPath *> *)indexPaths;
- (void)invalidateDecorationElementsOfKind:(NSString *)elementKind atIndexPaths:(NSArray<NSIndexPath *> *)indexPaths;
@property (nonatomic, readonly, nullable) NSArray<NSIndexPath *> *invalidatedItemIndexPaths;
@property (nonatomic, readonly, nullable) NSDictionary<NSString *, NSArray<NSIndexPath *> *> *invalidatedSupplementaryIndexPaths; // keys are element kind strings - values are NSArrays of NSIndexPaths
@property (nonatomic, readonly, nullable) NSDictionary<NSString *, NSArray<NSIndexPath *> *> *invalidatedDecorationIndexPaths; // keys are element kind strings - values are NSArrays of NSIndexPaths

@property (nonatomic) CGPoint contentOffsetAdjustment; // delta to be applied to the collection view's current contentOffset - default is CGPointZero
@property (nonatomic) CGSize contentSizeAdjustment; // delta to be applied to the current content size - default is CGSizeZero

// Reordering support
@property (nonatomic, readonly, copy, nullable) NSArray<NSIndexPath *> *previousIndexPathsForInteractivelyMovingItems; // index paths of moving items prior to the invalidation
@property (nonatomic, readonly, copy, nullable) NSArray<NSIndexPath *> *targetIndexPathsForInteractivelyMovingItems; // index paths of moved items following the invalidation
@property (nonatomic, readonly) CGPoint interactiveMovementTarget;

@end

NS_ASSUME_NONNULL_END
