//
//  FeedRequestManager.h
//  Ren
//
//  Created by Cedric Cheng on 2020/12/16.
//

#import <Foundation/Foundation.h>
#import "FeedDataModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface FeedDataSource : NSObject<UITableViewDataSource>

@property(nonatomic, strong) FeedDataModel *feedModel;
@property(nonatomic, strong) NSMutableDictionary *rowHeightCache;

- (void)requestFeedDatas:(void (^)(FeedDataModel* dataModel))block;

@end

NS_ASSUME_NONNULL_END
