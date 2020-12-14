//
//  RenTabBarItemConfig.h
//  Ren
//
//  Created by Cedric Cheng on 2020/12/9.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface RenTabBarItemConfig : NSObject

@property(nonatomic, strong) NSString *text;
@property(nonatomic, strong) NSString *iconNormal;
@property(nonatomic, strong) NSString *iconHighlight;
@property(nonatomic, strong) UIColor *textColorNormal;
@property(nonatomic, strong) UIColor *textColorHighlight;
@property(nonatomic, assign) NSInteger index;
@property(nonatomic, assign) BOOL isSelected;

@end

NS_ASSUME_NONNULL_END
