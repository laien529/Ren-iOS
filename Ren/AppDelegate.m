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
      RenNavigationController([[NSClassFromString(@"HomeViewController") alloc] init]) ,
      
      RenNavigationController([[NSClassFromString(@"UGCViewController") alloc] init]),
                              
      RenNavigationController([[NSClassFromString(@"VIPViewController") alloc] init]),
                                                      
      RenNavigationController([[NSClassFromString(@"SocialViewController") alloc] init]),
                                                                              
      RenNavigationController([[NSClassFromString(@"MeViewController") alloc] init])
    ]];
    self.window.rootViewController = tabBarController;
    [self.window makeKeyAndVisible];
    [self.window addSubview:[[ViewController alloc] init].view];
    return YES;
}


@end
