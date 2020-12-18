//
//  FeedFlowViewController.m
//  Ren
//
//  Created by Cedric Cheng on 2020/12/16.
//

#import "FeedFlowViewController.h"
#import "FeedDataSource.h"
#import "HorizontalSTD.h"

@interface FeedFlowViewController ()

@property (nonatomic, strong)FeedDataModel *dataModel;
@property (nonatomic, strong)NSMutableArray *feedArray;
@property (nonatomic, strong)FeedDataSource *dataSource;
@end

@implementation FeedFlowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _dataSource = [[FeedDataSource alloc] init];
    
    _tableViewController = [[RenTableViewController alloc] init];
    [self addChildViewController:_tableViewController];
    [self.view addSubview:_tableViewController.view];
    _tableViewController.renDataSource = _dataSource;
    [_tableViewController.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view);
        make.leading.mas_equalTo(self.view);
        make.trailing.mas_equalTo(self.view);
        make.width.mas_equalTo(self.view);
        make.height.mas_equalTo(self.view);

    }];
    _tableViewController.view.backgroundColor = UIColor.yellowColor;
  
    _stackView = [[UIStackView alloc] initWithFrame:self.view.frame];

//    
//    [_stackView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.width.mas_equalTo(_scrollView);
//        make.leading.mas_equalTo(_scrollView);
//        make.trailing.mas_equalTo(_scrollView);
//        make.top.mas_equalTo(_scrollView);
//        make.bottom.mas_equalTo(_scrollView);
//
//    }];
    
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
/* StackView
- (void)reloadStackViewSubs:(NSArray*)datas {
    _stackView.axis = UILayoutConstraintAxisVertical;
//    _stackView.alignment = UIStackViewAlignmentFill;
    _stackView.distribution = UIStackViewDistributionFill;
//    _stackView.translatesAutoresizingMaskIntoConstraints = NO;
//    _stackView.spacing = 0;
    for (ModuleData *moduleData in datas) {
        HorizontalSTD *hView = [[HorizontalSTD alloc] init];
        [hView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo(@(300));
        }];
        [hView setData:moduleData];
        [_stackView addArrangedSubview:hView];
      
    }
}
*/
- (void)addToStackViewSubs:(NSArray*)datas {
    
}

@end
