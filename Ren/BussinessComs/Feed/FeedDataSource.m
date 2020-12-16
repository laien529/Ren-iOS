//
//  FeedRequestManager.m
//  Ren
//
//  Created by Cedric Cheng on 2020/12/16.
//

#import "FeedDataSource.h"
#import "RenNetworkManager.h"

@implementation FeedDataSource

+ (void)requestFeedDatas:(void (^)(FeedDataModel* dataModel))block {
    [[RenNetworkManager sharedManager] requestWithURL:@"https://mob-st.bz.mgtv.com/odin/c1/channel/index?_support=10101001&abroad=0&ageMode=0&appVersion=6.7.6&ch=AppStore&channelId=60&device=iPhone&did=abf8f18eeb44c27c976b12de8b7f4e4a8d9431cf&dname=C%20iPhone%20XS&flag=0&mac=abf8f18eeb44c27c976b12de8b7f4e4a8d9431cf&osType=ios&osVersion=14.0.1&pageNo=1&seqId=472195aa4acf35694a89f66a60438b94&src=mgtv&testversion=&ticket=&type=5&uuid=&vclassId=60&version=5.3" METHOD:@"GET" paramters:nil successBlock:^(NSURLResponse * _Nonnull response, id  _Nonnull responseObject, NSInteger retryTimes) {
        FeedDataModel *feedModel = [FeedDataModel modelWithDictionary:responseObject];
            
        } failedBlock:^(NSError * _Nonnull error, NSURLResponse * _Nonnull response, NSInteger retryTimes) {
            
        }];
}

@end
