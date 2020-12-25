//
//  VODControlView.m
//  Ren
//
//  Created by Cedric Cheng on 2020/12/23.
//
const static NSInteger kAreaHeight = 80;

#import "VODControlViewH.h"

@interface VODControlViewH () {
    UIView *_topArea;
    UIView *_bottomArea;
}

@end

@implementation VODControlViewH

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)init {
    self = [super init];
    if (self) {
        [self setupTopArea];
        [self setupBottomArea];
    }
    return self;
}

- (void)setupTopArea {
    _topArea = [[UIView alloc] init];
    _topArea.backgroundColor = UIColor.whiteColor;
    _topArea.alpha = 0.1;
    [self addSubview:_topArea];
    
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    backBtn.backgroundColor = UIColor.whiteColor;
    [backBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_topArea).offset(5);
        make.top.equalTo(_topArea).offset(5);
        make.bottom.equalTo(_topArea).offset(5);
        make.width.equalTo(@80);
    }];
    [backBtn setTitle:@"Back" forState:UIControlStateNormal];
    [_topArea addSubview:backBtn];

}

- (void)setupBottomArea {
    _bottomArea = [[UIView alloc] init];
    _bottomArea.backgroundColor = UIColor.whiteColor;
    _bottomArea.alpha = 0.1;
    [self addSubview:_bottomArea];

}

- (void)layoutSubviews {
    _topArea.frame = CGRectMake(0, 0, kRenScreenHeight, kAreaHeight);
    _bottomArea.frame = CGRectMake(0, kRenScreenWidth - kAreaHeight, kRenScreenHeight, kAreaHeight);
}

- (void)play {
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
}
@end
