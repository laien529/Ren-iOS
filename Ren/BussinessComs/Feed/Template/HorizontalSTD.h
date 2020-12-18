//
//  HorizontalSTD.h
//  Ren
//
//  Created by chengsc on 2020/12/16.
//

#import <UIKit/UIKit.h>
#import "FeedDataModel.h"
#import "RenTableViewCellProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface HorizontalSTD : UIView<RenTableViewCellProtocol>

@property(nonatomic, strong) UIView *backgroundView;
@property(nonatomic, strong) UIImageView *coverImageView;
@property(nonatomic, strong) UILabel *titleLabel;
@property(nonatomic, strong) UILabel *subTitleLabel;
@property(nonatomic, strong) UIImageView *cornerIcon;

@property(nonatomic, assign) CGFloat cellHeight;

@end


NS_ASSUME_NONNULL_END
