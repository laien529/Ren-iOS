//
//  FeedRequestManager.m
//  Ren
//
//  Created by Cedric Cheng on 2020/12/16.
//

#import "FeedDataSource.h"
#import "RenNetworkManager.h"
#import "RenTableViewCell.h"

@implementation FeedDataSource


- (void)requestFeedDatas:(void (^)(FeedDataModel* dataModel))block {
    [[RenNetworkManager sharedManager] requestWithURL:@"https://mob-st.bz.mgtv.com/odin/c1/channel/index?_support=10101001&abroad=0&ageMode=0&appVersion=6.7.6&ch=AppStore&channelId=60&device=iPhone&did=abf8f18eeb44c27c976b12de8b7f4e4a8d9431cf&dname=C%20iPhone%20XS&flag=0&mac=abf8f18eeb44c27c976b12de8b7f4e4a8d9431cf&osType=ios&osVersion=14.0.1&pageNo=1&seqId=472195aa4acf35694a89f66a60438b94&src=mgtv&testversion=&ticket=&type=5&uuid=&vclassId=60&version=5.3" METHOD:@"GET" paramters:nil successBlock:^(NSURLResponse * _Nonnull response, id  _Nonnull responseObject, NSInteger retryTimes) {
          
            __weak typeof(self) weakSelf = self;
            FeedDataModel *feedModel = [FeedDataModel modelWithDictionary:responseObject];
            weakSelf.feedModel = feedModel;
            if (block) {
                block(feedModel);
            }
        } failedBlock:^(NSError * _Nonnull error, NSURLResponse * _Nonnull response, NSInteger retryTimes) {
            
        }];
//    for (int i = 0; i < 20; i++) {
//        [[RenNetworkManager sharedManager] requestWithURL:@"https://mob-st.bz.mgtv.com/odin/c1/channel/index?_support=10101001&abroad=0&ageMode=0&appVersion=6.7.6&ch=AppStore&channelId=60&device=iPhone&did=abf8f18eeb44c27c976b12de8b7f4e4a8d9431cf&dname=C%20iPhone%20XS&flag=0&mac=abf8f18eeb44c27c976b12de8b7f4e4a8d9431cf&osType=ios&osVersion=14.0.1&pageNo=1&seqId=472195aa4acf35694a89f66a60438b94&src=mgtv&testversion=&ticket=&type=5&uuid=&vclassId=60&version=5.3" METHOD:@"GET" paramters:nil successBlock:^(NSURLResponse * _Nonnull response, id  _Nonnull responseObject, NSInteger retryTimes) {
//
//            } failedBlock:^(NSError * _Nonnull error, NSURLResponse * _Nonnull response, NSInteger retryTimes) {
//
//            }];
//    }
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
   
    FeedData *feedData = (FeedData*)_feedModel.data[indexPath.section];
    ModuleData *moduleData = [feedData.moduleData objectAtIndex:indexPath.row];
    feedData.moduleType = @"HorizontalSTD";
    [tableView registerClass:[RenTableViewCell class] forCellReuseIdentifier:feedData.moduleType];
    RenTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:feedData.moduleType];
    if (!cell) {
        cell = [[RenTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:feedData.moduleType];
    }
    if (cell) {
        for (UIView *subview in cell.contentView.subviews) {
            [subview removeFromSuperview];
        }
    }
    if ([cell respondsToSelector:@selector(setData:cellType:)]) {
        [cell setData:moduleData cellType:feedData.moduleType];
    }
    [self.rowHeightCache setObject:@(cell.cellHeight) forKey:indexPath];
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return _feedModel.data.count;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    FeedData *feedData = (FeedData*)_feedModel.data[section];
    return feedData.moduleData.count;
}

- (NSMutableDictionary *)rowHeightCache {
    if (!_rowHeightCache) {
        _rowHeightCache = [[NSMutableDictionary alloc] init];
    }
    return _rowHeightCache;;
}

@end
