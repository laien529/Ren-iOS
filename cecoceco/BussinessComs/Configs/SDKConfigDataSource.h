//
//  SDKConfigDataSource.h
//  Ren
//
//  Created by chengsc on 2020/12/15.
//

#import <Foundation/Foundation.h>
#import "SDKConfigModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface SDKConfigDataSource : NSObject

+ (void)requestSDKConfig:(void (^)(SDKConfigModel* configModel))block;

@end

NS_ASSUME_NONNULL_END
