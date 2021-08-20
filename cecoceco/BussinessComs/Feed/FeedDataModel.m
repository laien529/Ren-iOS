//
//  FeedDataModel.m
//  Ren
//
//  Created by Cedric Cheng on 2020/12/16.
//

#import "FeedDataModel.h"

@implementation ModuleData

@end

@implementation FeedData

+ (NSDictionary*)modelContainerPropertyGenericClass {
    return @{
        @"moduleData":ModuleData.class
    };
}

@end

@implementation FeedDataModel

+ (NSDictionary*)modelContainerPropertyGenericClass {
    return @{
        @"data":FeedData.class
    };
}

@end
