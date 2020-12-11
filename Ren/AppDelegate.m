//
//  AppDelegate.m
//  Ren
//
//  Created by Cedric Cheng on 2020/12/9.
//

#import "AppDelegate.h"
#import "RenTabBarController.h"

@interface AppDelegate ()
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    RenTabBarController *tabBarController = [[RenTabBarController alloc] init];
    self.window.rootViewController = tabBarController;
    
    [self.window makeKeyAndVisible];
    return YES;
}


@end
