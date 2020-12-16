//
//  AppDelegate.m
//  Ren
//
//  Created by Cedric Cheng on 2020/12/9.
//

#import "AppDelegate.h"
#import "RenTabBarController.h"
#import "ViewController.h"
#import "SDKConfigDataSource.h"

@interface AppDelegate ()
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    
    [SDKConfigDataSource requestSDKConfig:^(SDKConfigModel * _Nonnull configModel) {
        
    }];
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    RenTabBarController *tabBarController = [[RenTabBarController alloc] init];
    [tabBarController setViewControllers:@
     [
     [[NSClassFromString(@"HomeViewController") alloc] init],
     [[NSClassFromString(@"UGCViewController") alloc] init],
     [[NSClassFromString(@"VIPViewController") alloc] init],
     [[NSClassFromString(@"SocialViewController") alloc] init],
     [[NSClassFromString(@"MeViewController") alloc] init]
    ]];
    self.window.rootViewController = tabBarController;
    [self.window makeKeyAndVisible];
    [self.window addSubview:[[ViewController alloc] init].view];
    return YES;
}


@end
