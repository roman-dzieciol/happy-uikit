//
//  _UICollectionViewItemKey.h
//  HappyUIKit
//
//  Created by Roman Dzieciol on 1/28/17.
//  Copyright © 2017 RDI. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface _RDCollectionViewItemKey : NSObject <NSCopying> {
    NSString * _identifier;
    NSIndexPath * _indexPath;
    bool  _isClone;
    NSUInteger  _type;
}

@property (nonatomic, readonly, retain) NSString *identifier;
@property (nonatomic, readonly, retain) NSIndexPath *indexPath;
@property (nonatomic, readonly) bool isClone;
@property (nonatomic, readonly) NSUInteger type;

+ (id)collectionItemKeyForCellWithIndexPath:(id)arg1;
+ (id)collectionItemKeyForDecorationViewOfKind:(id)arg1 andIndexPath:(id)arg2;
+ (id)collectionItemKeyForLayoutAttributes:(id)arg1;
+ (id)collectionItemKeyForSupplementaryViewOfKind:(id)arg1 andIndexPath:(id)arg2;

- (id)copyAsClone:(bool)arg1;
- (id)copyWithZone:(struct _NSZone { }*)arg1;
- (id)description;
- (NSUInteger)hash;
- (id)identifier;
- (id)indexPath;
- (id)initWithType:(NSUInteger)arg1 indexPath:(id)arg2 identifier:(id)arg3;
- (id)initWithType:(NSUInteger)arg1 indexPath:(id)arg2 identifier:(id)arg3 clone:(bool)arg4;
- (bool)isClone;
- (bool)isEqual:(id)arg1;
- (NSUInteger)type;

@end

