//
//  HorizontalSTD.m
//  Ren
//
//  Created by chengsc on 2020/12/16.
//

#import "HorizontalSTD.h"
static const float spacing = 5;
static const float imageHeight = 300;
static const float totalHeight = 400;

@implementation HorizontalSTD

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)init {
    self = [super initWithFrame:CGRectMake(0, 0, kScreenWidth, totalHeight)];
    if (self) {
        _backgroundView = [[UIView alloc] init];
        _backgroundView.backgroundColor = UIColor.whiteColor;//default color
        _coverImageView = [[UIImageView alloc] init];
        _coverImageView.backgroundColor = UIColor.lightGrayColor;
        _cornerIcon = [[UIImageView alloc] init];
        _titleLabel = [[UILabel alloc] init];
        _subTitleLabel = [[UILabel alloc] init];
        [self addSubview:_backgroundView];
        [self addSubview:_coverImageView];
        [self addSubview:_cornerIcon];
        [self addSubview:_titleLabel];
        [self addSubview:_subTitleLabel];

    }
    return self;
}

- (void)layoutSubviews {
    _backgroundView.frame = self.frame;
    _coverImageView.frame = CGRectMake(spacing, spacing, CGRectGetWidth(self.frame) - 2 * spacing, imageHeight);
}

- (void)setData:(ModuleData*)data {
    _titleLabel.text = data.name;
    _subTitleLabel.text = data.subName;
}
@end
