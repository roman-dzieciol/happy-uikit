//
//  _RDFlowLayoutSection.h
//  MinimalObjC
//
//  Created by Roman Dzieciol on 1/22/17.
//  Copyright © 2017 R3PI. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HappyUIKitDefinitions.h"

@class _RDFlowLayoutInfo;

@interface _RDFlowLayoutSection : NSObject {
    double  _actualGap;
    double  _beginMargin;
    double  _endMargin;
    bool  _fixedItemSize;
    double  _footerDimension;
    CGRect  _footerFrame;
    CGRect  _frame;
    double  _headerDimension;
    CGRect  _headerFrame;
    double  _horizontalInterstice;
    NSInteger  _indexOfIncompleteRow;
    NSMutableSet * _invalidatedIndexPaths;
    bool  _isValid;
    CGSize  _itemSize;
    NSMutableArray * _items;
    NSInteger  _itemsByRowCount;
    NSInteger  _itemsCount;
    double  _lastRowActualGap;
    double  _lastRowBeginMargin;
    double  _lastRowEndMargin;
    bool  _lastRowIncomplete;
    __weak _RDFlowLayoutInfo * _layoutInfo;
    double  _otherMargin;
    CGRect  _rectToKeepValid;
    @public struct {
        int commonRowHorizontalAlignment;
        int lastRowHorizontalAlignment;
        int rowVerticalAlignment;
    }  _rowAlignmentOptions;
    NSMutableArray * _rows;
    UIEdgeInsets  _sectionMargins;
    NSRange  _validItemRange;
    CGRect  _validRect;
    double  _verticalInterstice;
}

@property (nonatomic, readonly) double actualGap;
@property (nonatomic, readonly) double beginMargin;
@property (nonatomic, readonly) CGRect effectiveFooterFrameWithSectionMarginsApplied;
@property (nonatomic, readonly) CGRect effectiveHeaderFrameWithSectionMarginsApplied;
@property (nonatomic, readonly) double endMargin;
@property (nonatomic) bool fixedItemSize;
@property (nonatomic, readonly) double footerDimension;
@property (nonatomic) CGRect footerFrame;
@property (nonatomic) CGRect frame;
@property (nonatomic, readonly) double headerDimension;
@property (nonatomic) CGRect headerFrame;
@property (nonatomic) double horizontalInterstice;
@property (nonatomic, readonly) NSInteger indexOfIncompleteRow;
//@property (nonatomic, readonly) NSArray *invalidatedIndexPaths;
@property (nonatomic) CGSize itemSize;
@property (nonatomic, readonly) NSMutableArray *items;
@property (nonatomic, readonly) NSInteger itemsByRowCount;
@property (nonatomic) NSInteger itemsCount;
@property (nonatomic, readonly) double lastRowActualGap;
@property (nonatomic, readonly) double lastRowBeginMargin;
@property (nonatomic, readonly) double lastRowEndMargin;
@property (nonatomic, readonly) bool lastRowIncomplete;
@property (nonatomic, weak) _RDFlowLayoutInfo *layoutInfo;
@property (nonatomic, readonly) double otherMargin;
//@property (nonatomic) _RowAlignmentOptions rowAlignmentOptions;
@property (nonatomic, readonly) NSMutableArray *rows;
@property (nonatomic) UIEdgeInsets sectionMargins;
@property (nonatomic, readonly) NSRange validItemRange;
@property (nonatomic) double verticalInterstice;


//- (void).cxx_destruct;
- (double)actualGap;
- (void)addInvalidatedIndexPath:(id)arg1;
- (id)addItem;
- (id)addRowAtEnd:(bool)arg1;
- (double)beginMargin;
- (void)computeLayout;
- (void)computeLayoutInRect:(CGRect)arg1 forSection:(NSInteger)arg2 invalidating:(bool)arg3 invalidationContext:(id)arg4;
- (id)copyFromLayoutInfo:(id)arg1;
- (CGRect)effectiveFooterFrameWithSectionMarginsApplied;
- (CGRect)effectiveHeaderFrameWithSectionMarginsApplied;
- (double)endMargin;
- (NSInteger)estimatedIndexOfItemAtPoint:(CGPoint)arg1;
- (bool)fixedItemSize;
- (double)footerDimension;
- (CGRect)footerFrame;
- (CGRect)frame;
- (CGRect)frameForItemAtIndexPath:(id)arg1;
- (double)headerDimension;
- (CGRect)headerFrame;
- (double)horizontalInterstice;
- (NSInteger)indexOfIncompleteRow;
- (id)init;
- (void)invalidate;
- (id)invalidatedIndexPaths;
- (CGSize)itemSize;
- (id)items;
- (NSInteger)itemsByRowCount;
- (NSInteger)itemsCount;
- (double)lastRowActualGap;
- (double)lastRowBeginMargin;
- (double)lastRowEndMargin;
- (bool)lastRowIncomplete;
- (id)layoutInfo;
- (void)logInvalidSizes;
- (void)logInvalidSizesForHorizontalDirection:(bool)arg1 warnAboutDelegateValues:(bool)arg2;
- (double)otherMargin;
- (struct { int x1; int x2; int x3; })rowAlignmentOptions;
- (id)rows;
- (id)rowsInRect:(CGRect)arg1;
- (UIEdgeInsets)sectionMargins;
- (void)setEstimatedSize:(CGSize)arg1 forSection:(NSInteger)arg2;
- (void)setFixedItemSize:(bool)arg1;
- (void)setFooterDimension:(double)arg1 forSection:(NSInteger)arg2;
- (void)setFooterFrame:(CGRect)arg1;
- (void)setFrame:(CGRect)arg1;
- (void)setHeaderDimension:(double)arg1 forSection:(NSInteger)arg2;
- (void)setHeaderFrame:(CGRect)arg1;
- (void)setHorizontalInterstice:(double)arg1;
- (void)setItemSize:(CGSize)arg1;
- (void)setItemsCount:(NSInteger)arg1;
- (void)setLayoutInfo:(id)arg1;
- (void)setRowAlignmentOptions:(_RowAlignmentOptions)arg1;
- (void)setSectionMargins:(UIEdgeInsets)arg1;
- (void)setSize:(CGSize)arg1 forItemAtIndexPath:(id)arg2 invalidationContext:(id)arg3;
- (void)setVerticalInterstice:(double)arg1;
- (void)sizeChangedForItem:(id)arg1 atIndexPath:(id)arg2 inRow:(id)arg3;
- (id)snapshot;
- (void)updateEstimatedSizeForSection:(NSInteger)arg1;
- (NSRange)validItemRange;
- (double)verticalInterstice;

@end
