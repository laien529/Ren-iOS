//
//  RenTabBarController.m
//  Ren
//
//  Created by Cedric Cheng on 2020/12/9.
//

#import "RenTabBarController.h"
#import "RenTabBarItem.h"


#define statusBarHeight CGRectGetHeight(UIApplication.sharedApplication.statusBarFrame)

#define tabBarHeight (statusBarHeight == 20 ? 49 : 83)

#define safeBottomHeight 34

@interface RenTabBarController ()<RenTabBarDelegate, UITabBarControllerDelegate, UIViewControllerAnimatedTransitioning> {
    NSMutableArray *tabBarConfigArray;
    NSMutableArray *tabBarItemArray;
    NSInteger currentIndex;

}

@end

@implementation RenTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = UIColor.whiteColor;
    NSInteger idx = 0;
    NSInteger count = [self tabBarConfigArray].count;
    CGFloat width = kScreenWidth / count;
    for (RenTabBarItemConfig *config in [self tabBarConfigArray]) {
        RenTabBarItem *item = [[RenTabBarItem alloc] init];
        config.iconHighlight = [NSString stringWithFormat:@"menubar_iCON0%ld_seleted", (long)config.index + 1];
        config.iconNormal = [NSString stringWithFormat:@"menubar_iCON0%ld_normal", (long)config.index + 1];
        item.itemConfig = config;

        [item setFrame:CGRectMake(idx * width, (CGRectGetHeight(self.view.frame) - tabBarHeight), width, tabBarHeight)];
        item.delegate = self;
        [self.view addSubview:item];
        [tabBarItemArray addObject:item];
        idx++;
    }
}

- (NSArray*)tabBarConfigArray {
    if (!tabBarConfigArray) {
        tabBarConfigArray = [[NSMutableArray alloc] init];
        
        RenTabBarItemConfig *config1 = [RenTabBarItemConfig alloc];
        config1.isSelected = YES;
//        config1.text = @"会话";
        config1.index = 0;
        
        RenTabBarItemConfig *config2 = [RenTabBarItemConfig alloc];
//        config2.text = @"通讯录";
        config2.index = 1;

        RenTabBarItemConfig *config3 = [RenTabBarItemConfig alloc];
//        config3.text = @"REN";
        config3.index = 2;

        RenTabBarItemConfig *config4 = [RenTabBarItemConfig alloc];
//        config4.text = @"发现";
        config4.index = 3;

        RenTabBarItemConfig *config5 = [RenTabBarItemConfig alloc];
//        config5.text = @"我";
        config5.index = 4;

        [tabBarConfigArray addObject:config1];
        [tabBarConfigArray addObject:config2];
        [tabBarConfigArray addObject:config3];
        [tabBarConfigArray addObject:config4];
        [tabBarConfigArray addObject:config5];


    }
    return tabBarConfigArray;
}

- (void)didSelectItem:(NSInteger)index {
    if (currentIndex == index) {
        return;
    }
    RenTabBarItemConfig *previousItemConfig = tabBarConfigArray[currentIndex];
    previousItemConfig.isSelected = NO;
   
    
    currentIndex = index;
    RenTabBarItemConfig *itemConfig = tabBarConfigArray[currentIndex];
    itemConfig.isSelected = YES;
    [self setSelectedIndex:currentIndex];
}

- (id<UIViewControllerAnimatedTransitioning>)tabBarController:(UITabBarController *)tabBarController animationControllerForTransitionFromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC {
    return nil;
}

- (UIInterfaceOrientationMask)tabBarControllerSupportedInterfaceOrientations:(UITabBarController *)tabBarController {
    return UIInterfaceOrientationMaskPortrait;
}


- (NSTimeInterval)transitionDuration:(nullable id<UIViewControllerContextTransitioning>)transitionContext {
    return 0.5;
}


@end
