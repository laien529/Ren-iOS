//
//  RenNavigationBar.m
//  Ren
//
//  Created by Cedric Cheng on 2020/12/18.
//

#import "RenNavigationBar.h"


@implementation RenNavigationBar

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
        self.backgroundColor = [UIColor systemOrangeColor];
    }
    return self;
}
- (void)layoutSubviews {
    
}
@end
