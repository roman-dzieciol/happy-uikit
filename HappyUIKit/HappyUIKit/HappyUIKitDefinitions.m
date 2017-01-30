//
//  HappyUIKitDefinitions.m
//  MinimalObjC
//
//  Created by Roman Dzieciol on 1/22/17.
//  Copyright © 2017 R3PI. All rights reserved.
//

#import "HappyUIKitDefinitions.h"

extern uint32_t dyld_get_program_sdk_version() WEAK_IMPORT_ATTRIBUTE;

const int _RDFlowLayoutAlignment_0 = 0;
const int _RDFlowLayoutAlignment_1 = 1;
const int _RDFlowLayoutAlignment_2 = 2;
const int _RDFlowLayoutAlignment_3 = 3;

const NSUInteger _RD_AutomaticDimension = 0x7fefffffffffffff;
NSUInteger _RDApplicationLinkedOnVersion = 0x0; // iOS 10.2 is 0xa0200


BOOL _RDApplicationLinkedOnOrAfter(NSUInteger version) {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (dyld_get_program_sdk_version != NULL) {
            _RDApplicationLinkedOnVersion = dyld_get_program_sdk_version();
        }
    });
    return version >= _RDApplicationLinkedOnVersion;
}

@implementation HappyUIKitDefinitions

@end
