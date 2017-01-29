//
//  RDCollectionViewData.h
//  HappyUIKit
//
//  Created by Roman Dzieciol on 1/28/17.
//  Copyright © 2017 RDI. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RDCollectionView;
@class RDCollectionViewLayout;


@interface RDCollectionViewData : NSObject {
    NSMutableArray * _clonedCellAttributes;
    NSMutableArray * _clonedDecorationAttributes;
    NSMutableArray * _clonedSupplementaryAttributes;
    RDCollectionView * _collectionView;
    struct {
        unsigned int contentSizeIsValid : 1;
        unsigned int itemCountsAreValid : 1;
        unsigned int layoutIsPrepared : 1;
        unsigned int layoutLocked : 1;
    }  _collectionViewDataFlags;
    CGSize  _contentSize;
    NSMutableDictionary * _decorationLayoutAttributes;
    NSMutableIndexSet * _globalIndexesOfItemsAwaitingValidation;
    id _globalItems;
    NSMutableDictionary * _invalidatedDecorationIndexPaths;
    NSMutableDictionary * _invalidatedSupplementaryIndexPaths;
    NSInteger  _lastResultForNumberOfItemsBeforeSection;
    NSInteger  _lastSectionTestedForNumberOfItemsBeforeSection;
    RDCollectionViewLayout * _layout;
    NSInteger  _numItems;
    NSInteger  _numSections;
    NSMapTable * _screenPageMap;
    NSInteger * _sectionItemCounts;
    NSMutableDictionary * _supplementaryLayoutAttributes;
    CGRect  _validLayoutRect;
}

@property (nonatomic, readonly) NSArray *clonedCellAttributes;
@property (nonatomic, readonly) NSArray *clonedDecorationAttributes;
@property (nonatomic, readonly) NSArray *clonedSupplementaryAttributes;
@property (nonatomic) CGSize contentSize;
@property (nonatomic, readonly) bool layoutIsPrepared;
@property (getter=isLayoutLocked, nonatomic) bool layoutLocked;

+ (void)initialize;

//- (void).cxx_destruct;
- (void)_loadEverything;
- (void)_prepareToLoadData;
- (id)_screenPageForPoint:(CGPoint)arg1;
- (void)_setLayoutAttributes:(id)arg1 atGlobalItemIndex:(int)arg2;
- (void)_updateItemCounts;
- (void)_validateContentSize;
- (void)_validateItemCounts;
- (id)clonedCellAttributes;
- (id)clonedDecorationAttributes;
- (id)clonedSupplementaryAttributes;
- (CGRect)collectionViewContentRect;
- (CGSize)contentSize;
- (void)dealloc;
- (id)existingSupplementaryLayoutAttributes;
- (id)existingSupplementaryLayoutAttributesInSection:(NSInteger)arg1;
- (NSInteger)globalIndexForItemAtIndexPath:(id)arg1;
- (id)indexPathForItemAtGlobalIndex:(NSInteger)arg1;
- (id)initWithCollectionView:(id)arg1 layout:(id)arg2;
- (void)invalidate:(bool)arg1;
- (void)invalidateDecorationIndexPaths:(id)arg1;
- (void)invalidateItemsAtIndexPaths:(id)arg1;
- (void)invalidateSupplementaryIndexPaths:(id)arg1;
- (bool)isGlobalIndexValid:(NSInteger)arg1;
- (bool)isLayoutLocked;
- (id)knownDecorationElementKinds;
- (id)knownSupplementaryElementKinds;
- (id)layoutAttributesForCellsInRect:(CGRect)arg1 validateLayout:(bool)arg2;
- (id)layoutAttributesForDecorationViewOfKind:(id)arg1 atIndexPath:(id)arg2;
- (id)layoutAttributesForElementsInRect:(CGRect)arg1;
- (id)layoutAttributesForElementsInSection:(NSInteger)arg1;
- (id)layoutAttributesForGlobalItemIndex:(NSInteger)arg1;
- (id)layoutAttributesForItemAtIndexPath:(id)arg1;
- (id)layoutAttributesForSupplementaryElementOfKind:(id)arg1 atIndexPath:(id)arg2;
- (bool)layoutIsPrepared;
- (NSInteger)numberOfItems;
- (NSInteger)numberOfItemsBeforeSection:(NSInteger)arg1;
- (NSInteger)numberOfItemsInSection:(NSInteger)arg1;
- (NSInteger)numberOfSections;
- (CGRect)rectForDecorationElementOfKind:(id)arg1 atIndexPath:(id)arg2;
- (CGRect)rectForGlobalItemIndex:(NSInteger)arg1;
- (CGRect)rectForItemAtIndexPath:(id)arg1;
- (CGRect)rectForSupplementaryElementOfKind:(id)arg1 atIndexPath:(id)arg2;
- (void)setContentSize:(CGSize)arg1;
- (void)setLayoutLocked:(bool)arg1;
- (void)validateDecorationViews;
- (void)validateLayoutInRect:(CGRect)arg1;
- (void)validateSupplementaryViews;

@end
