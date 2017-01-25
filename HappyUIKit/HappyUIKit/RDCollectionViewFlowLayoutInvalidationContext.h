//
//  RDCollectionViewFlowLayoutInvalidationContext.h
//  MinimalObjC
//
//  Created by Roman Dzieciol on 1/24/17.
//  Copyright © 2017 R3PI. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RDCollectionViewLayoutInvalidationContext.h"

NS_ASSUME_NONNULL_BEGIN

@interface RDCollectionViewFlowLayoutInvalidationContext : RDCollectionViewLayoutInvalidationContext

@property (nonatomic) BOOL invalidateFlowLayoutDelegateMetrics; // if set to NO, flow layout will not requery the collection view delegate for size information etc.
@property (nonatomic) BOOL invalidateFlowLayoutAttributes; // if set to NO, flow layout will keep all layout information, effectively not invalidating - useful for a subclass which invalidates only a piece of itself

@end

NS_ASSUME_NONNULL_END
