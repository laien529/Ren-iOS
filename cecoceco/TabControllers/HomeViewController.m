//
//  HomeViewController.m
//  Ren
//
//  Created by Cedric Cheng on 2020/12/11.
//

#import "HomeViewController.h"
#import "FeedFlowViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    FeedFlowViewController *feedFlow = [[FeedFlowViewController alloc] init];
    [self addChildViewController:feedFlow];
    [self.view addSubview:feedFlow.view];

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
