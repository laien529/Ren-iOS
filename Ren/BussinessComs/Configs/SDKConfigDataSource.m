//
//  SDKConfigDataSource.m
//  Ren
//
//  Created by chengsc on 2020/12/15.
//

#import "SDKConfigDataSource.h"
#import "RenNetworkManager.h"
#import "SDKConfigModel.h"

@implementation SDKConfigDataSource

+ (void)requestSDKConfig {
    [[RenNetworkManager sharedManager] requestWithURL:@"http://platconf.api.mgtv.com/app/startConfig?platform=android&appVersion=6.7.2&osVersion=9.1&osType=ios&did=4232jfldsfjsdlfsdfdsfsdf&ticket=&uuid=&mf=apple&src=mgtv" METHOD:@"GET" paramters:nil successBlock:^(NSURLResponse * _Nonnull response, id  _Nonnull responseObject, NSInteger retryTimes) {
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
//            SDKConfigModel *sdkConfigs = [SDKConfigModel modelWithDictionary:responseObject];
//            NSLog(sdkConfigs);
        }
        } failedBlock:^(NSError * _Nonnull error, NSURLResponse * _Nonnull response, NSInteger retryTimes) {
            
        }];
}

@end
