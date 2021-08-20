//
//  RenNavigationBar.m
//  Ren
//
//  Created by Cedric Cheng on 2020/12/18.
//

#import "RenNavigationBar.h"


@implementation RenNavigationBar

- (void)setupBlurView {
    UIBlurEffect *blur = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
    UIVisualEffectView *effectView = [[UIVisualEffectView alloc] initWithEffect:blur];
    effectView.alpha = 0.5;
    effectView.frame = self.frame;
    [self addSubview:effectView];
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)init {
    self = [super initWithFrame:CGRectMake(0, 0, kRenScreenWidth, 88)];
    if (self) {
        self.backgroundColor = [UIColor blackColor];
        self.alpha  = 0.9;
        [self setupBlurView];
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
        button.frame = CGRectMake(10, 0, 50, 50);
        [button setTitle:@"aaaa" forState:UIControlStateNormal];
        [self addSubview:button];
    }
    return self;
}
- (void)layoutSubviews {
    
}
@end
