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
        bottomBaseLineY = kRenScreenHeight - tabBarHeight;
        self.translatesAutoresizingMaskIntoConstraints = NO;
    }
    return self;
}

- (void)setContentView:(UIView *)contentView {
    
    _contentView = contentView;
    [self addSubview:_contentView];

}

- (void)setNavigationBar:(RenNavigationBar*)navigationBar {
    CGRect frame = self.safeAreaLayoutGuide.layoutFrame;
    if (!_navigationBar) {
        _navigationBar = navigationBar;
        [self addSubview:_navigationBar];
    } else {
        _navigationBar = navigationBar;
    }
}

- (void)setTabbarHeight:(CGFloat)tabbarHeight {
    bottomBaseLineY = kRenScreenHeight - tabbarHeight;
}

- (void)layoutSubviews {
    topBaseLineY = CGRectGetMaxY(_navigationBar.frame);
    self.frame = CGRectMake(0, 0, kRenScreenWidth, bottomBaseLineY);
    _contentView.frame = CGRectMake(0, topBaseLineY, kRenScreenWidth, bottomBaseLineY - topBaseLineY);
}
@end
