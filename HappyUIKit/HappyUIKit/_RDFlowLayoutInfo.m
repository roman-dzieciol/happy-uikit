//
//  _RDFlowLayoutInfo.m
//  MinimalObjC
//
//  Created by Roman Dzieciol on 1/22/17.
//  Copyright © 2017 R3PI. All rights reserved.
//

#import "_RDFlowLayoutInfo.h"
#import "_RDFlowLayoutSection.h"
#import "_RDFlowLayoutItem.h"
#import "RDCollectionViewFlowLayout.h"
#import "RDCollectionViewFlowLayoutInvalidationContext.h"

@implementation _RDFlowLayoutInfo

- (_RDFlowLayoutSection *)addSection {
    _RDFlowLayoutSection *result = [[_RDFlowLayoutSection alloc] init];
    [result setLayoutInfo:self];
    [self.sections addObject:result];
    return result;
}

- (CGSize)computedEstimatedSize {
    if (_computedEstimatedCount > 0) {
        return CGSizeMake(_computedEstimatedSum.width / _computedEstimatedCount, _computedEstimatedSum.height / _computedEstimatedCount);
    } else {
        return CGSizeZero;
    }
}

- (instancetype)copy {
    _RDFlowLayoutInfo *result = [[_RDFlowLayoutInfo alloc] init];
    if (result) {
        result.usesFloatingHeaderFooter = self.usesFloatingHeaderFooter;
        result.horizontal = self.horizontal;
        result.leftToRight = self.leftToRight;
        result->_visibleBounds = _visibleBounds;
        result->_layoutSize = _layoutSize;
        result.dimension = self.dimension;
        result->_isValid = _isValid;
        result.rowAlignmentOptions = self.rowAlignmentOptions;
        
        for (_RDFlowLayoutSection *section in self.sections) {
            _RDFlowLayoutSection *newSection = [section copyFromLayoutInfo:self];
            newSection.layoutInfo = self;
            [result.sections addObject:newSection];
        }
    }
    return result;
}

- (void)didUpdateSizeForSection:(NSInteger)sectionIndex withDelta:(CGFloat)delta {
    for (NSInteger i=sectionIndex + 1; i<[_sections count]; ++i) {
        _RDFlowLayoutSection *section = _sections[i];
        CGRect frame = section.frame;
        if (_horizontal) {
            frame.origin.x += delta;
        } else {
            frame.origin.y += delta;
        }
        section.frame = frame;
    }
    [_layout _updateContentSizeScrollingDimensionWithDelta:delta];
}

- (CGRect)frameForItemAtIndexPath:(NSIndexPath *)indexPath {
    _RDFlowLayoutSection *section = [self.sections objectAtIndex:[indexPath section]];
    CGRect sectionFrame = section.frame;
    _RDFlowLayoutItem *item = [section.items objectAtIndex:[indexPath row]];
    CGRect rowFrame = item.itemFrame;
    return CGRectMake(sectionFrame.origin.x + rowFrame.origin.x,
                      sectionFrame.origin.y + rowFrame.origin.y,
                      rowFrame.size.width,
                      rowFrame.size.height);
}

- (instancetype)init {
    self = [super init];
    if (self != nil) {
        _horizontal = NO;
        _leftToRight = YES;
        _sections = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)invalidate:(BOOL)bFlag {
    _computedEstimatedSum = CGSizeZero;
    _computedEstimatedCount = 0;
    _isValid = NO;
    if (bFlag) {
        if (_layout.estimatesSizes) {
            __block NSMutableArray *currentSections = _sections;
            _sections = [[NSMutableArray alloc] init];
            dispatch_async(dispatch_get_main_queue(), ^{
                currentSections = nil; // dealloc on main queue
            });
        }
    } else {
        __block NSMutableArray *currentSections = _sections;
        _sections = [[NSMutableArray alloc] init];
        dispatch_async(dispatch_get_main_queue(), ^{
            currentSections = nil; // dealloc on main queue
        });
    }
}

- (NSMutableArray<NSIndexPath *> *)invalidatedIndexPaths {
    NSMutableArray *result = [[NSMutableArray alloc] init];
    for (_RDFlowLayoutSection *section in _sections) {
        [result addObjectsFromArray:[section invalidatedIndexPaths]];
    }
    return result;
}

- (RDCollectionViewLayoutInvalidationContext *)setSize:(CGSize)newSize forItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if (_layout.estimatesSizes) {
        _computedEstimatedSum = CGSizeMake(_computedEstimatedSum.width + newSize.width,
                                           _computedEstimatedSum.height + newSize.height);
        _computedEstimatedCount += 1;
    }
    
    RDCollectionViewFlowLayoutInvalidationContext *invalidationContext = [[[[_layout class] invalidationContextClass] alloc] init];

    NSAssert1([invalidationContext isKindOfClass:[RDCollectionViewFlowLayoutInvalidationContext class]], @"Invalidation context class (%@) must be a subclass of RDCollectionViewFlowLayoutInvalidationContext.", NSStringFromClass([[_layout class] invalidationContextClass]));
    
    invalidationContext.invalidateFlowLayoutAttributes = NO;
    invalidationContext.invalidateFlowLayoutDelegateMetrics = NO;
 
    _RDFlowLayoutSection *section = [_sections objectAtIndex:[_layout _sectionArrayIndexForIndexPath:indexPath]];
    [section setSize:newSize forItemAtIndexPath:indexPath invalidationContext:invalidationContext];
    
    return invalidationContext;
}

- (_RDFlowLayoutInfo *)snapshot {
    _RDFlowLayoutInfo *newInfo = [[_RDFlowLayoutInfo alloc] init];
    for (_RDFlowLayoutSection *section in _sections) {
        _RDFlowLayoutSection *newSection = [section snapshot];
        [[newInfo sections] addObject:newSection];
    }
    [newInfo setContentSize:self.contentSize]; // VERIFY
    return newInfo;
}

- (NSMutableDictionary *)specifiedItemSizes {
    NSMutableDictionary *result = [NSMutableDictionary dictionary];
    NSInteger sectionCount = 0;
    for (_RDFlowLayoutSection *section in self.sections) {
        NSInteger rowCount = 0;
        for (_RDFlowLayoutItem *item in section.items) {
            if ([item sizeHasBeenSet]) {
                NSIndexPath *indexPath = [NSIndexPath indexPathForItem:rowCount inSection:sectionCount];
                result[indexPath] = [NSValue valueWithCGSize:item.itemFrame.size];
            }
            ++rowCount;
        }
        ++sectionCount;
    }
    return result;
}


@end
