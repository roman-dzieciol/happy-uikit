//
//  RDCollectionViewFlowLayout.h
//  MinimalObjC
//
//  Created by Roman Dzieciol on 1/22/17.
//  Copyright © 2017 R3PI. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RDCollectionViewLayout.h"

@class _RDFlowLayoutInfo;

@interface RDCollectionViewFlowLayout: RDCollectionViewLayout {
    NSMutableDictionary * _cachedItemAttributes;
    NSMutableDictionary * _cachedItemFrames;
    CGPoint  _contentOffsetAdjustment;
    CGSize  _contentSizeAdjustment;
    CGSize  _currentLayoutSize;
    _RDFlowLayoutInfo * _data;
    NSMutableDictionary * _deletedItemsAttributesDict;
    NSMutableDictionary * _deletedSectionFootersAttributesDict;
    NSMutableDictionary * _deletedSectionHeadersAttributesDict;
    CGSize  _estimatedItemSize;
    CGSize  _footerReferenceSize;
    struct {
        unsigned int delegateSizeForItem : 1;
        unsigned int delegateReferenceSizeForHeader : 1;
        unsigned int delegateReferenceSizeForFooter : 1;
        unsigned int delegateInsetForSection : 1;
        unsigned int delegateInteritemSpacingForSection : 1;
        unsigned int delegateLineSpacingForSection : 1;
        unsigned int delegateAlignmentOptions : 1;
        unsigned int layoutDataIsValid : 1;
        unsigned int delegateInfoIsValid : 1;
        unsigned int roundsToScreenScale : 1;
        unsigned int delegateSizesForSection : 1;
        unsigned int sectionHeadersFloat : 1;
        unsigned int sectionFootersFloat : 1;
        unsigned int headerFollowsSectionMargins : 1;
        unsigned int footerFollowsSectionMargins : 1;
    }  _gridLayoutFlags;
    CGSize  _headerReferenceSize;
    NSMutableArray * _indexPathsToValidate;
    NSMutableDictionary * _insertedItemsAttributesDict;
    NSMutableDictionary * _insertedSectionFootersAttributesDict;
    NSMutableDictionary * _insertedSectionHeadersAttributesDict;
    double  _interitemSpacing;
    CGSize  _itemSize;
    double  _lineSpacing;
    NSDictionary * _rowAlignmentsOptionsDictionary;
    NSInteger  _scrollDirection;
    UIEdgeInsets  _sectionInset;
}

@property (nonatomic) CGSize estimatedItemSize;
@property (getter=_estimatesSizes, nonatomic, readonly) bool estimatesSizes;
@property (nonatomic) CGSize footerReferenceSize;
@property (nonatomic) CGSize headerReferenceSize;
@property (nonatomic) CGSize itemSize;
@property (nonatomic) double minimumInteritemSpacing;
@property (nonatomic) double minimumLineSpacing;
@property (nonatomic) NSInteger scrollDirection;
@property (nonatomic) bool sectionFootersPinToVisibleBounds;
@property (nonatomic) bool sectionHeadersPinToVisibleBounds;
@property (nonatomic) UIEdgeInsets sectionInset;

+ (Class)invalidationContextClass;

- (void)_updateContentSizeScrollingDimensionWithDelta:(double)arg1;
- (NSInteger)_sectionArrayIndexForIndexPath:(id)arg1;

@end
