//
//  HomeViewController.m
//  Ren
//
//  Created by Cedric Cheng on 2020/12/11.
//

#import "HomeViewController.h"
#import "RenNetworkManager.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [[RenNetworkManager sharedManager] requestWithURL:@"http://platconf.api.mgtv.com/app/startConfig?platform=android&appVersion=6.7.2&osVersion=9.1&osType=ios&did=4232jfldsfjsdlfsdfdsfsdf&ticket=&uuid=&mf=apple&src=mgtv" METHOD:@"GET" paramters:nil successBlock:^(NSURLResponse * _Nonnull response, id  _Nonnull responseObject, NSInteger retryTimes) {
            
        } failedBlock:^(NSError * _Nonnull error, NSURLResponse * _Nonnull response, NSInteger retryTimes) {
            
        }];
}
- (void)viewDidAppear:(BOOL)animated {
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
