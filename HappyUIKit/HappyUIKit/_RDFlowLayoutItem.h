//
//  _RDFlowLayoutItem.h
//  MinimalObjC
//
//  Created by Roman Dzieciol on 1/22/17.
//  Copyright © 2017 R3PI. All rights reserved.
//

#import <UIKit/UIKit.h>

@class _RDFlowLayoutRow;
@class _RDFlowLayoutSection;

@interface _RDFlowLayoutItem : NSObject

@property (nonatomic) CGRect itemFrame;
@property (getter=isPositionEstimated, nonatomic) bool positionEstimated;
@property (nonatomic, weak) _RDFlowLayoutRow *rowObject;
@property (nonatomic, weak) _RDFlowLayoutSection *section;
@property (getter=isSizeEstimated, nonatomic) bool sizeEstimated;
@property (nonatomic) bool sizeHasBeenSet;

- (id)copy;

@end
