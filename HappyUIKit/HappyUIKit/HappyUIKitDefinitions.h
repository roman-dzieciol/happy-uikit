//
//  HappyUIKitDefinitions.h
//  MinimalObjC
//
//  Created by Roman Dzieciol on 1/22/17.
//  Copyright © 2017 R3PI. All rights reserved.
//

#import <UIKit/UIKit.h>

struct _RowAlignmentOptions {
    int commonRowHorizontalAlignment;
    int lastRowHorizontalAlignment;
    int rowVerticalAlignment;
};
typedef struct _RowAlignmentOptions _RowAlignmentOptions;

extern const int _RDFlowLayoutAlignment_0;
extern const int _RDFlowLayoutAlignment_1;
extern const int _RDFlowLayoutAlignment_2;
extern const int _RDFlowLayoutAlignment_3;

extern const NSUInteger _RD_AutomaticDimension;

extern NSUInteger _RDApplicationLinkedOnVersion __attribute__((weak_import));

extern BOOL _RDApplicationLinkedOnOrAfter(NSUInteger version);

typedef NS_ENUM(NSInteger, RDCollectionUpdateAction) {
    RDCollectionUpdateActionInsert,
    RDCollectionUpdateActionDelete,
    RDCollectionUpdateActionReload,
    RDCollectionUpdateActionMove,
    RDCollectionUpdateActionNone
};

typedef NS_ENUM(NSUInteger, RDCollectionElementCategory) {
    RDCollectionElementCategoryCell,
    RDCollectionElementCategorySupplementaryView,
    RDCollectionElementCategoryDecorationView
};

@interface HappyUIKitDefinitions : NSObject

@end
