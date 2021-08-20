//
//  SDKConfigModel.h
//  Ren
//
//  Created by chengsc on 2020/12/14.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN


@interface SDKConfigs : NSObject
///
@property (nonatomic,strong) NSMutableArray *allowDomains;//
///
@property (nonatomic,strong) NSMutableArray *allowAPIs;//

@end





@interface SDK : NSObject

@property (nonatomic,copy) NSString *appVersion;//
///
@property (nonatomic,copy) NSString *platform;//
///
@property (nonatomic,copy) NSString *sdkVersion;//
///
@property (nonatomic,strong) NSNumber *switchState;//
///
@property (nonatomic,strong) NSString *sdkName;//
///
@property (nonatomic,strong) SDKConfigs *sdkConfigs;//
///
@property (nonatomic,strong) NSString *sdkId;//

@property (nonatomic,strong) NSString *configs;//

@end





//************分割线************

@interface JSSDK : NSObject
///
@property (nonatomic,strong) NSNumber *sdkState;//
///
@property (nonatomic,copy) NSString *sdkName;//
///
@property (nonatomic,copy) NSString *sdkVersion;//
///
@property (nonatomic,strong) SDKConfigs *sdkConfigs;//
///
@property (nonatomic,copy) NSString *configs;//

@end




@interface SDKConfigDataModel : NSObject

//************分割线************
///
@property (nonatomic,strong) NSMutableArray *sdk;//
///
@property (nonatomic,strong) NSMutableArray *jssdk;//

@end





@interface SDKConfigModel : YYBaseModel
///
@property (nonatomic,strong) SDKConfigDataModel *data;//

@end


NS_ASSUME_NONNULL_END
