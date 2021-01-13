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

    //bottom
    UILabel *_currentTimeLabel;
    UILabel *_totalDurationLabel;
    UIView *_currentTimeView;
    UIView *_totalDurationView;
    NSInteger _currentTime;
    NSInteger _totalDuration;

}

@end

@implementation VODControlViewV

- (instancetype)init {
    self = [super init];
    if (self) {
        self.frame = CGRectMake(0, 0, kRenScreenWidth, 250);
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
    
    [backBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self);
        make.top.equalTo(self);
        make.height.equalTo(@44);
        make.width.equalTo(@44);
    }];
}

- (void)setupTopArea {
    _topArea = [[UIView alloc] init];
    _topArea.backgroundColor = UIColor.clearColor;
    [self addSubview:_topArea];
    
    _topArea.frame = CGRectMake(44, 0, kRenScreenWidth - 44, kAreaHeight);

    
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
    
    UIButton *castBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [castBtn setImage:[UIImage imageNamed:@"play-dlnaicon-nor"] forState:UIControlStateNormal];
    [castBtn addTarget:self action:@selector(cast) forControlEvents:UIControlEventTouchUpInside];
    [_topArea addSubview:castBtn];
    [castBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(_topArea.mas_centerY);
        make.trailing.mas_equalTo(chinaUnion.mas_leading).offset(-5);
    }];
}

- (void)setupBottomArea {
    _bottomArea = [[UIView alloc] init];
    _bottomArea.backgroundColor = UIColor.clearColor;
    [self addSubview:_bottomArea];
    _bottomArea.frame = CGRectMake(0, 250 - kAreaHeight, kRenScreenWidth, kAreaHeight);
    
    UIButton *playBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [playBtn setImage:[UIImage imageNamed:@"play-butt"] forState:UIControlStateNormal];
    [playBtn addTarget:self action:@selector(play) forControlEvents:UIControlEventTouchUpInside];
    [_bottomArea addSubview:playBtn];
    [playBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(_bottomArea);
        make.leading.equalTo(_bottomArea);
        make.width.equalTo(@44);
        make.height.equalTo(@44);
    }];
    
    _currentTimeLabel = [[UILabel alloc] init];
    _currentTimeLabel.font = [UIFont systemFontOfSize:12];
    _currentTimeLabel.textColor = UIColor.whiteColor;
    _currentTimeLabel.textAlignment = NSTextAlignmentCenter;
    _currentTimeLabel.text = @"--:--";
    [_bottomArea addSubview:_currentTimeLabel];
    [_currentTimeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(_bottomArea.mas_leading).offset(45);
        make.centerY.equalTo(_bottomArea);
        make.width.equalTo(@50);
        make.height.equalTo(_bottomArea);
    }];
    
    _totalDurationLabel = [[UILabel alloc] init];
    _totalDurationLabel.font = [UIFont systemFontOfSize:12];
    _totalDurationLabel.textColor = UIColor.whiteColor;
    _totalDurationLabel.textAlignment = NSTextAlignmentCenter;
    _totalDurationLabel.text = @"--:--";
    [_bottomArea addSubview:_totalDurationLabel];
    [_totalDurationLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.trailing.mas_equalTo(_bottomArea.mas_trailing).offset(-45);
        make.centerY.equalTo(_bottomArea);
        make.width.mas_greaterThanOrEqualTo(@50);
        make.height.equalTo(_bottomArea);
    }];
    
    _totalDurationView = [[UIView alloc] init];
    _totalDurationView.backgroundColor = UIColor.darkGrayColor;
    [_bottomArea addSubview:_totalDurationView];
    [_totalDurationView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(_currentTimeLabel.mas_trailing).offset(5);
        make.trailing.mas_equalTo(_totalDurationLabel.mas_leading).offset(-5);
        make.centerY.equalTo(_bottomArea);
        make.height.equalTo(@2);
    }];
    
    _currentTimeView = [[UIView alloc] init];
    _currentTimeView.backgroundColor = UIColor.orangeColor;
    [_bottomArea addSubview:_currentTimeView];
    [_currentTimeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(_totalDurationView.mas_leading);
        make.centerY.equalTo(_totalDurationView);
        make.height.equalTo(@2);
    }];
    
    UIButton *rotateBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [rotateBtn setImage:[UIImage imageNamed:@"playtips_ytox_bg"] forState:UIControlStateNormal];
    [rotateBtn addTarget:self action:@selector(rotate) forControlEvents:UIControlEventTouchUpInside];
    [_bottomArea addSubview:rotateBtn];
    [rotateBtn setImageEdgeInsets:UIEdgeInsetsMake(10, 10, 10, 10)];
    [rotateBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(_bottomArea);
        make.trailing.equalTo(_bottomArea);
        make.width.equalTo(@44);
        make.height.equalTo(@44);
    }];
}

- (void)layoutSubviews {
    
   
}

- (void)setCurrentTime:(NSInteger)currentTime {
    _currentTime = currentTime;
    _currentTimeLabel.text = [NSString stringWithFormat:@"%zd", currentTime];
    if (_totalDuration > 0 && currentTime <= _totalDuration) {
        CGFloat targetDurationLength = CGRectGetWidth(_totalDurationView.frame) * currentTime / _totalDuration;
        [_currentTimeView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(targetDurationLength);
        }];
    }
}

- (void)setTotalDuration:(NSInteger)totalDuration {
    _totalDuration = totalDuration;
    [_totalDurationLabel setText:[NSString stringWithFormat:@"%zd", totalDuration]];

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

- (void)cast {
    if (self.delegate && [self.delegate respondsToSelector:@selector(cast)]) {
        [self.delegate cast];
    }
}

- (void)back {
    if (self.delegate && [self.delegate respondsToSelector:@selector(back)]) {
        [self.delegate back];
    }
}

- (void)rotate {
    
}

-  (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
}
@end
