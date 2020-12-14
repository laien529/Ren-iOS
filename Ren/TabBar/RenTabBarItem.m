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
- (void)setItemConfig:(RenTabBarItemConfig *)itemConfig {
    _itemConfig = itemConfig;

    [_itemConfig addObserver:self forKeyPath:@"isSelected" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:"selectStatus"];

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

- (void)setupItem {
    if (_itemConfig) {
        if (_itemConfig.text.length > 0) {
            titleLabel.text = _itemConfig.text;
            titleLabel.frame = CGRectMake(0, 0, CGRectGetWidth(self.frame), 15);
        }
        if (_itemConfig.textColorNormal || _itemConfig.textColorHighlight) {
            titleLabel.textColor = _itemConfig.isSelected ? _itemConfig.textColorHighlight : _itemConfig.textColorNormal;
        }
        if (_itemConfig.iconHighlight.length > 0 || _itemConfig.iconNormal.length) {
            iconImageView.image = _itemConfig.isSelected ? [UIImage imageNamed:_itemConfig.iconHighlight] : [UIImage imageNamed:_itemConfig.iconNormal];
            iconImageView.frame = CGRectMake((CGRectGetWidth(self.frame) - 57) / 2, -15, 57, 70);
        }
    }
}

- (void)layoutSubviews {
    [self setupItem];

}
- (void)changeSelectStatus {

        [self setupItem];
    
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    [self changeSelectStatus];
}

- (void)clickItem:(UITapGestureRecognizer*)recognizer {
    if (self.delegate && [self.delegate respondsToSelector:@selector(didSelectItem:)]) {
        [self.delegate didSelectItem:_itemConfig.index];
    }
}
@end
