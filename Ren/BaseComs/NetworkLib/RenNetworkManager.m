//
//  RenNetworkManager.m
//  Ren
//
//  Created by Cedric Cheng on 2020/12/14.
//

#import "RenNetworkManager.h"
#import "AFNetworking.h"
#import "RenJSONManager.h"

@interface RenNetworkManager () {
    AFHTTPSessionManager *_sessionManager;

}

@end

@implementation RenNetworkManager

+ (instancetype)sharedManager {
    static dispatch_once_t onceToken;
    static RenNetworkManager *_manager;

    dispatch_once(&onceToken, ^{
        _manager = [[RenNetworkManager alloc] init];
    });
    return _manager;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        NSURLSessionConfiguration *sessionConfig = [NSURLSessionConfiguration defaultSessionConfiguration];
        _sessionManager = [[AFHTTPSessionManager alloc] initWithSessionConfiguration:sessionConfig];
    }
    return self;
}
- (void)requestWithMethod:(NSString*)method
                URLString:(nonnull NSString *)URLString
               parameters:(nullable NSDictionary*)parameters
                  headers:(nullable NSDictionary*)headers
             successBlock:(void (^)(NSURLResponse *response, id responseObject, NSInteger retryTimes)) successBlock
              failedBlock:(void (^)(NSError* error, NSURLResponse *response, NSInteger retryTimes)) failedBlock {
    NSURLSessionTask *task = [_sessionManager dataTaskWithHTTPMethod:method URLString:URLString parameters:parameters headers:headers uploadProgress:^(NSProgress * _Nonnull uploadProgress) {
        
    } downloadProgress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if ([responseObject isKindOfClass:NSData.class]) {
            [[RenJSONManager sharedManager] parseObject:responseObject onCompleted:^(NSError * _Nonnull error, id  _Nonnull jsonObject) {
                if (error) {
                    failedBlock(error, task.response, 0);
                } else {
                    successBlock(task.response, jsonObject, 0);
                }
            }];
        } else {
            NSError *error = [NSError errorWithDomain:@"DATA Parse" code:-1 userInfo:@{@"responseSerializer":@"NOT MATCH"}];
            
            failedBlock(error, task.response, 0);
        }
//        NSLog(@"responseObject:%@", responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failedBlock(error, task.response, 0);
    }];
    
    [task resume];
}

- (void)requestWithURL:(NSString*)url
                METHOD:(NSString*)method
               headers:(nullable NSDictionary*)headers
             paramters:(NSDictionary*)paramters
          successBlock:(void (^)(NSURLResponse *response, id responseObject, NSInteger retryTimes)) successBlock
           failedBlock:(void (^)(NSError* error, NSURLResponse *response, NSInteger retryTimes)) failedBlock {
    
    [_sessionManager setResponseSerializer:[AFHTTPResponseSerializer serializer]];
    
    [self requestWithMethod:method URLString:url parameters:paramters headers:headers successBlock:^(NSURLResponse *response, id responseObject, NSInteger retryTimes) {
        successBlock(response, responseObject, retryTimes);

    } failedBlock:^(NSError *error, NSURLResponse *response, NSInteger retryTimes) {
        failedBlock(error, response, retryTimes);
    }];
}

- (void)requestWithURL:(NSString*)url
                METHOD:(NSString*)method
             paramters:(nullable NSDictionary*)paramters
          successBlock:(void (^)(NSURLResponse *response, id responseObject, NSInteger retryTimes)) successBlock
           failedBlock:(void (^)(NSError* error, NSURLResponse *response, NSInteger retryTimes)) failedBlock {
    
    [_sessionManager setResponseSerializer:[AFHTTPResponseSerializer serializer]];
    
    [self requestWithMethod:method URLString:url parameters:paramters headers:nil successBlock:^(NSURLResponse *response, id responseObject, NSInteger retryTimes) {
        successBlock(response, responseObject, retryTimes);
    } failedBlock:^(NSError *error, NSURLResponse *response, NSInteger retryTimes) {
        failedBlock(error, response, retryTimes);
    }];
}

- (void)requesImagetWithURL:(NSString*)url
                METHOD:(NSString*)method
                  paramters:(nullable NSDictionary*)paramters
          successBlock:(void (^)(NSURLResponse *response, id responseObject, NSInteger retryTimes)) successBlock
                failedBlock:(void (^)(NSError* error, NSURLResponse *response, NSInteger retryTimes)) failedBlock {
    [_sessionManager setResponseSerializer:[AFImageResponseSerializer serializer]];
    [self requestWithMethod:method URLString:url parameters:paramters headers:nil successBlock:^(NSURLResponse *response, id responseObject, NSInteger retryTimes) {
        successBlock(response, responseObject, retryTimes);
    } failedBlock:^(NSError *error, NSURLResponse *response, NSInteger retryTimes) {
        failedBlock(error, response, retryTimes);
    }];
}

- (void)downloadDataWithURL:(NSString*)url
                  paramters:(nullable NSDictionary*)paramters
               progress:(void (^)(float progress, float kbps)) progress
           successBlock:(void (^)(NSURLResponse *response, id respnoseObject, NSInteger retryTimes)) successBlock
                failedBlock:(void (^)(NSURLResponse *response, NSError* error, NSInteger retryTimes)) failedBlock {
    [_sessionManager setResponseSerializer:[AFHTTPResponseSerializer serializer]];

}

@end
