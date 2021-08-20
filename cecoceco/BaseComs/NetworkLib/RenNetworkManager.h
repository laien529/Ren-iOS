//
//  RenNetworkManager.h
//  Ren
//
//  Created by Cedric Cheng on 2020/12/14.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface RenNetworkManager : NSObject

+ (instancetype)sharedManager;

- (void)requestWithURL:(NSString*)url
                METHOD:(NSString*)method
             paramters:(nullable NSDictionary*)paramters
          successBlock:(void (^)(NSURLResponse *response, id responseObject, NSInteger retryTimes)) successBlock
           failedBlock:(void (^)(NSError* error, NSURLResponse *response, NSInteger retryTimes)) failedBlock;

- (void)requestImagetWithURL:(NSString*)url
                METHOD:(NSString*)method
                  paramters:(nullable NSDictionary*)paramters
          successBlock:(void (^)(NSURLResponse *response, id responseObject, NSInteger retryTimes)) successBlock
                failedBlock:(void (^)(NSError* error, NSURLResponse *response, NSInteger retryTimes)) failedBlock;

- (void)downloadDataWithURL:(NSString*)url
                  paramters:(nullable NSDictionary*)paramters
               progress:(void (^)(float progress, float kbps)) progress
           successBlock:(void (^)(NSURLResponse *response, id respnoseObject, NSInteger retryTimes)) successBlock
                failedBlock:(void (^)(NSURLResponse *response, NSError* error, NSInteger retryTimes)) failedBlock;



@end

NS_ASSUME_NONNULL_END
