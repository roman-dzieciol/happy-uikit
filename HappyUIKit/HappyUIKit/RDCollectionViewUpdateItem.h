//
//  RDCollectionViewUpdateItem.h
//  HappyUIKit
//
//  Created by Roman Dzieciol on 1/28/17.
//  Copyright © 2017 RDI. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HappyUIKitDefinitions.h"

@interface RDCollectionViewUpdateItem : NSObject {
    NSIndexPath * _finalIndexPath;
    NSIndexPath * _initialIndexPath;
    NSInteger  _updateAction;
}

@property (getter=_action, nonatomic, readonly) NSInteger action;
@property (getter=_indexPath, nonatomic, readonly) NSIndexPath *indexPath;
@property (nonatomic, readonly) NSIndexPath *indexPathAfterUpdate;
@property (nonatomic, readonly) NSIndexPath *indexPathBeforeUpdate;
@property (getter=_isSectionOperation, nonatomic, readonly) bool isSectionOperation;
@property (getter=_newIndexPath, setter=_setNewIndexPath:, nonatomic, retain) NSIndexPath *newIndexPath;
@property (nonatomic, readonly) NSInteger updateAction;

//- (void).cxx_destruct;
- (NSInteger)_action;
- (id)_indexPath;
- (bool)_isSectionOperation;
- (id)_newIndexPath __attribute__((objc_method_family(none)));
- (void)_setNewIndexPath:(id)arg1;
- (NSInteger)compareIndexPaths:(id)arg1;
- (id)description;
- (id)indexPathAfterUpdate;
- (id)indexPathBeforeUpdate;
- (id)initWithAction:(NSInteger)arg1 forIndexPath:(id)arg2;
- (id)initWithInitialIndexPath:(id)arg1 finalIndexPath:(id)arg2 updateAction:(NSInteger)arg3;
- (id)initWithOldIndexPath:(id)arg1 newIndexPath:(id)arg2;
- (NSInteger)inverseCompareIndexPaths:(id)arg1;
- (NSInteger)updateAction;

@end

