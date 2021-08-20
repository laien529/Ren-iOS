//
//  FeedFlowViewController.m
//  Ren
//
//  Created by Cedric Cheng on 2020/12/16.
//

#import "FeedFlowViewController.h"
#import "FeedDataSource.h"
#import "HorizontalSTD.h"
#import "RenScaffold.h"
#import "RenNavigationBar.h"

@interface FeedFlowViewController ()

@property (nonatomic, strong)FeedDataModel *dataModel;
@property (nonatomic, strong)NSMutableArray *feedArray;
@property (nonatomic, strong)FeedDataSource *dataSource;
@end

@implementation FeedFlowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    [self.navigationController setNavigationBarHidden:YES];
    RenScaffold *scraffold = [[RenScaffold alloc] init];
    [scraffold setNavigationBar:[[RenNavigationBar alloc] init]];    
    _dataSource = [[FeedDataSource alloc] init];
    _tableViewController = [[RenTableViewController alloc] init];
    _tableViewController.view.backgroundColor = UIColor.whiteColor;
    [self addChildViewController:_tableViewController];
    [scraffold setContentView:_tableViewController.view];
    [self.view addSubview:scraffold];

    _tableViewController.renDataSource = _dataSource;

    [self fetchFeedDatas];
}

- (void)fetchFeedDatas {
    [_dataSource requestFeedDatas:^(FeedDataModel * _Nonnull dataModel) {
        self.dataModel = dataModel;
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableViewController.tableView reloadData];
        });
    }];
}

- (void)addToStackViewSubs:(NSArray*)datas {
    
}

@end
