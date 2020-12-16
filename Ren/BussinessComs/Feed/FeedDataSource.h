//
//  FeedRequestManager.h
//  Ren
//
//  Created by Cedric Cheng on 2020/12/16.
//

#import <Foundation/Foundation.h>
#import "FeedDataModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface FeedDataSource : NSObject

+ (void)requestFeedDatas:(void (^)(FeedDataModel* dataModel))block;

@end

NS_ASSUME_NONNULL_END
