//
//  RenJSONManager.m
//  Ren
//
//  Created by Cedric Cheng on 2020/12/14.
//

#import "RenJSONManager.h"

@implementation RenJSONManager

+ (instancetype)sharedManager {
    static dispatch_once_t onceToken;
    static RenJSONManager *manager;
    dispatch_once(&onceToken, ^{
        manager = [[self alloc] init];
    });
    
    return manager;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)parseObject:(NSData*)data onCompleted:(void (^)(NSError *error, id jsonObject)) completedBlock {
    NSError *error;
    id jsonObject = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:&error];
    if (completedBlock) {
        completedBlock(error, jsonObject);
    }
}
@end
