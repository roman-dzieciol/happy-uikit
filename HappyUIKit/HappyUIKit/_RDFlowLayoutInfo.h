//
//  _RDFlowLayoutInfo.h
//  MinimalObjC
//
//  Created by Roman Dzieciol on 1/22/17.
//  Copyright © 2017 R3PI. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HappyUIKitDefinitions.h"

@class RDCollectionViewFlowLayout;
@class _RDFlowLayoutSection;
@class RDCollectionViewLayoutInvalidationContext;

@interface _RDFlowLayoutInfo : NSObject {
    NSInteger  _computedEstimatedCount;
    CGSize  _computedEstimatedSum;
    CGSize  _contentSize;
    double  _dimension;
    bool  _estimatesSizes;
    bool  _horizontal;
    bool  _isValid;
     __weak RDCollectionViewFlowLayout * _layout;
    CGSize  _layoutSize;
    bool  _leftToRight;
    _RowAlignmentOptions  _rowAlignmentOptions;
    NSMutableArray * _sections;
    bool  _useFloatingHeaderFooter;
    bool  _usesFloatingHeaderFooter;
    CGRect  _visibleBounds;
}
@property (nonatomic, readonly) CGSize computedEstimatedSize;
@property (nonatomic) CGSize contentSize;
@property (nonatomic) double dimension;
@property (nonatomic) bool estimatesSizes;
@property (nonatomic) bool horizontal;
@property (nonatomic, weak) RDCollectionViewFlowLayout *layout;
@property (nonatomic) bool leftToRight;
@property (nonatomic) _RowAlignmentOptions rowAlignmentOptions;
@property (nonatomic, readonly) NSMutableArray *sections;
@property (nonatomic) bool usesFloatingHeaderFooter;

@property (nonatomic, readonly) CGRect visibleBounds;

- (_RDFlowLayoutSection *)addSection;

- (CGSize)computedEstimatedSize;

- (instancetype)copy;

- (void)didUpdateSizeForSection:(NSInteger)sectionIndex withDelta:(CGFloat)delta;

- (CGRect)frameForItemAtIndexPath:(NSIndexPath *)indexPath;

- (void)invalidate:(BOOL)bFlag;

- (NSMutableArray<NSIndexPath *> *)invalidatedIndexPaths;

- (RDCollectionViewLayoutInvalidationContext *)setSize:(CGSize)newSize forItemAtIndexPath:(NSIndexPath *)indexPath;

- (_RDFlowLayoutInfo *)snapshot;

- (NSMutableDictionary *)specifiedItemSizes;

@end
