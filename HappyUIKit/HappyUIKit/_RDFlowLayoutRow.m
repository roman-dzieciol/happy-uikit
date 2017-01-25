//
//  _RDFlowLayoutRow.m
//  MinimalObjC
//
//  Created by Roman Dzieciol on 1/22/17.
//  Copyright © 2017 R3PI. All rights reserved.
//

#import "_RDFlowLayoutRow.h"
#import "_RDFlowLayoutItem.h"
#import "_RDFlowLayoutInfo.h"
#import "_RDFlowLayoutSection.h"
#import "HappyUIKitDefinitions.h"

@interface _RDFlowLayoutRow()

@property (nonatomic, readwrite) NSMutableArray<_RDFlowLayoutItem *> *items;

@end

@implementation _RDFlowLayoutRow

- (void)addItem:(_RDFlowLayoutItem *)item atEnd:(bool)atEnd {
    if (atEnd) {
        [self.items addObject:item];
    } else {
        [self.items insertObject:item atIndex:0];
    }
    [item setRowObject:self];
}

- (instancetype)copyFromSection:(_RDFlowLayoutSection *)section {
    _RDFlowLayoutRow *newRow = [[_RDFlowLayoutRow alloc] init];
    newRow.section = self.section;
    newRow.rowSize = self.rowSize;
    newRow.rowFrame = self.rowFrame;
    newRow.index = self.index;
    newRow.isValid = self.isValid;
    newRow.verticalAlignement = self.verticalAlignement;
    newRow.horizontalAlignement = self.horizontalAlignement;
    for (_RDFlowLayoutItem *item in self.items) {
        _RDFlowLayoutItem *newItem = [item copy];
        [newRow.items addObject:newItem];
        newItem.section = self.section;
        newItem.rowObject = newRow;
    }
    return newRow;
}

- (NSInteger)indexOfNearestItemAtPoint:(CGPoint)point {
    __block NSInteger nearestIndex = 0;
    BOOL isHorizontalLayout = [[_section layoutInfo] horizontal];
    [_items enumerateObjectsUsingBlock:^(_RDFlowLayoutItem *_Nonnull __strong obj, NSUInteger idx, BOOL * _Nonnull stop) {
        CGRect itemFrame = [obj itemFrame];
        if (isHorizontalLayout) {
            if (point.x < CGRectGetMinX(itemFrame)) {
                if (idx == 0) {
                    nearestIndex = 0;
                    *stop = YES;
                } else {
                    CGFloat distanceToCurrent = CGRectGetMinX(itemFrame) - point.x;
                    CGFloat distanceToPrevious = point.x - CGRectGetMaxX(_items[idx-1].itemFrame);
                    if (distanceToPrevious < distanceToCurrent) {
                        nearestIndex = idx-1;
                    } else {
                        nearestIndex = idx;
                    }
                    *stop = YES;
                }
            } else if (point.x < CGRectGetMaxX(itemFrame)) {
                nearestIndex = idx;
                *stop = YES;
            }
        } else {
            if (point.y < CGRectGetMinY(itemFrame)) {
                if (idx == 0) {
                    nearestIndex = 0;
                    *stop = YES;
                } else {
                    CGFloat distanceToCurrent = CGRectGetMinY(itemFrame) - point.y;
                    CGFloat distanceToPrevious = point.y - CGRectGetMaxY(_items[idx-1].itemFrame);
                    if (distanceToPrevious < distanceToCurrent) {
                        nearestIndex = idx-1;
                    } else {
                        nearestIndex = idx;
                    }
                    *stop = YES;
                }
            } else if (point.y < CGRectGetMaxY(itemFrame)) {
                nearestIndex = idx;
                *stop = YES;
            }
        }
    }];
    // TODO: point.n >= CGRectGetMaxN(itemFrame) ?
    return nearestIndex;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.items = [[NSMutableArray alloc] initWithCapacity:3];
        self.verticalAlignement = 1;
        self.horizontalAlignement = 3;
    }
    return self;
}

- (void)insertItem:(_RDFlowLayoutItem *)item atIndex:(NSInteger)index {
    [self.items insertObject:item atIndex:index];
    self.isValid = NO;
}

- (void)invalidate {
    self.isValid = NO;
    [self.items removeAllObjects];
}

- (void)layoutRow {
    
    _RDFlowLayoutRow *var_250_self = self;
    
    _RDFlowLayoutSection *section = self.section;
    _RDFlowLayoutInfo *info = [section layoutInfo];
    BOOL var_231_isHorizontal = [info horizontal];
    
    UIEdgeInsets sectionMargins = [section sectionMargins];
    CGFloat var_258_interstice = var_231_isHorizontal ? [section horizontalInterstice] : [section verticalInterstice];
    
    

    
//    [section sectionMargins];
    CGFloat var_268_dimension = [info dimension];
//    
//    [section verticalInterstice];
//    [section horizontalInterstice];
    
    CGFloat var_270 = 0;
    CGFloat var_278 = 0;
    
    CGFloat var_288_rowHeight = 0;
    CGFloat maxHeight = 0;
    CGFloat var_240_acc = 0;
    
    
    for (_RDFlowLayoutItem *item in _items) {
        
        CGRect itemFrame = [item itemFrame];
        if (var_231_isHorizontal) {
            var_288_rowHeight += itemFrame.origin.y + itemFrame.size.height;
        } else {
            var_288_rowHeight += itemFrame.origin.x + itemFrame.size.width;
        }
        
    }
    
    CGSize rowSize = var_231_isHorizontal ? CGSizeMake(var_288_rowHeight, var_268_dimension) : CGSizeMake(var_268_dimension, var_288_rowHeight);
    [var_250_self setRowSize:rowSize];
    
    int lastRowHorizontalAlignment = section->_rowAlignmentOptions.lastRowHorizontalAlignment;
    int commonRowHorizontalAlignment = section->_rowAlignmentOptions.commonRowHorizontalAlignment;
    
    int alignment = commonRowHorizontalAlignment;
    
    if ([var_250_self complete]) {
        alignment = lastRowHorizontalAlignment;
    }
    
    switch (alignment) {
        case 1: {
//            CGFloat xmm0 = 0;
//            CGFloat xmm1 = 0;
//            //xmm0 = var_268_dimension
//            var_240_acc = var_268_dimension - var_240_acc;
//            // xmm0 = intrinsic_punpckldq(zero_extend_64([r15 count] - 0x1), *(int128_t *)0xc4f620);
//            // xmm0 = intrinsic_subpd(xmm0, *(int128_t *)0xc4f630);
//            // xmm0 = intrinsic_haddpd(xmm0, xmm0);
//            xmm0 *= var_258_interstice;
//            xmm1 = var_240_acc;
//            xmm1 -= xmm0;
//            xmm1 -= var_278;
//            
//            xmm0 = var_270;
//            xmm1 -= xmm0;
//            xmm1 *= *0xc4f4a0;
//            xmm1 += xmm0;
            
            // intrinsic_subpd
            // Destination[0..63] = Destination[0..63] - Source[0..63];
            // Destination[64..127] = Destination[64..127] - Source[64..127];
            
            // intrinsic_haddpd
            // xmm1[0..63] = xmm1[0..63] + xmm1[64..127];
            // xmm1[64..127] = xmm2/m128[0..63] + xmm2/m128[64..127];
            
            
//        loc_a1e79a:
//            var_240 = intrinsic_movsd(var_240, intrinsic_subsd(intrinsic_movsd(xmm0, var_268), var_240));
//            xmm0 = intrinsic_punpckldq(zero_extend_64([r15 count] - 0x1), *(int128_t *)0xc4f620);
//            xmm0 = intrinsic_subpd(xmm0, *(int128_t *)0xc4f630);
//            xmm0 = intrinsic_haddpd(xmm0, xmm0);
//            xmm0 = intrinsic_mulsd(xmm0, var_258);
//            xmm1 = intrinsic_movsd(xmm1, var_240);
//            xmm1 = intrinsic_subsd(xmm1, xmm0);
//            xmm1 = intrinsic_subsd(xmm1, var_278);
//            xmm0 = intrinsic_movsd(xmm0, var_270);
//            xmm1 = intrinsic_subsd(xmm1, xmm0);
//            xmm1 = intrinsic_mulsd(xmm1, *0xc4f4a0);
//            xmm1 = intrinsic_addsd(xmm1, xmm0);
//            goto loc_a1e812;
            break;
        }
        case 2:
            break;
        case 3:
            break;
        default:
            break;
    }
    
 
#if 0
    
    void -[_UIFlowLayoutRow layoutRow](void * self, void * _cmd) {
        rsi = _cmd;
        var_250 = self;
        var_30 = *___stack_chk_guard;
        r14 = _objc_msgSend;
        rbx = [[self section] retain];
        rax = [rbx layoutInfo];
        rax = [rax retain];
        var_280 = rax;
        var_231 = [rax horizontal];
        if (rbx != 0x0) {
            rax = [var_150 sectionMargins];
        }
        else {
            xmm0 = intrinsic_xorpd(xmm0, xmm0);
            var_140 = intrinsic_movapd(var_140, xmm0);
            var_150 = intrinsic_movapd(var_150, xmm0);
        }
        rax = [var_280 dimension];
        var_268 = intrinsic_movsd(var_268, xmm0);
        rax = var_148;
        rcx = var_150;
        if (var_231 == 0x0) {
            rcx = rax;
        }
        xmm0 = intrinsic_movsd(xmm0, *rcx);
        var_270 = intrinsic_movsd(var_270, xmm0);
        rax = var_138;
        rcx = var_140;
        if (CPU_FLAGS & E) {
            rcx = rax;
        }
        xmm0 = intrinsic_movsd(xmm0, *rcx);
        var_278 = intrinsic_movsd(var_278, xmm0);
        if (!CPU_FLAGS & E) {
            rsi = @selector(verticalInterstice);
        }
        else {
            rsi = @selector(horizontalInterstice);
        }
        var_2A8 = rbx;
        rax = _objc_msgSend(rbx, rsi);
        var_258 = intrinsic_movsd(var_258, xmm0);
        xmm0 = intrinsic_xorpd(xmm0, xmm0);
        var_160 = intrinsic_movapd(var_160, xmm0);
        var_170 = intrinsic_movapd(var_170, xmm0);
        var_180 = intrinsic_movapd(var_180, xmm0);
        var_190 = intrinsic_movapd(var_190, xmm0);
        r14 = [var_250->_items retain];
        rdx = var_190;
        rbx = [r14 countByEnumeratingWithState:rdx objects:var_B0 count:0x10];
        xmm0 = intrinsic_xorpd(xmm0, xmm0);
        var_240 = intrinsic_movsd(var_240, xmm0);
        xmm0 = intrinsic_xorpd(xmm0, xmm0);
        if (rbx != 0x0) {
            r13 = *var_180;
            xmm0 = intrinsic_xorpd(xmm0, xmm0);
            var_240 = intrinsic_movsd(var_240, xmm0);
            var_260 = @selector(countByEnumeratingWithState:objects:count:);
            xmm0 = intrinsic_xorpd(xmm0, xmm0);
            do {
                r15 = @selector(itemFrame);
                r12 = 0x0;
                do {
                    var_248 = intrinsic_movsd(var_248, xmm0);
                    if (*var_180 != r13) {
                        rax = objc_enumerationMutation(r14);
                    }
                    rsi = *(var_188 + r12 * 0x8);
                    if (rsi != 0x0) {
                        rax = [var_1B0 itemFrame];
                        xmm1 = intrinsic_movsd(xmm1, var_1A0);
                        xmm0 = intrinsic_movsd(xmm0, var_198);
                    }
                    else {
                        xmm0 = intrinsic_xorpd(xmm0, xmm0);
                        var_1A0 = intrinsic_movapd(var_1A0, xmm0);
                        var_1B0 = intrinsic_movapd(var_1B0, xmm0);
                        xmm1 = intrinsic_xorpd(xmm1, xmm1);
                        xmm0 = intrinsic_xorpd(xmm0, xmm0);
                    }
                    xmm2 = intrinsic_movapd(xmm2, xmm1);
                    if (var_231 == 0x0) {
                        xmm2 = intrinsic_movapd(xmm2, xmm0);
                    }
                    if (!CPU_FLAGS & NE) {
                        xmm0 = intrinsic_movapd(xmm0, xmm1);
                    }
                    xmm2 = intrinsic_maxsd(xmm2, var_248);
                    xmm1 = intrinsic_movsd(xmm1, var_240);
                    xmm1 = intrinsic_addsd(xmm1, xmm0);
                    var_240 = intrinsic_movsd(var_240, xmm1);
                    r12 = r12 + 0x1;
                    xmm0 = intrinsic_movapd(xmm0, xmm2);
                } while (r12 < rbx);
                var_288 = intrinsic_movsd(var_288, xmm2, var_190, var_B0, 0x10);
                rax = [r14 countByEnumeratingWithState:rdx objects:rcx count:r8];
                xmm0 = intrinsic_movsd(xmm0, var_288);
                rbx = rax;
            } while (rbx != 0x0);
        }
        var_288 = intrinsic_movsd(var_288, xmm0);
        rax = [r14 release];
        rbx = var_2A8;
        if (var_231 == 0x0) {
            xmm0 = intrinsic_movsd(xmm0, var_268);
            xmm1 = intrinsic_movsd(xmm1, var_288);
        }
        else {
            xmm0 = intrinsic_movsd(xmm0, var_288);
            xmm1 = intrinsic_movsd(xmm1, var_268);
        }
        r12 = var_250;
        r15 = _objc_msgSend;
        rax = [r12 setRowSize:rdx];
        r13 = [rbx rowAlignmentOptions];
        r14 = r13 >> 0x20;
        rbx = r14;
        if ([r12 complete] != 0x0) {
            rbx = r13;
        }
        r15 = [r12->_items retain];
        if (rbx == 0x1) goto loc_a1e79a;
        
    loc_a1e722:
        if (rbx == 0x3) goto loc_a1e81f;
        
    loc_a1e72b:
        xmm0 = intrinsic_movsd(xmm0, var_240);
        if (rbx != 0x2) goto loc_a1e8ec;
        
// ALIGNMENT 2
    loc_a1e73c:
        xmm1 = intrinsic_movsd(xmm1, var_268);
        xmm1 = intrinsic_subsd(xmm1, xmm0);
        var_240 = intrinsic_movsd(var_240, xmm1);
        xmm0 = intrinsic_punpckldq(zero_extend_64([r15 count] - 0x1), *(int128_t *)0xc4f620);
        xmm0 = intrinsic_subpd(xmm0, *(int128_t *)0xc4f630);
        xmm0 = intrinsic_haddpd(xmm0, xmm0);
        xmm0 = intrinsic_mulsd(xmm0, var_258);
        xmm1 = intrinsic_movsd(xmm1, var_240);
        xmm1 = intrinsic_subsd(xmm1, xmm0);
        xmm1 = intrinsic_subsd(xmm1, var_278);
        goto loc_a1e812;
        
    loc_a1e812:
        var_240 = intrinsic_movsd(var_240, xmm1);
        goto loc_a1e8fc;
        
    loc_a1e8fc:
        rsi = @selector(complete);
        goto loc_a1e903;
        
    loc_a1e903:
        if ([r12 complete] != 0x0) goto loc_a1eb4b;
        
    loc_a1e914:
        rax = [r12 fixedItemSize];
        if ((((r14 | 0x2) != 0x2) || (r13 != 0x3)) || (rax == 0x0)) goto loc_a1eb4b;
        
    loc_a1e948:
        r13 = r15;
        r15 = r12;
        r14 = _objc_msgSend;
        r12 = [var_280 horizontal];
        rax = [var_280 dimension];
        var_240 = intrinsic_movsd(var_240, xmm0);
        if (r12 != 0x0) {
            xmm0 = intrinsic_movsd(xmm0, var_150);
            xmm0 = intrinsic_addsd(xmm0, var_140);
            var_258 = intrinsic_movsd(var_258, xmm0);
            rsi = @selector(verticalInterstice);
        }
        else {
            xmm0 = intrinsic_movsd(xmm0, var_148);
            xmm0 = intrinsic_addsd(xmm0, var_138);
            var_258 = intrinsic_movsd(var_258, xmm0);
            rsi = @selector(horizontalInterstice);
        }
        rax = _objc_msgSend(var_2A8, rsi);
        var_248 = intrinsic_movsd(var_248, xmm0);
        xmm0 = intrinsic_movsd(xmm0, var_240);
        xmm0 = intrinsic_subsd(xmm0, var_258);
        var_240 = intrinsic_movsd(var_240, xmm0);
        r14 = [[r15->_items lastObject] retain];
        rdx = @selector(itemFrame);
        if (r12 == 0x0) goto loc_a1ea43;
        
    loc_a1ea25:
        if (r14 == 0x0) goto loc_a1ea7e;
        
    loc_a1ea2a:
        rax = [var_1F0 itemFrame];
        xmm0 = intrinsic_movsd(xmm0, var_1D8);
        goto loc_a1eaac;
        
    loc_a1eaac:
        r12 = r15;
        xmm2 = intrinsic_movsd(xmm2, var_248);
        xmm1 = intrinsic_xorpd(xmm1, xmm1);
        var_258 = intrinsic_movsd(var_258, xmm1);
        xmm1 = intrinsic_movsd(xmm1, var_240);
        xmm1 = intrinsic_ucomisd(xmm1, xmm0);
        r15 = r13;
        if (xmm1 >= 0x0) {
            xmm2 = intrinsic_addsd(xmm2, xmm0);
            rax = 0xffffffffffffffff;
            do {
                xmm1 = intrinsic_subsd(xmm1, xmm2);
                rax = rax + 0x1;
                xmm1 = intrinsic_ucomisd(xmm1, xmm0);
            } while (xmm1 >= 0x0);
            rcx = rax + 0x1;
            if (rcx >= 0x2) {
                xmm1 = intrinsic_cvtsi2sd(0x0, rcx);
                xmm0 = intrinsic_mulsd(xmm0, xmm1);
                xmm1 = intrinsic_movsd(xmm1, var_268);
                xmm1 = intrinsic_subsd(xmm1, xmm0);
                xmm1 = intrinsic_subsd(xmm1, var_270);
                xmm1 = intrinsic_subsd(xmm1, var_278);
                xmm0 = intrinsic_cvtsi2sd(0x0, rax);
                xmm1 = intrinsic_divsd(xmm1, xmm0);
                var_258 = intrinsic_movsd(var_258, xmm1);
            }
        }
        rax = [r14 release];
        xmm0 = intrinsic_movsd(xmm0, var_270);
        var_240 = intrinsic_movsd(var_240, xmm0);
        goto loc_a1eb4b;
        
    loc_a1eb4b:
        rbx = _objc_msgSend;
        rax = [r12 rowSize];
        var_298 = intrinsic_movsd(var_298, xmm0);
        xmm0 = intrinsic_xorpd(xmm0, xmm0);
        var_200 = intrinsic_movapd(var_200, xmm0);
        var_210 = intrinsic_movapd(var_210, xmm0);
        var_220 = intrinsic_movapd(var_220, xmm0);
        var_230 = intrinsic_movapd(var_230, xmm0);
        rax = [r15 retain];
        var_270 = rax;
        rdx = var_230;
        rcx = var_130;
        r14 = [rax countByEnumeratingWithState:rdx objects:rcx count:0x10];
        if (r14 != 0x0) {
            xmm0 = intrinsic_movsd(xmm0, *0xc4f4a0);
            xmm0 = intrinsic_mulsd(xmm0, var_288);
            var_290 = intrinsic_movsd(var_290, xmm0);
            var_260 = *var_220;
            var_2A0 = @selector(countByEnumeratingWithState:objects:count:);
            do {
                r13 = *_OBJC_IVAR_$__UIFlowLayoutRow._verticalAlignement;
                r12 = @selector(setItemFrame:);
                var_278 = @selector(leftToRight);
                var_268 = @selector(itemFrame);
                rbx = 0x0;
                do {
                    if (*var_220 != var_260) {
                        rax = objc_enumerationMutation(var_270);
                    }
                    r15 = *(var_228 + rbx * 0x8);
                    if (r15 != 0x0) {
                        rax = [var_1B0 itemFrame];
                        xmm0 = intrinsic_movsd(xmm0, var_1A0);
                        xmm1 = intrinsic_movsd(xmm1, var_198);
                    }
                    else {
                        xmm0 = intrinsic_xorpd(xmm0, xmm0);
                        var_1A0 = intrinsic_movapd(var_1A0, xmm0);
                        var_1B0 = intrinsic_movapd(var_1B0, xmm0);
                        xmm1 = intrinsic_xorpd(xmm1, xmm1);
                        xmm0 = intrinsic_xorpd(xmm0, xmm0);
                    }
                    xmm3 = intrinsic_movsd(xmm3, var_240);
                    xmm4 = intrinsic_movapd(xmm4, xmm1);
                    if (var_231 == 0x0) {
                        xmm4 = intrinsic_movapd(xmm4, xmm0);
                    }
                    rax = var_250->_verticalAlignement;
                    if (rax != 0x1) {
                        xmm2 = intrinsic_xorpd(xmm2, xmm2);
                        if (rax == 0x2) {
                            if (var_231 == 0x0) {
                                xmm0 = intrinsic_movapd(xmm0, xmm1);
                            }
                            xmm2 = intrinsic_movsd(xmm2, var_288);
                            xmm2 = intrinsic_subsd(xmm2, xmm0);
                        }
                    }
                    else {
                        if (var_231 == 0x0) {
                            xmm0 = intrinsic_movapd(xmm0, xmm1);
                        }
                        xmm0 = intrinsic_mulsd(xmm0, *0xc4f838);
                        xmm0 = intrinsic_addsd(xmm0, var_290);
                        xmm2 = intrinsic_movapd(xmm2, xmm0);
                    }
                    xmm4 = intrinsic_addsd(xmm4, var_258);
                    if (var_231 != 0x0) {
                        var_1A8 = intrinsic_movsd(var_1A8, xmm3);
                        var_1B0 = intrinsic_movsd(var_1B0, xmm2);
                    }
                    else {
                        var_1B0 = intrinsic_movsd(var_1B0, xmm3);
                        var_1A8 = intrinsic_movsd(var_1A8, xmm2);
                        rdi = var_280;
                        var_248 = intrinsic_movsd(var_248, xmm4);
                        rax = [rdi leftToRight];
                        xmm4 = intrinsic_movsd(xmm4, var_248);
                        xmm3 = intrinsic_movsd(xmm3, var_240);
                        if (rax == 0x0) {
                            stack[1960] = var_198;
                            stack[1959] = var_1A0;
                            stack[1958] = var_1A8;
                            stack[1957] = var_1B0;
                            rax = CGRectGetWidth(rdi);
                            xmm4 = intrinsic_movsd(xmm4, var_248);
                            xmm3 = intrinsic_movsd(xmm3, var_240);
                            xmm1 = intrinsic_movsd(xmm1, var_298);
                            xmm1 = intrinsic_subsd(xmm1, xmm0);
                            xmm1 = intrinsic_subsd(xmm1, var_1B0);
                            var_1B0 = intrinsic_movsd(var_1B0, xmm1);
                        }
                    }
                    xmm3 = intrinsic_addsd(xmm3, xmm4);
                    var_240 = intrinsic_movsd(var_240, xmm3);
                    stack[1960] = var_198;
                    stack[1959] = var_1A0;
                    stack[1958] = var_1A8;
                    stack[1957] = var_1B0;
                    rax = [r15 setItemFrame:rdx, rcx];
                    rbx = rbx + 0x1;
                } while (rbx < r14);
                rdx = var_230;
                rcx = var_130;
                r14 = [var_270 countByEnumeratingWithState:rdx objects:rcx count:0x10];
            } while (r14 != 0x0);
        }
        r14 = _objc_release;
        rax = [var_270 release];
        rax = [var_270 release];
        rax = [var_280 release];
        rax = [var_2A8 release];
        if (*___stack_chk_guard == *___stack_chk_guard) {
            rbx = stack[2042];
            r12 = stack[2043];
            r13 = stack[2044];
            r14 = stack[2045];
            r15 = stack[2046];
            rsp = rsp + 0x2d8;
            rbp = stack[2047];
        }
        else {
            rax = __stack_chk_fail();
        }
        return;
        
    loc_a1ea7e:
        xmm0 = intrinsic_xorpd(xmm0, xmm0);
        var_1E0 = intrinsic_movapd(var_1E0, xmm0);
        var_1F0 = intrinsic_movapd(var_1F0, xmm0);
        goto loc_a1eaa8;
        
    loc_a1eaa8:
        xmm0 = intrinsic_xorpd(xmm0, xmm0);
        goto loc_a1eaac;
        
    loc_a1ea43:
        if (r14 == 0x0) goto loc_a1ea94;
        
    loc_a1ea48:
        rax = [var_1D0 itemFrame];
        xmm0 = intrinsic_movsd(xmm0, var_1C0);
        goto loc_a1eaac;
        
    loc_a1ea94:
        xmm0 = intrinsic_xorpd(xmm0, xmm0);
        var_1C0 = intrinsic_movapd(var_1C0, xmm0);
        var_1D0 = intrinsic_movapd(var_1D0, xmm0);
        goto loc_a1eaa8;
        
// ALIGNMENT 0
    loc_a1e8ec:
        xmm0 = intrinsic_movsd(xmm0, var_270);
        var_240 = intrinsic_movsd(var_240, xmm0);
        goto loc_a1e8fc;
        
// ALIGNMENT 3
    loc_a1e81f:
        if ([r15 count] > 0x1) goto loc_a1e884;
        
    loc_a1e835:
        xmm1 = intrinsic_movsd(xmm1, var_270);
        xmm0 = intrinsic_movapd(xmm0, xmm1);
        xmm0 = intrinsic_addsd(xmm0, var_278);
        xmm2 = intrinsic_movsd(xmm2, var_268);
        xmm2 = intrinsic_subsd(xmm2, xmm0);
        xmm0 = intrinsic_xorpd(xmm0, xmm0);
        var_258 = intrinsic_movsd(var_258, xmm0);
        xmm0 = intrinsic_movsd(xmm0, var_240);
        xmm2 = intrinsic_ucomisd(xmm2, xmm0);
        rsi = @selector(complete);
        if (xmm2 < 0x0) {
            var_240 = intrinsic_movsd(var_240, xmm1);
        }
        else {
            xmm2 = intrinsic_subsd(xmm2, xmm0);
            xmm2 = intrinsic_mulsd(xmm2, *0xc4f4a0);
            xmm2 = intrinsic_addsd(xmm2, xmm1);
            var_240 = intrinsic_movsd(var_240, xmm2);
        }
        goto loc_a1e903;
        
    loc_a1e884:
        var_258 = intrinsic_movsd(var_258, intrinsic_subsd(intrinsic_subsd(intrinsic_subsd(intrinsic_movsd(xmm0, var_268), var_240), var_270), var_278));
        xmm0 = intrinsic_punpckldq(zero_extend_64([r15 count] - 0x1), *(int128_t *)0xc4f620);
        xmm0 = intrinsic_subpd(xmm0, *(int128_t *)0xc4f630);
        xmm0 = intrinsic_haddpd(xmm0, xmm0);
        xmm1 = intrinsic_movsd(xmm1, var_258);
        xmm1 = intrinsic_divsd(xmm1, xmm0);
        var_258 = intrinsic_movsd(var_258, xmm1);
        goto loc_a1e8ec;
        
// ALIGNMENT 1
    loc_a1e79a:
        var_240 = intrinsic_movsd(var_240, intrinsic_subsd(intrinsic_movsd(xmm0, var_268), var_240));
        xmm0 = intrinsic_punpckldq(zero_extend_64([r15 count] - 0x1), *(int128_t *)0xc4f620);
        xmm0 = intrinsic_subpd(xmm0, *(int128_t *)0xc4f630);
        xmm0 = intrinsic_haddpd(xmm0, xmm0);
        xmm0 = intrinsic_mulsd(xmm0, var_258);
        xmm1 = intrinsic_movsd(xmm1, var_240);
        xmm1 = intrinsic_subsd(xmm1, xmm0);
        xmm1 = intrinsic_subsd(xmm1, var_278);
        xmm0 = intrinsic_movsd(xmm0, var_270);
        xmm1 = intrinsic_subsd(xmm1, xmm0);
        xmm1 = intrinsic_mulsd(xmm1, *0xc4f4a0);
        xmm1 = intrinsic_addsd(xmm1, xmm0);
        goto loc_a1e812;
    }
    
#endif
}
- (void)removeItemAtIndex:(NSInteger)index {
    [self.items removeObjectAtIndex:index];
    self.isValid = NO;
    self.complete = NO;
}

- (instancetype)snapshot {
    _RDFlowLayoutRow *newRow = [[_RDFlowLayoutRow alloc] init];
    for (_RDFlowLayoutItem *item in self.items) {
        _RDFlowLayoutItem *newItem = [[_RDFlowLayoutItem alloc] init];
        [newRow addItem:newItem atEnd:YES];
        newItem.itemFrame = item.itemFrame;
    }
    [newRow setRowFrame:self.rowFrame];
    return newRow;
}

@end
