//
//  RenTableViewController.m
//  Ren
//
//  Created by Cedric Cheng on 2020/12/17.
//

#import "RenTableViewController.h"

@interface RenTableViewController ()

@end

@implementation RenTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.delegate = self;
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)setRenDataSource:(id<UITableViewDataSource>)renDataSource {
    _renDataSource = (FeedDataSource*)renDataSource;
    self.tableView.dataSource = _renDataSource;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSNumber *height = [_renDataSource.rowHeightCache objectForKey:indexPath];
    if (!height || ![height isKindOfClass:[NSNumber class]]) {
        return 0;
    }
    return height.floatValue;
}

//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
//    return 20;
//}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    FeedData *data = _renDataSource.feedModel.data[indexPath.section];
    RenTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:data.moduleType forIndexPath:indexPath];
    

}
@end
