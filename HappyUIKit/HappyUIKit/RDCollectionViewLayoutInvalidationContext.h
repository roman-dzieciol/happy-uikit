//
//  RDCollectionViewLayoutInvalidationContext.h
//  MinimalObjC
//
//  Created by Roman Dzieciol on 1/24/17.
//  Copyright © 2017 R3PI. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RDCollectionViewLayoutInvalidationContext : NSObject {
    CGPoint  _contentOffsetAdjustment;
    CGSize  _contentSizeAdjustment;
    bool  _initiatedFromReloadData;
    NSMutableDictionary * _invalidatedDecorationIndexPaths;
    NSMutableSet * _invalidatedItemIndexPaths;
    NSMutableDictionary * _invalidatedSupplementaryIndexPaths;
    struct {
        unsigned int invalidateDataSource : 1;
        unsigned int invalidateEverything : 1;
    }  _invalidationContextFlags;
    NSArray * _previousIndexPathsForReorderedItems;
    CGPoint  _reorderingTarget;
    bool  _retainExistingSizingInfoForEstimates;
    NSArray * _targetIndexPathsForReorderedItems;
    NSArray * _updateItems;
}

@property (nonatomic) CGPoint contentOffsetAdjustment;
@property (nonatomic) CGSize contentSizeAdjustment;
@property (getter=_initiatedFromReloadData, setter=_setInitiatedFromReloadData:, nonatomic) bool initiatedFromReloadData;
@property (setter=_setInteractiveMovementTarget:, nonatomic) CGPoint interactiveMovementTarget;
@property (setter=_setInvalidateDataSourceCounts:, nonatomic) bool invalidateDataSourceCounts;
@property (setter=_setInvalidateEverything:, nonatomic) bool invalidateEverything;
@property (nonatomic, readonly) NSDictionary *invalidatedDecorationIndexPaths;
@property (nonatomic, readonly) NSArray *invalidatedItemIndexPaths;
@property (nonatomic, readonly) NSDictionary *invalidatedSupplementaryIndexPaths;
@property (setter=_setPreviousIndexPathsForInteractivelyMovingItems:, nonatomic, copy) NSArray *previousIndexPathsForInteractivelyMovingItems;
@property (getter=_retainExistingSizingInfoForEstimates, setter=_setRetainExistingSizingInfoForEstimates:, nonatomic) bool retainExistingSizingInfoForEstimates;
@property (setter=_setTargetIndexPathsForInteractivelyMovingItems:, nonatomic, copy) NSArray *targetIndexPathsForInteractivelyMovingItems;
@property (getter=_updateItems, setter=_setUpdateItems:, nonatomic, retain) NSArray *updateItems;

//- (void).cxx_destruct;
- (bool)_initiatedFromReloadData;
- (void)_invalidateSupplementaryElementsOfKind:(id)arg1 atIndexPaths:(id)arg2;
- (id)_invalidatedSupplementaryViews;
- (bool)_retainExistingSizingInfoForEstimates;
- (void)_setInitiatedFromReloadData:(bool)arg1;
- (void)_setInteractiveMovementTarget:(CGPoint)arg1;
- (void)_setInvalidateDataSourceCounts:(bool)arg1;
- (void)_setInvalidateEverything:(bool)arg1;
- (void)_setInvalidatedSupplementaryViews:(id)arg1;
- (void)_setPreviousIndexPathsForInteractivelyMovingItems:(NSArray *)arg1;
- (void)_setRetainExistingSizingInfoForEstimates:(bool)arg1;
- (void)_setTargetIndexPathsForInteractivelyMovingItems:(NSArray *)arg1;
- (void)_setUpdateItems:(NSArray *)arg1;
- (id)_updateItems;
- (CGPoint)contentOffsetAdjustment;
- (CGSize)contentSizeAdjustment;
- (CGPoint)interactiveMovementTarget;
- (bool)invalidateDataSourceCounts;
- (void)invalidateDecorationElementsOfKind:(id)arg1 atIndexPaths:(id)arg2;
- (bool)invalidateEverything;
- (void)invalidateItemsAtIndexPaths:(id)arg1;
- (void)invalidateSupplementaryElementsOfKind:(id)arg1 atIndexPaths:(id)arg2;
- (id)invalidatedDecorationIndexPaths;
- (id)invalidatedItemIndexPaths;
- (id)invalidatedSupplementaryIndexPaths;
- (NSArray *)previousIndexPathsForInteractivelyMovingItems;
- (void)setContentOffsetAdjustment:(CGPoint)arg1;
- (void)setContentSizeAdjustment:(CGSize)arg1;
- (id)targetIndexPathsForInteractivelyMovingItems;

@end


