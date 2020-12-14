//
//  RenNetworkManager.m
//  Ren
//
//  Created by Cedric Cheng on 2020/12/14.
//

#import "RenNetworkManager.h"
#import "AFNetworking.h"

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
- (void)requestWithMethod:(NSString*)method URLString:(nonnull NSString *)URLString parameters:(nullable NSDictionary*)parameters headers:(nullable NSDictionary*)headers {
    NSURLSessionTask *task = [_sessionManager dataTaskWithHTTPMethod:method URLString:URLString parameters:parameters headers:headers uploadProgress:^(NSProgress * _Nonnull uploadProgress) {
        
    } downloadProgress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"responseObject:%@", responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
    
    [task resume];
}

- (void)requestWithURL:(NSString*)url
                METHOD:(NSString*)method
               headers:(nullable NSDictionary*)headers
             paramters:(NSDictionary*)paramters
          successBlock:(void (^)(NSURLResponse *response, id responseObject, NSInteger retryTimes)) successBlock
           failedBlock:(void (^)(NSError* error, NSURLResponse *response, NSInteger retryTimes)) failedBlock {
    [_sessionManager setResponseSerializer:[AFJSONResponseSerializer serializer]];
    [self requestWithMethod:method URLString:url parameters:paramters headers:headers];
}

- (void)requestWithURL:(NSString*)url
                METHOD:(NSString*)method
             paramters:(nullable NSDictionary*)paramters
          successBlock:(void (^)(NSURLResponse *response, id responseObject, NSInteger retryTimes)) successBlock
           failedBlock:(void (^)(NSError* error, NSURLResponse *response, NSInteger retryTimes)) failedBlock {
    [_sessionManager setResponseSerializer:[AFJSONResponseSerializer serializer]];
    [self requestWithMethod:method URLString:url parameters:paramters headers:nil];
}

- (void)requesImagetWithURL:(NSString*)url
                METHOD:(NSString*)method
                  paramters:(nullable NSDictionary*)paramters
          successBlock:(void (^)(NSURLResponse *response, id responseObject, NSInteger retryTimes)) successBlock
                failedBlock:(void (^)(NSError* error, NSURLResponse *response, NSInteger retryTimes)) failedBlock {
    [_sessionManager setResponseSerializer:[AFImageResponseSerializer serializer]];
    [self requestWithMethod:method URLString:url parameters:paramters headers:nil];
}

- (void)downloadDataWithURL:(NSString*)url
                  paramters:(nullable NSDictionary*)paramters
               progress:(void (^)(float progress, float kbps)) progress
           successBlock:(void (^)(NSURLResponse *response, id respnoseObject, NSInteger retryTimes)) successBlock
                failedBlock:(void (^)(NSURLResponse *response, NSError* error, NSInteger retryTimes)) failedBlock {
    [_sessionManager setResponseSerializer:[AFHTTPResponseSerializer serializer]];

}

@end
