//
//  RenTabBarItem.m
//  Ren
//
//  Created by Cedric Cheng on 2020/12/9.
//

#import "RenTabBarItem.h"

@interface RenTabBarItem () {
    UILabel *titleLabel;
    UIImageView *bgImageView;
    UIImageView *iconImageView;
}

@end

@implementation RenTabBarItem

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickItem:)]];
        self.userInteractionEnabled = YES;
        [self setBgImageView];
        [self setIconImageView];
        [self setTitleLabel];
    }
    return self;
}

- (void)setTitleLabel {
    titleLabel = [[UILabel alloc] init];
    titleLabel.font = [UIFont systemFontOfSize:12];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:titleLabel];
}

- (void)setIconImageView {
    iconImageView = [[UIImageView alloc] init];
    [self addSubview:iconImageView];
}

- (void)setBgImageView {
    bgImageView = [[UIImageView alloc] init];
    [self addSubview:bgImageView];

}

- (void)layoutSubviews {
    if (_itemConfig) {
//        if (_itemConfig.text.length > 0) {
//            titleLabel.text = _itemConfig.text;
//            titleLabel.frame = CGRectMake(0, 0, CGRectGetWidth(self.frame), 15);
//        }
//        if (_itemConfig.textColorNormal) {
//            titleLabel.textColor = _itemConfig.textColorNormal;
//        }
        if (_itemConfig.icon.length > 0) {
//            iconImageView.backgroundColor = [UIColor yellowColor];
            iconImageView.image = [UIImage imageNamed:_itemConfig.icon];
            iconImageView.frame = CGRectMake((CGRectGetWidth(self.frame) - 57) / 2, -10, 57, 70);
        }
    }
}

- (void)clickItem:(UITapGestureRecognizer*)recognizer {
    if (self.delegate && [self.delegate respondsToSelector:@selector(didSelectItem:)]) {
        [self.delegate didSelectItem:_itemConfig.index];
    }
}
@end
