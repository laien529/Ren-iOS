//
//  RenTableViewController.h
//  Ren
//
//  Created by Cedric Cheng on 2020/12/17.
//

#import <UIKit/UIKit.h>
#import "FeedDataSource.h"
#import "RenTableViewCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface RenTableViewController : UITableViewController

@property(nonatomic, strong)FeedDataSource *renDataSource;
@end

NS_ASSUME_NONNULL_END
