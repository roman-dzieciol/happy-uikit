//
//  RDCollectionViewLayoutAttributes.m
//  HappyUIKit
//
//  Created by Roman Dzieciol on 1/15/17.
//  Copyright © 2017 R3PI. All rights reserved.
//

@import QuartzCore;

#import "RDCollectionViewLayoutAttributes.h"

@implementation RDCollectionViewLayoutAttributes

- (instancetype)init
{
    self = [super init];
    if (self) {
        _transform = CATransform3DIdentity;
        _alpha = 1.0;
        _frame = CGRectNull;
        _isCloneString = @"_UICollectionElementIsOriginal";
        _layoutFlags.isClone = NO;
    }
    return self;
}


+ (instancetype)layoutAttributesForCellWithIndexPath:(NSIndexPath *)indexPath {
    RDCollectionViewLayoutAttributes* attribs = [[self alloc] init];
    attribs->_layoutFlags.isCellKind = YES;
    attribs->_elementKind = @"UICollectionElementKindCell";
    attribs->_indexPath = indexPath;
    return attribs;
}

+ (instancetype)layoutAttributesForSupplementaryViewOfKind:(NSString *)elementKind withIndexPath:(NSIndexPath *)indexPath {
    RDCollectionViewLayoutAttributes* attribs = [[self alloc] init];
    attribs->_indexPath = indexPath;
    attribs->_elementKind = [elementKind copy];
    return attribs;
}

+ (instancetype)layoutAttributesForDecorationViewOfKind:(NSString *)decorationViewKind withIndexPath:(NSIndexPath *)indexPath {
    RDCollectionViewLayoutAttributes* attribs = [[self alloc] init];
    attribs->_indexPath = indexPath;
    attribs->_elementKind = [decorationViewKind copy];
    attribs->_reuseIdentifier = [decorationViewKind copy];
    attribs->_layoutFlags.isDecorationView = YES;
    return attribs;
}

- (CGAffineTransform)transform {
    if (CATransform3DIsAffine(_transform)) {
        return CATransform3DGetAffineTransform(_transform);
    } else {
        //        *(r14 + 0x28) = *_CGAffineTransformMakeTranslation;
        //        *(r14 + 0x20) = *_CGAffineTransformMakeScale;
        //        *(r14 + 0x18) = *_CGAffineTransformMakeRotation;
        //        *(r14 + 0x10) = *_CGAffineTransformIsIdentity;
        //        *(r14 + 0x8) = *_CGAffineTransformInvert;
        //        *r14 = *_CGAffineTransformIdentity;
        return CGAffineTransformIdentity;
    }
}

#if 0

#endif

- (void)setTransform:(CGAffineTransform)transform {
    self.transform3D = CATransform3DMakeAffineTransform(transform);
}

- (void)setTransform3D:(CATransform3D)transform3D {
    if (!CATransform3DEqualToTransform(_transform, transform3D)) {
        _frame = CGRectNull;
    }
    _transform = transform3D;
}

- (void)setSize:(CGSize)size {
    _size = size;
    _frame.size = size;
}

- (void)setFrame:(CGRect)frame {
    NSAssert(!CGRectEqualToRect(frame, CGRectInfinite), @"UICollectionViewLayoutAttributes: -setFrame: with CGRectInfinite is undefined.");
    NSAssert(!CGRectEqualToRect(frame, CGRectNull), @"UICollectionViewLayoutAttributes: -setFrame: with CGRectNull is undefined.");
    self.size = frame.size;
    self.center = CGPointMake(CGRectGetMidX(frame), CGRectGetMidY(frame));
    if (CATransform3DIsIdentity(_transform)) {
        _frame = frame;
    } else {
        _frame = CGRectNull;
    }
}

- (CGRect)frame {
    if (CGRectIsNull(_frame)) {
        CALayer *___geometryCalculationLayer = [[CALayer alloc] init];
        [___geometryCalculationLayer setPosition:_center];
        [___geometryCalculationLayer setBounds:(CGRect){.size = _size}];
        [___geometryCalculationLayer setTransform:_transform];
        _frame = ___geometryCalculationLayer.frame;
    }
    return _frame;
}

- (void)setCenter:(CGPoint)center {
    _center = center;
    _frame = CGRectMake(center.x - _frame.size.width*0.5, center.y - _frame.size.height*0.5, _frame.size.width, _frame.size.height);
}

- (void)setBounds:(CGRect)bounds {
    NSAssert(CGPointEqualToPoint(bounds.origin, CGPointZero), @"UICollectionViewLayoutAttributes bounds must be set with a (0,0) origin %@ - %@", NSStringFromCGRect(bounds), self);
    self.size = bounds.size;
}

- (CGRect)bounds {
    return (CGRect){.size = _size};
}

- (NSUInteger)hash {
    return [_elementKind hash] ^ [_indexPath hash] ^ [_isCloneString hash];
}

- (void)setHidden:(BOOL)hidden {
    _layoutFlags.isHidden = hidden;
}

- (BOOL)isHidden {
    return _layoutFlags.isHidden;
}

- (NSString *)representedElementKind {
    return _layoutFlags.isCellKind ? nil : _elementKind;
}

- (UICollectionElementCategory)representedElementCategory {
    return _layoutFlags.isDecorationView ? UICollectionElementCategoryDecorationView : UICollectionElementCategorySupplementaryView;
}

- (BOOL)isEqual:(id)object {
    if ([object isKindOfClass:self.class] && [self.indexPath isEqual:[object indexPath]]) {
        return [self _isEquivalentTo:object];
    }
    return NO;
}

- (BOOL)_isEquivalentTo:(RDCollectionViewLayoutAttributes *)object {
    // TODO _isClone & flags
    if (_alpha == object->_alpha &&
        CGPointEqualToPoint(_center, object->_center) &&
        CGSizeEqualToSize(_size, object->_size) &&
        CATransform3DEqualToTransform(_transform, object->_transform) &&
        _zIndex == object->_zIndex &&
        [_elementKind isEqualToString:object->_elementKind]) {
        return YES;
    }
    return NO;
}

- (NSString *)description {
    NSMutableString *result = [NSMutableString stringWithFormat:@"%@", [super description]];
    [result appendFormat:@"index path: (%@); ", _indexPath];
    if (_layoutFlags.isCellKind == false) {
        [result appendFormat:@"element kind: (%@); ", _elementKind];
    }
    [result appendFormat:@"frame: (%g %g; %g %g); ", _frame.origin.x, _frame.origin.y, _frame.size.width, _frame.size.height];
    if (CATransform3DIsIdentity(_transform) == false) {
        if (CATransform3DIsAffine(_transform)) {
            [result appendFormat:@"transform: (%@); ", NSStringFromCGAffineTransform(CATransform3DGetAffineTransform(_transform))];
        } else {
            [result appendString:@"non-affine transform; "];
        }
    }
    if (self.isHidden) {
        [result appendFormat:@"hidden = YES; "];
    }
    if (_alpha > 0) {
        [result appendFormat:@"alpha = %g; ", _alpha];
    }
    if (_zIndex != 0) {
        [result appendFormat:@"zIndex = %ld; ", _zIndex];
    }
    if (_layoutFlags.isClone) {
        [result appendFormat:@"IS CLONE; "];
    }
    
    return result;
}

- (id)copyWithZone:(NSZone *)zone {
    RDCollectionViewLayoutAttributes *copy = [[[self class] alloc] init];
    copy->_alpha = _alpha;
    copy->_layoutFlags = _layoutFlags;
    copy->_layoutFlags.isClone = YES;
    copy->_indexPath = _indexPath;
    copy->_reuseIdentifier = [_reuseIdentifier copy];
    copy->_elementKind = [_elementKind copy];
    copy->_zIndex = _zIndex;
    copy->_transform = _transform;
    copy->_center = _center;
    copy->_size = _size;
    copy->_frame = _frame;
    return copy;
}

- (void)_setIsClone:(BOOL)isClone {
    _layoutFlags.isClone = isClone;
    _isCloneString = isClone ? @"_UICollectionElementIsClone" : @"_UICollectionElementIsOriginal";
}

- (BOOL)_isClone {
    return _layoutFlags.isClone;
}

- (BOOL)_isTransitionVisibleTo:(RDCollectionViewLayoutAttributes *)attributes {
    // TODO
    return YES;
}

- (BOOL)_isSupplementaryView {
    return _layoutFlags.isDecorationView == NO;
}

- (BOOL)_isDecorationView {
    return _layoutFlags.isDecorationView;
}

- (BOOL)_isCell {
    return _layoutFlags.isCellKind;
}

@end
