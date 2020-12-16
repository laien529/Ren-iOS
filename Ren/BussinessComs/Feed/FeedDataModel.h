//
//  FeedDataModel.h
//  Ren
//
//  Created by Cedric Cheng on 2020/12/16.
//

#import <Foundation/Foundation.h>
#import "YYBaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface ModuleData : NSObject

@property(nonatomic, strong)NSString *cornerType;
@property(nonatomic, strong)NSString *jumpKind;
@property(nonatomic, strong)NSString *rightCorner;
@property(nonatomic, strong)NSString *imgHUrlToMobile;
@property(nonatomic, strong)NSString *videoId;
@property(nonatomic, strong)NSString *jumpId;
@property(nonatomic, strong)NSString *childId;
@property(nonatomic, strong)NSString *articleUrl;
@property(nonatomic, strong)NSString *sortNo;
@property(nonatomic, strong)NSString *bgColor;
@property(nonatomic, strong)NSString *subName;
@property(nonatomic, strong)NSString *name;
@property(nonatomic, strong)NSString *videoGroup;
@property(nonatomic, strong)NSString *fontColor;

@end

@interface FeedDataModel : YYBaseModel
@property(nonatomic, strong)NSString *moduleTitle;
@property(nonatomic, strong)NSString *moduleType;
@property(nonatomic, strong)NSString *moduleName;
@property(nonatomic, strong)NSArray *moduleData;

@end

NS_ASSUME_NONNULL_END
