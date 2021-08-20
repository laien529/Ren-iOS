//
//  SeekIndicator.m
//  Ren
//
//  Created by Cedric Cheng on 2020/12/25.
//

#import "SeekIndicator.h"

static const CGFloat kDurationViewHeight = 2;

@interface SeekIndicator () {
    UILabel *_targetDurationLabel;
    UIView *_totalDurationView;
    UIView *_targetDurationView;
}

@end

@implementation SeekIndicator

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
        _totalDuraion = 0;
        _targetDuraion = 0;
        
        _targetDurationLabel = [[UILabel alloc] init];
        [_targetDurationLabel setTextColor:UIColor.whiteColor];
        _targetDurationLabel.font = [UIFont boldSystemFontOfSize:28];
        
        _totalDurationView = [[UIView alloc] init];
        _totalDurationView.backgroundColor = UIColor.lightGrayColor;
        _totalDurationView.alpha = 0.5;
        
        _targetDurationView = [[UIView alloc] init];
        _targetDurationView.backgroundColor = UIColor.whiteColor;
        
        [self addSubview:_targetDurationLabel];
        [self addSubview:_totalDurationView];
        [self addSubview:_targetDurationView];

        
    }
    return self;
}

- (void)layoutSubviews {
    [_totalDurationView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self);
        make.height.mas_equalTo(kDurationViewHeight);
        make.width.mas_equalTo(self);
    }];
    [_targetDurationView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_totalDurationView);
        make.leading.equalTo(_totalDurationView);
        make.height.mas_equalTo(kDurationViewHeight);
//            make.width.mas_equalTo(_totalDurationView);
    }];
    [_targetDurationLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.bottom.equalTo(_totalDurationView).offset(-10);
    }];
}

- (void)setTargetDuraion:(CGFloat)targetDuraion {
    _targetDuraion = targetDuraion;
    if (_totalDuraion > 0 && _targetDuraion <= _totalDuraion) {
        CGFloat targetDurationLength = CGRectGetWidth(_totalDurationView.frame) * _targetDuraion / _totalDuraion;
        [_targetDurationView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(targetDurationLength);
        }];
        _targetDurationLabel.text = [NSString stringWithFormat:@"%.0f/%.0f", _targetDuraion, _totalDuraion];
    }
}

- (void)endSeek {
    self.hidden = YES;
}

@end
