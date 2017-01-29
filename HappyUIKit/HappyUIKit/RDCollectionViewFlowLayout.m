//
//  RDCollectionViewFlowLayout.m
//  MinimalObjC
//
//  Created by Roman Dzieciol on 1/22/17.
//  Copyright © 2017 R3PI. All rights reserved.
//

#import "RDCollectionViewFlowLayout.h"

@implementation RDCollectionViewFlowLayout



//- (void)invalidateLayoutWithContext:(RDCollectionViewLayoutInvalidationContext *)context {
//    r15 = self;
//    r14 = [arg2 retain];
//    if ([r14 isKindOfClass:[UICollectionViewFlowLayoutInvalidationContext class]] == 0x0) {
//        rcx = @"the invalidation context (%@) sent to -[UICollectionViewFlowLayout invalidateLayoutWithContext:] is not an instance of type UICollectionViewFlowLayoutInvalidationContext or a subclass";
//        [NSException raise:*_NSInvalidArgumentException format:rcx];
//    }
//    if (*(int32_t *)__UIApplicationLinkedOnVersion == 0x0) goto loc_9a7a67;
//    
//loc_9a7a5a:
//    if (*(int32_t *)__UIApplicationLinkedOnVersion < 0xa0000) goto loc_9a7b2f;
//    
//loc_9a7a79:
//    if (([r14 _retainExistingSizingInfoForEstimates] != 0x0) || ([r14 _initiatedFromReloadData] != 0x0)) goto loc_9a7aa5;
//    
//loc_9a7b2f:
//    if (([r14 invalidateFlowLayoutAttributes] != 0x0) || ([r14 invalidateDataSourceCounts] != 0x0)) {
//        if (r15->_gridLayoutFlags < 0x0) {
//            rax = [r14 invalidateFlowLayoutDelegateMetrics];
//            [r15->_data invalidate:(rax ^ 0x1) & 0xff];
//            [r15 _resetCachedItems];
//            if ([r14 invalidateFlowLayoutDelegateMetrics] != 0x0) {
//                rax = 0x0;
//            }
//            else {
//                rax = [r15 _estimatesSizes];
//                rax = rax ^ 0x1;
//            }

//            r15->_gridLayoutFlags = r15->_gridLayoutFlags & 0xffff & 0xfe7f | (rax & 0xff) << 0x8;
//        }
//    }
//    rbx = [[r14 invalidatedItemIndexPaths] retain];
//    if ([rbx count] != 0x0) {
//        rdi = r15->_indexPathsToValidate;
//        if (rdi == 0x0) {
//            r15->_indexPathsToValidate = [[NSMutableArray alloc] init];
//            [r15->_indexPathsToValidate release];
//            rdi = r15->_indexPathsToValidate;
//        }
//        [rdi addObjectsFromArray:rbx];
//        [r15->_cachedItemAttributes removeObjectsForKeys:rbx];
//        [r15->_cachedItemFrames removeObjectsForKeys:rbx];
//    }
//    rdi = rbx;
//    goto loc_9a7c88;
//    
//loc_9a7c88:
//    [rdi release];
//    goto loc_9a7c8e;
//    
//loc_9a7c8e:
//    *(r15 + *_OBJC_IVAR_$_UICollectionViewFlowLayout._contentSizeAdjustment + 0x8) = *_CPBitmapCreateImagesFromData;
//    r15->_contentSizeAdjustment = *_CGSizeZero;
//    *(r15 + *_OBJC_IVAR_$_UICollectionViewFlowLayout._contentOffsetAdjustment + 0x8) = *_CGRectApplyAffineTransform;
//    r15->_contentOffsetAdjustment = *_CGPointZero;
//    [[r15 super] invalidateLayoutWithContext:r14];
//    [r14 release];
//    return;
//    
//loc_9a7aa5:
//    if ([r15 _estimatesSizes] == 0x0) goto loc_9a7b2f;
//    
//loc_9a7ab9:
//    [r15 collectionViewContentSize];
//    var_50 = intrinsic_movaps(var_50, 0x0);
//    var_40 = intrinsic_movsd(var_40, xmm0);
//    var_38 = intrinsic_movsd(var_38, xmm1);
//    xmm0 = intrinsic_mulsd(xmm0, xmm1);
//    xmm0 = intrinsic_andpd(xmm0, *(int128_t *)0xc4f640);
//    xmm1 = intrinsic_movsd(xmm1, *0xc4f700);
//    xmm1 = intrinsic_ucomisd(xmm1, xmm0);
//    if (xmm1 <= 0x0) goto loc_9a7d10;
//    
//loc_9a7af8:
//    [r15->_data invalidate:0x0];
//    [r15 _resetCachedItems];
//    r15->_gridLayoutFlags = r15->_gridLayoutFlags & 0xfe7f;
//    goto loc_9a7c8e;
//    
//loc_9a7d10:
//    var_78 = 0x0;
//    intrinsic_movdqu(var_68, intrinsic_punpcklqdq(zero_extend_64(___Block_byref_object_copy_), zero_extend_64(___Block_byref_object_dispose_)));
//    var_58 = [[r15->_data specifiedItemSizes] retain];
//    rbx = [[r14 _updateItems] retain];
//    r12 = [rbx count];
//    [rbx release];
//    if (r12 != 0x0) {
//        r13 = [[NSMutableDictionary alloc] init];
//        var_98 = [r14 retain];
//        rbx = [r13 retain];
//        var_90 = rbx;
//        [*(var_78 + 0x28) enumerateKeysAndObjectsUsingBlock:__NSConcreteStackBlock];
//        *(var_78 + 0x28) = rbx;
//        r13 = [rbx retain];
//        [*(var_78 + 0x28) release];
//        [var_90 release];
//        [var_98 release];
//        [r13 release];
//    }
//    [r15->_data invalidate:0x0];
//    [r15 _getSizingInfosWithExistingSizingDictionary:*(var_78 + 0x28)];
//    [r15 _updateItemsLayoutForRect:0x0 allowsPartialUpdate:rcx];
//    [r15 _resetCachedItems];
//    r15->_gridLayoutFlags = r15->_gridLayoutFlags | 0x180;
//    _Block_object_dispose(0x0, 0x8);
//    rdi = var_58;
//    goto loc_9a7c88;
//    
//loc_9a7a67:
//    if (__UIApplicationLinkedOnOrAfter(0xa0000) == 0x0) goto loc_9a7b2f;
//}
//
//
//- (CGSize)_effectiveEstimatedItemSize {
//    
//    if (CGSizeEqualToSize(UICollectionViewFlowLayoutAutomaticSize, _estimatedItemSize)) {
//        [_data computedEstimatedSize];
//    }
//    
//}
//
//
//
//struct CGSize -[UICollectionViewFlowLayout _effectiveEstimatedItemSize](void * self, void * _cmd) {
//    
//        
//        rdi = self;
//    
//    
//    rax = *_OBJC_IVAR_$_UICollectionViewFlowLayout._estimatedItemSize;
//    xmm0 = intrinsic_movsd(xmm0, *(rdi + rax));
//    xmm1 = intrinsic_movsd(xmm1, *(rdi + rax + 0x8));
//    xmm0 = intrinsic_ucomisd(xmm0, *0xc4f6f8);
//    if ((xmm0 == 0x0) && (!CPU_FLAGS & P)) {
//        xmm1 = intrinsic_ucomisd(xmm1, *0xc4f6f8);
//        if ((xmm1 == 0x0) && (!CPU_FLAGS & P)) {
//            stack[2047] = rbp;
//            rsp = rsp - 0x8;
//            [rdi->_data computedEstimatedSize];
//            xmm3 = intrinsic_movapd(xmm3, xmm0);
//            xmm2 = intrinsic_movapd(xmm2, xmm1);
//            rax = _CGSizeZero;
//            xmm3 = intrinsic_ucomisd(xmm3, *rax);
//            COND = xmm3 == 0x0;
//            asm { setnp      cl };
//            rdx = (COND ? 0x1 : 0x0) & rcx;
//            xmm2 = intrinsic_ucomisd(xmm2, *(rax + 0x8));
//            COND = xmm2 == 0x0;
//            asm { setnp      cl };
//            rax = (COND ? 0x1 : 0x0) & rcx & rdx;
//            xmm1 = intrinsic_movsd(xmm1, *0xc4fba0);
//            xmm0 = intrinsic_movapd(xmm0, xmm1);
//            if (rax == 0x0) {
//                intrinsic_movapd(xmm0, xmm3);
//            }
//            if (rax == 0x0) {
//                intrinsic_movapd(xmm1, xmm2);
//            }
//        }
//    }
//    return rax;
//}

@end
