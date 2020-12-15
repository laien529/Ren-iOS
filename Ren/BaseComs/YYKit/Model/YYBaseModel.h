//
//  YYBaseModel.h
//  Ren
//
//  Created by chengsc on 2020/12/14.
//

#import <Foundation/Foundation.h>
#import "NSObject+YYModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface YYBaseModel : NSObject

@property(nonatomic, strong) NSString *msg;
@property(nonatomic, assign) NSInteger code;
@end

NS_ASSUME_NONNULL_END
