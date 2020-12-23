//
//  VODViewController.m
//  Ren
//
//  Created by Cedric Cheng on 2020/12/23.
//

#import "VODViewController.h"
#import "VODControlViewH.h"
#import "VODControlViewV.h"
#import "VODPlayerView.h"
#import "VODBarrageView.h"

@interface VODViewController () {
    VODControlViewH *_controlViewH;
    VODControlViewV *_controlViewV;
    VODPlayerView *_playerView;
    VODBarrageView *_barrageView;
    BOOL _isHorizontal;

}

@end

@implementation VODViewController

- (instancetype)initWithVertical {
    self = [super init];
    if (self) {
        _controlViewV = [[VODControlViewV alloc] init];
        _controlViewV.delegate = self;
        _isHorizontal = NO;
        self.view.backgroundColor = [UIColor blackColor];
    }
    return self;
}

- (instancetype)initWithHorizontal {
    self = [super init];
    if (self) {
        _controlViewH = [[VODControlViewH alloc] init];
        _controlViewH.delegate = self;
        _isHorizontal = YES;
        self.view.backgroundColor = [UIColor blackColor];
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

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    CGRect playerFrame = CGRectZero;
    if (_isHorizontal) {
        playerFrame = CGRectMake(0, 0, kRenScreenHeight, kRenScreenWidth);
    } else {
        playerFrame = CGRectMake(0, 0, kRenScreenWidth, 250);
    }
    _playerView = [[VODPlayerView alloc] initWithFrame:playerFrame];
    [self.view addSubview:_playerView];
    
    _barrageView = [[VODBarrageView alloc] initWithFrame:_isHorizontal ? _controlViewH.frame : _controlViewV.frame];
    [self.view addSubview:_barrageView];
    
    if (_controlViewV) {
        [self.view addSubview:_controlViewV];
    }
    if (_controlViewH) {
        [self.view addSubview:_controlViewH];
    }
}
- (void)viewWillAppear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:YES];
}

- (void)viewDidAppear:(BOOL)animated {
//    [_playerView play];
}
- (void)viewWillLayoutSubviews {
    
}

- (void)back {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)play {
    [_playerView play];
}

- (void)dealloc {
    
}
@end
