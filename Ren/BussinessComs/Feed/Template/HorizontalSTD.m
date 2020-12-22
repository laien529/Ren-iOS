//
//  HorizontalSTD.m
//  Ren
//
//  Created by chengsc on 2020/12/16.
//

#import "HorizontalSTD.h"

static const float spacing = 5;
static const float imageHeight = 200;
static const float totalHeight = 250;

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
        _titleLabel.font = [UIFont boldSystemFontOfSize:14];
        _subTitleLabel = [[UILabel alloc] init];
        _subTitleLabel.font = [UIFont systemFontOfSize:12];
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
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(_coverImageView);
        make.height.greaterThanOrEqualTo(@14);
        make.top.mas_equalTo(_coverImageView.mas_bottom).and.offset(5);
        make.leading.equalTo(_coverImageView).and.offset(5);
        make.trailing.equalTo(_coverImageView).and.offset(5);

    }];
    [_subTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(_titleLabel);
        make.height.greaterThanOrEqualTo(@12);
        make.top.mas_equalTo(_titleLabel.mas_bottom).and.offset(5);
        make.leading.equalTo(_titleLabel).and.offset(0);
        make.trailing.equalTo(_titleLabel).and.offset(0);

    }];
}

- (void)setData:(ModuleData*)data cellType:(NSString*)cellType {
    
    _cellHeight = totalHeight;
    _titleLabel.text = data.name;
    _titleLabel.textColor = UIColor.darkGrayColor;
    _subTitleLabel.text = data.subName;
    _subTitleLabel.textColor = UIColor.lightGrayColor;

    NSURL *url = [NSURL URLWithString:data.imgHUrlToMobile];
    if (!url) {
        url = [NSURL URLWithString:data.imgHUrl];
    }
    if (!url) {
        url = [NSURL URLWithString:data.imgHVUrl];
    }
    [_coverImageView setImageWithURL:url placeholder:nil];
    
    self.block = ^(ModuleData*  _Nonnull dt) {
        NSLog(dt.name);
    };
}


@end
