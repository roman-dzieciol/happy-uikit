//
//  _RDFlowLayoutItem.m
//  MinimalObjC
//
//  Created by Roman Dzieciol on 1/22/17.
//  Copyright © 2017 R3PI. All rights reserved.
//

#import "_RDFlowLayoutItem.h"

@implementation _RDFlowLayoutItem

- (id)copy {
    _RDFlowLayoutItem *result = [[_RDFlowLayoutItem alloc] init];
    result.itemFrame = self.itemFrame;
    result.positionEstimated = self.positionEstimated;
    result.sizeEstimated = self.sizeEstimated;
    result.sizeHasBeenSet = self.sizeHasBeenSet;
    return result;
}

@end
