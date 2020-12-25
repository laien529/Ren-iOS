//
//  VODViewController.m
//  Ren
//
//  Created by Cedric Cheng on 2020/12/23.
//

#import "VODViewController.h"
#import "PlayerGestureLayer.h"
#import "VODControlViewH.h"
#import "VODControlViewV.h"
#import "VODPlayerView.h"
#import "VODBarrageView.h"
#import "SeekIndicator.h"

@interface VODViewController () {
    PlayerGestureLayer *_gestureLayer;
    VODControlViewH *_controlViewH;
    VODControlViewV *_controlViewV;
    VODPlayerView *_playerView;
    VODBarrageView *_barrageView;
    SeekIndicator *_seekIndicator;
    BOOL _isHorizontal;

}

@end

@implementation VODViewController

#pragma mark- --setupViews
- (instancetype)initWithVertical {
    self = [super init];
    if (self) {
        _controlViewV = [[VODControlViewV alloc] init];
        _controlViewV.delegate = self;
        _isHorizontal = NO;
    }
    return self;
}

- (instancetype)initWithHorizontal {
    self = [super init];
    if (self) {
        _controlViewH = [[VODControlViewH alloc] init];
        _controlViewH.delegate = self;
        _isHorizontal = YES;
//        CGFloat duration = [UIApplication sharedApplication].statusBarOrientationAnimationDuration;
//
//        [[UIApplication sharedApplication] setStatusBarOrientation:UIDeviceOrientationLandscapeRight animated:YES];
//
//        [UIView animateWithDuration:duration animations:^{
//            self.view.transform = CGAffineTransformMakeRotation(M_PI / 2);
//        }];
    }
    return self;
}

- (SeekIndicator*)seekIndicator {
    if (!_seekIndicator) {
        _seekIndicator = [[SeekIndicator alloc] init];
        _seekIndicator.totalDuraion = 200;

        [self.view addSubview:_seekIndicator];
        [_seekIndicator mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(_playerView);
            make.width.equalTo(@300);
            make.height.equalTo(@150);
        }];
    }
    return _seekIndicator;
}

#pragma mark- --rotate
- (BOOL)shouldAutorotate {
    return YES;
}

- (void)setInterfaceOrientation:(UIInterfaceOrientation*)orientation {
    if ([[UIDevice currentDevice] respondsToSelector:@selector(setOrientation:)]) {
        SEL selector = NSSelectorFromString(@"setOrientation:");
        NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:[UIDevice
            instanceMethodSignatureForSelector:selector]];
        [invocation setSelector:selector];
        [invocation setTarget:[UIDevice currentDevice]];
        UIInterfaceOrientation *val = orientation;
        [invocation setArgument:&val atIndex:2];
        [invocation invoke];
            }
}

//- (void)setInterfaceOrientation:(UIDeviceOrientation*)orientation {
//    if ([[UIDevice currentDevice] respondsToSelector:@selector(setOrientation:)]) {
//                SEL selector = NSSelectorFromString(@"setOrientation:");
//                NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:[UIDevice
//            instanceMethodSignatureForSelector:selector]];
//                [invocation setSelector:selector];
//                [invocation setTarget:[UIDevice currentDevice]];
//                int val = orientation;
//                [invocation setArgument:&val atIndex:2];
//                [invocation invoke];
//            }
//}
#pragma mark- --LifeStyle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor blackColor];

    CGRect playerFrame = CGRectZero;
    if (_isHorizontal) {
        playerFrame = CGRectMake(0, 44, kRenScreenHeight, kRenScreenWidth);
    } else {
        playerFrame = CGRectMake(0, 44, kRenScreenWidth, 250);
    }
    _playerView = [[VODPlayerView alloc] initWithFrame:playerFrame];
    [self.view addSubview:_playerView];
    
    _gestureLayer = [[PlayerGestureLayer alloc] initWithFrame:_playerView.frame];
    _gestureLayer.delegate = self;
    [_playerView addSubview:_gestureLayer];
    
    _barrageView = [[VODBarrageView alloc] initWithFrame:_isHorizontal ? _controlViewH.frame : _controlViewV.frame];
    [_gestureLayer addSubview:_barrageView];
    
    if (_controlViewV) {
        [_barrageView addSubview:_controlViewV];
    }
    if (_controlViewH) {
        [self.view addSubview:_controlViewH];
    }
}

- (void)viewWillAppear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:YES];
}

- (void)viewDidAppear:(BOOL)animated {

}

- (void)viewWillLayoutSubviews {
    
}


#pragma mark- --PlayerControlLayerProtocol
- (void)back {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)play {
    [_playerView play];
}

- (void)volumeUp:(CGFloat)up {
    
}

- (void)volumeDown:(CGFloat)down {
    
}
- (void)lightUp:(CGFloat)up {
    
}

- (void)lightDown:(CGFloat)down {
    
}

- (void)seekForward:(NSInteger)duration {
    _seekIndicator.hidden = NO;
    self.seekIndicator.targetDuraion = duration;
}

- (void)seekBackward:(NSInteger)duration {
    _seekIndicator.hidden = NO;
    self.seekIndicator.targetDuraion = duration;
}

- (void)gestureEnd {
    _seekIndicator.hidden = YES;
}
#pragma mark- --dealloc
- (void)dealloc {
    
}
@end
