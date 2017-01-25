//
//  _RDFlowLayoutSection.m
//  MinimalObjC
//
//  Created by Roman Dzieciol on 1/22/17.
//  Copyright © 2017 R3PI. All rights reserved.
//

#import "_RDFlowLayoutSection.h"
#import "_RDFlowLayoutItem.h"
#import "_RDFlowLayoutRow.h"
#import "_RDFlowLayoutInfo.h"
#import "RDCollectionViewFlowLayout.h"

@implementation _RDFlowLayoutSection


- (void)addInvalidatedIndexPath:(id)indexPath {
    if (self.invalidatedIndexPaths == nil) {
        _invalidatedIndexPaths = [[NSMutableSet alloc] init];
    }
    [self.invalidatedIndexPaths addObject:indexPath];
}

- (id)addItem {
    _RDFlowLayoutItem *item = [[_RDFlowLayoutItem alloc] init];
    [item setSection:self];
    [[self items] addObject:item];
    return item;
}

- (id)addRowAtEnd:(bool)atEnd {
    _RDFlowLayoutRow *row = [[_RDFlowLayoutRow alloc] init];
    [row setSection:self];
    if (atEnd) {
        [self.rows addObject:row];
    }
    else {
        [self.rows insertObject:row atIndex:0x0];
    }
    return row;
}

- (void)computeLayout {
//    rbx = *_OBJC_IVAR_$__UIFlowLayoutSection._layoutInfo + self;
//    var_290 = rbx;
//    r14 = objc_loadWeakRetained(rbx);
//    r13 = [r14 horizontal];
//    [r14 release];
//    rbx = objc_loadWeakRetained(rbx);
//    [rbx dimension];
//    var_218 = intrinsic_movsd(var_218, xmm0);
//    rdi = rbx;
//    rbx = self;
//    [rdi release];
//    if (rbx->_fixedItemSize == 0x0) goto loc_a1593f;
//    
//loc_a15807:
//    xmm0 = intrinsic_movsd(xmm0, rbx->_horizontalInterstice);
//    var_208 = intrinsic_movsd(var_208, xmm0);
//    xmm0 = intrinsic_movsd(xmm0, rbx->_verticalInterstice);
//    var_230 = intrinsic_movsd(var_230, xmm0);
//    var_200 = r13;
//    if (r13 != 0x0) {
//        xmm0 = intrinsic_movsd(xmm0, rbx->_sectionMargins);
//        xmm1 = intrinsic_movsd(xmm1, *(rbx + *_OBJC_IVAR_$__UIFlowLayoutSection._sectionMargins + 0x8));
//        xmm0 = intrinsic_addsd(xmm0, *(rbx + *_OBJC_IVAR_$__UIFlowLayoutSection._sectionMargins + 0x10));
//        xmm2 = intrinsic_movsd(xmm2, var_218);
//        xmm2 = intrinsic_subsd(xmm2, xmm0);
//        xmm1 = intrinsic_addsd(xmm1, rbx->_headerDimension);
//        rbx->_otherMargin = intrinsic_movsd(rbx->_otherMargin, xmm1);
//        xmm0 = intrinsic_movsd(xmm0, rbx->_sectionMargins);
//        var_220 = intrinsic_movsd(var_220, xmm0);
//        xmm0 = intrinsic_movsd(xmm0, *(rbx + *_OBJC_IVAR_$__UIFlowLayoutSection._sectionMargins + 0x10));
//        var_228 = intrinsic_movsd(var_228, xmm0);
//        xmm0 = intrinsic_movsd(xmm0, rbx->_itemSize);
//        var_238 = intrinsic_movsd(var_238, xmm0);
//        xmm0 = intrinsic_movsd(xmm0, *(rbx + *_OBJC_IVAR_$__UIFlowLayoutSection._itemSize + 0x8));
//        var_210 = intrinsic_movsd(var_210, xmm0);
//        xmm1 = intrinsic_movsd(xmm1, rbx->_headerDimension);
//        rax = rbx;
//        rbx = *_OBJC_IVAR_$__UIFlowLayoutSection._headerFrame + rax;
//        r13 = rax;
//        xmm0 = intrinsic_xorpd(xmm0, xmm0);
//        xmm1 = intrinsic_ucomisd(xmm1, xmm0);
//        rdi = var_290;
//        if (xmm1 > 0x0) {
//            var_218 = intrinsic_movsd(var_218, xmm2);
//            var_1F8 = intrinsic_movsd(var_1F8, xmm1);
//            r12 = objc_loadWeakRetained(rdi);
//            [r12 dimension];
//            xmm1 = intrinsic_xorpd(xmm1, xmm1);
//            *(int128_t *)rbx = intrinsic_movupd(*(int128_t *)rbx, xmm1);
//            xmm1 = intrinsic_movsd(xmm1, var_1F8);
//            *(rbx + 0x10) = intrinsic_movsd(*(rbx + 0x10), xmm1);
//            *(rbx + 0x18) = intrinsic_movsd(*(rbx + 0x18), xmm0);
//            [r12 release];
//            xmm2 = intrinsic_movsd(xmm2, var_218);
//            xmm0 = intrinsic_xorpd(xmm0, xmm0);
//        }
//        else {
//            *(rbx + 0x18) = *_CGSizeCreateDictionaryRepresentation;
//            *(rbx + 0x10) = *_CGShadingRelease;
//            *(rbx + 0x8) = *_CGShadingCreateAxial;
//            *rbx = *_CGRectZero;
//        }
//        var_2A8 = intrinsic_movsd(var_2A8, xmm2);
//    }
//    else {
//        xmm0 = intrinsic_movsd(xmm0, rbx->_sectionMargins);
//        xmm1 = intrinsic_movsd(xmm1, *(rbx + *_OBJC_IVAR_$__UIFlowLayoutSection._sectionMargins + 0x8));
//        xmm1 = intrinsic_addsd(xmm1, *(rbx + *_OBJC_IVAR_$__UIFlowLayoutSection._sectionMargins + 0x18));
//        xmm2 = intrinsic_movsd(xmm2, var_218);
//        xmm2 = intrinsic_subsd(xmm2, xmm1);
//        xmm0 = intrinsic_addsd(xmm0, rbx->_headerDimension);
//        rbx->_otherMargin = intrinsic_movsd(rbx->_otherMargin, xmm0);
//        xmm0 = intrinsic_movsd(xmm0, *(rbx + *_OBJC_IVAR_$__UIFlowLayoutSection._sectionMargins + 0x8));
//        var_220 = intrinsic_movsd(var_220, xmm0);
//        xmm0 = intrinsic_movsd(xmm0, *(rbx + *_OBJC_IVAR_$__UIFlowLayoutSection._sectionMargins + 0x18));
//        var_228 = intrinsic_movsd(var_228, xmm0);
//        xmm0 = intrinsic_movsd(xmm0, rbx->_itemSize);
//        var_210 = intrinsic_movsd(var_210, xmm0);
//        xmm0 = intrinsic_movsd(xmm0, *(rbx + *_OBJC_IVAR_$__UIFlowLayoutSection._itemSize + 0x8));
//        var_238 = intrinsic_movsd(var_238, xmm0);
//        xmm0 = intrinsic_movsd(xmm0, rbx->_headerDimension);
//        r14 = rbx;
//        rbx = *_OBJC_IVAR_$__UIFlowLayoutSection._headerFrame + r14;
//        xmm1 = intrinsic_xorpd(xmm1, xmm1);
//        xmm0 = intrinsic_ucomisd(xmm0, xmm1);
//        COND = xmm0 <= 0x0;
//        xmm0 = intrinsic_xorpd(xmm0, xmm0);
//        var_2A8 = intrinsic_movsd(var_2A8, xmm0);
//        rdi = var_290;
//        if (!COND) {
//            var_218 = intrinsic_movsd(var_218, xmm2);
//            r12 = objc_loadWeakRetained(rdi);
//            [r12 dimension];
//            r13 = r14;
//            xmm1 = intrinsic_xorpd(xmm1, xmm1);
//            *(int128_t *)rbx = intrinsic_movupd(*(int128_t *)rbx, xmm1);
//            *(rbx + 0x10) = intrinsic_movsd(*(rbx + 0x10), xmm0);
//            *(rbx + 0x18) = r14->_headerDimension;
//            [r12 release];
//            xmm2 = intrinsic_movsd(xmm2, var_218);
//            xmm0 = intrinsic_movapd(xmm0, xmm2);
//        }
//        else {
//            r13 = r14;
//            *(rbx + 0x18) = *_CGSizeCreateDictionaryRepresentation;
//            *(rbx + 0x10) = *_CGShadingRelease;
//            *(rbx + 0x8) = *_CGShadingCreateAxial;
//            *rbx = *_CGRectZero;
//            xmm0 = intrinsic_movapd(xmm0, xmm2);
//        }
//    }
//    var_2B0 = intrinsic_movsd(var_2B0, xmm0);
//    xmm0 = intrinsic_movsd(xmm0, r13->_otherMargin);
//    rbx = r13;
//    if (r13->_itemsCount <= 0x0) goto loc_a16265;
//    
//loc_a15ae1:
//    var_1F8 = intrinsic_movsd(var_1F8, xmm0);
//    xmm0 = intrinsic_movsd(xmm0, var_210);
//    xmm0 = intrinsic_ucomisd(xmm0, xmm2);
//    if (xmm0 > 0x0) {
//        var_218 = intrinsic_movsd(var_218, xmm2, var_200 & 0xff, 0x0);
//        [rbx logInvalidSizesForHorizontalDirection:rdx warnAboutDelegateValues:rcx];
//        xmm2 = intrinsic_movsd(xmm2, var_218);
//    }
//    var_218 = intrinsic_movsd(var_218, xmm2);
//    xmm1 = intrinsic_movsd(xmm1, var_208);
//    xmm0 = intrinsic_movapd(xmm0, xmm1);
//    xmm0 = intrinsic_addsd(xmm0, xmm2);
//    xmm1 = intrinsic_addsd(xmm1, var_210);
//    var_240 = intrinsic_movsd(var_240, xmm1);
//    xmm0 = intrinsic_divsd(xmm0, xmm1);
//    rax = floor(xmm0);
//    rax = intrinsic_cvttsd2si(rax, xmm0);
//    rcx = 0x1;
//    if (rax != 0x0) {
//        rcx = rax;
//    }
//    rbx->_itemsByRowCount = rcx;
//    temp_0 = rbx->_itemsCount / rcx;
//    r13 = temp_0;
//    rbx->_indexOfIncompleteRow = 0xffffffffffffffff;
//    r15 = 0x0;
//    COND = rbx->_itemsByRowCount * r13 == rbx->_itemsCount;
//    rbx->_lastRowIncomplete = COND_BYTE_SET(NE);
//    if (!COND) {
//        r15 = rbx->_itemsCount - rbx->_itemsByRowCount * r13;
//        rbx->_indexOfIncompleteRow = r13;
//        r13 = r13 + 0x1;
//    }
//    rcx = *_OBJC_IVAR_$__UIFlowLayoutSection._rowAlignmentOptions;
//    rax = *(int32_t *)(rbx + rcx);
//    xmm2 = intrinsic_movsd(xmm2, var_218);
//    if (rax > 0x3) goto loc_a15e6d;
//    
//loc_a15bd6:
//    goto *0xa1706c[sign_extend_64(*(int32_t *)(0xa1706c + rax * 0x4)) + 0xa1706c];
//    
//loc_a15be6:
//    xmm0 = intrinsic_movsd(xmm0, var_208);
//    rbx->_actualGap = intrinsic_movsd(rbx->_actualGap, xmm0);
//    xmm0 = intrinsic_movsd(xmm0, var_220);
//    rbx->_beginMargin = intrinsic_movsd(rbx->_beginMargin, xmm0);
//    r14 = objc_loadWeakRetained(var_290);
//    [r14 dimension];
//    xmm0 = intrinsic_subsd(xmm0, var_220);
//    xmm1 = intrinsic_cvtsi2sd(xmm1, rbx->_itemsByRowCount);
//    xmm1 = intrinsic_mulsd(xmm1, var_240);
//    xmm1 = intrinsic_subsd(xmm1, var_208);
//    xmm0 = intrinsic_subsd(xmm0, xmm1);
//    rbx->_endMargin = intrinsic_movsd(rbx->_endMargin, xmm0);
//    [r14 release];
//    goto loc_a15f2a;
//    
//loc_a15f2a:
//    xmm2 = intrinsic_movsd(xmm2, var_218);
//    rcx = *_OBJC_IVAR_$__UIFlowLayoutSection._rowAlignmentOptions;
//    goto loc_a15f40;
//    
//loc_a15f40:
//    if (rbx->_lastRowIncomplete == 0x0) goto loc_a16235;
//    
//loc_a15f4a:
//    rcx = *_OBJC_IVAR_$__UIFlowLayoutSection._rowAlignmentOptions;
//    rax = *(int32_t *)(rbx + rcx + 0x4);
//    if (rax > 0x3) goto loc_a16179;
//    
//loc_a15f58:
//    var_218 = intrinsic_movsd(var_218, xmm2);
//    goto *0xa1707c[sign_extend_64(*(int32_t *)(0xa1707c + rax * 0x4)) + 0xa1707c];
//    
//loc_a15f70:
//    xmm0 = intrinsic_movsd(xmm0, var_208);
//    rbx->_lastRowActualGap = intrinsic_movsd(rbx->_lastRowActualGap, xmm0);
//    goto loc_a16219;
//    
//loc_a16219:
//    rbx->_lastRowBeginMargin = intrinsic_movsd(rbx->_lastRowBeginMargin, intrinsic_movsd(xmm0, var_220));
//    xmm2 = intrinsic_movsd(xmm2, var_218);
//    goto loc_a16235;
//    
//loc_a16235:
//    xmm0 = intrinsic_cvtsi2sd(0x0, r13);
//    xmm1 = intrinsic_movsd(xmm1, var_230);
//    xmm3 = intrinsic_movsd(xmm3, var_238);
//    xmm3 = intrinsic_addsd(xmm3, xmm1);
//    xmm3 = intrinsic_mulsd(xmm3, xmm0);
//    xmm0 = intrinsic_movsd(xmm0, var_1F8);
//    xmm0 = intrinsic_addsd(xmm0, xmm3);
//    xmm0 = intrinsic_subsd(xmm0, xmm1);
//    goto loc_a16265;
//    
//loc_a16265:
//    var_1F8 = intrinsic_movsd(var_1F8, xmm0);
//    var_218 = intrinsic_movsd(var_218, xmm2);
//    if (var_200 != 0x0) {
//        rdx = @selector(sectionMargins);
//        objc_msgSend_stret(var_110, rbx, rdx);
//        xmm0 = intrinsic_movsd(xmm0, var_1F8);
//        xmm0 = intrinsic_addsd(xmm0, var_F8);
//        var_1F8 = intrinsic_movsd(var_1F8, xmm0);
//        xmm1 = intrinsic_movsd(xmm1, rbx->_footerDimension);
//        r12 = rbx;
//        rbx = *_OBJC_IVAR_$__UIFlowLayoutSection._footerFrame + r12;
//        xmm0 = intrinsic_xorpd(xmm0, xmm0);
//        xmm1 = intrinsic_ucomisd(xmm1, xmm0);
//        if (xmm1 > 0x0) {
//            r15 = var_290;
//            var_208 = intrinsic_movsd(var_208, xmm1);
//            r14 = objc_loadWeakRetained(r15);
//            [r14 dimension];
//            xmm1 = intrinsic_movsd(xmm1, var_1F8);
//            *rbx = intrinsic_movsd(*rbx, xmm1);
//            *(rbx + 0x8) = 0x0;
//            xmm1 = intrinsic_movsd(xmm1, var_208);
//            *(rbx + 0x10) = intrinsic_movsd(*(rbx + 0x10), xmm1);
//            *(rbx + 0x18) = intrinsic_movsd(*(rbx + 0x18), xmm0);
//            [r14 release];
//            xmm0 = intrinsic_movsd(xmm0, var_1F8);
//            xmm0 = intrinsic_addsd(xmm0, r12->_footerDimension);
//            var_1F8 = intrinsic_movsd(var_1F8, xmm0);
//        }
//        else {
//            *(rbx + 0x18) = *_CGSizeCreateDictionaryRepresentation;
//            *(rbx + 0x10) = *_CGShadingRelease;
//            *(rbx + 0x8) = *_CGShadingCreateAxial;
//            *rbx = *_CGRectZero;
//            r15 = var_290;
//        }
//        r13 = @selector(dimension);
//        r14 = objc_loadWeakRetained(r15);
//        _objc_msgSend(r14, r13);
//        xmm1 = intrinsic_xorpd(xmm1, xmm1);
//        var_130 = intrinsic_movapd(var_130, xmm1);
//        xmm1 = intrinsic_movsd(xmm1, var_1F8);
//        var_120 = intrinsic_movsd(var_120, xmm1);
//        intrinsic_movsd(var_118, xmm0);
//        [r12 setFrame:rdx, rcx];
//        [r14 release];
//        xmm0 = intrinsic_movsd(xmm0, var_1F8);
//    }
//    else {
//        rdx = @selector(sectionMargins);
//        objc_msgSend_stret(var_D0, rbx, rdx);
//        xmm0 = intrinsic_movsd(xmm0, var_1F8);
//        xmm0 = intrinsic_addsd(xmm0, var_C0);
//        var_1F8 = intrinsic_movsd(var_1F8, xmm0);
//        xmm0 = intrinsic_movsd(xmm0, rbx->_footerDimension);
//        r12 = rbx;
//        rbx = *_OBJC_IVAR_$__UIFlowLayoutSection._footerFrame + r12;
//        xmm1 = intrinsic_xorpd(xmm1, xmm1);
//        xmm0 = intrinsic_ucomisd(xmm0, xmm1);
//        if (xmm0 > 0x0) {
//            r15 = var_290;
//            r14 = objc_loadWeakRetained(r15);
//            [r14 dimension];
//            *rbx = 0x0;
//            xmm1 = intrinsic_movsd(xmm1, var_1F8);
//            *(rbx + 0x8) = intrinsic_movsd(*(rbx + 0x8), xmm1);
//            *(rbx + 0x10) = intrinsic_movsd(*(rbx + 0x10), xmm0);
//            *(rbx + 0x18) = r12->_footerDimension;
//            [r14 release];
//            xmm0 = intrinsic_movsd(xmm0, var_1F8);
//            xmm0 = intrinsic_addsd(xmm0, r12->_footerDimension);
//            var_1F8 = intrinsic_movsd(var_1F8, xmm0);
//        }
//        else {
//            *(rbx + 0x18) = *_CGSizeCreateDictionaryRepresentation;
//            *(rbx + 0x10) = *_CGShadingRelease;
//            *(rbx + 0x8) = *_CGShadingCreateAxial;
//            *rbx = *_CGRectZero;
//            r15 = var_290;
//        }
//        r13 = @selector(dimension);
//        r14 = objc_loadWeakRetained(r15);
//        _objc_msgSend(r14, r13);
//        xmm1 = intrinsic_xorpd(xmm1, xmm1);
//        var_F0 = intrinsic_movapd(var_F0, xmm1);
//        var_E0 = intrinsic_movsd(var_E0, xmm0);
//        xmm0 = intrinsic_movsd(xmm0, var_1F8);
//        intrinsic_movsd(var_D8, xmm0);
//        [r12 setFrame:rdx, rcx];
//        [r14 release];
//        xmm0 = intrinsic_movsd(xmm0, var_1F8);
//        var_2A8 = intrinsic_movsd(var_2A8, xmm0);
//        xmm0 = intrinsic_movsd(xmm0, var_2B0);
//    }
//    rbx = r12;
//    rdi = r15;
//    xmm2 = intrinsic_movsd(xmm2, var_218);
//    if (r12->_fixedItemSize != 0x0) goto loc_a17016;
//    
//loc_a165bb:
//    rcx = *_OBJC_IVAR_$__UIFlowLayoutSection._sectionMargins;
//    if (var_200 == 0x0) goto loc_a166ad;
//    
//loc_a165cf:
//    var_2B0 = intrinsic_movsd(var_2B0, xmm0);
//    xmm0 = intrinsic_movsd(xmm0, rbx->_sectionMargins);
//    xmm0 = intrinsic_addsd(xmm0, *(rbx + *_OBJC_IVAR_$__UIFlowLayoutSection._sectionMargins + 0x10));
//    xmm2 = intrinsic_subsd(xmm2, xmm0);
//    xmm3 = intrinsic_movsd(xmm3, rbx->_headerDimension);
//    xmm1 = intrinsic_movsd(xmm1, *(rbx + *_OBJC_IVAR_$__UIFlowLayoutSection._sectionMargins + 0x8));
//    xmm1 = intrinsic_addsd(xmm1, xmm3);
//    xmm0 = intrinsic_movsd(xmm0, rbx->_verticalInterstice);
//    var_230 = intrinsic_movsd(var_230, xmm0);
//    xmm0 = intrinsic_movsd(xmm0, rbx->_horizontalInterstice);
//    var_210 = intrinsic_movsd(var_210, xmm0);
//    rax = rbx;
//    rbx = *_OBJC_IVAR_$__UIFlowLayoutSection._headerFrame + rax;
//    r15 = rax;
//    xmm0 = intrinsic_xorpd(xmm0, xmm0);
//    xmm3 = intrinsic_ucomisd(xmm3, xmm0);
//    if (xmm3 <= 0x0) goto loc_a1677b;
//    
//loc_a16642:
//    var_1F8 = intrinsic_movsd(var_1F8, xmm1);
//    var_290 = rdi;
//    var_218 = intrinsic_movsd(var_218, xmm2);
//    var_208 = intrinsic_movsd(var_208, xmm3);
//    r14 = objc_loadWeakRetained(rdi);
//    _objc_msgSend(r14, r13);
//    xmm1 = intrinsic_xorpd(xmm1, xmm1);
//    *(int128_t *)rbx = intrinsic_movupd(*(int128_t *)rbx, xmm1);
//    xmm1 = intrinsic_movsd(xmm1, var_208);
//    *(rbx + 0x10) = intrinsic_movsd(*(rbx + 0x10), xmm1);
//    *(rbx + 0x18) = intrinsic_movsd(*(rbx + 0x18), xmm0);
//    [r14 release];
//    xmm0 = intrinsic_movsd(xmm0, var_218);
//    var_2A8 = intrinsic_movsd(var_2A8, xmm0);
//    goto loc_a167f9;
//    
//loc_a167f9:
//    var_288 = r15;
//    r13 = r15;
//    [r13->_rows removeAllObjects];
//    rax = [r13->_items count];
//    var_238 = rax;
//    var_259 = 0x1;
//    r14 = 0x0;
//    if (rax <= 0x0) goto loc_a16b8d;
//    
//loc_a16851:
//    var_259 = 0x1;
//    r15 = 0x0;
//    xmm0 = intrinsic_movsd(xmm0, var_218);
//    var_220 = intrinsic_movsd(var_220, xmm0);
//    r14 = 0x0;
//    goto loc_a168fa;
//    
//loc_a168fa:
//    rdx = r15;
//    rax = [r13->_items objectAtIndexedSubscript:rdx];
//    rax = [rax retain];
//    rbx = var_200;
//    if (rbx == 0x0) goto loc_a16954;
//    
//loc_a16928:
//    if (rax == 0x0) goto loc_a16980;
//    
//loc_a1692d:
//    var_228 = rax;
//    [var_170 itemFrame];
//    xmm1 = intrinsic_movsd(xmm1, var_158);
//    goto loc_a169bc;
//    
//loc_a169bc:
//    xmm0 = intrinsic_movsd(xmm0, var_218);
//    var_218 = intrinsic_movsd(var_218, xmm0);
//    xmm1 = intrinsic_ucomisd(xmm1, xmm0);
//    if (xmm1 > 0x0) {
//        var_208 = intrinsic_movsd(var_208, xmm1, rbx & 0xff, 0x1);
//        [r13 logInvalidSizesForHorizontalDirection:rdx warnAboutDelegateValues:rcx];
//        xmm1 = intrinsic_movsd(xmm1, var_208);
//    }
//    if (r14 == 0x0) {
//        var_208 = intrinsic_movsd(var_208, xmm1, 0x1);
//        rax = [r13 addRowAtEnd:rdx];
//        rax = [rax retain];
//        xmm1 = intrinsic_movsd(xmm1, var_208);
//        r14 = rax;
//    }
//    xmm0 = intrinsic_movsd(xmm0, var_220);
//    xmm0 = intrinsic_ucomisd(xmm0, xmm1);
//    if (xmm0 < 0x0) {
//        xmm1 = intrinsic_addsd(xmm1, var_230);
//        var_208 = intrinsic_movsd(var_208, xmm1);
//        [r14 setComplete:0x1];
//        if ((var_259 & 0x1) != 0x0) {
//            rbx = [[r14 items] retain];
//            var_259 = [rbx count] == 0x1 ? 0x1 : 0x0;
//            r13 = var_288;
//            [rbx release];
//        }
//        xmm0 = intrinsic_movsd(xmm0, var_218);
//        xmm0 = intrinsic_subsd(xmm0, var_208);
//        var_220 = intrinsic_movsd(var_220, xmm0);
//        [r14 layoutRow];
//        rdi = r14;
//        r14 = [[r13 addRowAtEnd:0x1] retain];
//        [rdi release];
//        rcx = 0x1;
//        rbx = var_228;
//        [r14 addItem:rbx atEnd:rcx];
//    }
//    else {
//        rbx = var_228;
//        var_208 = intrinsic_movsd(var_208, xmm1, rbx, 0x1);
//        [r14 addItem:rdx atEnd:rcx];
//        xmm1 = intrinsic_movsd(xmm1, var_208);
//        xmm1 = intrinsic_addsd(xmm1, var_230);
//        xmm0 = intrinsic_movsd(xmm0, var_220);
//        xmm0 = intrinsic_subsd(xmm0, xmm1);
//        var_220 = intrinsic_movsd(var_220, xmm0);
//    }
//    [rbx release];
//    r15 = r15 + 0x1;
//    if (var_238 != r15) goto loc_a168fa;
//    
//loc_a16b8d:
//    [r14 setFixedItemSize:r13->_fixedItemSize & 0xff];
//    if ((var_259 & 0x1) != 0x0) {
//        r12 = r14;
//        r14 = [[r14 items] retain];
//        r15 = [r14 count];
//        rdi = r14;
//        r14 = r12;
//        [rdi release];
//        if (r15 == 0x1) {
//            [r14 setComplete:0x1];
//        }
//    }
//    var_230 = r14;
//    var_288 = r13;
//    [r14 layoutRow];
//    xmm0 = intrinsic_xorpd(xmm0, xmm0);
//    intrinsic_movapd(var_180, xmm0);
//    intrinsic_movapd(var_190, xmm0);
//    var_1A0 = intrinsic_movapd(var_1A0, xmm0);
//    var_1B0 = intrinsic_movapd(var_1B0, xmm0);
//    rax = [r13->_rows retain];
//    var_220 = rax;
//    rdx = var_1B0;
//    rcx = var_B0;
//    rax = [rax countByEnumeratingWithState:rdx objects:rcx count:0x10];
//    var_208 = rax;
//    if (rax != 0x0) {
//        var_218 = *var_1A0;
//        do {
//            r15 = 0x0;
//            do {
//                if (*var_1A0 != var_218) {
//                    objc_enumerationMutation(var_220);
//                }
//                r12 = *(var_1A8 + r15 * 0x8);
//                [r12 rowSize];
//                xmm2 = intrinsic_xorpd(xmm2, xmm2);
//                if (var_200 == 0x0) {
//                    xmm3 = intrinsic_xorpd(xmm3, xmm3);
//                    xmm5 = intrinsic_movsd(xmm5, var_1F8);
//                    xmm2 = intrinsic_movapd(xmm2, xmm5);
//                    xmm4 = intrinsic_movapd(xmm4, xmm1);
//                }
//                else {
//                    xmm5 = intrinsic_movsd(xmm5, var_1F8);
//                    xmm3 = intrinsic_movapd(xmm3, xmm5);
//                    xmm4 = intrinsic_movapd(xmm4, xmm0);
//                }
//                xmm4 = intrinsic_addsd(xmm4, var_210);
//                xmm5 = intrinsic_addsd(xmm5, xmm4);
//                var_1F8 = intrinsic_movsd(var_1F8, xmm5);
//                var_1D0 = intrinsic_movsd(var_1D0, xmm3);
//                var_1C8 = intrinsic_movsd(var_1C8, xmm2);
//                var_1C0 = intrinsic_movsd(var_1C0, xmm0);
//                var_1B8 = intrinsic_movsd(var_1B8, xmm1);
//                [r12 setRowFrame:rdx, rcx];
//                r15 = r15 + 0x1;
//            } while (r15 < var_208);
//            rdx = var_1B0;
//            rcx = var_B0;
//            rax = [var_220 countByEnumeratingWithState:rdx objects:rcx count:0x10];
//            var_208 = rax;
//        } while (rax != 0x0);
//    }
//    [var_220 release];
//    xmm2 = intrinsic_movsd(xmm2, var_1F8);
//    xmm2 = intrinsic_subsd(xmm2, var_210);
//    if (var_200 != 0x0) {
//        r12 = var_288;
//        var_1F8 = intrinsic_movsd(var_1F8, xmm2, @selector(sectionMargins));
//        [var_1F0 sectionMargins];
//        xmm1 = intrinsic_movsd(xmm1, var_1F8);
//        xmm1 = intrinsic_addsd(xmm1, var_1D8);
//        xmm2 = intrinsic_movsd(xmm2, r12->_footerDimension);
//        r15 = *_OBJC_IVAR_$__UIFlowLayoutSection._footerFrame + r12;
//        xmm0 = intrinsic_xorpd(xmm0, xmm0);
//        xmm2 = intrinsic_ucomisd(xmm2, xmm0);
//        if (xmm2 > 0x0) {
//            var_1F8 = intrinsic_movsd(var_1F8, xmm1);
//            var_200 = intrinsic_movsd(var_200, xmm2);
//            r14 = [[r12 layoutInfo] retain];
//            [r14 dimension];
//            xmm1 = intrinsic_movsd(xmm1, var_1F8);
//            *r15 = intrinsic_movsd(*r15, xmm1);
//            *(r15 + 0x8) = 0x0;
//            xmm1 = intrinsic_movsd(xmm1, var_200);
//            *(r15 + 0x10) = intrinsic_movsd(*(r15 + 0x10), xmm1);
//            *(r15 + 0x18) = intrinsic_movsd(*(r15 + 0x18), xmm0);
//            [r14 release];
//            xmm0 = intrinsic_movsd(xmm0, var_1F8);
//            xmm0 = intrinsic_addsd(xmm0, r12->_footerDimension);
//            xmm1 = intrinsic_movapd(xmm1, xmm0);
//        }
//        else {
//            *(r15 + 0x18) = *_CGSizeCreateDictionaryRepresentation;
//            *(r15 + 0x10) = *_CGShadingRelease;
//            *(r15 + 0x8) = *_CGShadingCreateAxial;
//            *r15 = *_CGRectZero;
//        }
//        xmm2 = intrinsic_movsd(xmm2, var_2A8);
//        rbx = r12;
//    }
//    else {
//        r12 = var_288;
//        xmm2 = intrinsic_addsd(xmm2, *(r12 + *_OBJC_IVAR_$__UIFlowLayoutSection._sectionMargins + 0x10));
//        xmm0 = intrinsic_movsd(xmm0, r12->_footerDimension);
//        rbx = *_OBJC_IVAR_$__UIFlowLayoutSection._footerFrame + r12;
//        xmm1 = intrinsic_xorpd(xmm1, xmm1);
//        xmm0 = intrinsic_ucomisd(xmm0, xmm1);
//        if (xmm0 > 0x0) {
//            var_1F8 = intrinsic_movsd(var_1F8, xmm2);
//            r14 = objc_loadWeakRetained(var_290);
//            [r14 dimension];
//            *rbx = 0x0;
//            xmm1 = intrinsic_movsd(xmm1, var_1F8);
//            *(rbx + 0x8) = intrinsic_movsd(*(rbx + 0x8), xmm1);
//            *(rbx + 0x10) = intrinsic_movsd(*(rbx + 0x10), xmm0);
//            *(rbx + 0x18) = r12->_footerDimension;
//            [r14 release];
//            xmm2 = intrinsic_movsd(xmm2, var_1F8);
//            xmm2 = intrinsic_addsd(xmm2, r12->_footerDimension);
//        }
//        else {
//            *(rbx + 0x18) = *_CGSizeCreateDictionaryRepresentation;
//            *(rbx + 0x10) = *_CGShadingRelease;
//            *(rbx + 0x8) = *_CGShadingCreateAxial;
//            *rbx = *_CGRectZero;
//        }
//        rbx = r12;
//        xmm1 = intrinsic_movsd(xmm1, var_2B0);
//    }
//    rbx->_frame = intrinsic_movupd(rbx->_frame, intrinsic_xorpd(xmm0, xmm0));
//    *(rbx + *_OBJC_IVAR_$__UIFlowLayoutSection._frame + 0x10) = intrinsic_movsd(*(rbx + *_OBJC_IVAR_$__UIFlowLayoutSection._frame + 0x10), xmm1);
//    *(rbx + *_OBJC_IVAR_$__UIFlowLayoutSection._frame + 0x18) = intrinsic_movsd(*(rbx + *_OBJC_IVAR_$__UIFlowLayoutSection._frame + 0x18), xmm2);
//    [var_230 release];
//    goto loc_a17016;
//    
//loc_a17016:
//    rbx->_validItemRange = 0x0;
//    *(rbx + *_OBJC_IVAR_$__UIFlowLayoutSection._validItemRange + 0x8) = [rbx->_items count];
//    if (*___stack_chk_guard != *___stack_chk_guard) {
//        __stack_chk_fail();
//    }
//    return;
//    
//loc_a16980:
//    var_228 = rax;
//    xmm0 = intrinsic_xorpd(xmm0, xmm0);
//    var_160 = intrinsic_movapd(var_160, xmm0);
//    var_170 = intrinsic_movapd(var_170, xmm0);
//    goto loc_a169b8;
//    
//loc_a169b8:
//    xmm1 = intrinsic_xorpd(xmm1, xmm1);
//    goto loc_a169bc;
//    
//loc_a16954:
//    if (rax == 0x0) goto loc_a1699d;
//    
//loc_a16959:
//    var_228 = rax;
//    [var_150 itemFrame];
//    xmm1 = intrinsic_movsd(xmm1, var_140);
//    goto loc_a169bc;
//    
//loc_a1699d:
//    var_228 = rax;
//    xmm0 = intrinsic_xorpd(xmm0, xmm0);
//    var_140 = intrinsic_movapd(var_140, xmm0);
//    var_150 = intrinsic_movapd(var_150, xmm0);
//    goto loc_a169b8;
//    
//loc_a1677b:
//    var_1F8 = intrinsic_movsd(var_1F8, xmm1);
//    var_290 = rdi;
//    *(rbx + 0x18) = *_CGSizeCreateDictionaryRepresentation;
//    *(rbx + 0x10) = *_CGShadingRelease;
//    *(rbx + 0x8) = *_CGShadingCreateAxial;
//    *rbx = *_CGRectZero;
//    var_2A8 = intrinsic_movsd(var_2A8, xmm2);
//    goto loc_a167f1;
//    
//loc_a167f1:
//    var_218 = intrinsic_movsd(var_218, xmm2);
//    goto loc_a167f9;
//    
//loc_a166ad:
//    var_290 = rdi;
//    xmm0 = intrinsic_movsd(xmm0, *(rbx + *_OBJC_IVAR_$__UIFlowLayoutSection._sectionMargins + 0x8));
//    xmm0 = intrinsic_addsd(xmm0, *(rbx + *_OBJC_IVAR_$__UIFlowLayoutSection._sectionMargins + 0x18));
//    xmm2 = intrinsic_subsd(xmm2, xmm0);
//    xmm0 = intrinsic_movsd(xmm0, rbx->_headerDimension);
//    xmm3 = intrinsic_movsd(xmm3, rbx->_sectionMargins);
//    xmm3 = intrinsic_addsd(xmm3, xmm0);
//    xmm1 = intrinsic_movsd(xmm1, rbx->_horizontalInterstice);
//    var_230 = intrinsic_movsd(var_230, xmm1);
//    xmm1 = intrinsic_movsd(xmm1, rbx->_verticalInterstice);
//    var_210 = intrinsic_movsd(var_210, xmm1);
//    r12 = rbx;
//    rbx = *_OBJC_IVAR_$__UIFlowLayoutSection._headerFrame + r12;
//    xmm1 = intrinsic_xorpd(xmm1, xmm1);
//    xmm0 = intrinsic_ucomisd(xmm0, xmm1);
//    if (xmm0 <= 0x0) goto loc_a167b9;
//    
//loc_a1671d:
//    var_1F8 = intrinsic_movsd(var_1F8, xmm3);
//    var_218 = intrinsic_movsd(var_218, xmm2);
//    r14 = objc_loadWeakRetained(var_290);
//    _objc_msgSend(r14, r13);
//    r15 = r12;
//    xmm1 = intrinsic_xorpd(xmm1, xmm1);
//    *(int128_t *)rbx = intrinsic_movupd(*(int128_t *)rbx, xmm1);
//    *(rbx + 0x10) = intrinsic_movsd(*(rbx + 0x10), xmm0);
//    *(rbx + 0x18) = r12->_headerDimension;
//    [r14 release];
//    xmm0 = intrinsic_movsd(xmm0, var_218);
//    var_2B0 = intrinsic_movsd(var_2B0, xmm0);
//    goto loc_a167f9;
//    
//loc_a167b9:
//    var_1F8 = intrinsic_movsd(var_1F8, xmm3);
//    r15 = r12;
//    *(rbx + 0x18) = *_CGSizeCreateDictionaryRepresentation;
//    *(rbx + 0x10) = *_CGShadingRelease;
//    *(rbx + 0x8) = *_CGShadingCreateAxial;
//    *rbx = *_CGRectZero;
//    var_2B0 = intrinsic_movsd(var_2B0, xmm2);
//    goto loc_a167f1;
//    
//loc_a15f89:
//    xmm0 = intrinsic_movsd(xmm0, var_208);
//    rbx->_lastRowActualGap = intrinsic_movsd(rbx->_lastRowActualGap, xmm0);
//    r14 = rbx;
//    rbx = objc_loadWeakRetained(var_290);
//    [rbx dimension];
//    xmm1 = intrinsic_cvtsi2sd(xmm1, r15);
//    xmm3 = intrinsic_movsd(xmm3, var_240);
//    xmm3 = intrinsic_mulsd(xmm3, xmm1);
//    xmm3 = intrinsic_subsd(xmm3, var_208);
//    xmm1 = intrinsic_movsd(xmm1, var_220);
//    xmm3 = intrinsic_addsd(xmm3, xmm1);
//    xmm2 = intrinsic_movsd(xmm2, var_228);
//    xmm2 = intrinsic_addsd(xmm2, xmm3);
//    xmm0 = intrinsic_subsd(xmm0, xmm2);
//    xmm0 = intrinsic_mulsd(xmm0, *0xc4f4a0);
//    xmm0 = intrinsic_addsd(xmm0, xmm1);
//    goto loc_a1605d;
//    
//loc_a1605d:
//    r14->_lastRowBeginMargin = intrinsic_movsd(r14->_lastRowBeginMargin, xmm0);
//    rdi = rbx;
//    rbx = r14;
//    goto loc_a16166;
//    
//loc_a16166:
//    [rdi release];
//    xmm2 = intrinsic_movsd(xmm2, var_218);
//    goto loc_a16235;
//    
//loc_a16002:
//    xmm0 = intrinsic_movsd(xmm0, var_208);
//    rbx->_lastRowActualGap = intrinsic_movsd(rbx->_lastRowActualGap, xmm0);
//    r14 = rbx;
//    rbx = objc_loadWeakRetained(var_290);
//    [rbx dimension];
//    xmm0 = intrinsic_subsd(xmm0, var_228);
//    xmm1 = intrinsic_cvtsi2sd(xmm1, r15);
//    xmm2 = intrinsic_movsd(xmm2, var_240);
//    xmm2 = intrinsic_mulsd(xmm2, xmm1);
//    xmm2 = intrinsic_subsd(xmm2, var_208);
//    xmm0 = intrinsic_subsd(xmm0, xmm2);
//    goto loc_a1605d;
//    
//loc_a16075:
//    r14 = var_290;
//    if (r15 > 0x1) goto loc_a161a6;
//    
//loc_a16086:
//    xmm0 = intrinsic_movsd(xmm0, var_208);
//    rbx->_lastRowActualGap = intrinsic_movsd(rbx->_lastRowActualGap, xmm0);
//    r15 = objc_loadWeakRetained(r14);
//    [r15 dimension];
//    xmm0 = intrinsic_subsd(xmm0, var_210);
//    xmm1 = intrinsic_movsd(xmm1, var_220);
//    xmm0 = intrinsic_subsd(xmm0, xmm1);
//    xmm0 = intrinsic_subsd(xmm0, var_228);
//    xmm0 = intrinsic_mulsd(xmm0, *0xc4f4a0);
//    xmm0 = intrinsic_addsd(xmm0, xmm1);
//    rbx->_lastRowBeginMargin = intrinsic_movsd(rbx->_lastRowBeginMargin, xmm0);
//    [r15 release];
//    r15 = objc_loadWeakRetained(r14);
//    [r15 dimension];
//    xmm0 = intrinsic_subsd(xmm0, var_210);
//    xmm0 = intrinsic_subsd(xmm0, var_220);
//    xmm1 = intrinsic_movsd(xmm1, var_228);
//    rbx->_endMargin = intrinsic_movsd(rbx->_endMargin, intrinsic_addsd(intrinsic_mulsd(intrinsic_subsd(xmm0, xmm1), *0xc4f4a0), xmm1));
//    rdi = r15;
//    rbx = rbx;
//    goto loc_a16166;
//    
//loc_a161a6:
//    rax = objc_loadWeakRetained(r14);
//    r14 = rbx;
//    rbx = rax;
//    [rbx dimension];
//    xmm1 = intrinsic_cvtsi2sd(xmm1, r15);
//    xmm2 = intrinsic_movsd(xmm2, var_240);
//    xmm2 = intrinsic_mulsd(xmm2, xmm1);
//    xmm2 = intrinsic_subsd(xmm2, var_208);
//    xmm0 = intrinsic_subsd(xmm0, xmm2);
//    xmm0 = intrinsic_subsd(xmm0, var_220);
//    xmm0 = intrinsic_subsd(xmm0, var_228);
//    xmm1 = intrinsic_cvtsi2sd(0x0, r15 - 0x1);
//    xmm0 = intrinsic_divsd(xmm0, xmm1);
//    r14->_lastRowActualGap = intrinsic_movsd(r14->_lastRowActualGap, xmm0);
//    rdi = rbx;
//    rbx = r14;
//    [rdi release];
//    goto loc_a16219;
//    
//loc_a16179:
//    xmm0 = intrinsic_movsd(xmm0, var_208);
//    rbx->_lastRowActualGap = intrinsic_movsd(rbx->_lastRowActualGap, xmm0);
//    rbx->_lastRowBeginMargin = intrinsic_movsd(rbx->_lastRowBeginMargin, intrinsic_movsd(xmm0, var_220));
//    goto loc_a16235;
//    
//loc_a15c69:
//    xmm0 = intrinsic_movsd(xmm0, var_208);
//    rbx->_actualGap = intrinsic_movsd(rbx->_actualGap, xmm0);
//    r14 = objc_loadWeakRetained(var_290);
//    [r14 dimension];
//    xmm1 = intrinsic_cvtsi2sd(xmm1, rbx->_itemsByRowCount);
//    xmm1 = intrinsic_mulsd(xmm1, var_240);
//    xmm1 = intrinsic_subsd(xmm1, var_208);
//    xmm2 = intrinsic_movsd(xmm2, var_220);
//    xmm1 = intrinsic_addsd(xmm1, xmm2);
//    xmm1 = intrinsic_addsd(xmm1, var_228);
//    xmm0 = intrinsic_subsd(xmm0, xmm1);
//    xmm0 = intrinsic_mulsd(xmm0, *0xc4f4a0);
//    xmm0 = intrinsic_addsd(xmm0, xmm2);
//    rbx->_beginMargin = intrinsic_movsd(rbx->_beginMargin, xmm0);
//    [r14 release];
//    rbx->_endMargin = rbx->_beginMargin;
//    goto loc_a15f2a;
//    
//loc_a15d00:
//    xmm0 = intrinsic_movsd(xmm0, var_208);
//    rbx->_actualGap = intrinsic_movsd(rbx->_actualGap, xmm0);
//    r14 = objc_loadWeakRetained(var_290);
//    [r14 dimension];
//    xmm0 = intrinsic_subsd(xmm0, var_228);
//    xmm1 = intrinsic_cvtsi2sd(xmm1, rbx->_itemsByRowCount);
//    xmm1 = intrinsic_mulsd(xmm1, var_240);
//    xmm1 = intrinsic_subsd(xmm1, var_208);
//    xmm0 = intrinsic_subsd(xmm0, xmm1);
//    rbx->_beginMargin = intrinsic_movsd(rbx->_beginMargin, xmm0);
//    [r14 release];
//    goto loc_a15f16;
//    
//loc_a15f16:
//    xmm0 = intrinsic_movsd(xmm0, var_228);
//    rbx->_endMargin = intrinsic_movsd(rbx->_endMargin, xmm0);
//    goto loc_a15f2a;
//    
//loc_a15d6f:
//    if (rbx->_itemsByRowCount > 0x1) goto loc_a15e9a;
//    
//loc_a15d7a:
//    xmm0 = intrinsic_movsd(xmm0, var_208);
//    rbx->_actualGap = intrinsic_movsd(rbx->_actualGap, xmm0);
//    var_288 = rbx;
//    rbx = objc_loadWeakRetained(var_290);
//    [rbx dimension];
//    xmm0 = intrinsic_subsd(xmm0, var_210);
//    xmm1 = intrinsic_movsd(xmm1, var_220);
//    xmm0 = intrinsic_subsd(xmm0, xmm1);
//    xmm0 = intrinsic_subsd(xmm0, var_228);
//    xmm0 = intrinsic_mulsd(xmm0, *0xc4f4a0);
//    xmm0 = intrinsic_addsd(xmm0, xmm1);
//    var_288->_beginMargin = intrinsic_movsd(var_288->_beginMargin, xmm0);
//    [rbx release];
//    rbx = objc_loadWeakRetained(var_290);
//    [rbx dimension];
//    xmm0 = intrinsic_subsd(xmm0, var_210);
//    xmm0 = intrinsic_subsd(xmm0, var_220);
//    xmm1 = intrinsic_movsd(xmm1, var_228);
//    xmm0 = intrinsic_subsd(xmm0, xmm1);
//    xmm0 = intrinsic_mulsd(xmm0, *0xc4f4a0);
//    xmm0 = intrinsic_addsd(xmm0, xmm1);
//    var_288->_endMargin = intrinsic_movsd(var_288->_endMargin, xmm0);
//    rdi = rbx;
//    rbx = var_288;
//    [rdi release];
//    goto loc_a15f2a;
//    
//loc_a15e9a:
//    r14 = objc_loadWeakRetained(var_290);
//    [r14 dimension];
//    xmm0 = intrinsic_subsd(xmm0, var_220);
//    xmm0 = intrinsic_subsd(xmm0, var_228);
//    xmm0 = intrinsic_subsd(xmm0, intrinsic_mulsd(intrinsic_cvtsi2sd(xmm1, rbx->_itemsByRowCount), var_210));
//    xmm1 = intrinsic_cvtsi2sd(0x0, rbx->_itemsByRowCount - 0x1);
//    xmm0 = intrinsic_divsd(xmm0, xmm1);
//    rbx->_actualGap = intrinsic_movsd(rbx->_actualGap, xmm0);
//    [r14 release];
//    xmm0 = intrinsic_movsd(xmm0, var_220);
//    rbx->_beginMargin = intrinsic_movsd(rbx->_beginMargin, xmm0);
//    goto loc_a15f16;
//    
//loc_a15e6d:
//    xmm0 = intrinsic_movsd(xmm0, var_208);
//    rbx->_actualGap = intrinsic_movsd(rbx->_actualGap, xmm0);
//    xmm0 = intrinsic_movsd(xmm0, var_220);
//    rbx->_beginMargin = intrinsic_movsd(rbx->_beginMargin, xmm0);
//    goto loc_a15f40;
//    
//loc_a1593f:
//    var_200 = r13;
//    xmm0 = intrinsic_xorpd(xmm0, xmm0);
//    var_2A8 = intrinsic_movsd(var_2A8, xmm0);
//    xmm0 = intrinsic_xorpd(xmm0, xmm0);
//    xmm2 = intrinsic_movsd(xmm2, var_218);
//    r13 = @selector(dimension);
//    rdi = var_290;
//    goto loc_a165bb;

}

- (void)computeLayoutInRect:(CGRect)arg1 forSection:(NSInteger)arg2 invalidating:(bool)arg3 invalidationContext:(id)arg4 {
//    var_5C0 = arg4;
//    var_4B0 = arg3;
//    var_508 = arg2;
//    var_5D8 = _cmd;
//    r12 = self;
//    xmm0 = intrinsic_xorpd(xmm0, xmm0, arg2, arg3, arg4, arg5);
//    intrinsic_movapd(var_1C0, xmm0);
//    intrinsic_movapd(var_1D0, xmm0);
//    var_1E0 = intrinsic_movapd(var_1E0, xmm0);
//    var_1F0 = intrinsic_movapd(var_1F0, xmm0);
//    rax = [r12->_invalidatedIndexPaths retain];
//    var_498 = rax;
//    rcx = var_B0;
//    r8 = 0x10;
//    rax = [rax countByEnumeratingWithState:var_1F0 objects:rcx count:r8];
//    var_460 = rax;
//    if (rax != 0x0) {
//        var_490 = *var_1E0;
//        do {
//            r13 = 0x0;
//            do {
//                if (*var_1E0 != var_490) {
//                    objc_enumerationMutation(var_498);
//                }
//                var_468 = *_OBJC_IVAR_$__UIFlowLayoutSection._items;
//                var_458 = *(var_1E8 + r13 * 0x8);
//                r14 = [[*(r12 + var_468) objectAtIndexedSubscript:[*(var_1E8 + r13 * 0x8) item]] retain];
//                rbx = [[r14 rowObject] retain];
//                [r12 sizeChangedForItem:r14 atIndexPath:var_458 inRow:rbx];
//                rdi = rbx;
//                [rdi release];
//                [r14 release];
//                r13 = r13 + 0x1;
//            } while (r13 < var_460);
//            r8 = 0x10;
//            rdx = var_1F0;
//            rcx = var_B0;
//            rax = [var_498 countByEnumeratingWithState:rdx objects:rcx count:r8];
//            var_460 = rax;
//        } while (rax != 0x0);
//    }
//    r13 = arg_0;
//    [var_498 release];
//    r15 = r12;
//    rdi = r15->_invalidatedIndexPaths;
//    [rdi removeAllObjects];
//    rbx = r15 + *_OBJC_IVAR_$__UIFlowLayoutSection._rectToKeepValid;
//    r12 = var_508;
//    if (((CGRectIsEmpty(rdi) == 0x0) && (CGRectIntersectsRect(rdi, @selector(removeAllObjects)) != 0x0)) && (CGRectContainsRect(rdi, @selector(removeAllObjects)) == 0x0)) {
//        var_210 = *rbx;
//        *(rbx + 0x18) = *_CGSizeCreateDictionaryRepresentation;
//        *(rbx + 0x10) = *_CGShadingRelease;
//        *(rbx + 0x8) = *_CGShadingCreateAxial;
//        *rbx = *_CGRectZero;
//        rcx = var_4B0 & 0xff;
//        r8 = var_5C0;
//        [r15 computeLayoutInRect:r12 forSection:rcx invalidating:r8 invalidationContext:r9];
//    }
//    var_600 = rbx;
//    rdi = *_OBJC_IVAR_$__UIFlowLayoutSection._layoutInfo + r15;
//    var_5C8 = rdi;
//    r12 = objc_loadWeakRetained(rdi);
//    rbx = [r12 horizontal];
//    var_460 = rbx;
//    rdi = r12;
//    [rdi release];
//    r12 = r13;
//    if (rbx == 0x0) goto loc_a18446;
//    
//loc_a181b4:
//    CGRectGetMaxX(rdi);
//    var_458 = intrinsic_movsd(var_458, xmm0);
//    CGRectGetMaxX(rdi);
//    xmm1 = intrinsic_movsd(xmm1, var_458);
//    xmm1 = intrinsic_ucomisd(xmm1, xmm0);
//    if (xmm1 <= 0x0) goto loc_a18737;
//    
//loc_a1822b:
//    rbx = r15 + *_OBJC_IVAR_$__UIFlowLayoutSection._validRect;
//    var_5B8 = *_OBJC_IVAR_$__UIFlowLayoutSection._validRect;
//    CGRectGetMinX(rdi);
//    var_458 = intrinsic_movsd(var_458, xmm0);
//    CGRectGetMinX(rdi);
//    xmm0 = intrinsic_ucomisd(xmm0, var_458);
//    if (xmm0 <= 0x0) goto loc_a1873e;
//    
//loc_a1829e:
//    CGRectGetMinX(rdi);
//    var_458 = intrinsic_movsd(var_458, xmm0);
//    CGRectGetMinX(rdi);
//    xmm1 = intrinsic_movsd(xmm1, var_458);
//    xmm1 = intrinsic_subsd(xmm1, xmm0);
//    xmm0 = intrinsic_movapd(xmm0, xmm1, 0x0, *(r12 + 0x8));
//    CGRectDivide(var_230, var_210, 0x0, *(r12 + 0x8), r8);
//    var_458 = var_4B0 & 0xff;
//    r13 = r15;
//    r15 = var_508;
//    r8 = var_5C0;
//    [r13 computeLayoutInRect:r15 forSection:rcx invalidating:r8 invalidationContext:r9];
//    CGRectGetMaxX(r13);
//    var_460 = intrinsic_movsd(var_460, xmm0);
//    CGRectGetMaxX(r13);
//    xmm1 = intrinsic_movsd(xmm1, var_460);
//    xmm1 = intrinsic_subsd(xmm1, xmm0);
//    rcx = *(r12 + 0x8);
//    rsi = var_250;
//    rdx = 0x2;
//    goto loc_a186d6;
//    
//loc_a186d6:
//    intrinsic_movapd(xmm0, xmm1);
//    CGRectDivide(var_210, rsi, rdx, rcx, r8);
//    [r13 computeLayoutInRect:r15 forSection:var_458 invalidating:var_5C0 invalidationContext:r9];
//    goto loc_a1ab36;
//    
//loc_a1ab36:
//    if (*___stack_chk_guard != *___stack_chk_guard) {
//        __stack_chk_fail();
//    }
//    return;
//    
//loc_a1873e:
//    r13 = *_CGSizeCreateDictionaryRepresentation;
//    var_218 = r13;
//    rbx = *_CGShadingRelease;
//    var_220 = rbx;
//    rcx = r12;
//    r12 = *_CGShadingCreateAxial;
//    var_228 = r12;
//    var_230 = *_CGRectZero;
//    if (CGRectIsEmpty(rdi) == 0x0) goto loc_a18823;
//    
//loc_a187ba:
//    var_218 = r13;
//    var_518 = r13;
//    var_220 = rbx;
//    var_540 = rbx;
//    var_228 = r12;
//    var_550 = r12;
//    var_230 = *_CGRectZero;
//    var_548 = *_CGRectZero;
//    r13 = r15;
//    r12 = var_5B8;
//    var_238 = *(r13 + r12 + 0x18);
//    var_240 = *(r13 + r12 + 0x10);
//    rax = *(r13 + r12);
//    rcx = *(r13 + r12 + 0x8);
//    goto loc_a189dd;
//    
//loc_a189dd:
//    var_248 = rcx;
//    var_250 = rax;
//    goto loc_a189eb;
//    
//loc_a189eb:
//    var_480 = 0x1;
//    goto loc_a189f3;
//    
//loc_a189f3:
//    var_488 = [[NSMutableArray alloc] init];
//    rbx = objc_loadWeakRetained(var_5C8);
//    [rbx dimension];
//    var_490 = intrinsic_movsd(var_490, xmm0);
//    [rbx release];
//    xmm0 = intrinsic_movsd(xmm0, r13->_horizontalInterstice);
//    var_4D0 = intrinsic_movsd(var_4D0, xmm0);
//    if (var_460 != 0x0) {
//        xmm0 = intrinsic_movsd(xmm0, r13->_sectionMargins);
//        xmm0 = intrinsic_addsd(xmm0, *(r13 + *_OBJC_IVAR_$__UIFlowLayoutSection._sectionMargins + 0x10));
//    }
//    else {
//        xmm0 = intrinsic_movsd(xmm0, *(r13 + *_OBJC_IVAR_$__UIFlowLayoutSection._sectionMargins + 0x8));
//        xmm0 = intrinsic_addsd(xmm0, *(r13 + *_OBJC_IVAR_$__UIFlowLayoutSection._sectionMargins + 0x18));
//    }
//    var_4E8 = intrinsic_movsd(var_4E8, xmm0);
//    var_5B8 = r12;
//    xmm0 = intrinsic_xorpd(xmm0, xmm0);
//    intrinsic_movapd(var_2A0, xmm0);
//    intrinsic_movapd(var_2B0, xmm0);
//    var_2C0 = intrinsic_movapd(var_2C0, xmm0);
//    var_2D0 = intrinsic_movapd(var_2D0, xmm0);
//    var_4A0 = r13;
//    rax = [r13->_rows retain];
//    var_4C8 = rax;
//    rax = [rax countByEnumeratingWithState:var_2D0 objects:var_130 count:0x10];
//    var_4C0 = rax;
//    if (rax == 0x0) goto loc_a18eb3;
//    
//loc_a18b17:
//    r12 = *var_2C0;
//    var_4E0 = r12;
//    var_470 = 0x1;
//    xmm0 = intrinsic_xorpd(xmm0, xmm0);
//    var_458 = intrinsic_movsd(var_458, xmm0);
//    r15 = 0x1;
//    goto loc_a18b6a;
//    
//loc_a18b6a:
//    rbx = 0x0;
//    goto loc_a18b88;
//    
//loc_a18b88:
//    if (*var_2C0 != r12) {
//        objc_enumerationMutation(var_4C8);
//    }
//    rax = [*(var_2C8 + rbx * 0x8) items];
//    rax = [rax retain];
//    var_478 = rax;
//    if ([rax count] > 0x1) {
//        r15 = 0x0;
//    }
//    if ((var_470 & 0x1) != 0x0) goto loc_a18bf5;
//    
//loc_a18be3:
//    var_498 = rbx;
//    rax = var_470;
//    goto loc_a18e45;
//    
//loc_a18e45:
//    var_470 = rax;
//    rbx = rax | r15;
//    [var_478 release];
//    if ((rbx & 0x1) == 0x0) goto loc_a18ec9;
//    
//loc_a18e62:
//    rbx = var_498 + 0x1;
//    if (rbx < var_4C0) goto loc_a18b88;
//    
//loc_a18e79:
//    rdx = var_2D0;
//    rax = [var_4C8 countByEnumeratingWithState:rdx objects:var_130 count:0x10];
//    var_4C0 = rax;
//    if (rax != 0x0) goto loc_a18b6a;
//    
//loc_a18ec9:
//    [var_4C8 release];
//    if (CGRectIsEmpty(var_4C8) == 0x0) goto loc_a18f16;
//    
//loc_a18f0e:
//    r15 = 0x0;
//    goto loc_a1a38c;
//    
//loc_a1a38c:
//    r14 = var_4A0;
//    *(r14 + var_5B8 + 0x18) = var_238;
//    *(r14 + var_5B8 + 0x10) = var_240;
//    *(r14 + var_5B8 + 0x8) = var_248;
//    *(r14 + var_5B8) = var_250;
//    *(var_600 + 0x18) = var_238;
//    *(var_600 + 0x10) = var_240;
//    *(var_600 + 0x8) = var_248;
//    *var_600 = var_250;
//    [r14 updateEstimatedSizeForSection:var_508];
//    if (var_460 != 0x0) {
//        rdi = *_UIApp;
//        rbx = [rdi userInterfaceLayoutDirection];
//        CGRectGetWidth(rdi);
//        if (rbx == 0x1) {
//            var_510 = r15;
//            xmm0 = intrinsic_subsd(xmm0, r14->_headerDimension);
//            var_468 = intrinsic_movsd(var_468, xmm0);
//            xmm0 = intrinsic_xorpd(xmm0, xmm0);
//            var_460 = intrinsic_movsd(var_460, xmm0);
//        }
//        else {
//            var_510 = r15;
//            xmm0 = intrinsic_subsd(xmm0, r14->_footerDimension);
//            var_460 = intrinsic_movsd(var_460, xmm0);
//            xmm0 = intrinsic_xorpd(xmm0, xmm0);
//            var_468 = intrinsic_movsd(var_468, xmm0);
//        }
//        rcx = *_OBJC_IVAR_$__UIFlowLayoutSection._footerDimension;
//        var_458 = rcx;
//        rbx = objc_loadWeakRetained(var_5C8);
//        [rbx dimension];
//        xmm1 = intrinsic_movsd(xmm1, var_468);
//        r14->_headerFrame = intrinsic_movsd(r14->_headerFrame, xmm1);
//        *(r14 + *_OBJC_IVAR_$__UIFlowLayoutSection._headerFrame + 0x8) = 0x0;
//        *(r14 + *_OBJC_IVAR_$__UIFlowLayoutSection._headerFrame + 0x10) = r14->_headerDimension;
//        *(r14 + *_OBJC_IVAR_$__UIFlowLayoutSection._headerFrame + 0x18) = intrinsic_movsd(*(r14 + *_OBJC_IVAR_$__UIFlowLayoutSection._headerFrame + 0x18), xmm0);
//        [rbx release];
//        rbx = objc_loadWeakRetained(var_5C8);
//        [rbx dimension];
//        xmm1 = intrinsic_movsd(xmm1, var_460);
//        r14->_footerFrame = intrinsic_movsd(r14->_footerFrame, xmm1);
//        *(r14 + *_OBJC_IVAR_$__UIFlowLayoutSection._footerFrame + 0x8) = 0x0;
//        *(r14 + *_OBJC_IVAR_$__UIFlowLayoutSection._footerFrame + 0x10) = *(r14 + var_458);
//        *(r14 + *_OBJC_IVAR_$__UIFlowLayoutSection._footerFrame + 0x18) = intrinsic_movsd(*(r14 + *_OBJC_IVAR_$__UIFlowLayoutSection._footerFrame + 0x18), xmm0);
//    }
//    else {
//        var_510 = r15;
//        rbx = objc_loadWeakRetained(var_5C8);
//        [rbx dimension];
//        xmm1 = intrinsic_xorpd(xmm1, xmm1);
//        r14->_headerFrame = intrinsic_movupd(r14->_headerFrame, xmm1);
//        *(r14 + *_OBJC_IVAR_$__UIFlowLayoutSection._headerFrame + 0x10) = intrinsic_movsd(*(r14 + *_OBJC_IVAR_$__UIFlowLayoutSection._headerFrame + 0x10), xmm0);
//        *(r14 + *_OBJC_IVAR_$__UIFlowLayoutSection._headerFrame + 0x18) = r14->_headerDimension;
//        [rbx release];
//        CGRectGetHeight(rbx);
//        var_458 = *_OBJC_IVAR_$__UIFlowLayoutSection._footerDimension;
//        xmm0 = intrinsic_subsd(xmm0, r14->_footerDimension);
//        var_460 = intrinsic_movsd(var_460, xmm0);
//        rbx = objc_loadWeakRetained(var_5C8);
//        [rbx dimension];
//        rcx = *_OBJC_IVAR_$__UIFlowLayoutSection._footerFrame;
//        *(r14 + rcx) = 0x0;
//        xmm1 = intrinsic_movsd(xmm1, var_460);
//        *(r14 + rcx + 0x8) = intrinsic_movsd(*(r14 + rcx + 0x8), xmm1);
//        *(r14 + rcx + 0x10) = intrinsic_movsd(*(r14 + rcx + 0x10), xmm0);
//        *(r14 + rcx + 0x18) = r14->_footerDimension;
//    }
//    [rbx release];
//    r12 = var_488;
//    r15 = var_508;
//    if ([r12 count] != 0x0) {
//        [var_5C0 setInvalidateFlowLayoutAttributes:0x0];
//        [var_5C0 setInvalidateFlowLayoutDelegateMetrics:0x0];
//        if ((var_510 & 0x1) != 0x0) {
//            rdx = 0x0;
//            var_4C0 = [[NSMutableArray alloc] init];
//            var_4A8 = [[NSMutableArray alloc] init];
//            xmm0 = intrinsic_movsd(xmm0, *(r14 + var_458));
//            xmm1 = intrinsic_xorpd(xmm1, xmm1);
//            xmm0 = intrinsic_ucomisd(xmm0, xmm1);
//            r14 = _objc_msgSend;
//            if (xmm0 > 0x0) {
//                rcx = r15;
//                rbx = [(r14)(@class(NSIndexPath), @selector(indexPathForItem:inSection:), 0x0, rcx) retain];
//                rdx = rbx;
//                (r14)(var_4A8, @selector(addObject:), rdx);
//                [rbx release];
//            }
//            r12 = objc_loadWeakRetained(var_5C8);
//            rbx = [(r14)(r12, @selector(sections), rdx, rcx) retain];
//            var_470 = rbx;
//            [r12 release];
//            rax = (r14)(rbx, @selector(count), rdx, rcx);
//            var_478 = rax;
//            r15 = r15 + 0x1;
//            if (r15 < rax) {
//                r12 = r14;
//                do {
//                    rdx = r15;
//                    rdi = [var_470 objectAtIndexedSubscript:rdx];
//                    r14 = [rdi retain];
//                    if (r14 != 0x0) {
//                        rdi = var_430;
//                        rdx = @selector(headerFrame);
//                        objc_msgSend_stret(rdi, r14, rdx);
//                    }
//                    else {
//                        xmm0 = intrinsic_xorpd(xmm0, xmm0);
//                        var_420 = intrinsic_movapd(var_420, xmm0);
//                        var_430 = intrinsic_movapd(var_430, xmm0);
//                    }
//                    if (CGRectIsEmpty(rdi) == 0x0) {
//                        rbx = [(r12)(@class(NSIndexPath), @selector(indexPathForItem:inSection:), 0x0, r15) retain];
//                        rdx = rbx;
//                        (r12)(var_4C0, @selector(addObject:), rdx);
//                        rdi = rbx;
//                        [rdi release];
//                    }
//                    if (r14 != 0x0) {
//                        rdi = var_450;
//                        rdx = @selector(footerFrame);
//                        objc_msgSend_stret(rdi, r14, rdx);
//                    }
//                    else {
//                        xmm0 = intrinsic_xorpd(xmm0, xmm0);
//                        var_440 = intrinsic_movapd(var_440, xmm0);
//                        var_450 = intrinsic_movapd(var_450, xmm0);
//                    }
//                    if (CGRectIsEmpty(rdi) == 0x0) {
//                        rbx = [(r12)(@class(NSIndexPath), @selector(indexPathForItem:inSection:), 0x0, r15) retain];
//                        rdx = rbx;
//                        (r12)(var_4A8, @selector(addObject:), rdx);
//                        [rbx release];
//                    }
//                    var_468 = r14;
//                    r14 = [r14 validItemRange];
//                    r13 = rdx;
//                    rbx = r15;
//                    if (r14 < r13 + r14) {
//                        do {
//                            r15 = [(r12)(@class(NSIndexPath), @selector(indexPathForItem:inSection:), r14, rbx) retain];
//                            (r12)(var_488, @selector(addObject:), r15, rbx);
//                            [r15 release];
//                            r14 = r14 + 0x1;
//                            r13 = r13 - 0x1;
//                        } while (r13 != 0x0);
//                    }
//                    [var_468 release];
//                    r15 = rbx + 0x1;
//                } while (rbx + 0x1 != var_478);
//            }
//            r14 = var_4C0;
//            if ([r14 count] != 0x0) {
//                [var_5C0 invalidateSupplementaryElementsOfKind:@"UICollectionElementKindSectionHeader" atIndexPaths:r14];
//            }
//            rbx = var_4A8;
//            r12 = var_488;
//            if ([rbx count] != 0x0) {
//                [var_5C0 invalidateSupplementaryElementsOfKind:@"UICollectionElementKindSectionFooter" atIndexPaths:rbx];
//            }
//            [var_470 release];
//            [rbx release];
//            [r14 release];
//        }
//        [var_5C0 invalidateItemsAtIndexPaths:r12];
//    }
//    [r12 release];
//    goto loc_a1ab36;
//    
//loc_a18f16:
//    var_50C = r15;
//    xmm0 = intrinsic_movsd(xmm0, var_490);
//    xmm0 = intrinsic_subsd(xmm0, var_4E8);
//    var_490 = intrinsic_movsd(var_490, xmm0);
//    r13 = *_OBJC_IVAR_$__UIFlowLayoutSection._validItemRange;
//    var_588 = r13;
//    var_530 = *_OBJC_IVAR_$__UIFlowLayoutSection._verticalInterstice;
//    r15 = 0x0;
//    goto loc_a1905e;
//    
//loc_a1905e:
//    rax = var_4A0;
//    r12 = *(rax + r13);
//    if (var_480 == 0x0) goto loc_a19095;
//    
//loc_a19073:
//    rdx = rax;
//    rax = *(rdx + r13 + 0x8);
//    rcx = arg_0;
//    if (rax + r12 < rdx->_itemsCount) goto loc_a190a7;
//    goto loc_a1a38c;
//    
//loc_a190a7:
//    if (rax != 0x0) {
//        if (var_480 != 0x0) {
//            var_510 = r15;
//            r12 = r12 + rax;
//            rdi = var_4A0;
//        }
//        else {
//            var_510 = r15;
//            r12 = r12 - 0x1;
//            rdi = var_4A0;
//        }
//    }
//    else {
//        var_510 = r15;
//        xmm0 = intrinsic_movsd(xmm0, *rcx);
//        xmm1 = intrinsic_movsd(xmm1, *(rcx + 0x8));
//        r12 = [var_4A0 estimatedIndexOfItemAtPoint:rdx];
//        rdi = var_4A0;
//    }
//    var_4B0 = var_480 & 0xff;
//    r15 = [[rdi addRowAtEnd:rdx] retain];
//    xmm0 = intrinsic_movsd(xmm0, var_490);
//    var_468 = intrinsic_movsd(var_468, xmm0);
//    rbx = var_470;
//    goto loc_a191eb;
//    
//loc_a191eb:
//    rdi = [var_4A0->_items objectAtIndexedSubscript:r12];
//    r14 = [rdi retain];
//    if (r14 != 0x0) {
//        rdi = var_370;
//        [rdi itemFrame];
//    }
//    else {
//        xmm0 = intrinsic_xorpd(xmm0, xmm0);
//        var_360 = intrinsic_movapd(var_360, xmm0);
//        var_370 = intrinsic_movapd(var_370, xmm0);
//    }
//    if (var_460 != 0x0) {
//        CGRectGetHeight(rdi);
//    }
//    else {
//        CGRectGetWidth(rdi);
//    }
//    xmm3 = intrinsic_movapd(xmm3, xmm0);
//    xmm3 = intrinsic_ucomisd(xmm3, var_490);
//    if (xmm3 > 0x0) {
//        var_470 = intrinsic_movsd(var_470, xmm3);
//        [var_4A0 logInvalidSizes];
//        xmm3 = intrinsic_movsd(xmm3, var_470);
//    }
//    xmm2 = intrinsic_movsd(xmm2, var_458);
//    xmm0 = intrinsic_movapd(xmm0, xmm2);
//    asm { cmpeqsd    xmm0, qword [_createPatternColorFromImage.alpha+96] };
//    xmm1 = intrinsic_movapd(xmm1, xmm0);
//    xmm1 = intrinsic_andpd(xmm1, xmm3);
//    xmm0 = intrinsic_andnpd(xmm0, xmm2);
//    xmm0 = intrinsic_orpd(xmm0, xmm1);
//    r13 = 0x0;
//    xmm3 = intrinsic_ucomisd(xmm3, xmm0);
//    if ((xmm3 == 0x0) && (!CPU_FLAGS & P)) {
//        r13 = rbx;
//    }
//    xmm1 = intrinsic_movsd(xmm1, var_468);
//    xmm1 = intrinsic_ucomisd(xmm1, xmm3);
//    if (xmm1 < 0x0) goto loc_a19495;
//    
//loc_a19333:
//    var_470 = intrinsic_movsd(var_470, xmm3);
//    var_478 = r13;
//    var_458 = intrinsic_movsd(var_458, xmm0);
//    if ([r14 isPositionEstimated] != 0x0) {
//        r13 = r14;
//        rbx = [[NSIndexPath indexPathForItem:r12 inSection:var_508] retain];
//        [var_488 addObject:rbx];
//        [rbx release];
//        [r13 setPositionEstimated:0x0];
//        r14 = r13;
//    }
//    rbx = var_4A0;
//    rcx = *_OBJC_IVAR_$__UIFlowLayoutSection._validItemRange;
//    *(rbx + rcx + 0x8) = *(rbx + rcx + 0x8) + 0x1;
//    if (var_480 == 0x0) goto loc_a1943d;
//    
//loc_a193dd:
//    [r15 addItem:r14 atEnd:var_4B0];
//    xmm1 = intrinsic_movsd(xmm1, var_470);
//    xmm1 = intrinsic_addsd(xmm1, var_4D0);
//    xmm0 = intrinsic_movsd(xmm0, var_468);
//    xmm0 = intrinsic_subsd(xmm0, xmm1);
//    var_468 = intrinsic_movsd(var_468, xmm0);
//    r12 = r12 + 0x1;
//    if (r12 >= rbx->_itemsCount) goto loc_a19539;
//    
//loc_a19432:
//    rbx = var_478;
//    goto loc_a191e2;
//    
//loc_a191e2:
//    [r14 release];
//    goto loc_a191eb;
//    
//loc_a19539:
//    r13 = var_478;
//    r12 = r13 & 0x1;
//    xmm0 = intrinsic_movsd(xmm0, var_458);
//    xmm0 = intrinsic_ucomisd(xmm0, var_468);
//    rbx = (xmm0 > 0x0 ? 0x1 : 0x0) & r12;
//    if ((var_50C & 0x1) == 0x0) {
//        if (rbx != 0x0) {
//            [r15 setComplete:0x1];
//        }
//    }
//    else {
//        rdi = r15;
//        var_468 = r15;
//        r15 = r13;
//        rax = [rdi items];
//        rax = [rax retain];
//        var_470 = rax;
//        r13 = r15;
//        r15 = var_468;
//        var_498 = [rax count] == 0x1 ? 0x1 : 0x0;
//        [var_470 release];
//        rbx = rbx | var_498;
//        if (rbx != 0x0) {
//            [r15 setComplete:0x1];
//        }
//    }
//    rdx = r12 & 0xff;
//    rdi = r15;
//    rsi = @selector(setFixedItemSize:);
//    goto loc_a19644;
//    
//loc_a19644:
//    _objc_msgSend(rdi, rsi, rdx);
//    [r15 layoutRow];
//    r12 = var_518;
//    goto loc_a196f1;
//    
//loc_a196f1:
//    var_518 = r12;
//    [r14 release];
//    var_368 = var_550;
//    var_370 = var_548;
//    [r15 rowSize];
//    var_360 = intrinsic_movsd(var_540, xmm0);
//    var_358 = intrinsic_movsd(r12, xmm1);
//    rdi = var_4A0->_rows;
//    r12 = [rdi count];
//    if (var_480 != 0x0) {
//        var_478 = r13;
//        if (var_460 != 0x0) {
//            r13 = var_4A0;
//            rbx = r15;
//            if (r12 >= 0x2) {
//                var_468 = rbx;
//                r14 = r13;
//                rdx = r12 + 0xfffffffffffffffe;
//                rdi = [r13->_rows objectAtIndex:rdx];
//                r15 = [rdi retain];
//                if (r15 != 0x0) {
//                    rdi = var_390;
//                    [rdi rowFrame];
//                }
//                else {
//                    xmm0 = intrinsic_xorpd(xmm0, xmm0);
//                    var_380 = intrinsic_movapd(var_380, xmm0);
//                    var_390 = intrinsic_movapd(var_390, xmm0);
//                }
//                r12 = var_510;
//                r13 = var_588;
//                CGRectGetMaxX(rdi);
//                xmm0 = intrinsic_addsd(xmm0, *(r14 + var_530));
//                var_370 = intrinsic_movsd(var_370, xmm0);
//                rdi = r15;
//                [rdi release];
//                rbx = var_468;
//            }
//            else {
//                xmm0 = intrinsic_movsd(xmm0, r13->_headerDimension);
//                xmm0 = intrinsic_addsd(xmm0, *(r13 + *_OBJC_IVAR_$__UIFlowLayoutSection._sectionMargins + 0x8));
//                var_370 = intrinsic_movsd(var_370, xmm0);
//                r14 = r13;
//                r12 = var_510;
//                r13 = var_588;
//            }
//            var_4A0 = r14;
//            CGRectGetMaxX(rdi);
//            xmm0 = intrinsic_addsd(xmm0, r14->_horizontalInterstice);
//            var_468 = intrinsic_movsd(var_468, xmm0);
//            CGRectGetMinX(rdi);
//            xmm1 = intrinsic_movsd(xmm1, var_468);
//            xmm1 = intrinsic_subsd(xmm1, xmm0);
//            xmm1 = intrinsic_ucomisd(xmm1, *0xc4ff40);
//            if (xmm1 > 0x0) {
//                xmm0 = intrinsic_movsd(xmm0, var_230);
//                xmm0 = intrinsic_addsd(xmm0, xmm1);
//                var_230 = intrinsic_movsd(var_230, xmm0);
//                xmm0 = intrinsic_movsd(xmm0, var_220);
//                xmm0 = intrinsic_subsd(xmm0, xmm1);
//                var_220 = intrinsic_movsd(var_220, xmm0);
//            }
//            CGRectGetMaxX(rdi);
//            xmm0 = intrinsic_addsd(xmm0, var_4A0->_horizontalInterstice);
//            var_468 = intrinsic_movsd(var_468, xmm0);
//            rax = CGRectGetMaxX(rdi);
//            xmm1 = intrinsic_movsd(xmm1, var_468);
//            xmm1 = intrinsic_subsd(xmm1, xmm0);
//            xmm0 = intrinsic_movapd(xmm0, xmm1);
//            xmm0 = intrinsic_ucomisd(xmm0, *0xc4ff40);
//            if (xmm0 > 0x0) {
//                xmm0 = intrinsic_addsd(xmm0, var_240);
//                var_240 = intrinsic_movsd(var_240, xmm0);
//            }
//        }
//        else {
//            var_468 = r15;
//            r13 = var_4A0;
//            if (r12 >= 0x2) {
//                r14 = r13;
//                rdx = r12 + 0xfffffffffffffffe;
//                rdi = [r13->_rows objectAtIndex:rdx];
//                r15 = [rdi retain];
//                if (r15 != 0x0) {
//                    rdi = var_3B0;
//                    [rdi rowFrame];
//                }
//                else {
//                    xmm0 = intrinsic_xorpd(xmm0, xmm0);
//                    var_3A0 = intrinsic_movapd(var_3A0, xmm0);
//                    var_3B0 = intrinsic_movapd(var_3B0, xmm0);
//                }
//                r12 = var_510;
//                r13 = var_588;
//                CGRectGetMaxY(rdi);
//                rbx = var_530;
//                xmm0 = intrinsic_addsd(xmm0, *(r14 + rbx));
//                var_368 = intrinsic_movsd(var_368, xmm0);
//                rdi = r15;
//                [rdi release];
//            }
//            else {
//                xmm0 = intrinsic_movsd(xmm0, r13->_headerDimension);
//                xmm0 = intrinsic_addsd(xmm0, r13->_sectionMargins);
//                var_368 = intrinsic_movsd(var_368, xmm0);
//                r14 = r13;
//                r12 = var_510;
//                r13 = var_588;
//                rbx = var_530;
//            }
//            var_530 = rbx;
//            var_4A0 = r14;
//            CGRectGetMaxY(rdi);
//            xmm0 = intrinsic_addsd(xmm0, *(r14 + rbx));
//            var_470 = intrinsic_movsd(var_470, xmm0);
//            CGRectGetMinY(rdi);
//            xmm1 = intrinsic_movsd(xmm1, var_470);
//            xmm1 = intrinsic_subsd(xmm1, xmm0);
//            xmm1 = intrinsic_ucomisd(xmm1, *0xc4ff40);
//            if (xmm1 > 0x0) {
//                xmm0 = intrinsic_movsd(xmm0, var_228);
//                xmm0 = intrinsic_addsd(xmm0, xmm1);
//                var_228 = intrinsic_movsd(var_228, xmm0);
//                xmm0 = intrinsic_movsd(xmm0, var_218);
//                xmm0 = intrinsic_subsd(xmm0, xmm1);
//                var_218 = intrinsic_movsd(var_218, xmm0);
//            }
//            CGRectGetMaxY(rdi);
//            xmm0 = intrinsic_addsd(xmm0, *(var_4A0 + var_530));
//            var_470 = intrinsic_movsd(var_470, xmm0);
//            rax = CGRectGetMaxY(rdi);
//            xmm1 = intrinsic_movsd(xmm1, var_470);
//            xmm1 = intrinsic_subsd(xmm1, xmm0);
//            xmm0 = intrinsic_movapd(xmm0, xmm1);
//            xmm0 = intrinsic_ucomisd(xmm0, *0xc4ff40);
//            rbx = var_468;
//            if (xmm0 > 0x0) {
//                xmm0 = intrinsic_addsd(xmm0, var_238);
//                var_238 = intrinsic_movsd(var_238, xmm0);
//            }
//        }
//    }
//    else {
//        var_468 = r15;
//        if (r12 <= 0x1) {
//            r15 = _objc_msgSend;
//            rbx = [[NSString stringWithUTF8String:"/BuildRoot/Library/Caches/com.apple.xbs/Sources/UIKit_Sim/UIKit-3600.6.21/UIFlowLayoutSupport.m"] retain];
//            rdi = @"<Unknown File>";
//            if (rbx != 0x0) {
//                rdi = rbx;
//            }
//            r14 = [rdi retain];
//            rdi = rbx;
//            [rdi release];
//            r15 = [(r15)(@class(NSAssertionHandler), @selector(currentHandler), "/BuildRoot/Library/Caches/com.apple.xbs/Sources/UIKit_Sim/UIKit-3600.6.21/UIFlowLayoutSupport.m") retain];
//            [r15 handleFailureInMethod:var_5D8 object:var_4A0 file:r14 lineNumber:0x3e1 description:@"UICollectionViewFlowLayout internal error"];
//            [r15 release];
//            [r14 release];
//        }
//        rdx = r12 + 0xfffffffffffffffe;
//        rdi = [var_4A0->_rows objectAtIndex:rdx];
//        r14 = [rdi retain];
//        if (var_460 != 0x0) {
//            if (r14 != 0x0) {
//                var_478 = r13;
//                rdi = var_3D0;
//                [rdi rowFrame];
//            }
//            else {
//                var_478 = r13;
//                xmm0 = intrinsic_xorpd(xmm0, xmm0);
//                var_3C0 = intrinsic_movapd(var_3C0, xmm0);
//                var_3D0 = intrinsic_movapd(var_3D0, xmm0);
//            }
//            CGRectGetMinX(rdi);
//            var_470 = intrinsic_movsd(var_470, xmm0);
//            CGRectGetWidth(rdi);
//            xmm0 = intrinsic_addsd(xmm0, var_4A0->_horizontalInterstice);
//            xmm1 = intrinsic_movsd(xmm1, var_470);
//            xmm1 = intrinsic_subsd(xmm1, xmm0);
//            var_368 = intrinsic_movsd(var_368, xmm1);
//            rdi = r14;
//            [rdi release];
//            CGRectGetMaxX(rdi);
//            var_470 = intrinsic_movsd(var_470, xmm0);
//            CGRectGetMinX(rdi);
//            xmm1 = intrinsic_movsd(xmm1, var_470);
//            xmm0 = intrinsic_addsd(xmm0, var_4A0->_horizontalInterstice);
//            xmm1 = intrinsic_subsd(xmm1, xmm0);
//            xmm1 = intrinsic_ucomisd(xmm1, *0xc4ff40);
//            if (xmm1 > 0x0) {
//                xmm0 = intrinsic_movsd(xmm0, var_220);
//                xmm0 = intrinsic_subsd(xmm0, xmm1);
//                var_220 = intrinsic_movsd(var_220, xmm0);
//            }
//            CGRectGetMinX(rdi);
//            var_470 = intrinsic_movsd(var_470, xmm0);
//            CGRectGetMinX(rdi);
//            xmm1 = intrinsic_movsd(xmm1, var_470);
//            rax = var_4A0;
//            xmm0 = intrinsic_subsd(xmm0, rax->_horizontalInterstice);
//            xmm1 = intrinsic_subsd(xmm1, xmm0);
//            xmm1 = intrinsic_ucomisd(xmm1, *0xc4ff40);
//            r12 = var_510;
//            r13 = var_588;
//            rbx = var_468;
//            if (xmm1 > 0x0) {
//                xmm0 = intrinsic_movsd(xmm0, var_250);
//                xmm0 = intrinsic_subsd(xmm0, xmm1);
//                var_250 = intrinsic_movsd(var_250, xmm0);
//                xmm1 = intrinsic_addsd(xmm1, var_240);
//                var_240 = intrinsic_movsd(var_240, xmm1);
//            }
//        }
//        else {
//            if (r14 != 0x0) {
//                var_478 = r13;
//                rdi = var_3F0;
//                [rdi rowFrame];
//            }
//            else {
//                var_478 = r13;
//                xmm0 = intrinsic_xorpd(xmm0, xmm0);
//                var_3E0 = intrinsic_movapd(var_3E0, xmm0);
//                var_3F0 = intrinsic_movapd(var_3F0, xmm0);
//            }
//            CGRectGetMinY(rdi);
//            xmm0 = intrinsic_addsd(xmm0, var_4A0->_headerDimension);
//            var_470 = intrinsic_movsd(var_470, xmm0);
//            CGRectGetHeight(rdi);
//            rbx = var_530;
//            xmm0 = intrinsic_addsd(xmm0, *(var_4A0 + rbx));
//            xmm1 = intrinsic_movsd(xmm1, var_470);
//            xmm1 = intrinsic_subsd(xmm1, xmm0);
//            var_368 = intrinsic_movsd(var_368, xmm1);
//            rdi = r14;
//            [rdi release];
//            CGRectGetMaxY(rdi);
//            var_470 = intrinsic_movsd(var_470, xmm0);
//            CGRectGetMinY(rdi);
//            xmm1 = intrinsic_movsd(xmm1, var_470);
//            xmm0 = intrinsic_addsd(xmm0, *(var_4A0 + rbx));
//            xmm1 = intrinsic_subsd(xmm1, xmm0);
//            xmm1 = intrinsic_ucomisd(xmm1, *0xc4ff40);
//            if (xmm1 > 0x0) {
//                xmm0 = intrinsic_movsd(xmm0, var_218);
//                xmm0 = intrinsic_subsd(xmm0, xmm1);
//                var_218 = intrinsic_movsd(var_218, xmm0);
//            }
//            CGRectGetMinY(rdi);
//            var_470 = intrinsic_movsd(var_470, xmm0);
//            CGRectGetMinY(rdi);
//            xmm1 = intrinsic_movsd(xmm1, var_470);
//            rax = var_4A0;
//            xmm0 = intrinsic_subsd(xmm0, *(rax + rbx));
//            xmm1 = intrinsic_subsd(xmm1, xmm0);
//            xmm1 = intrinsic_ucomisd(xmm1, *0xc4ff40);
//            r12 = var_510;
//            r13 = var_588;
//            rbx = var_468;
//            if (xmm1 > 0x0) {
//                xmm0 = intrinsic_movsd(xmm0, var_248);
//                xmm0 = intrinsic_subsd(xmm0, xmm1);
//                var_248 = intrinsic_movsd(var_248, xmm0);
//                xmm1 = intrinsic_addsd(xmm1, var_238);
//                var_238 = intrinsic_movsd(var_238, xmm1);
//            }
//        }
//    }
//    if (rbx != 0x0) {
//        rax = [var_410 rowFrame];
//        xmm1 = intrinsic_movsd(xmm1, var_400);
//        xmm0 = intrinsic_movsd(xmm0, var_3F8);
//    }
//    else {
//        xmm0 = intrinsic_xorpd(xmm0, xmm0);
//        var_400 = intrinsic_movapd(var_400, xmm0);
//        var_410 = intrinsic_movapd(var_410, xmm0);
//        xmm0 = intrinsic_xorpd(xmm0, xmm0);
//        xmm1 = intrinsic_xorpd(xmm1, xmm1);
//    }
//    var_580 = @selector(setRowFrame:);
//    xmm1 = intrinsic_ucomisd(xmm1, var_360);
//    COND = xmm1 == 0x0;
//    asm { setnp      al };
//    rcx = (COND ? 0x1 : 0x0) & rax;
//    xmm0 = intrinsic_ucomisd(xmm0, var_358);
//    COND = xmm0 == 0x0;
//    asm { setnp      al };
//    rax = (COND ? 0x1 : 0x0) & rax & rcx & 0xff ^ 0x1;
//    rcx = r12 & 0x1 & 0xff | rax;
//    r15 = rcx != 0x0 ? 0x1 : 0x0;
//    _objc_msgSend(rbx, var_580, rdx, rcx);
//    [rbx release];
//    var_470 = var_478;
//    if (CGRectIsEmpty(rbx) == 0x0) goto loc_a1905e;
//    goto loc_a1a38c;
//    
//loc_a1943d:
//    *(rbx + rcx) = *(rbx + rcx) - 0x1;
//    [r15 addItem:r14 atEnd:var_4B0];
//    xmm1 = intrinsic_movsd(xmm1, var_470);
//    xmm1 = intrinsic_addsd(xmm1, var_4D0);
//    xmm0 = intrinsic_movsd(xmm0, var_468);
//    xmm0 = intrinsic_subsd(xmm0, xmm1);
//    var_468 = intrinsic_movsd(var_468, xmm0);
//    rbx = var_478;
//    if (r12 <= 0x0) goto loc_a19576;
//    
//loc_a1948d:
//    r12 = r12 - 0x1;
//    goto loc_a191e2;
//    
//loc_a19576:
//    r12 = rbx & 0x1;
//    xmm0 = intrinsic_movsd(xmm0, var_458);
//    xmm0 = intrinsic_ucomisd(xmm0, var_468);
//    rbx = (xmm0 > 0x0 ? 0x1 : 0x0) & r12;
//    if ((var_50C & 0x1) == 0x0) {
//        if (rbx != 0x0) {
//            [r15 setComplete:0x1];
//        }
//    }
//    else {
//        rax = [r15 items];
//        rax = [rax retain];
//        var_468 = rax;
//        r13 = [rax count] == 0x1 ? 0x1 : 0x0;
//        [var_468 release];
//        rbx = rbx | r13;
//        if (rbx != 0x0) {
//            [r15 setComplete:0x1];
//        }
//    }
//    rdx = r12 & 0xff;
//    [r15 setFixedItemSize:rdx];
//    [r15 layoutRow];
//    r12 = var_518;
//    r13 = var_478;
//    goto loc_a196f1;
//    
//loc_a19495:
//    var_458 = intrinsic_movsd(var_458, xmm0);
//    if ((var_50C & 0x1) != 0x0) {
//        var_468 = r15;
//        r12 = [[r15 items] retain];
//        rbx = [r12 count];
//        [r12 release];
//        if (rbx > 0x1) {
//            var_50C = 0x0;
//        }
//        r15 = var_468;
//    }
//    [r15 setComplete:0x1];
//    rdx = r13 & 0x1 & 0xff;
//    rdi = r15;
//    rsi = @selector(setFixedItemSize:);
//    goto loc_a19644;
//    
//loc_a19095:
//    rcx = arg_0;
//    if (r12 == 0x0) goto loc_a1a38c;
//    
//loc_a190a2:
//    rax = *(rax + r13 + 0x8);
//    goto loc_a190a7;
//    
//loc_a18bf5:
//    var_498 = rbx;
//    var_50C = r15;
//    xmm0 = intrinsic_xorpd(xmm0, xmm0);
//    var_2E0 = intrinsic_movapd(var_2E0, xmm0);
//    var_2F0 = intrinsic_movapd(var_2F0, xmm0);
//    var_300 = intrinsic_movapd(var_300, xmm0);
//    var_310 = intrinsic_movapd(var_310, xmm0);
//    rax = [var_478 retain];
//    var_468 = rax;
//    r8 = 0x10;
//    rdi = rax;
//    rdx = var_310;
//    rcx = var_1B0;
//    r15 = [rdi countByEnumeratingWithState:rdx objects:rcx count:r8];
//    if (r15 == 0x0) goto loc_a18e07;
//    
//loc_a18c6b:
//    rbx = *var_300;
//    xmm1 = intrinsic_movsd(xmm1, var_458);
//    goto loc_a18c8b;
//    
//loc_a18c8b:
//    r12 = 0x0;
//    goto loc_a18c95;
//    
//loc_a18c95:
//    var_458 = intrinsic_movsd(var_458, xmm1);
//    if (*var_300 != rbx) {
//        rdi = var_468;
//        objc_enumerationMutation(rdi);
//    }
//    rsi = *(var_308 + r12 * 0x8);
//    if (var_460 != 0x0) {
//        if (rsi != 0x0) {
//            rdi = var_330;
//            [rdi itemFrame];
//        }
//        else {
//            xmm0 = intrinsic_xorpd(xmm0, xmm0);
//            var_320 = intrinsic_movapd(var_320, xmm0);
//            var_330 = intrinsic_movapd(var_330, xmm0);
//        }
//        CGRectGetHeight(rdi);
//    }
//    else {
//        if (rsi != 0x0) {
//            rdi = var_350;
//            [rdi itemFrame];
//        }
//        else {
//            xmm0 = intrinsic_xorpd(xmm0, xmm0);
//            var_340 = intrinsic_movapd(var_340, xmm0);
//            var_350 = intrinsic_movapd(var_350, xmm0);
//        }
//        CGRectGetWidth(rdi);
//    }
//    xmm1 = intrinsic_movsd(xmm1, var_458);
//    xmm1 = intrinsic_ucomisd(xmm1, *0xc4ff40);
//    if ((xmm1 != 0x0) || (CPU_FLAGS & P)) goto loc_a18da1;
//    
//loc_a18d9b:
//    xmm1 = intrinsic_movapd(xmm1, xmm0);
//    goto loc_a18dac;
//    
//loc_a18dac:
//    r12 = r12 + 0x1;
//    if (r12 < r15) goto loc_a18c95;
//    
//loc_a18db8:
//    rdi = var_468;
//    var_458 = intrinsic_movsd(var_458, xmm1, var_310, var_1B0, 0x10);
//    rax = [rdi countByEnumeratingWithState:rdx objects:rcx count:r8];
//    xmm1 = intrinsic_movsd(xmm1, var_458);
//    r15 = rax;
//    if (r15 != 0x0) goto loc_a18c8b;
//    
//loc_a18dfc:
//    r13 = var_470;
//    goto loc_a18e18;
//    
//loc_a18e18:
//    var_458 = intrinsic_movsd(var_458, xmm1);
//    [var_468 release];
//    rax = r13;
//    r15 = var_50C;
//    r12 = var_4E0;
//    goto loc_a18e45;
//    
//loc_a18da1:
//    r13 = 0x0;
//    xmm1 = intrinsic_ucomisd(xmm1, xmm0);
//    if ((xmm1 != 0x0) || (CPU_FLAGS & P)) goto loc_a18e18;
//    goto loc_a18dac;
//    
//loc_a18e07:
//    r13 = var_470;
//    xmm1 = intrinsic_movsd(xmm1, var_458);
//    goto loc_a18e18;
//    
//loc_a18eb3:
//    var_470 = 0x1;
//    xmm0 = intrinsic_xorpd(xmm0, xmm0);
//    var_458 = intrinsic_movsd(var_458, xmm0);
//    r15 = 0x1;
//    goto loc_a18ec9;
//    
//loc_a18823:
//    var_550 = r12;
//    var_548 = *_CGRectZero;
//    var_540 = rbx;
//    var_518 = r13;
//    r12 = var_5B8;
//    rbx = r15 + r12;
//    r13 = r15;
//    if (CGRectIsEmpty(rdi) == 0x0) goto loc_a18932;
//    
//loc_a18880:
//    var_218 = *(arg_0 + 0x18);
//    var_220 = *(arg_0 + 0x10);
//    var_228 = *(arg_0 + 0x8);
//    var_230 = *arg_0;
//    CGRectUnion(var_270, @selector(horizontal));
//    var_238 = var_258;
//    var_240 = var_260;
//    rax = var_270;
//    rcx = var_268;
//    goto loc_a189dd;
//    
//loc_a18932:
//    r15 = arg_0;
//    if (CGRectContainsRect(rdi, @selector(horizontal)) == 0x0) goto loc_a1ab5c;
//    
//loc_a18988:
//    var_218 = var_518;
//    var_220 = var_540;
//    var_228 = var_550;
//    var_230 = var_548;
//    var_238 = *(rbx + 0x18);
//    var_240 = *(rbx + 0x10);
//    rax = *rbx;
//    rcx = *(rbx + 0x8);
//    goto loc_a189dd;
//    
//loc_a1ab5c:
//    if (CGRectIntersectsRect(rdi, @selector(horizontal)) == 0x0) goto loc_a1ac49;
//    
//loc_a1abae:
//    rdi = var_290;
//    CGRectUnion(rdi, @selector(horizontal));
//    var_238 = var_278;
//    var_240 = var_280;
//    var_248 = var_288;
//    var_250 = var_290;
//    if (var_460 == 0x0) goto loc_a1b02d;
//    
//loc_a1adb3:
//    CGRectGetMinX(rdi);
//    var_458 = intrinsic_movsd(var_458, xmm0);
//    CGRectGetMinX(rdi);
//    xmm0 = intrinsic_ucomisd(xmm0, var_458);
//    if (xmm0 <= 0x0) goto loc_a1b14d;
//    
//loc_a1ae17:
//    CGRectGetMinX(rdi);
//    var_458 = intrinsic_movsd(var_458, xmm0);
//    CGRectGetMinX(rdi);
//    xmm1 = intrinsic_movsd(xmm1, var_458);
//    xmm1 = intrinsic_subsd(xmm1, xmm0);
//    var_480 = 0x0;
//    xmm0 = intrinsic_movapd(xmm0, xmm1, 0x0, var_248);
//    CGRectDivide(var_230, var_210, 0x0, var_248, r8);
//    goto loc_a189f3;
//    
//loc_a1b14d:
//    CGRectGetMaxX(rdi);
//    var_458 = intrinsic_movsd(var_458, xmm0);
//    CGRectGetMaxX(rdi);
//    xmm1 = intrinsic_movsd(xmm1, var_458);
//    xmm1 = intrinsic_ucomisd(xmm1, xmm0);
//    if (xmm1 <= 0x0) goto loc_a1b378;
//    
//loc_a1b1b5:
//    CGRectGetMaxX(rdi);
//    var_458 = intrinsic_movsd(var_458, xmm0);
//    CGRectGetMaxX(rdi);
//    xmm1 = intrinsic_movsd(xmm1, var_458);
//    xmm1 = intrinsic_subsd(xmm1, xmm0);
//    rcx = var_248;
//    rdi = var_230;
//    rsi = var_210;
//    rdx = 0x2;
//    goto loc_a1b36a;
//    
//loc_a1b36a:
//    xmm0 = intrinsic_movapd(xmm0, xmm1);
//    CGRectDivide(rdi, rsi, rdx, rcx, r8);
//    goto loc_a189eb;
//    
//loc_a1b378:
//    rbx = [[NSString stringWithUTF8String:"/BuildRoot/Library/Caches/com.apple.xbs/Sources/UIKit_Sim/UIKit-3600.6.21/UIFlowLayoutSupport.m"] retain];
//    rdi = @"<Unknown File>";
//    if (rbx != 0x0) {
//        rdi = rbx;
//    }
//    r14 = [rdi retain];
//    r15 = r12;
//    [rbx release];
//    rbx = [[NSAssertionHandler currentHandler] retain];
//    stack[1843] = @"UICollectionViewFlowLayout internal error";
//    r9 = 0x32b;
//    goto loc_a1b485;
//    
//loc_a1b485:
//    rdx = var_5D8;
//    [rbx handleFailureInMethod:rdx object:r13 file:r14 lineNumber:r9 description:stack[1843]];
//    [rbx release];
//    [r14 release];
//    r12 = r15;
//    goto loc_a189eb;
//    
//loc_a1b02d:
//    CGRectGetMinY(rdi);
//    var_458 = intrinsic_movsd(var_458, xmm0);
//    CGRectGetMinY(rdi);
//    xmm0 = intrinsic_ucomisd(xmm0, var_458);
//    if (xmm0 <= 0x0) goto loc_a1b25e;
//    
//loc_a1b091:
//    CGRectGetMinY(rdi);
//    var_458 = intrinsic_movsd(var_458, xmm0);
//    CGRectGetMinY(rdi);
//    xmm1 = intrinsic_movsd(xmm1, var_458);
//    xmm1 = intrinsic_subsd(xmm1, xmm0);
//    xmm0 = intrinsic_movapd(xmm0, xmm1, 0x1, var_248);
//    CGRectDivide(var_230, var_210, 0x1, var_248, r8);
//    var_480 = 0x0;
//    goto loc_a189f3;
//    
//loc_a1b25e:
//    CGRectGetMaxY(rdi);
//    var_458 = intrinsic_movsd(var_458, xmm0);
//    CGRectGetMaxY(rdi);
//    xmm1 = intrinsic_movsd(xmm1, var_458);
//    xmm1 = intrinsic_ucomisd(xmm1, xmm0);
//    if (xmm1 <= 0x0) goto loc_a1b401;
//    
//loc_a1b2c6:
//    CGRectGetMaxY(rdi);
//    var_458 = intrinsic_movsd(var_458, xmm0);
//    CGRectGetMaxY(rdi);
//    xmm1 = intrinsic_movsd(xmm1, var_458);
//    xmm1 = intrinsic_subsd(xmm1, xmm0);
//    rcx = var_248;
//    rdi = var_230;
//    rsi = var_210;
//    rdx = 0x3;
//    goto loc_a1b36a;
//    
//loc_a1b401:
//    rbx = [[NSString stringWithUTF8String:"/BuildRoot/Library/Caches/com.apple.xbs/Sources/UIKit_Sim/UIKit-3600.6.21/UIFlowLayoutSupport.m"] retain];
//    rdi = @"<Unknown File>";
//    if (rbx != 0x0) {
//        rdi = rbx;
//    }
//    r14 = [rdi retain];
//    r15 = r12;
//    [rbx release];
//    rbx = [[NSAssertionHandler currentHandler] retain];
//    stack[1843] = @"UICollectionViewFlowLayout internal error";
//    r9 = 0x337;
//    goto loc_a1b485;
//    
//loc_a1ac49:
//    if (var_460 == 0x0) goto loc_a1aed0;
//    
//loc_a1ac56:
//    CGRectGetMinX(rdi);
//    var_458 = intrinsic_movsd(var_458, xmm0);
//    CGRectGetMaxX(rdi);
//    xmm1 = intrinsic_movsd(xmm1, var_458);
//    xmm1 = intrinsic_ucomisd(xmm1, xmm0);
//    if ((xmm1 != 0x0) || (!CPU_FLAGS & NP)) goto loc_a1acbc;
//    
//loc_a1ad2a:
//    rdi = var_290;
//    CGRectUnion(rdi, @selector(horizontal));
//    var_238 = var_278;
//    var_240 = var_280;
//    var_248 = var_288;
//    var_250 = var_290;
//    goto loc_a1adb3;
//    
//loc_a1acbc:
//    CGRectGetMaxX(rdi);
//    var_458 = intrinsic_movsd(var_458, xmm0);
//    CGRectGetMinX(rdi);
//    xmm1 = intrinsic_movsd(xmm1, var_458);
//    xmm1 = intrinsic_ucomisd(xmm1, xmm0);
//    if ((xmm1 != 0x0) || (CPU_FLAGS & P)) goto loc_a1b4b1;
//    goto loc_a1ad2a;
//    
//loc_a1b4b1:
//    var_238 = *(r15 + 0x18);
//    var_240 = *(r15 + 0x10);
//    var_248 = *(r15 + 0x8);
//    var_250 = *r15;
//    xmm0 = intrinsic_xorpd(xmm0, xmm0);
//    r13->_validItemRange = intrinsic_movupd(r13->_validItemRange, xmm0);
//    [r13->_rows removeAllObjects];
//    goto loc_a189eb;
//    
//loc_a1aed0:
//    CGRectGetMinY(rdi);
//    var_458 = intrinsic_movsd(var_458, xmm0);
//    CGRectGetMaxY(rdi);
//    xmm1 = intrinsic_movsd(xmm1, var_458);
//    xmm1 = intrinsic_ucomisd(xmm1, xmm0);
//    if ((xmm1 != 0x0) || (!CPU_FLAGS & NP)) goto loc_a1af36;
//    
//loc_a1afa4:
//    rdi = var_290;
//    CGRectUnion(rdi, @selector(horizontal));
//    var_238 = var_278;
//    var_240 = var_280;
//    var_248 = var_288;
//    var_250 = var_290;
//    goto loc_a1b02d;
//    
//loc_a1af36:
//    CGRectGetMaxY(rdi);
//    var_458 = intrinsic_movsd(var_458, xmm0);
//    CGRectGetMinY(rdi);
//    xmm1 = intrinsic_movsd(xmm1, var_458);
//    xmm1 = intrinsic_ucomisd(xmm1, xmm0);
//    if ((xmm1 != 0x0) || (CPU_FLAGS & P)) goto loc_a1b4b1;
//    goto loc_a1afa4;
//    
//loc_a18737:
//    var_5B8 = *_OBJC_IVAR_$__UIFlowLayoutSection._validRect;
//    goto loc_a1873e;
//    
//loc_a18446:
//    CGRectGetMaxY(rdi);
//    var_458 = intrinsic_movsd(var_458, xmm0);
//    CGRectGetMaxY(rdi);
//    xmm1 = intrinsic_movsd(xmm1, var_458);
//    xmm1 = intrinsic_ucomisd(xmm1, xmm0);
//    if (xmm1 <= 0x0) goto loc_a18737;
//    
//loc_a184bd:
//    rbx = r15 + *_OBJC_IVAR_$__UIFlowLayoutSection._validRect;
//    var_5B8 = *_OBJC_IVAR_$__UIFlowLayoutSection._validRect;
//    CGRectGetMinY(rdi);
//    var_458 = intrinsic_movsd(var_458, xmm0);
//    CGRectGetMinY(rdi);
//    xmm0 = intrinsic_ucomisd(xmm0, var_458);
//    if (xmm0 <= 0x0) goto loc_a1873e;
//    
//loc_a18530:
//    CGRectGetMinY(rdi);
//    var_458 = intrinsic_movsd(var_458, xmm0);
//    CGRectGetMinY(rdi);
//    xmm1 = intrinsic_movsd(xmm1, var_458);
//    xmm1 = intrinsic_subsd(xmm1, xmm0);
//    xmm0 = intrinsic_movapd(xmm0, xmm1, 0x1, *(r12 + 0x8));
//    CGRectDivide(var_230, var_210, 0x1, *(r12 + 0x8), r8);
//    var_458 = var_4B0 & 0xff;
//    r13 = r15;
//    r15 = var_508;
//    r8 = var_5C0;
//    [r13 computeLayoutInRect:r15 forSection:rcx invalidating:r8 invalidationContext:r9];
//    CGRectGetMaxY(r13);
//    var_460 = intrinsic_movsd(var_460, xmm0);
//    CGRectGetMaxY(r13);
//    xmm1 = intrinsic_movsd(xmm1, var_460);
//    xmm1 = intrinsic_subsd(xmm1, xmm0);
//    rcx = *(r12 + 0x8);
//    rsi = var_250;
//    rdx = 0x3;
//    goto loc_a186d6;
}
- (id)copyFromLayoutInfo:(id)arg1 {
    return nil;
//    r15 = self;
//    var_30 = *___stack_chk_guard;
//    r14 = [arg2 retain];
//    rbx = [[_UIFlowLayoutSection alloc] init];
//    if (rbx != 0x0) {
//        *(rbx + *_OBJC_IVAR_$__UIFlowLayoutSection._sectionMargins + 0x18) = *(r15 + *_OBJC_IVAR_$__UIFlowLayoutSection._sectionMargins + 0x18);
//        *(rbx + *_OBJC_IVAR_$__UIFlowLayoutSection._sectionMargins + 0x10) = *(r15 + *_OBJC_IVAR_$__UIFlowLayoutSection._sectionMargins + 0x10);
//        *(rbx + *_OBJC_IVAR_$__UIFlowLayoutSection._sectionMargins + 0x8) = *(r15 + *_OBJC_IVAR_$__UIFlowLayoutSection._sectionMargins + 0x8);
//        rbx->_sectionMargins = r15->_sectionMargins;
//        rbx->_verticalInterstice = r15->_verticalInterstice;
//        rbx->_horizontalInterstice = r15->_horizontalInterstice;
//        *(rbx + *_OBJC_IVAR_$__UIFlowLayoutSection._frame + 0x18) = *(r15 + *_OBJC_IVAR_$__UIFlowLayoutSection._frame + 0x18);
//        *(rbx + *_OBJC_IVAR_$__UIFlowLayoutSection._frame + 0x10) = *(r15 + *_OBJC_IVAR_$__UIFlowLayoutSection._frame + 0x10);
//        *(rbx + *_OBJC_IVAR_$__UIFlowLayoutSection._frame + 0x8) = *(r15 + *_OBJC_IVAR_$__UIFlowLayoutSection._frame + 0x8);
//        rbx->_frame = r15->_frame;
//        rbx->_isValid = r15->_isValid;
//        *(rbx + *_OBJC_IVAR_$__UIFlowLayoutSection._headerFrame + 0x18) = *(r15 + *_OBJC_IVAR_$__UIFlowLayoutSection._headerFrame + 0x18);
//        *(rbx + *_OBJC_IVAR_$__UIFlowLayoutSection._headerFrame + 0x10) = *(r15 + *_OBJC_IVAR_$__UIFlowLayoutSection._headerFrame + 0x10);
//        *(rbx + *_OBJC_IVAR_$__UIFlowLayoutSection._headerFrame + 0x8) = *(r15 + *_OBJC_IVAR_$__UIFlowLayoutSection._headerFrame + 0x8);
//        rbx->_headerFrame = r15->_headerFrame;
//        *(rbx + *_OBJC_IVAR_$__UIFlowLayoutSection._footerFrame + 0x18) = *(r15 + *_OBJC_IVAR_$__UIFlowLayoutSection._footerFrame + 0x18);
//        *(rbx + *_OBJC_IVAR_$__UIFlowLayoutSection._footerFrame + 0x10) = *(r15 + *_OBJC_IVAR_$__UIFlowLayoutSection._footerFrame + 0x10);
//        *(rbx + *_OBJC_IVAR_$__UIFlowLayoutSection._footerFrame + 0x8) = *(r15 + *_OBJC_IVAR_$__UIFlowLayoutSection._footerFrame + 0x8);
//        rbx->_footerFrame = r15->_footerFrame;
//        rbx->_headerDimension = r15->_headerDimension;
//        rbx->_footerDimension = r15->_footerDimension;
//        var_150 = r14;
//        [rbx setLayoutInfo:r14, r15->_footerDimension];
//        rbx->_fixedItemSize = r15->_fixedItemSize;
//        *(rbx + *_OBJC_IVAR_$__UIFlowLayoutSection._itemSize + 0x8) = *(r15 + *_OBJC_IVAR_$__UIFlowLayoutSection._itemSize + 0x8);
//        rbx->_itemSize = r15->_itemSize;
//        rbx->_itemsCount = r15->_itemsCount;
//        rbx->_itemsByRowCount = r15->_itemsByRowCount;
//        rbx->_indexOfIncompleteRow = r15->_indexOfIncompleteRow;
//        rbx->_beginMargin = r15->_beginMargin;
//        rbx->_endMargin = r15->_endMargin;
//        rbx->_actualGap = r15->_actualGap;
//        rbx->_lastRowIncomplete = r15->_lastRowIncomplete;
//        rbx->_lastRowBeginMargin = r15->_lastRowBeginMargin;
//        rbx->_lastRowEndMargin = r15->_lastRowEndMargin;
//        rbx->_lastRowActualGap = r15->_lastRowActualGap;
//        rbx->_otherMargin = r15->_otherMargin;
//        var_130 = rbx;
//        intrinsic_movaps(var_C0, 0x0);
//        intrinsic_movaps(var_D0, 0x0);
//        var_E0 = intrinsic_movaps(var_E0, 0x0);
//        var_F0 = intrinsic_movaps(var_F0, 0x0);
//        rax = [r15 rows];
//        rax = [rax retain];
//        var_140 = rax;
//        rax = [rax countByEnumeratingWithState:var_F0 objects:var_B0 count:0x10];
//        var_100 = rax;
//        if (rax != 0x0) {
//            var_138 = *var_E0;
//            do {
//                r14 = 0x0;
//                do {
//                    if (*var_E0 != var_138) {
//                        objc_enumerationMutation(var_140);
//                    }
//                    r12 = [*(var_E8 + r14 * 0x8) copyFromSection:var_130];
//                    var_F8 = r12;
//                    r15 = [[var_130 rows] retain];
//                    [r15 addObject:r12];
//                    [r15 release];
//                    r15 = [[var_130 items] retain];
//                    rbx = [[var_F8 items] retain];
//                    [r15 addObjectsFromArray:rbx];
//                    [rbx release];
//                    [r15 release];
//                    [var_F8 release];
//                    r14 = r14 + 0x1;
//                } while (r14 < var_100);
//                rax = [var_140 countByEnumeratingWithState:var_F0 objects:var_B0 count:0x10];
//                var_100 = rax;
//            } while (rax != 0x0);
//        }
//        [var_140 release];
//        r14 = var_150;
//        rbx = var_130;
//    }
//    [r14 release];
//    if (*___stack_chk_guard == var_30) {
//        rax = rbx;
//    }
//    else {
//        rax = __stack_chk_fail();
//    }
//    return rax;
}


- (CGRect)effectiveFooterFrameWithSectionMarginsApplied {
    
    // NOTE: Approximated
    
    CGRect rect = CGRectMake(_footerFrame.origin.x,
               _footerFrame.origin.y,
               _footerFrame.size.width,
               _footerFrame.size.height);
    
    if ([_layoutInfo horizontal]) {
        rect.origin.y = _sectionMargins.top;
        rect.size.height = (CGRectGetHeight(_footerFrame) - (_sectionMargins.top + _sectionMargins.bottom));
    } else {
        rect.origin.x = _sectionMargins.left;
        rect.size.width = CGRectGetWidth(_footerFrame) - _sectionMargins.left + _sectionMargins.right;
    }
    return rect;
}

- (CGRect)effectiveHeaderFrameWithSectionMarginsApplied {
    
    // NOTE: Approximated
    
    CGRect rect = CGRectMake(_headerFrame.origin.x,
                             _headerFrame.origin.y,
                             _headerFrame.size.width,
                             _headerFrame.size.height);
    
    if ([_layoutInfo horizontal]) {
        rect.origin.y = _sectionMargins.top;
        rect.size.height = (CGRectGetHeight(_headerFrame) - (_sectionMargins.top + _sectionMargins.bottom));
    } else {
        rect.origin.x = _sectionMargins.left;
        rect.size.width = CGRectGetWidth(_headerFrame) - _sectionMargins.left + _sectionMargins.right;
    }
    return rect;
}


- (NSInteger)estimatedIndexOfItemAtPoint:(CGPoint)arg1 {
    return -1;
//Pseudocode:
//    var_68 = intrinsic_movsd(var_68, xmm1, arg2);
//    var_70 = intrinsic_movsd(var_70, xmm0);
//    rbx = objc_loadWeakRetained(*_OBJC_IVAR_$__UIFlowLayoutSection._layoutInfo + self);
//    r15 = [rbx horizontal];
//    [rbx release];
//    r12 = [self retain];
//    var_40 = r12;
//    xmm0 = intrinsic_movsd(xmm0, var_70);
//    intrinsic_movsd(var_38, xmm0);
//    xmm0 = intrinsic_movsd(xmm0, var_68);
//    intrinsic_movsd(var_30, xmm0);
//    r14 = objc_retainBlock(__NSConcreteStackBlock);
//    rbx = r12 + *_OBJC_IVAR_$__UIFlowLayoutSection._validRect;
//    if (r15 == 0x0) goto loc_a171a8;
//    
//loc_a17148:
//    CGRectGetMinX(__NSConcreteStackBlock);
//    xmm0 = intrinsic_ucomisd(xmm0, var_70);
//    if (xmm0 <= 0x0) goto loc_a1721c;
//    
//loc_a1717a:
//    CGRectGetMinX(__NSConcreteStackBlock);
//    xmm1 = intrinsic_movsd(xmm1, var_70);
//    goto loc_a17206;
//    
//loc_a17206:
//    xmm1 = intrinsic_divsd(xmm1, xmm0);
//    xmm0 = zero_extend_64(r12->_validItemRange);
//    goto loc_a173eb;
//    
//loc_a173eb:
//    xmm0 = intrinsic_punpckldq(xmm0, *(int128_t *)0xc4f620);
//    xmm0 = intrinsic_subpd(xmm0, *(int128_t *)0xc4f630);
//    r15 = intrinsic_cvttsd2si(r15, intrinsic_mulsd(intrinsic_haddpd(xmm0, xmm0), xmm1));
//    goto loc_a17414;
//    
//loc_a17414:
//    [r14 release];
//    [var_40 release];
//    rax = r15;
//    return rax;
//    
//loc_a1721c:
//    CGRectGetMaxX(__NSConcreteStackBlock);
//    xmm0 = intrinsic_ucomisd(xmm0, var_70);
//    if (xmm0 >= 0x0) goto loc_a1740a;
//    
//loc_a1724e:
//    CGRectGetMaxX(__NSConcreteStackBlock);
//    xmm1 = intrinsic_movsd(xmm1, var_70);
//    xmm1 = intrinsic_subsd(xmm1, xmm0);
//    var_70 = intrinsic_movsd(var_70, xmm1);
//    CGRectGetMaxX(__NSConcreteStackBlock);
//    var_68 = intrinsic_movsd(var_68, xmm0);
//    CGRectGetMaxX(__NSConcreteStackBlock);
//    xmm2 = intrinsic_movsd(xmm2, var_68);
//    xmm2 = intrinsic_subsd(xmm2, xmm0);
//    xmm1 = intrinsic_movsd(xmm1, var_70);
//    goto loc_a173c7;
//    
//loc_a173c7:
//    xmm1 = intrinsic_divsd(xmm1, xmm2);
//    xmm0 = zero_extend_64(r12->_itemsCount - r12->_validItemRange - *(r12 + *_OBJC_IVAR_$__UIFlowLayoutSection._validItemRange + 0x8));
//    goto loc_a173eb;
//    
//loc_a1740a:
//    r15 = (*(r14 + 0x10))(r14);
//    goto loc_a17414;
//    
//loc_a171a8:
//    CGRectGetMinY(__NSConcreteStackBlock);
//    xmm0 = intrinsic_ucomisd(xmm0, var_68);
//    if (xmm0 <= 0x0) goto loc_a172f4;
//    
//loc_a171da:
//    CGRectGetMinY(__NSConcreteStackBlock);
//    xmm1 = intrinsic_movsd(xmm1, var_68);
//    goto loc_a17206;
//    
//loc_a172f4:
//    CGRectGetMaxY(__NSConcreteStackBlock);
//    xmm0 = intrinsic_ucomisd(xmm0, var_68);
//    if (xmm0 >= 0x0) goto loc_a1740a;
//    
//loc_a17326:
//    CGRectGetMaxY(__NSConcreteStackBlock);
//    xmm1 = intrinsic_movsd(xmm1, var_68);
//    xmm1 = intrinsic_subsd(xmm1, xmm0);
//    var_68 = intrinsic_movsd(var_68, xmm1);
//    CGRectGetMaxY(__NSConcreteStackBlock);
//    var_70 = intrinsic_movsd(var_70, xmm0);
//    CGRectGetMaxY(__NSConcreteStackBlock);
//    xmm2 = intrinsic_movsd(xmm2, var_70);
//    xmm2 = intrinsic_subsd(xmm2, xmm0);
//    xmm1 = intrinsic_movsd(xmm1, var_68);
//    goto loc_a173c7;
    
//    ___52-[_UIFlowLayoutSection estimatedIndexOfItemAtPoint:]_block_invoke
//    
//    
//Pseudocode:
//    rbx = arg0;
//    var_68 = [*(rbx + 0x20) retain];
//    rdx = __NSConcreteStackBlock;
//    [*(rbx + 0x20)->_rows enumerateObjectsUsingBlock:rdx];
//    r14 = *0x18;
//    if (r14 == 0x7fffffffffffffff) {
//        r15 = [[*(rbx + 0x20)->_rows lastObject] retain];
//        intrinsic_movsd(xmm0, *(rbx + 0x28));
//        intrinsic_movsd(xmm1, *(rbx + 0x30));
//        r14 = [r15 indexOfNearestItemAtPoint:rdx];
//        [r15 release];
//    }
//    [var_68 release];
//    _Block_object_dispose(0x0, 0x8);
//    rax = r14;
//    return rax;
//    

    
//    ___52-[_UIFlowLayoutSection estimatedIndexOfItemAtPoint:]_block_invoke_2
//    
//    
//Pseudocode:
//    rsi = arg1;
//    r14 = arg3;
//    r12 = arg2;
//    rbx = arg0;
//    rdi = rsi;
//    r15 = [rdi retain];
//    if (r15 != 0x0) {
//        rdi = var_50;
//        rsi = r15;
//        [rdi rowFrame];
//    }
//    else {
//        var_40 = intrinsic_movaps(var_40, 0x0);
//        var_50 = intrinsic_movaps(var_50, 0x0);
//    }
//    xmm0 = intrinsic_movsd(0x0, *(rbx + 0x30));
//    xmm1 = intrinsic_movsd(xmm1, *(rbx + 0x38));
//    if (CGRectContainsPoint(rdi, rsi) == 0x0) goto loc_a17630;
//    
//loc_a17605:
//    intrinsic_movsd(xmm0, *(rbx + 0x30));
//    intrinsic_movsd(xmm1, *(rbx + 0x38));
//    *(*(*(rbx + 0x28) + 0x8) + 0x18) = [r15 indexOfNearestItemAtPoint:rdx];
//    goto loc_a17715;
//    
//loc_a17715:
//    *(int8_t *)r14 = 0x1;
//    goto loc_a17719;
//    
//loc_a17719:
//    rax = [r15 release];
//    return rax;
//    
//loc_a17630:
//    if (*(int8_t *)(rbx + 0x40) == 0x0) goto loc_a17679;
//    
//loc_a17636:
//    xmm0 = intrinsic_movsd(xmm0, *(rbx + 0x30));
//    var_58 = intrinsic_movsd(var_58, xmm0);
//    CGRectGetMinX(rdi);
//    xmm0 = intrinsic_ucomisd(xmm0, var_58);
//    if (xmm0 > 0x0) goto loc_a176b2;
//    
//loc_a1766f:
//    if (*(int8_t *)(rbx + 0x40) != 0x0) goto loc_a17719;
//    
//loc_a17679:
//    xmm0 = intrinsic_movsd(xmm0, *(rbx + 0x38));
//    var_58 = intrinsic_movsd(var_58, xmm0);
//    CGRectGetMinY(rdi);
//    xmm0 = intrinsic_ucomisd(xmm0, var_58);
//    if (xmm0 <= 0x0) goto loc_a17719;
//    
//loc_a176b2:
//    rdi = *(rbx + 0x20)->_rows;
//    rdx = r12 + 0xffffffffffffffff;
//    if (r12 == 0x0) {
//        rdx = r12;
//    }
//    r12 = [[rdi objectAtIndex:rdx] retain];
//    intrinsic_movsd(xmm0, *(rbx + 0x30));
//    intrinsic_movsd(xmm1, *(rbx + 0x38));
//    *(*(*(rbx + 0x28) + 0x8) + 0x18) = [r12 indexOfNearestItemAtPoint:rdx];
//    [r12 release];
//    goto loc_a17715;
//    

}

- (CGRect)frameForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    // TODO
    
    CGRect result = CGRectZero;
    
    NSInteger itemIndex = [indexPath item];
    
    if (itemIndex >= _validItemRange.location && itemIndex < _validItemRange.length) {
        return [[_items objectAtIndex:itemIndex] itemFrame];
    } else {
        _RDFlowLayoutItem *item = [_items objectAtIndex:itemIndex];
        CGRect itemFrame = [item itemFrame];
        
//        for (NSInteger idx=itemIndex; itemIndex>_validItemRange.location; <#increment#>) {
//            <#statements#>
//        }
        
        if (itemIndex < _validItemRange.location) {
            _RDFlowLayoutRow *row = [_rows firstObject];
            id items = [row items];
            NSInteger itemsCount = [items count];
            
            NSInteger numberOfItemsUntilValidRange = _validItemRange.location - itemIndex;
            
        }
    }
    
    return result;
//    r14 = _cmd;
//    r13 = self;
//    rax = [rcx item];
//    r15 = rax;
//    rax = rax - r14->_validItemRange;
//    if ((rax >= 0x0) && (rax < *(r14 + *_OBJC_IVAR_$__UIFlowLayoutSection._validItemRange + 0x8))) {
//        rbx = [[r14->_items objectAtIndex:r15] retain];
//        if (rbx != 0x0) {
//            [r13 itemFrame];
//        }
//        else {
//            *(r13 + 0x18) = 0x0;
//            *(r13 + 0x10) = 0x0;
//            *(r13 + 0x8) = 0x0;
//            *r13 = 0x0;
//        }
//        [rbx release];
//        rax = r13;
//    }
//    else {
//        rbx = [[r14->_items objectAtIndex:r15] retain];
//        if (rbx != 0x0) {
//            [var_50 itemFrame];
//        }
//        else {
//            xmm0 = intrinsic_xorpd(xmm0, xmm0);
//            var_40 = intrinsic_movapd(var_40, xmm0);
//            var_50 = intrinsic_movapd(var_50, xmm0);
//        }
//        [rbx release];
//        rdi = r14->_rows;
//        if (r15 < r14->_validItemRange) {
//            var_88 = r13;
//            var_80 = r15;
//            rbx = [[rdi firstObject] retain];
//            rax = [rbx items];
//            rax = [rax retain];
//            var_90 = rax;
//            r13 = [rax count];
//            rcx = r14->_validItemRange - r15;
//            r12 = -(rcx % r13);
//            xmm0 = intrinsic_punpckldq(zero_extend_64(rcx), *(int128_t *)0xc4f620);
//            xmm0 = intrinsic_subpd(xmm0, *(int128_t *)0xc4f630);
//            xmm0 = intrinsic_haddpd(xmm0, xmm0);
//            xmm1 = intrinsic_cvtsi2sd(xmm1, r13);
//            xmm0 = intrinsic_divsd(xmm0, xmm1);
//            ceil(xmm0);
//            if (rbx != 0x0) {
//                var_78 = rbx;
//                var_98 = intrinsic_movsd(var_98, xmm0, @selector(rowFrame));
//                [var_70 rowFrame];
//                xmm0 = intrinsic_movsd(xmm0, var_98);
//            }
//            else {
//                var_78 = rbx;
//                xmm1 = intrinsic_xorpd(xmm1, xmm1);
//                var_60 = intrinsic_movapd(var_60, xmm1);
//                var_70 = intrinsic_movapd(var_70, xmm1);
//            }
//            var_98 = r13 + r12 + 0xffffffffffffffff;
//            r13 = intrinsic_cvttsd2si(r13, xmm0);
//            rbx = objc_loadWeakRetained(*_OBJC_IVAR_$__UIFlowLayoutSection._layoutInfo + r14);
//            r12 = [rbx horizontal];
//            rdi = rbx;
//            [rdi release];
//            r15 = var_80;
//            if (r12 != 0x0) {
//                CGRectGetMinX(rdi);
//                var_A0 = intrinsic_movsd(var_A0, xmm0);
//                CGRectGetWidth(rdi);
//                xmm0 = intrinsic_addsd(xmm0, r14->_horizontalInterstice);
//                xmm1 = intrinsic_cvtsi2sd(xmm1, r13);
//                xmm1 = intrinsic_mulsd(xmm1, xmm0);
//                xmm0 = intrinsic_movsd(xmm0, var_A0);
//                xmm0 = intrinsic_subsd(xmm0, xmm1);
//                var_50 = intrinsic_movsd(var_50, xmm0);
//                xmm0 = intrinsic_movsd(xmm0, r14->_sectionMargins);
//                var_A0 = intrinsic_movsd(var_A0, xmm0);
//                CGRectGetHeight(rdi);
//                var_48 = intrinsic_movsd(var_48, intrinsic_addsd(intrinsic_mulsd(intrinsic_cvtsi2sd(xmm1, var_98), intrinsic_addsd(xmm0, r14->_verticalInterstice)), var_A0));
//            }
//            else {
//                CGRectGetMinY(rdi);
//                var_A0 = intrinsic_movsd(var_A0, xmm0);
//                CGRectGetHeight(rdi);
//                xmm0 = intrinsic_addsd(xmm0, r14->_verticalInterstice);
//                xmm1 = intrinsic_cvtsi2sd(xmm1, r13);
//                xmm1 = intrinsic_mulsd(xmm1, xmm0);
//                xmm0 = intrinsic_movsd(xmm0, var_A0);
//                xmm0 = intrinsic_subsd(xmm0, xmm1);
//                var_48 = intrinsic_movsd(var_48, xmm0);
//                xmm0 = intrinsic_movsd(xmm0, *(r14 + *_OBJC_IVAR_$__UIFlowLayoutSection._sectionMargins + 0x8));
//                var_A0 = intrinsic_movsd(var_A0, xmm0);
//                CGRectGetWidth(rdi);
//                var_50 = intrinsic_movsd(var_50, intrinsic_addsd(intrinsic_mulsd(intrinsic_cvtsi2sd(xmm1, var_98), intrinsic_addsd(xmm0, r14->_horizontalInterstice)), var_A0));
//            }
//            r12 = var_88;
//            rdi = var_90;
//        }
//        else {
//            rbx = [[rdi lastObject] retain];
//            rax = [rbx items];
//            rax = [rax retain];
//            var_88 = rax;
//            rax = [rax count];
//            rcx = 0x1;
//            if (rax != 0x0) {
//                rcx = rax;
//            }
//            rax = r15 - r14->_validItemRange;
//            rax = rax - *(r14 + *_OBJC_IVAR_$__UIFlowLayoutSection._validItemRange + 0x8);
//            var_98 = rax / rcx;
//            var_90 = rax % rcx;
//            if (rbx != 0x0) {
//                r12 = r13;
//                var_78 = rbx;
//                [var_70 rowFrame];
//            }
//            else {
//                var_78 = rbx;
//                r12 = r13;
//                xmm0 = intrinsic_xorpd(xmm0, xmm0);
//                var_60 = intrinsic_movapd(var_60, xmm0);
//                var_70 = intrinsic_movapd(var_70, xmm0);
//            }
//            rbx = objc_loadWeakRetained(*_OBJC_IVAR_$__UIFlowLayoutSection._layoutInfo + r14);
//            r13 = [rbx horizontal];
//            rdi = rbx;
//            [rdi release];
//            if (r13 != 0x0) {
//                CGRectGetMaxX(rdi);
//                xmm0 = intrinsic_addsd(xmm0, r14->_horizontalInterstice);
//                var_A0 = intrinsic_movsd(var_A0, xmm0);
//                CGRectGetWidth(rdi);
//                xmm0 = intrinsic_addsd(xmm0, r14->_horizontalInterstice);
//                xmm1 = intrinsic_cvtsi2sd(xmm1, var_98);
//                xmm1 = intrinsic_mulsd(xmm1, xmm0);
//                xmm1 = intrinsic_addsd(xmm1, var_A0);
//                var_50 = intrinsic_movsd(var_50, xmm1);
//                xmm0 = intrinsic_movsd(xmm0, r14->_sectionMargins);
//                var_98 = intrinsic_movsd(var_98, xmm0);
//                CGRectGetHeight(rdi);
//                var_48 = intrinsic_movsd(var_48, intrinsic_addsd(intrinsic_mulsd(intrinsic_cvtsi2sd(xmm1, var_90), intrinsic_addsd(xmm0, r14->_verticalInterstice)), var_98));
//            }
//            else {
//                CGRectGetMaxY(rdi);
//                xmm0 = intrinsic_addsd(xmm0, r14->_verticalInterstice);
//                var_A0 = intrinsic_movsd(var_A0, xmm0);
//                CGRectGetHeight(rdi);
//                xmm0 = intrinsic_addsd(xmm0, r14->_verticalInterstice);
//                xmm1 = intrinsic_cvtsi2sd(xmm1, var_98);
//                xmm1 = intrinsic_mulsd(xmm1, xmm0);
//                xmm1 = intrinsic_addsd(xmm1, var_A0);
//                var_48 = intrinsic_movsd(var_48, xmm1);
//                xmm0 = intrinsic_movsd(xmm0, *(r14 + *_OBJC_IVAR_$__UIFlowLayoutSection._sectionMargins + 0x8));
//                var_98 = intrinsic_movsd(var_98, xmm0);
//                CGRectGetWidth(rdi);
//                var_50 = intrinsic_movsd(var_50, intrinsic_addsd(intrinsic_mulsd(intrinsic_cvtsi2sd(xmm1, var_90), intrinsic_addsd(xmm0, r14->_horizontalInterstice)), var_98));
//            }
//            rdi = var_88;
//        }
//        [rdi release];
//        [var_78 release];
//        rdi = r14->_items;
//        rbx = [[rdi objectAtIndexedSubscript:r15] retain];
//        [rbx setItemFrame:r15, rcx];
//        [rbx setPositionEstimated:0x1];
//        *(r12 + 0x18) = var_38;
//        *(r12 + 0x10) = var_40;
//        *(r12 + 0x8) = var_48;
//        *r12 = var_50;
//        [rbx release];
//        rax = r12;
//    }
//    return rax;

}

- (id)init {
    self = [super init];
    if (self != nil) {
        _items = [[NSMutableArray alloc] init];
        _rows = [[NSMutableArray alloc] init];
        _verticalInterstice = 0x4024000000000000;
        _horizontalInterstice = 0x4024000000000000;
    }
    return self;
}

- (void)invalidate {
    self->_isValid = 0x0;
    [self->_items removeAllObjects];
}


- (id)invalidatedIndexPaths {
    return [self->_invalidatedIndexPaths allObjects];
}

- (void)logInvalidSizes {
    [self logInvalidSizesForHorizontalDirection:[_layoutInfo horizontal] warnAboutDelegateValues:YES];
}

void RDCollectionViewFlowLayoutBreakForInvalidSizes(RDCollectionViewLayout *layout) {
    NSLog(@" ");
}

- (void)logInvalidSizesForHorizontalDirection:(BOOL)isHorizontal warnAboutDelegateValues:(BOOL)warnAboutDelegateValues {
    NSLog(@"The behavior of the UICollectionViewFlowLayout is not defined because:");
    
    if (isHorizontal) {
        NSLog(@"the item height must be less than the height of the UICollectionView minus the section insets top and bottom values, minus the content insets top and bottom values.");
    } else {
        NSLog(@"the item width must be less than the width of the UICollectionView minus the section insets left and right values, minus the content insets left and right values.");
    }
    
    if (warnAboutDelegateValues) {
        NSLog(@"Please check the values returned by the delegate.");
    }
    
    NSLog(@"The relevant UICollectionViewFlowLayout instance is %@, and it is attached to %@.", [[self layoutInfo] layout], [[self layoutInfo] collectionView]);
    NSLog(@"Make a symbolic breakpoint at RDCollectionViewFlowLayoutBreakForInvalidSizes to catch this in the debugger.");
    RDCollectionViewFlowLayoutBreakForInvalidSizes([[self layoutInfo] layout]);
}


- (NSArray *)rowsInRect:(CGRect)rect {
    
    // NOTE: Approximation
    
    const NSInteger rowCount = [_rows count];
    
    if (CGRectIsEmpty(CGRectIntersection(_frame, rect)) || rowCount == 0) {
        return [NSArray array];
    }
    
    NSRange indexRange = NSMakeRange(0, 0);
    
    for (NSInteger rowIdx = 0; rowIdx < rowCount; ++rowIdx) {
        _RDFlowLayoutRow *row = _rows[rowIdx];
        if (CGRectIntersectsRect([row rowFrame], rect)) {
            if (indexRange.length == 0) {
                indexRange.length = 1;
                indexRange.location = rowIdx;
            } else {
                indexRange.length += 1;
            }
        } else if (indexRange.length > 0) {
            break;
        }
    }
    
    if (indexRange.length > 0) {
        return [_rows objectsAtIndexes:[NSIndexSet indexSetWithIndexesInRange:indexRange]];
    } else {
        return [NSArray array];
    }
}

- (void)setEstimatedSize:(CGSize)newSize forSection:(NSInteger)section {
    if (_frame.size.width != newSize.width || _frame.size.height != newSize.height) {
        const CGFloat delta = [_layoutInfo horizontal] ? newSize.width - CGRectGetWidth(_frame) : newSize.height - CGRectGetHeight(_frame);
        _frame = CGRectMake(_frame.origin.x, _frame.origin.y, newSize.width, newSize.height);
        [_layoutInfo didUpdateSizeForSection:section withDelta:delta];
    }
}

- (void)setHeaderDimension:(CGFloat)newDimension forSection:(NSInteger)section {
    CGFloat delta = newDimension - _headerDimension;
    if (delta != 0) {
        _headerDimension = newDimension;
        CGSize newSize;
        if ([_layoutInfo horizontal]) {
            newSize = CGSizeMake(_frame.size.width,
                                 _frame.size.height + delta);
        } else {
            newSize = CGSizeMake(_frame.size.width + delta,
                                 _frame.size.height);
        }
        [self setEstimatedSize:newSize forSection:section];
    }
}

- (void)setSize:(CGSize)arg1 forItemAtIndexPath:(id)arg2 invalidationContext:(id)arg3 {
//Pseudocode:
//    var_138 = arg3;
//    r15 = arg2;
//    var_130 = intrinsic_movsd(var_130, xmm1, arg2, arg3, arg4);
//    var_120 = intrinsic_movsd(var_120, xmm0);
//    rbx = self;
//    var_F8 = [[NSMutableArray array] retain];
//    var_128 = [r15 item];
//    rdx = [r15 item];
//    rdi = [rbx->_items objectAtIndexedSubscript:rdx];
//    r13 = [rdi retain];
//    if (r13 != 0x0) {
//        rdi = var_50;
//        [rdi itemFrame];
//        xmm1 = intrinsic_movsd(xmm1, var_40);
//        xmm0 = intrinsic_movsd(xmm0, var_38);
//    }
//    else {
//        xmm0 = intrinsic_xorpd(xmm0, xmm0);
//        var_40 = intrinsic_movapd(var_40, xmm0);
//        var_50 = intrinsic_movapd(var_50, xmm0);
//        xmm0 = intrinsic_xorpd(xmm0, xmm0);
//        xmm1 = intrinsic_xorpd(xmm1, xmm1);
//    }
//    xmm1 = intrinsic_ucomisd(xmm1, var_120);
//    rcx = var_128;
//    if ((xmm1 != 0x0) || (CPU_FLAGS & P)) goto loc_a1cee3;
//
//loc_a1ced3:
//    xmm0 = intrinsic_ucomisd(xmm0, var_130);
//    if ((xmm0 != 0x0) || (!CPU_FLAGS & NP)) goto loc_a1cee3;
//    
//loc_a1da83:
//    rbx = var_F8;
//    if ([rbx count] != 0x0) {
//        [var_138 invalidateItemsAtIndexPaths:rbx];
//    }
//    [r13 release];
//    [rbx release];
//    return;
//    
//loc_a1cee3:
//    var_140 = r15;
//    r12 = rbx;
//    rax = rcx - r12->_validItemRange;
//    if ((rax < 0x0) || (rax >= *(r12 + *_OBJC_IVAR_$__UIFlowLayoutSection._validItemRange + 0x8))) goto loc_a1d1b5;
//    
//loc_a1cf0c:
//    CGRectGetWidth(rdi);
//    var_150 = intrinsic_movsd(var_150, xmm0);
//    CGRectGetHeight(rdi);
//    var_158 = intrinsic_movsd(var_158, xmm0);
//    xmm0 = intrinsic_movsd(xmm0, var_120);
//    var_40 = intrinsic_movsd(var_40, xmm0);
//    xmm0 = intrinsic_movsd(xmm0, var_130);
//    intrinsic_movsd(var_38, xmm0);
//    [r13 setItemFrame:rdx, rcx];
//    var_148 = r13;
//    [r13 setSizeHasBeenSet:0x1];
//    rax = [var_140 section];
//    r8 = _objc_msgSend;
//    if (rcx < *(r12 + *_OBJC_IVAR_$__UIFlowLayoutSection._validItemRange + 0x8) + r12->_validItemRange) {
//        rbx = var_128;
//        do {
//            var_100 = @selector(indexPathForItem:inSection:);
//            var_108 = @selector(addInvalidatedIndexPath:);
//            var_110 = @selector(addObject:);
//            r15 = rax;
//            r13 = [(r8)(@class(NSIndexPath), var_100, rbx, r15, r8) retain];
//            (r8)(r12, var_108, r13, r15, r8);
//            (r8)(var_F8, var_110, r13, r15, r8);
//            [r13 release];
//            r8 = r8;
//            r12 = r12;
//            rax = r15;
//            rbx = rbx + 0x1;
//        } while (rbx < *(r12 + *_OBJC_IVAR_$__UIFlowLayoutSection._validItemRange + 0x8) + r12->_validItemRange);
//    }
//    var_160 = rax;
//    r13 = r8;
//    rbx = objc_loadWeakRetained(*_OBJC_IVAR_$__UIFlowLayoutSection._layoutInfo + r12);
//    r14 = [rbx horizontal];
//    [rbx release];
//    if (r14 == 0x0) goto loc_a1d1fc;
//    
//loc_a1d0f1:
//    xmm1 = intrinsic_movsd(xmm1, var_130);
//    xmm1 = intrinsic_subsd(xmm1, var_158);
//    xmm0 = intrinsic_xorpd(xmm0, xmm0);
//    xmm0 = intrinsic_ucomisd(xmm0, xmm1);
//    r14 = r13;
//    r13 = var_148;
//    if (xmm0 <= 0x0) goto loc_a1da83;
//    
//loc_a1d119:
//    r15 = [(r14)(r13, @selector(rowObject)) retain];
//    rdi = r12->_rows;
//    var_108 = (r14)(rdi, @selector(indexOfObject:), r15);
//    rbx = r12;
//    CGRectGetMaxX(rdi);
//    var_120 = intrinsic_movsd(var_120, xmm0);
//    if (r15 != 0x0) {
//        rdi = var_70;
//        var_130 = r15;
//        [rdi rowFrame];
//    }
//    else {
//        var_130 = r15;
//        xmm0 = intrinsic_xorpd(xmm0, xmm0);
//        var_60 = intrinsic_movapd(var_60, xmm0);
//        var_70 = intrinsic_movapd(var_70, xmm0);
//    }
//    r12 = var_138;
//    r15 = *_OBJC_IVAR_$__UIFlowLayoutSection._validRect + rbx;
//    CGRectGetMinX(rdi);
//    xmm1 = intrinsic_movsd(xmm1, var_120);
//    xmm1 = intrinsic_subsd(xmm1, xmm0);
//    var_120 = intrinsic_movsd(var_120, xmm1);
//    rdx = var_108;
//    if (rdx > 0x0) {
//        var_100 = rbx;
//        r12 = [(r14)(rbx->_rows, @selector(objectAtIndexedSubscript:), rdx - 0x1) retain];
//        rbx = [(r14)(r12, @selector(items), rdx) retain];
//        r13 = (r14)(rbx, @selector(count), rdx);
//        rdi = rbx;
//        [rdi release];
//        rsi = r12;
//        if (rsi != 0x0) {
//            var_150 = r15;
//            rdi = var_90;
//            var_158 = rsi;
//            [rdi rowFrame];
//        }
//        else {
//            var_158 = rsi;
//            var_150 = r15;
//            xmm0 = intrinsic_xorpd(xmm0, xmm0);
//            var_80 = intrinsic_movapd(var_80, xmm0);
//            var_90 = intrinsic_movapd(var_90, xmm0);
//        }
//        CGRectGetWidth(rdi);
//        var_168 = intrinsic_movsd(var_168, xmm0);
//        r15 = var_128;
//        r12 = var_160;
//        if (r13 > 0x0) {
//            rbx = r15 - r13;
//            do {
//                var_108 = @selector(indexPathForItem:inSection:);
//                r13 = [(r14)(@class(NSIndexPath), var_108, rbx, r12) retain];
//                (r14)(var_100, @selector(addInvalidatedIndexPath:), r13, r12);
//                (r14)(var_F8, @selector(addObject:), r13, r12);
//                [r13 release];
//                rbx = rbx + 0x1;
//            } while (rbx < r15);
//        }
//        rbx = var_100;
//        xmm0 = intrinsic_movsd(xmm0, var_120);
//        xmm0 = intrinsic_addsd(xmm0, var_168);
//        var_120 = intrinsic_movsd(var_120, xmm0);
//        rdi = var_158;
//        [rdi release];
//        r12 = var_138;
//        r13 = var_148;
//        r15 = var_150;
//    }
//    CGRectGetWidth(rdi);
//    xmm0 = intrinsic_subsd(xmm0, var_120);
//    xmm1 = intrinsic_xorpd(xmm1, xmm1);
//    xmm1 = intrinsic_maxsd(xmm1, xmm0);
//    asm { cmpunordsd xmm0, xmm0 };
//    xmm0 = intrinsic_andnpd(xmm0, xmm1);
//    *(r15 + 0x10) = intrinsic_movsd(*(r15 + 0x10), xmm0);
//    CGRectGetMaxX(rdi);
//    var_100 = intrinsic_movsd(var_100, xmm0);
//    CGRectGetMinY(rdi);
//    var_108 = intrinsic_movsd(var_108, xmm0);
//    CGRectGetHeight(rdi);
//    xmm1 = intrinsic_movsd(xmm1, var_100);
//    var_B0 = intrinsic_movsd(var_B0, xmm1);
//    xmm1 = intrinsic_movsd(xmm1, var_108);
//    var_A8 = intrinsic_movsd(var_A8, xmm1);
//    var_A0 = intrinsic_movsd(var_A0, intrinsic_movsd(xmm1, var_120));
//    intrinsic_movsd(var_98, xmm0);
//    rdi = rbx;
//    rdx = (r14)(var_140, @selector(section), rdx);
//    r8 = r12;
//    goto loc_a1da73;
//    
//loc_a1da73:
//    (r14)(rdi, @selector(computeLayoutInRect:forSection:invalidating:invalidationContext:), rdx, 0x1, r8);
//    [var_130 release];
//    goto loc_a1da83;
//    
//loc_a1d1fc:
//    xmm1 = intrinsic_movsd(xmm1, var_120);
//    xmm1 = intrinsic_subsd(xmm1, var_150);
//    var_98 = *_CGSizeCreateDictionaryRepresentation;
//    var_A0 = *_CGShadingRelease;
//    var_A8 = *_CGShadingCreateAxial;
//    xmm0 = intrinsic_xorpd(xmm0, xmm0);
//    xmm0 = intrinsic_ucomisd(xmm0, xmm1);
//    r14 = r13;
//    r13 = var_148;
//    if (xmm0 <= 0x0) goto loc_a1da83;
//    
//loc_a1d256:
//    rbx = [(r14)(r13, @selector(rowObject)) retain];
//    rdi = r12->_rows;
//    var_100 = (r14)(rdi, @selector(indexOfObject:), rbx);
//    CGRectGetMaxY(rdi);
//    var_120 = intrinsic_movsd(var_120, xmm0);
//    if (rbx != 0x0) {
//        rdi = var_D0;
//        var_130 = rbx;
//        [rdi rowFrame];
//    }
//    else {
//        var_130 = rbx;
//        xmm0 = intrinsic_xorpd(xmm0, xmm0);
//        var_C0 = intrinsic_movapd(var_C0, xmm0);
//        var_D0 = intrinsic_movapd(var_D0, xmm0);
//    }
//    r15 = var_140;
//    rbx = *_OBJC_IVAR_$__UIFlowLayoutSection._validRect + r12;
//    CGRectGetMinY(rdi);
//    xmm1 = intrinsic_movsd(xmm1, var_120);
//    xmm1 = intrinsic_subsd(xmm1, xmm0);
//    xmm0 = intrinsic_movapd(xmm0, xmm1);
//    rdx = var_100;
//    if ((rdx != 0x7fffffffffffffff) && (rdx > 0x0)) {
//        var_120 = intrinsic_movsd(var_120, xmm0);
//        var_150 = rbx;
//        r15 = [(r14)(r12->_rows, @selector(objectAtIndexedSubscript:), rdx - 0x1) retain];
//        rbx = [(r14)(r15, @selector(items)) retain];
//        r13 = (r14)(rbx, @selector(count));
//        rdi = rbx;
//        [rdi release];
//        rsi = r15;
//        if (rsi != 0x0) {
//            rdi = var_F0;
//            var_158 = rsi;
//            [rdi rowFrame];
//        }
//        else {
//            var_158 = rsi;
//            xmm0 = intrinsic_xorpd(xmm0, xmm0);
//            var_E0 = intrinsic_movapd(var_E0, xmm0);
//            var_F0 = intrinsic_movapd(var_F0, xmm0);
//        }
//        CGRectGetHeight(rdi);
//        var_168 = intrinsic_movsd(var_168, xmm0);
//        var_100 = r12;
//        r15 = var_128;
//        r12 = var_160;
//        if (r13 > 0x0) {
//            rbx = r15 - r13;
//            do {
//                var_108 = @selector(indexPathForItem:inSection:);
//                var_110 = @selector(addInvalidatedIndexPath:);
//                r13 = [(r14)(@class(NSIndexPath), var_108, rbx, r12) retain];
//                (r14)(var_100, var_110, r13, r12);
//                (r14)(var_F8, @selector(addObject:), r13, r12);
//                [r13 release];
//                rbx = rbx + 0x1;
//            } while (rbx < r15);
//        }
//        xmm0 = intrinsic_movsd(xmm0, var_120);
//        xmm0 = intrinsic_addsd(xmm0, var_168);
//        var_120 = intrinsic_movsd(var_120, xmm0);
//        rdi = var_158;
//        [rdi release];
//        rbx = var_138;
//        r13 = var_148;
//        r15 = var_140;
//    }
//    else {
//        var_150 = rbx;
//        var_100 = r12;
//        rbx = var_138;
//        var_120 = intrinsic_movsd(var_120, xmm0);
//    }
//    var_B0 = *_CGRectZero;
//    r12 = var_150;
//    CGRectGetHeight(rdi);
//    xmm0 = intrinsic_subsd(xmm0, var_120);
//    xmm1 = intrinsic_xorpd(xmm1, xmm1);
//    xmm1 = intrinsic_maxsd(xmm1, xmm0);
//    asm { cmpunordsd xmm0, xmm0 };
//    xmm0 = intrinsic_andnpd(xmm0, xmm1);
//    *(r12 + 0x18) = intrinsic_movsd(*(r12 + 0x18), xmm0);
//    CGRectGetMinX(rdi);
//    var_108 = intrinsic_movsd(var_108, xmm0);
//    CGRectGetMaxY(rdi);
//    var_110 = intrinsic_movsd(var_110, xmm0);
//    CGRectGetWidth(rdi);
//    xmm1 = intrinsic_movsd(xmm1, var_108);
//    var_B0 = intrinsic_movsd(var_B0, xmm1);
//    var_A8 = intrinsic_movsd(var_A8, intrinsic_movsd(xmm1, var_110));
//    var_A0 = intrinsic_movsd(var_A0, xmm0);
//    intrinsic_movsd(var_98, intrinsic_movsd(xmm0, var_120));
//    rdi = var_100;
//    rdx = (r14)(r15, @selector(section));
//    r8 = rbx;
//    goto loc_a1da73;
//    
//loc_a1d1b5:
//    [r13 setItemFrame:rdx, rcx];
//    [r13 setSizeHasBeenSet:0x1];
//    goto loc_a1da83;
}

- (void)sizeChangedForItem:(id)arg1 atIndexPath:(id)arg2 inRow:(id)arg3 {
    
    
    
//    var_1E8 = arg3;
//    var_278 = [arg2 retain];
//    r13 = [arg4 retain];
//    var_280 = r13;
//    r12 = [self retain];
//    var_220 = r12;
//    var_138 = r12;
//    rbx = objc_loadWeakRetained(*_OBJC_IVAR_$__UIFlowLayoutSection._layoutInfo + r12);
//    var_221 = [rbx horizontal];
//    [rbx release];
//    var_218 = [r12->_rows indexOfObject:r13];
//    var_270 = [[r13 items] retain];
//    r13 = [r12->_rows count];
//    if (r13 > 0x0) {
//        if (var_218 == 0x0) {
//            rbx = [var_1E8 item];
//            rbx = rbx - [var_270 indexOfObject:var_278];
//            rax = r12->_validItemRange;
//            COND = rbx != rax;
//            if ((!COND) && (rax != 0x0)) {
//                rax = [var_270 count];
//                r12->_validItemRange = r12->_validItemRange + rax;
//                *(r12 + *_OBJC_IVAR_$__UIFlowLayoutSection._validItemRange + 0x8) = *(r12 + *_OBJC_IVAR_$__UIFlowLayoutSection._validItemRange + 0x8) - rax;
//                rdi = var_280;
//                [rdi rowSize];
//                r15 = _objc_msgSend;
//                if (var_221 != 0x0) {
//                    xmm1 = intrinsic_movsd(xmm1, r12->_horizontalInterstice);
//                    xmm1 = intrinsic_addsd(xmm1, xmm0);
//                    rbx = *_OBJC_IVAR_$__UIFlowLayoutSection._validRect;
//                    xmm1 = intrinsic_addsd(xmm1, *(r12 + rbx));
//                    *(r12 + rbx) = intrinsic_movsd(*(r12 + rbx), xmm1);
//                    var_1E8 = intrinsic_movsd(var_1E8, xmm0);
//                    CGRectGetWidth(rdi);
//                    xmm1 = intrinsic_movsd(xmm1, var_1E8);
//                    xmm1 = intrinsic_addsd(xmm1, r12->_horizontalInterstice);
//                    xmm0 = intrinsic_subsd(xmm0, xmm1);
//                    xmm1 = intrinsic_xorpd(xmm1, xmm1);
//                    xmm1 = intrinsic_maxsd(xmm1, xmm0);
//                    asm { cmpunordsd xmm0, xmm0 };
//                    xmm0 = intrinsic_andnpd(xmm0, xmm1);
//                    *(r12 + rbx + 0x10) = intrinsic_movsd(*(r12 + rbx + 0x10), xmm0);
//                }
//                else {
//                    xmm0 = intrinsic_movsd(xmm0, r12->_verticalInterstice);
//                    xmm0 = intrinsic_addsd(xmm0, xmm1);
//                    rbx = *_OBJC_IVAR_$__UIFlowLayoutSection._validRect;
//                    xmm0 = intrinsic_addsd(xmm0, *(r12 + rbx + 0x8));
//                    *(r12 + rbx + 0x8) = intrinsic_movsd(*(r12 + rbx + 0x8), xmm0);
//                    var_1E8 = intrinsic_movsd(var_1E8, xmm1);
//                    CGRectGetHeight(rdi);
//                    xmm1 = intrinsic_movsd(xmm1, var_1E8);
//                    xmm1 = intrinsic_addsd(xmm1, r12->_verticalInterstice);
//                    xmm0 = intrinsic_subsd(xmm0, xmm1);
//                    xmm1 = intrinsic_xorpd(xmm1, xmm1);
//                    xmm1 = intrinsic_maxsd(xmm1, xmm0);
//                    asm { cmpunordsd xmm0, xmm0 };
//                    xmm0 = intrinsic_andnpd(xmm0, xmm1);
//                    *(r12 + rbx + 0x18) = intrinsic_movsd(*(r12 + rbx + 0x18), xmm0);
//                }
//                var_220 = r12;
//                xmm0 = intrinsic_xorpd(xmm0, xmm0);
//                intrinsic_movapd(var_170, xmm0);
//                intrinsic_movapd(var_180, xmm0);
//                var_190 = intrinsic_movapd(var_190, xmm0);
//                var_1A0 = intrinsic_movapd(var_1A0, xmm0);
//                rbx = r15;
//                rax = (rbx)(var_280, @selector(items));
//                rax = [rax retain];
//                var_1F8 = rax;
//                rax = (rbx)(rax, @selector(countByEnumeratingWithState:objects:count:), var_1A0, var_B0, 0x10);
//                var_1E8 = rax;
//                if (rax != 0x0) {
//                    var_1F0 = *var_190;
//                    do {
//                        r12 = 0x0;
//                        do {
//                            if (*var_190 != var_1F0) {
//                                objc_enumerationMutation(var_1F8);
//                            }
//                            (rbx)(*(var_198 + r12 * 0x8), @selector(setPositionEstimated:), 0x1);
//                            (rbx)(*(var_198 + r12 * 0x8), @selector(setRowObject:), 0x0);
//                            ___61-[_UIFlowLayoutSection sizeChangedForItem:atIndexPath:inRow:]_block_invoke(__NSConcreteStackBlock, *(var_198 + r12 * 0x8));
//                            r12 = r12 + 0x1;
//                        } while (r12 < var_1E8);
//                        rax = [var_1F8 countByEnumeratingWithState:var_1A0 objects:var_B0 count:0x10];
//                        var_1E8 = rax;
//                    } while (rax != 0x0);
//                }
//                [var_1F8 release];
//                [var_220->_rows removeObjectAtIndex:0x0];
//            }
//            else {
//                if (r13 > var_218) {
//                    var_240 = *_OBJC_IVAR_$__UIFlowLayoutSection._validRect + r12;
//                    do {
//                        r13 = r13 - 0x1;
//                        r15 = [[r12->_rows objectAtIndexedSubscript:r13] retain];
//                        rbx = [[r15 items] retain];
//                        *(r12 + *_OBJC_IVAR_$__UIFlowLayoutSection._validItemRange + 0x8) = *(r12 + *_OBJC_IVAR_$__UIFlowLayoutSection._validItemRange + 0x8) - [rbx count];
//                        rdi = rbx;
//                        [rdi release];
//                        if (var_221 != 0x0) {
//                            var_208 = r13;
//                            rbx = var_240;
//                            CGRectGetWidth(rdi);
//                            var_1E8 = intrinsic_movsd(var_1E8, xmm0);
//                            [r15 rowSize];
//                            xmm0 = intrinsic_addsd(xmm0, r12->_horizontalInterstice);
//                            xmm1 = intrinsic_movsd(xmm1, var_1E8);
//                            xmm1 = intrinsic_subsd(xmm1, xmm0);
//                            xmm0 = intrinsic_xorpd(xmm0, xmm0);
//                            xmm0 = intrinsic_maxsd(xmm0, xmm1);
//                            asm { cmpunordsd xmm1, xmm1 };
//                            xmm1 = intrinsic_andnpd(xmm1, xmm0);
//                            *(rbx + 0x10) = intrinsic_movsd(*(rbx + 0x10), xmm1);
//                        }
//                        else {
//                            var_208 = r13;
//                            rbx = var_240;
//                            CGRectGetHeight(rdi);
//                            var_1E8 = intrinsic_movsd(var_1E8, xmm0);
//                            [r15 rowSize];
//                            xmm1 = intrinsic_addsd(xmm1, r12->_verticalInterstice);
//                            xmm2 = intrinsic_movsd(xmm2, var_1E8);
//                            xmm2 = intrinsic_subsd(xmm2, xmm1);
//                            xmm0 = intrinsic_xorpd(xmm0, xmm0);
//                            xmm0 = intrinsic_maxsd(xmm0, xmm2);
//                            asm { cmpunordsd xmm2, xmm2 };
//                            xmm2 = intrinsic_andnpd(xmm2, xmm0);
//                            *(rbx + 0x18) = intrinsic_movsd(*(rbx + 0x18), xmm2);
//                        }
//                        xmm0 = intrinsic_xorpd(xmm0, xmm0);
//                        var_1B0 = intrinsic_movapd(var_1B0, xmm0);
//                        var_1C0 = intrinsic_movapd(var_1C0, xmm0);
//                        var_1D0 = intrinsic_movapd(var_1D0, xmm0);
//                        var_1E0 = intrinsic_movapd(var_1E0, xmm0);
//                        var_210 = r15;
//                        rax = [r15 items];
//                        rax = [rax retain];
//                        var_1F8 = rax;
//                        rax = [rax countByEnumeratingWithState:var_1E0 objects:var_130 count:0x10];
//                        var_1E8 = rax;
//                        if (rax != 0x0) {
//                            var_1F0 = *var_1D0;
//                            do {
//                                r15 = 0x0;
//                                do {
//                                    if (*var_1D0 != var_1F0) {
//                                        objc_enumerationMutation(var_1F8);
//                                    }
//                                    [*(var_1D8 + r15 * 0x8) setPositionEstimated:0x1];
//                                    [*(var_1D8 + r15 * 0x8) setRowObject:0x0];
//                                    ___61-[_UIFlowLayoutSection sizeChangedForItem:atIndexPath:inRow:]_block_invoke(__NSConcreteStackBlock, *(var_1D8 + r15 * 0x8));
//                                    r15 = r15 + 0x1;
//                                } while (r15 < var_1E8);
//                                rax = [var_1F8 countByEnumeratingWithState:var_1E0 objects:var_130 count:0x10];
//                                var_1E8 = rax;
//                            } while (rax != 0x0);
//                        }
//                        [var_1F8 release];
//                        r12 = var_220;
//                        r13 = var_208;
//                        [r12->_rows removeObjectAtIndex:r13];
//                        [var_210 release];
//                    } while (r13 > var_218);
//                }
//            }
//        }
//        else {
//            if (r13 > var_218) {
//                var_240 = *_OBJC_IVAR_$__UIFlowLayoutSection._validRect + r12;
//                do {
//                    r13 = r13 - 0x1;
//                    r15 = [[r12->_rows objectAtIndexedSubscript:r13] retain];
//                    rbx = [[r15 items] retain];
//                    *(r12 + *_OBJC_IVAR_$__UIFlowLayoutSection._validItemRange + 0x8) = *(r12 + *_OBJC_IVAR_$__UIFlowLayoutSection._validItemRange + 0x8) - [rbx count];
//                    rdi = rbx;
//                    [rdi release];
//                    if (var_221 != 0x0) {
//                        var_208 = r13;
//                        rbx = var_240;
//                        CGRectGetWidth(rdi);
//                        var_1E8 = intrinsic_movsd(var_1E8, xmm0);
//                        [r15 rowSize];
//                        xmm0 = intrinsic_addsd(xmm0, r12->_horizontalInterstice);
//                        xmm1 = intrinsic_movsd(xmm1, var_1E8);
//                        xmm1 = intrinsic_subsd(xmm1, xmm0);
//                        xmm0 = intrinsic_xorpd(xmm0, xmm0);
//                        xmm0 = intrinsic_maxsd(xmm0, xmm1);
//                        asm { cmpunordsd xmm1, xmm1 };
//                        xmm1 = intrinsic_andnpd(xmm1, xmm0);
//                        *(rbx + 0x10) = intrinsic_movsd(*(rbx + 0x10), xmm1);
//                    }
//                    else {
//                        var_208 = r13;
//                        rbx = var_240;
//                        CGRectGetHeight(rdi);
//                        var_1E8 = intrinsic_movsd(var_1E8, xmm0);
//                        [r15 rowSize];
//                        xmm1 = intrinsic_addsd(xmm1, r12->_verticalInterstice);
//                        xmm2 = intrinsic_movsd(xmm2, var_1E8);
//                        xmm2 = intrinsic_subsd(xmm2, xmm1);
//                        xmm0 = intrinsic_xorpd(xmm0, xmm0);
//                        xmm0 = intrinsic_maxsd(xmm0, xmm2);
//                        asm { cmpunordsd xmm2, xmm2 };
//                        xmm2 = intrinsic_andnpd(xmm2, xmm0);
//                        *(rbx + 0x18) = intrinsic_movsd(*(rbx + 0x18), xmm2);
//                    }
//                    xmm0 = intrinsic_xorpd(xmm0, xmm0);
//                    var_1B0 = intrinsic_movapd(var_1B0, xmm0);
//                    var_1C0 = intrinsic_movapd(var_1C0, xmm0);
//                    var_1D0 = intrinsic_movapd(var_1D0, xmm0);
//                    var_1E0 = intrinsic_movapd(var_1E0, xmm0);
//                    var_210 = r15;
//                    rax = [r15 items];
//                    rax = [rax retain];
//                    var_1F8 = rax;
//                    rax = [rax countByEnumeratingWithState:var_1E0 objects:var_130 count:0x10];
//                    var_1E8 = rax;
//                    if (rax != 0x0) {
//                        var_1F0 = *var_1D0;
//                        do {
//                            r15 = 0x0;
//                            do {
//                                if (*var_1D0 != var_1F0) {
//                                    objc_enumerationMutation(var_1F8);
//                                }
//                                [*(var_1D8 + r15 * 0x8) setPositionEstimated:0x1];
//                                [*(var_1D8 + r15 * 0x8) setRowObject:0x0];
//                                ___61-[_UIFlowLayoutSection sizeChangedForItem:atIndexPath:inRow:]_block_invoke(__NSConcreteStackBlock, *(var_1D8 + r15 * 0x8));
//                                r15 = r15 + 0x1;
//                            } while (r15 < var_1E8);
//                            rax = [var_1F8 countByEnumeratingWithState:var_1E0 objects:var_130 count:0x10];
//                            var_1E8 = rax;
//                        } while (rax != 0x0);
//                    }
//                    [var_1F8 release];
//                    r12 = var_220;
//                    r13 = var_208;
//                    [r12->_rows removeObjectAtIndex:r13];
//                    [var_210 release];
//                } while (r13 > var_218);
//            }
//        }
//    }
//    [var_270 release];
//    [var_138 release];
//    [var_280 release];
//    [var_278 release];
//    if (*___stack_chk_guard != *___stack_chk_guard) {
//        __stack_chk_fail();
//    }
//    return;
    
//    
//    ___61-[_UIFlowLayoutSection sizeChangedForItem:atIndexPath:inRow:]_block_invoke
//
//Pseudocode:
//    r14 = arg0;
//    rbx = [arg1 retain];
//    if (([rbx isSizeEstimated] != 0x0) && ([rbx sizeHasBeenSet] == 0x0)) {
//        r13 = [[*(r14 + 0x20) layoutInfo] retain];
//        [r13 computedEstimatedSize];
//        var_58 = intrinsic_movsd(var_58, xmm0);
//        var_60 = intrinsic_movsd(var_60, xmm1);
//        [r13 release];
//        xmm0 = intrinsic_movsd(xmm0, var_58);
//        xmm0 = intrinsic_ucomisd(xmm0, *_CGSizeZero);
//        if ((xmm0 == 0x0) && (!CPU_FLAGS & P)) {
//            xmm0 = intrinsic_movsd(xmm0, var_60);
//            xmm0 = intrinsic_ucomisd(xmm0, *_CPBitmapCreateImagesFromData);
//            if (xmm0 == 0x0) {
//                if (!CPU_FLAGS & NP) {
//                    if (rbx != 0x0) {
//                        [var_50 itemFrame];
//                    }
//                    else {
//                        xmm0 = intrinsic_xorpd(xmm0, xmm0);
//                        var_40 = intrinsic_movapd(var_40, xmm0);
//                        var_50 = intrinsic_movapd(var_50, xmm0);
//                    }
//                    r14 = [[*(r14 + 0x20) layoutInfo] retain];
//                    [r14 computedEstimatedSize];
//                    var_40 = intrinsic_movsd(var_40, xmm0);
//                    var_38 = intrinsic_movsd(var_38, xmm1);
//                    [r14 release];
//                    [rbx setItemFrame:@selector(itemFrame), rcx];
//                }
//            }
//            else {
//                if (rbx != 0x0) {
//                    [var_50 itemFrame];
//                }
//                else {
//                    xmm0 = intrinsic_xorpd(xmm0, xmm0);
//                    var_40 = intrinsic_movapd(var_40, xmm0);
//                    var_50 = intrinsic_movapd(var_50, xmm0);
//                }
//                r14 = [[*(r14 + 0x20) layoutInfo] retain];
//                [r14 computedEstimatedSize];
//                var_40 = intrinsic_movsd(var_40, xmm0);
//                var_38 = intrinsic_movsd(var_38, xmm1);
//                [r14 release];
//                [rbx setItemFrame:@selector(itemFrame), rcx];
//            }
//        }
//        else {
//            if (rbx != 0x0) {
//                [var_50 itemFrame];
//            }
//            else {
//                xmm0 = intrinsic_xorpd(xmm0, xmm0);
//                var_40 = intrinsic_movapd(var_40, xmm0);
//                var_50 = intrinsic_movapd(var_50, xmm0);
//            }
//            r14 = [[*(r14 + 0x20) layoutInfo] retain];
//            [r14 computedEstimatedSize];
//            var_40 = intrinsic_movsd(var_40, xmm0);
//            var_38 = intrinsic_movsd(var_38, xmm1);
//            [r14 release];
//            [rbx setItemFrame:@selector(itemFrame), rcx];
//        }
//    }
//    [rbx release];
//    return;

}


- (id)snapshot {
    _RDFlowLayoutSection *newSection = [[_RDFlowLayoutSection alloc] init];
    for (_RDFlowLayoutRow *row in self.rows) {
        _RDFlowLayoutRow *newRow = [row snapshot];
        [[newSection rows] addObject:newRow];
        [[newSection items] addObjectsFromArray:[newRow items]];
    }
    [newSection setFrame:self.frame]; // VERIFY
    return newSection;
}

- (void)updateEstimatedSizeForSection:(NSInteger)sectionIndex {
    
//    r15 = arg2;
//    r14 = self;
//    rdi = *_OBJC_IVAR_$__UIFlowLayoutSection._layoutInfo + r14;
//    var_3B8 = rdi;
//    rbx = objc_loadWeakRetained(rdi);
//    r12 = [rbx horizontal];
    
    BOOL isHorizontal = [_layoutInfo horizontal];
    
//    if ([r14->_items count] == 0x0) goto loc_a1b84f;
    
    if ([_items count] != 0) {
        
//    loc_a1b593:
//        var_3C0 = r15;
//        rbx = r14;
//        if ([r14->_rows count] == 0x0) goto loc_a1b8cf;
        
        if ([_rows count] != 0) {
//        loc_a1b5ba:
//            xmm0 = intrinsic_xorpd(xmm0, xmm0);
//            if (r12 != 0x0) {
            
            if (isHorizontal) {
                
//                intrinsic_movapd(var_240, xmm0);
//                intrinsic_movapd(var_250, xmm0);
//                var_260 = intrinsic_movapd(var_260, xmm0);
//                var_270 = intrinsic_movapd(var_270, xmm0);
//                var_3A0 = rbx;
//                rax = [rbx->_rows retain];
//                var_3A8 = rax;
//                rcx = var_B0;
//                rdi = rax;
//                rbx = [rdi countByEnumeratingWithState:var_270 objects:rcx count:0x10];
//                xmm0 = intrinsic_xorpd(xmm0, xmm0);
//                var_398 = intrinsic_movsd(var_398, xmm0);
//                if (rbx != 0x0) {
//                    r14 = *var_260;
//                    xmm0 = intrinsic_xorpd(xmm0, xmm0);
//                    var_398 = intrinsic_movsd(var_398, xmm0);
//                    do {
//                        r12 = 0x0;
//                        do {
//                            if (*var_260 != r14) {
//                                rdi = var_3A8;
//                                objc_enumerationMutation(rdi);
//                            }
//                            rsi = *(var_268 + r12 * 0x8);
//                            if (rsi != 0x0) {
//                                rdi = var_290;
//                                [rdi rowFrame];
//                            }
//                            else {
//                                xmm0 = intrinsic_xorpd(xmm0, xmm0);
//                                var_280 = intrinsic_movapd(var_280, xmm0);
//                                var_290 = intrinsic_movapd(var_290, xmm0);
//                            }
//                            CGRectGetWidth(rdi);
//                            xmm0 = intrinsic_addsd(xmm0, var_3A0->_horizontalInterstice);
//                            xmm1 = intrinsic_movsd(xmm1, var_398);
//                            xmm1 = intrinsic_addsd(xmm1, xmm0);
//                            var_398 = intrinsic_movsd(var_398, xmm1);
//                            r12 = r12 + 0x1;
//                        } while (r12 < rbx);
//                        rdi = var_3A8;
//                        rcx = var_B0;
//                        rbx = [rdi countByEnumeratingWithState:var_270 objects:rcx count:0x10];
//                    } while (rbx != 0x0);
//                }
//                [var_3A8 release];
                
                CGFloat totalWidth = 0;
                for (_RDFlowLayoutRow *row in _rows) {
                    CGRect rowFrame = [row rowFrame];
                    totalWidth += CGRectGetWidth(rowFrame) + _horizontalInterstice;
                }
                
//                temp_0 = var_3A0->_itemsCount / *(var_3A0 + *_OBJC_IVAR_$__UIFlowLayoutSection._validItemRange + 0x8);
//                xmm0 = intrinsic_punpckldq(zero_extend_64(temp_0), *(int128_t *)0xc4f620);
//                xmm0 = intrinsic_subpd(xmm0, *(int128_t *)0xc4f630);
//                xmm0 = intrinsic_haddpd(xmm0, xmm0);
//                round(xmm0);
//                xmm0 = intrinsic_mulsd(xmm0, var_398);
//                xmm0 = intrinsic_subsd(xmm0, var_3A0->_horizontalInterstice);
//                xmm1 = intrinsic_movapd(xmm1, xmm0);
//                xmm0 = intrinsic_movsd(xmm0, *(var_3A0 + *_OBJC_IVAR_$__UIFlowLayoutSection._sectionMargins + 0x8));
//                xmm0 = intrinsic_addsd(xmm0, *(var_3A0 + *_OBJC_IVAR_$__UIFlowLayoutSection._sectionMargins + 0x18));
//                xmm0 = intrinsic_addsd(xmm0, var_3A0->_headerDimension);
//                xmm0 = intrinsic_addsd(xmm0, var_3A0->_footerDimension);
//                xmm1 = intrinsic_addsd(xmm1, xmm0);
//                var_398 = intrinsic_movsd(var_398, xmm1);
//                r12 = objc_loadWeakRetained(var_3B8);
//                [r12 dimension];
//                intrinsic_movapd(xmm1, xmm0);
//                intrinsic_movsd(xmm0, var_398);
//                [var_3A0 setEstimatedSize:var_3C0 forSection:rcx];
//                [r12 release];
                
                // TODO
                // 0000000000c4f620  0x4530000043300000, 0x0000000000000000
                // 0000000000c4f630  0x4330000000000000, 0x4530000000000000
                //        CGFloat temp0 = (CGFloat)_itemsCount / (CGFloat)_validItemRange.length;
                //        xmm0 = intrinsic_punpckldq(zero_extend_64(temp_0), *(int128_t *)0xc4f620);
                //        xmm0 = intrinsic_subpd(xmm0, *(int128_t *)0xc4f630);
                //        xmm0 = intrinsic_haddpd(xmm0, xmm0);
                //        round(xmm0);
                //        xmm0 = intrinsic_mulsd(xmm0, var_398);
                //        xmm0 = intrinsic_subsd(xmm0, var_3A0->_horizontalInterstice);
                //        xmm0 += _sectionMargins.left + _sectionMargins.right + _headerDimension + _footerDimension;
                
                CGSize estimatedSize = CGSizeMake(totalWidth, [_layoutInfo dimension]);
                [self setEstimatedSize:estimatedSize forSection:sectionIndex];
            }
            else {
//                intrinsic_movapd(var_2A0, xmm0);
//                intrinsic_movapd(var_2B0, xmm0);
//                var_2C0 = intrinsic_movapd(var_2C0, xmm0);
//                var_2D0 = intrinsic_movapd(var_2D0, xmm0);
//                var_3A0 = rbx;
//                rax = [rbx->_rows retain];
//                var_3A8 = rax;
//                rcx = var_130;
//                rdi = rax;
//                rbx = [rdi countByEnumeratingWithState:var_2D0 objects:rcx count:0x10];
//                xmm1 = intrinsic_xorpd(xmm1, xmm1);
//                if (rbx != 0x0) {
//                    r14 = *var_2C0;
//                    xmm1 = intrinsic_xorpd(xmm1, xmm1);
//                    do {
//                        r12 = 0x0;
//                        do {
//                            var_398 = intrinsic_movsd(var_398, xmm1);
//                            if (*var_2C0 != r14) {
//                                rdi = var_3A8;
//                                objc_enumerationMutation(rdi);
//                            }
//                            rsi = *(var_2C8 + r12 * 0x8);
//                            if (rsi != 0x0) {
//                                rdi = var_2F0;
//                                [rdi rowFrame];
//                            }
//                            else {
//                                xmm0 = intrinsic_xorpd(xmm0, xmm0);
//                                var_2E0 = intrinsic_movapd(var_2E0, xmm0);
//                                var_2F0 = intrinsic_movapd(var_2F0, xmm0);
//                            }
//                            CGRectGetHeight(rdi);
//                            xmm0 = intrinsic_addsd(xmm0, var_3A0->_verticalInterstice);
//                            xmm1 = intrinsic_movsd(xmm1, var_398);
//                            xmm1 = intrinsic_addsd(xmm1, xmm0);
//                            r12 = r12 + 0x1;
//                        } while (r12 < rbx);
//                        rdi = var_3A8;
//                        var_398 = intrinsic_movsd(var_398, xmm1, var_2D0, var_130, 0x10);
//                        rax = [rdi countByEnumeratingWithState:rdx objects:rcx count:r8];
//                        xmm1 = intrinsic_movsd(xmm1, var_398);
//                        rbx = rax;
//                    } while (rbx != 0x0);
//                }
                CGFloat totalHeight = 0;
                for (_RDFlowLayoutRow *row in _rows) {
                    CGRect rowFrame = [row rowFrame];
                    totalHeight += CGRectGetHeight(rowFrame) + _verticalInterstice;
                }
                
                
//                var_398 = intrinsic_movsd(var_398, xmm1);
//                [var_3A8 release];
//                rbx = var_3A0;
//                rax = *(rbx + *_OBJC_IVAR_$__UIFlowLayoutSection._validItemRange + 0x8);
//                if (rax != 0x0) {
//                    xmm2 = intrinsic_cvtsi2sd(xmm2, rbx->_itemsCount);
//                    xmm1 = intrinsic_punpckldq(zero_extend_64(rax), *(int128_t *)0xc4f620);
//                    xmm1 = intrinsic_subpd(xmm1, *(int128_t *)0xc4f630);
//                    xmm1 = intrinsic_haddpd(xmm1, xmm1);
//                    xmm2 = intrinsic_divsd(xmm2, xmm1);
//                    xmm0 = intrinsic_movsd(xmm0, var_398);
//                    xmm0 = intrinsic_mulsd(xmm0, xmm2);
//                    round(xmm0);
//                    xmm0 = intrinsic_subsd(xmm0, rbx->_verticalInterstice);
//                    xmm1 = intrinsic_movsd(xmm1, rbx->_sectionMargins);
//                    xmm1 = intrinsic_addsd(xmm1, *(rbx + *_OBJC_IVAR_$__UIFlowLayoutSection._sectionMargins + 0x10));
//                    xmm1 = intrinsic_addsd(xmm1, rbx->_headerDimension);
//                    xmm1 = intrinsic_addsd(xmm1, rbx->_footerDimension);
//                    xmm1 = intrinsic_addsd(xmm1, xmm0);
//                    var_398 = intrinsic_movsd(var_398, xmm1);
//                }
//                r12 = rbx;
//                r13 = objc_loadWeakRetained(var_3B8);
//                [r13 dimension];
//                intrinsic_movsd(xmm1, var_398);
//                [r12 setEstimatedSize:var_3C0 forSection:rcx];
//                [r13 release];
                
                
                // TODO: as above
                CGSize estimatedSize = CGSizeMake([_layoutInfo dimension], totalHeight);
                [self setEstimatedSize:estimatedSize forSection:sectionIndex];
                
                
            }
//            goto loc_a1c3e5;
//            
//        loc_a1c3e5:
            return;
        }
        else { // rows.count == 0
            
//        loc_a1b8cf:
//            r15 = objc_loadWeakRetained(var_3B8);
//            [r15 dimension];
//            var_398 = intrinsic_movsd(var_398, xmm0);
//            if (r12 == 0x0) goto loc_a1bed1;
            
            if (isHorizontal) {
                
//            loc_a1b909:
//                xmm0 = intrinsic_movsd(xmm0, rbx->_sectionMargins);
//                var_3A0 = intrinsic_movsd(var_3A0, xmm0);
//                xmm0 = intrinsic_movsd(xmm0, *(rbx + *_OBJC_IVAR_$__UIFlowLayoutSection._sectionMargins + 0x10));
//                var_3A8 = intrinsic_movsd(var_3A8, xmm0);
//                [r15 release];
//                xmm0 = intrinsic_xorpd(xmm0, xmm0);
//                intrinsic_movapd(var_300, xmm0);
//                intrinsic_movapd(var_310, xmm0);
//                var_320 = intrinsic_movapd(var_320, xmm0);
//                var_330 = intrinsic_movapd(var_330, xmm0);
//                r15 = [rbx->_items retain];
//                rdi = r15;
//                r12 = [rdi countByEnumeratingWithState:var_330 objects:var_1B0 count:0x10];
//                if (r12 == 0x0) goto loc_a1c1df;
                
                CGFloat var_3A0 = _sectionMargins.top;
                CGFloat var_3A8 = _sectionMargins.bottom;
                
                NSInteger count = 0;
                if (count != 0 ) {
                    
//                loc_a1b997:
//                    var_3B0 = r15;
//                    r14 = rbx;
//                    xmm1 = intrinsic_movsd(xmm1, var_3A0);
//                    xmm1 = intrinsic_addsd(xmm1, var_3A8);
//                    xmm0 = intrinsic_movsd(xmm0, var_398);
//                    xmm0 = intrinsic_subsd(xmm0, xmm1);
//                    var_398 = intrinsic_movsd(var_398, xmm0);
//                    r15 = *var_320;
//                    xmm0 = intrinsic_xorpd(xmm0, xmm0);
//                    var_3A0 = intrinsic_movsd(var_3A0, xmm0);
//                    rax = 0x0;
//                    goto loc_a1b9eb;
                    
                    var_3A0 = 0;
                    
//                loc_a1b9eb:
//                    var_3C8 = rax;
//                    r13 = 0x0;
//                    goto loc_a1ba0a;
                    
                    NSInteger index = 0;
                    
//                loc_a1ba0a:
//                    if (*var_320 != r15) {
//                        rdi = var_3B0;
//                        objc_enumerationMutation(rdi);
//                    }
//                    rsi = *(var_328 + r13 * 0x8);
//                    if (rsi != 0x0) {
//                        rdi = var_350;
//                        [rdi itemFrame];
//                    }
//                    else {
//                        xmm0 = intrinsic_xorpd(xmm0, xmm0);
//                        var_340 = intrinsic_movapd(var_340, xmm0);
//                        var_350 = intrinsic_movapd(var_350, xmm0);
//                    }
//                    CGRectGetHeight(rdi);
//                    xmm1 = intrinsic_movsd(xmm1, var_398);
//                    xmm1 = intrinsic_ucomisd(xmm1, xmm0);
//                    if (xmm1 < 0x0) goto loc_a1c173;
                    
                    CGFloat xmm1 = 0;
                    if (xmm1 >= 0x0) {
//                    loc_a1baa1:
//                        CGRectGetHeight(rdi);
//                        xmm0 = intrinsic_addsd(xmm0, r14->_verticalInterstice);
//                        xmm1 = intrinsic_movsd(xmm1, var_398);
//                        xmm1 = intrinsic_subsd(xmm1, xmm0);
//                        var_398 = intrinsic_movsd(var_398, xmm1);
//                        CGRectGetWidth(rdi);
//                        xmm3 = intrinsic_movsd(xmm3, var_3A0);
//                        xmm1 = intrinsic_movapd(xmm1, xmm3);
//                        asm { cmpunordsd xmm1, xmm1 };
//                        xmm2 = intrinsic_movapd(xmm2, xmm1);
//                        xmm2 = intrinsic_andpd(xmm2, xmm0);
//                        xmm0 = intrinsic_maxsd(xmm0, xmm3);
//                        xmm1 = intrinsic_andnpd(xmm1, xmm0);
//                        xmm1 = intrinsic_orpd(xmm1, xmm2);
//                        var_3A0 = intrinsic_movsd(var_3A0, xmm1);
//                        r13 = r13 + 0x1;
//                        if (r13 < r12) goto loc_a1ba0a;
                        
                        // var_3A0 = ?
                        
                        BOOL bNextIndex = YES;
                        if (bNextIndex == NO) {
//                        loc_a1bb5c:
//                            rdi = var_3B0;
//                            r12 = [rdi countByEnumeratingWithState:var_330 objects:var_1B0 count:0x10];
//                            rcx = var_3C8;
//                            rax = rcx + r13;
//                            if (r12 != 0x0) goto loc_a1b9eb;
                            
                            BOOL bLoop = YES;
                            if (bLoop != 0) {
//                            loc_a1b9eb:
//                                var_3C8 = rax;
//                                r13 = 0x0;
//                                goto loc_a1ba0a;
                            }
                            else {
//                            loc_a1bb9b:
//                                r15 = rcx + r13;
//                                goto loc_a1c184;
                                
                                CGFloat itemDivider = 0 + index; // ?
                                
//                            loc_a1c184:
//                                [var_3B0 release];
//                                rbx = r14;
//                                if (r15 == 0x0) {
//                                    [rbx logInvalidSizes];
//                                    r15 = 0x1;
//                                }
//                                goto loc_a1c211;
                                
                                if (itemDivider == 0) {
                                    [self logInvalidSizes];
                                    itemDivider = 1;
                                }
                                
//                            loc_a1c211:
//
                                
                                CGFloat itemsRatio = ceil((CGFloat)_itemsCount / (CGFloat)itemDivider);
                                CGFloat width = (itemsRatio * (var_3A0 + _horizontalInterstice)) - _horizontalInterstice + _sectionMargins.left + _sectionMargins.right + _headerDimension + _footerDimension;
                                
                                [self setEstimatedSize:CGSizeMake(width, [_layoutInfo dimension]) forSection:sectionIndex];
                                return;
                            }
                        }
                        
                    } else { // xmm1 < 0x0
//                    loc_a1c173:
//                        r15 = var_3C8 + r13;
//                        goto loc_a1c184;
                        
                        CGFloat itemDivider = 0 + 0; // ?
                        
//                    loc_a1c184:
//                        [var_3B0 release];
//                        rbx = r14;
//                        if (r15 == 0x0) {
//                            [rbx logInvalidSizes];
//                            r15 = 0x1;
//                        }
//                        goto loc_a1c211;
                        
                        if (itemDivider == 0) {
                            [self logInvalidSizes];
                            itemDivider = 1;
                        }
                        
//                    loc_a1c211:
                        
                        CGFloat itemsRatio = ceil((CGFloat)_itemsCount / (CGFloat)itemDivider);
                        CGFloat width = (itemsRatio * (var_3A0 + _horizontalInterstice)) - _horizontalInterstice + _sectionMargins.left + _sectionMargins.right + _headerDimension + _footerDimension;
                        
                        [self setEstimatedSize:CGSizeMake(width, [_layoutInfo dimension]) forSection:sectionIndex];
                        return;
                        
                    }
                    
                } else { // count == 0
                    
                    
//                loc_a1c1df:
//                    [r15 release];
//                    xmm0 = intrinsic_xorpd(xmm0, xmm0);
//                    var_3A0 = intrinsic_movsd(var_3A0, xmm0);
//                    [rbx logInvalidSizes];
//                    r15 = 0x1;
//                    goto loc_a1c211;
                    
                    var_3A0 = 0;
                    CGFloat itemDivider = 1;
                    [self logInvalidSizes];
                    
//                loc_a1c211:
                    
                    CGFloat itemsRatio = ceil((CGFloat)_itemsCount / (CGFloat)itemDivider);
                    CGFloat width = (itemsRatio * (var_3A0 + _horizontalInterstice)) - _horizontalInterstice + _sectionMargins.left + _sectionMargins.right + _headerDimension + _footerDimension;
                    
                    [self setEstimatedSize:CGSizeMake(width, [_layoutInfo dimension]) forSection:sectionIndex];
                    return;
                }
                
            } else {
                
//            loc_a1bed1:
//                xmm0 = intrinsic_movsd(xmm0, *(rbx + *_OBJC_IVAR_$__UIFlowLayoutSection._sectionMargins + 0x8));
//                var_3A0 = intrinsic_movsd(var_3A0, xmm0);
//                xmm0 = intrinsic_movsd(xmm0, *(rbx + *_OBJC_IVAR_$__UIFlowLayoutSection._sectionMargins + 0x18));
//                var_3A8 = intrinsic_movsd(var_3A8, xmm0);
//                [r15 release];
//                xmm0 = intrinsic_xorpd(xmm0, xmm0);
//                intrinsic_movapd(var_360, xmm0);
//                intrinsic_movapd(var_370, xmm0);
//                var_380 = intrinsic_movapd(var_380, xmm0);
//                var_390 = intrinsic_movapd(var_390, xmm0);
//                r14 = [rbx->_items retain];
//                rdi = r14;
//                r12 = [rdi countByEnumeratingWithState:var_390 objects:var_230 count:0x10];
//                if (r12 == 0x0) goto loc_a1c2d4;
                
                CGFloat var_3A0 = _sectionMargins.left;
                CGFloat var_3A8 = _sectionMargins.right;
                
            }
        }
    }
    else { // items.count == 0
        CGSize newSize;
        if (isHorizontal) {
            newSize = CGSizeMake(_sectionMargins.left + _sectionMargins.right + _headerDimension + _footerDimension, [_layoutInfo dimension]);
        }
        else {
            newSize = CGSizeMake([_layoutInfo dimension], _sectionMargins.top + _sectionMargins.bottom + _headerDimension + _footerDimension);
        }
        [self setEstimatedSize:newSize forSection:sectionIndex];
    }
}

@end
