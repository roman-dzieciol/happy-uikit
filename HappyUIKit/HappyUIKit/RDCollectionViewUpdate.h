//
//  RDCollectionViewUpdate.h
//  HappyUIKit
//
//  Created by Roman Dzieciol on 1/28/17.
//  Copyright © 2017 RDI. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RDCollectionView;
@class RDCollectionViewData;

@interface RDCollectionViewUpdate : NSObject {
    id _animatedFooters;
    id _animatedHeaders;
    id _animatedItems;
    RDCollectionView * _collectionView;
    NSMutableIndexSet * _deletedSections;
    NSMutableArray * _deletedSupplementaryIndexesSectionArray;
    NSMutableDictionary * _deletedSupplementaryTopLevelIndexesDict;
    NSMutableIndexSet * _insertedSections;
    @public NSMutableArray * _insertedSupplementaryIndexesSectionArray;
    NSMutableDictionary * _insertedSupplementaryTopLevelIndexesDict;
    NSMutableIndexSet * _movedItems;
    NSMutableIndexSet * _movedSections;
    NSIndexPath * _newFocusedIndexPath;
    NSInteger  _newFocusedViewType;
    @public NSInteger * _newGlobalItemMap;
    @public RDCollectionViewData * _newModel;
    NSInteger * _newSectionMap;
    CGRect  _newVisibleBounds;
    NSIndexPath * _oldFocusedIndexPath;
    NSInteger  _oldFocusedViewType;
    @public NSInteger * _oldGlobalItemMap;
    @public RDCollectionViewData * _oldModel;
    NSInteger * _oldSectionMap;
    CGRect  _oldVisibleBounds;
    NSArray * _updateItems;
    NSMutableArray * _viewAnimations;
}

//- (void).cxx_destruct;
- (void)_computeItemUpdates;
- (void)_computeSectionUpdates;
- (void)_computeSupplementaryUpdates;
- (void)dealloc;
- (id)initWithCollectionView:(id)arg1 updateItems:(id)arg2 oldModel:(id)arg3 newModel:(id)arg4 oldVisibleBounds:(CGRect)arg5 newVisibleBounds:(CGRect)arg6;
- (id)newIndexPathForSupplementaryElementOfKind:(id)arg1 oldIndexPath:(id)arg2;
- (id)oldIndexPathForSupplementaryElementOfKind:(id)arg1 newIndexPath:(id)arg2;

@end
