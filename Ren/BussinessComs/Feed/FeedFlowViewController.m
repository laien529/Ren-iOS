//
//  FeedFlowViewController.m
//  Ren
//
//  Created by Cedric Cheng on 2020/12/16.
//

#import "FeedFlowViewController.h"
#import "FeedDataSource.h"

@interface FeedFlowViewController ()
@property (nonatomic, strong)UIStackView *stackView;
@end

@implementation FeedFlowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _stackView = [[UIStackView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:_stackView];
    
    [self fetchFeedDatas];
}

- (void)fetchFeedDatas {
    [FeedDataSource requestFeedDatas:^(FeedDataModel * _Nonnull dataModel) {
    }];
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
