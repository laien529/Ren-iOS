//
//  FeedFlowCellFactory.h
//  Ren
//
//  Created by Cedric Cheng on 2020/12/17.
//

#import <Foundation/Foundation.h>
#import "RenTableViewCellProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface FeedFlowCellFactory : NSObject

+ (nonnull id<RenTableViewCellProtocol>)getCellByType:(NSString*)cellType;

@end

NS_ASSUME_NONNULL_END
