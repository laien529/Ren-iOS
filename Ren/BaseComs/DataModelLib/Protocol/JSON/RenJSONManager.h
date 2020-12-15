//
//  RenJSONManager.h
//  Ren
//
//  Created by Cedric Cheng on 2020/12/14.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface RenJSONManager : NSObject

+ (instancetype)sharedManager;

- (void)parseObject:(NSData*)data onCompleted:(void (^)(NSError *error, id jsonObject)) completedBlock;

@end

NS_ASSUME_NONNULL_END
