//
//  RenScaffold.m
//  Ren
//
//  Created by Cedric Cheng on 2020/12/18.
//

#import "RenScaffold.h"


@interface RenScaffold () {
    CGFloat topBaseLineY;
    CGFloat bottomBaseLineY;
}

@end

@implementation RenScaffold

- (instancetype)init {
    self = [super initWithFrame:CGRectMake(0, 0, kRenScreenWidth, kRenScreenHeight)];
    if (self) {
    
    }
    return self;
}

- (void)setContentView:(UIView *)contentView {
    
    _contentView = contentView;
    
}

- (void)setNavigatonBar:(RenNavigationBar*)navigationBar {
//    if (isNotchScreen()) {
//        
//    } else {
//        
//    }
//    
}

- (void)setTabbarHeight:(CGFloat)tabbarHeight {
    bottomBaseLineY = kRenScreenHeight - tabbarHeight;
}

- (void)layoutSubviews {
    topBaseLineY = CGRectGetMaxY(_navigationBar.frame);

}
@end
