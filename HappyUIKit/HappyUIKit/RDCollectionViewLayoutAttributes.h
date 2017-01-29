//
//  RDCollectionViewLayoutAttributes.h
//  HappyUIKit
//
//  Created by Roman Dzieciol on 1/15/17.
//  Copyright © 2017 R3PI. All rights reserved.
//

@import UIKit;

NS_ASSUME_NONNULL_BEGIN

@interface RDCollectionViewLayoutAttributes : NSObject <NSCopying, UIDynamicItem>
{
    CGFloat  _alpha;
    CGPoint  _center;
    NSString * _elementKind;
    CGRect  _frame;
    NSIndexPath * _indexPath;
    NSString * _isCloneString;
    struct {
        NSUInteger isCellKind : 1;
        NSUInteger isDecorationView : 1;
        NSUInteger isHidden : 1;
        NSUInteger isClone : 1;
    }  _layoutFlags;
    NSString * _reuseIdentifier;
    CGSize  _size;
    CATransform3D  _transform;
    NSInteger  _zIndex;
}

@property (nonatomic) CGRect frame;
@property (nonatomic) CGPoint center;
@property (nonatomic) CGSize size;
@property (nonatomic) CATransform3D transform3D;
@property (nonatomic) CGRect bounds;
@property (nonatomic) CGAffineTransform transform;
@property (nonatomic) CGFloat alpha;
@property (nonatomic) NSInteger zIndex; // default is 0
@property (nonatomic, getter=isHidden) BOOL hidden; // As an optimization, UICollectionView might not create a view for items whose hidden attribute is YES
@property (nonatomic, strong) NSIndexPath *indexPath;

@property (nonatomic, readonly) UICollectionElementCategory representedElementCategory;
@property (nonatomic, readonly, nullable) NSString *representedElementKind; // nil when representedElementCategory is UICollectionElementCategoryCell



+ (id)layoutAttributesForCellWithIndexPath:(NSString *)arg1;
+ (id)layoutAttributesForDecorationViewOfKind:(NSString *)arg1 withIndexPath:(NSIndexPath *)arg2;
+ (id)layoutAttributesForSupplementaryViewOfKind:(NSString *)arg1 withIndexPath:(NSIndexPath *)arg2;

- (NSString *)__elementKind;
- (NSString *)__indexPath;
- (NSString *)_elementKind;
- (bool)_isCell;
- (bool)_isClone;
- (bool)_isDecorationView;
- (bool)_isEquivalentTo:(RDCollectionViewLayoutAttributes *)arg1;
- (bool)_isSupplementaryView;
- (bool)_isTransitionVisibleTo:(RDCollectionViewLayoutAttributes *)arg1;
- (NSString *)_reuseIdentifier;
- (void)_setElementKind:(NSString *)arg1;
- (void)_setIsClone:(bool)arg1;
- (void)_setReuseIdentifier:(NSString *)arg1;
- (double)alpha;
- (CGRect)bounds;
- (CGPoint)center;
- (NSString *)description;
- (CGRect)frame;
- (NSUInteger)hash;
- (NSIndexPath *)indexPath;
- (id)init;
- (RDCollectionViewLayoutAttributes *)initialLayoutAttributesForInsertedDecorationElementOfKind:(NSString *)arg1 atIndexPath:(NSIndexPath *)arg2;
- (bool)isEqual:(id)arg1;
- (bool)isHidden;
- (UICollectionElementCategory)representedElementCategory;
- (NSString *)representedElementKind;
- (void)setAlpha:(double)arg1;
- (void)setBounds:(CGRect)arg1;
- (void)setCenter:(CGPoint)arg1;
- (void)setFrame:(CGRect)arg1;
- (void)setHidden:(bool)arg1;
- (void)setIndexPath:(NSIndexPath *)arg1;
- (void)setSize:(CGSize)arg1;
- (void)setTransform3D:(CATransform3D)arg1;
- (void)setTransform:(CGAffineTransform)arg1;
- (void)setZIndex:(NSInteger)arg1;
- (CGSize)size;
- (CGAffineTransform)transform;
- (CATransform3D)transform3D;
- (NSInteger)zIndex;

@end

NS_ASSUME_NONNULL_END
