//
//  VODControlViewV.m
//  Ren
//
//  Created by Cedric Cheng on 2020/12/23.
//

#import "VODControlViewV.h"

const static NSInteger kAreaHeight = 44;

@interface VODControlViewV () {
    UIView *_topArea;
    UIView *_bottomArea;
    UIButton *backBtn;

}

@end

@implementation VODControlViewV

- (instancetype)init {
    self = [super init];
    if (self) {
        self.frame = CGRectMake(0, 44, kRenScreenWidth, 44);
        [self setupBackButton];
        [self setupTopArea];
        [self setupBottomArea];
    }
    return self;
}

- (void)setupBackButton {
    backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [backBtn setImage:[UIImage imageNamed:@"VOD_player_back"] forState:UIControlStateNormal];
    backBtn.backgroundColor = UIColor.clearColor;
    [backBtn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:backBtn];
}

- (void)setupTopArea {
    _topArea = [[UIView alloc] init];
    _topArea.backgroundColor = UIColor.clearColor;
    [self addSubview:_topArea];
    
}

- (void)setupBottomArea {
    _bottomArea = [[UIView alloc] init];
    _bottomArea.backgroundColor = UIColor.clearColor;
    [self addSubview:_bottomArea];

}

- (void)layoutSubviews {
    _topArea.frame = CGRectMake(44, 0, kRenScreenWidth - 44, kAreaHeight);
    _bottomArea.frame = CGRectMake(0, kRenScreenWidth - kAreaHeight, kRenScreenWidth, kAreaHeight);
    
    [backBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self);
        make.top.equalTo(self);
        make.height.equalTo(@44);
        make.width.equalTo(@44);
    }];
    
    UIButton *moreBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [moreBtn setImage:[UIImage imageNamed:@"Player_ more"] forState:UIControlStateNormal];
    [moreBtn addTarget:self action:@selector(moreTools) forControlEvents:UIControlEventTouchUpInside];
    [_topArea addSubview:moreBtn];
    
    UIImageView *chinaUnion = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Player_ChinaUnicom"]];
    [_topArea addSubview:chinaUnion];
    
    [moreBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_topArea);
        make.trailing.equalTo(_topArea);
        make.height.equalTo(_topArea);
        make.width.equalTo(@44);
        
    }];
    
    [chinaUnion mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(_topArea.mas_centerY);
        make.trailing.mas_equalTo(moreBtn.mas_leading).offset(-20);
        make.height.equalTo(@22);
        make.width.equalTo(@22);
        
    }];
}

- (void)moreTools {
    if (self.delegate && [self.delegate respondsToSelector:@selector(more)]) {
        [self.delegate more];
    }
}

- (void)play {
    if (self.delegate && [self.delegate respondsToSelector:@selector(play)]) {
        [self.delegate play];
    }
}

- (void)back {
    if (self.delegate && [self.delegate respondsToSelector:@selector(back)]) {
        [self.delegate back];
    }
}
@end
