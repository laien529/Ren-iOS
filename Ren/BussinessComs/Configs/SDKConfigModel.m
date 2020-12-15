//
//  SDKConfigModel.m
//  Ren
//
//  Created by chengsc on 2020/12/14.
//

#import "SDKConfigModel.h"

@implementation SDKConfigs

@end

@implementation SDK

@end

@implementation JSSDK

@end

@implementation SDKConfigDataModel
+ (NSDictionary*)modelContainerPropertyGenericClass {
    return @{
        @"sdk":SDK.class,
        @"jssdk":JSSDK.class
    };
}

@end

@implementation SDKConfigModel


@end
