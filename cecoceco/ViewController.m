//
//  ViewController.m
//  Ren
//
//  Created by Cedric Cheng on 2020/12/9.
//

#import "ViewController.h"
#import <Lottie/Lottie.h>

@interface ViewController () {
    LOTAnimationView *logoView;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithRed:9/255.0 green:208/255.0 blue:193/255.0 alpha:1];
    
    logoView = [LOTAnimationView animationNamed:@"LottieLogo1"];
    logoView.contentMode = UIViewContentModeScaleAspectFill;
    [self.view addSubview:logoView];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    logoView.frame = CGRectMake(0, CGRectGetHeight(self.view.frame) / 3, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame) / 3);
    [logoView playWithCompletion:^(BOOL animationFinished) {
        [self.view removeFromSuperview];
    }];
}

@end
