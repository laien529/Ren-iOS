//
//  HorizontalSTD.h
//  Ren
//
//  Created by chengsc on 2020/12/16.
//

#import <UIKit/UIKit.h>
#import "FeedDataModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface HorizontalSTD : UIView

@property(nonatomic, strong) UIView *backgroundView;
@property(nonatomic, strong) UIImageView *coverImageView;
@property(nonatomic, strong) UILabel *titleLabel;
@property(nonatomic, strong) UILabel *subTitleLabel;
@property(nonatomic, strong) UIImageView *cornerIcon;

- (void)setData:(ModuleData*)data;


@end


NS_ASSUME_NONNULL_END
