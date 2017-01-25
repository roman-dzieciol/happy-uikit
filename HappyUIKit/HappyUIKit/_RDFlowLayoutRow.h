//
//  _RDFlowLayoutRow.h
//  MinimalObjC
//
//  Created by Roman Dzieciol on 1/22/17.
//  Copyright © 2017 R3PI. All rights reserved.
//

#import <UIKit/UIKit.h>

@class _RDFlowLayoutSection;
@class _RDFlowLayoutItem;

/**
 A row/column of collection view items.
 
 In vertical layout, this is a horizontal row, items arranged left-to-right.
 In horizontal layout, this is a vertical column, items arranged top-to-bottom.
 */
@interface _RDFlowLayoutRow : NSObject {
    double  _availableSpace;
    bool  _complete;
    bool  _fixedItemSize;
    int  _horizontalAlignement;
    NSInteger  _index;
    bool  _isValid;
    NSMutableArray<_RDFlowLayoutItem *> * _items;
    CGRect  _rowFrame;
    CGSize  _rowSize;
    __weak _RDFlowLayoutSection * _section;
    int  _verticalAlignement;
}

@property (nonatomic) double availableSpace;
@property (nonatomic) bool complete;
@property (nonatomic) bool fixedItemSize;
@property (nonatomic) NSInteger index;
@property (nonatomic, readonly) NSMutableArray<_RDFlowLayoutItem *> *items;
@property (nonatomic) CGRect rowFrame;
@property (nonatomic) CGSize rowSize;
@property (nonatomic, weak) _RDFlowLayoutSection *section;

@property (nonatomic) bool isValid;
@property (nonatomic) int horizontalAlignement;
@property (nonatomic) int verticalAlignement;

- (void)addItem:(_RDFlowLayoutItem *)item atEnd:(bool)atEnd;
- (instancetype)copyFromSection:(_RDFlowLayoutSection *)section;
- (NSInteger)indexOfNearestItemAtPoint:(CGPoint)point;
- (instancetype)init;
- (void)insertItem:(_RDFlowLayoutItem *)item atIndex:(NSInteger)index;
- (void)invalidate;
- (void)layoutRow;
- (void)removeItemAtIndex:(NSInteger)index;
- (instancetype)snapshot;

@end
