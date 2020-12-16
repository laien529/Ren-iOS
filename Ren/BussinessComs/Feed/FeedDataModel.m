//
//  FeedDataModel.m
//  Ren
//
//  Created by Cedric Cheng on 2020/12/16.
//

#import "FeedDataModel.h"

@implementation ModuleData

@end

@implementation FeedDataModel

+ (NSDictionary*)modelContainerPropertyGenericClass {
    return @{
        @"moduleData":ModuleData.class
    };
}

@end
