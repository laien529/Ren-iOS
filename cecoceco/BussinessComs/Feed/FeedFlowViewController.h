//
//  FeedFlowViewController.h
//  Ren
//
//  Created by Cedric Cheng on 2020/12/16.
//

#import <UIKit/UIKit.h>
#import "RenTableViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface FeedFlowViewController : UIViewController

@property (nonatomic, strong)RenTableViewController *tableViewController;
@property (nonatomic, strong)UIStackView *stackView;

@end

NS_ASSUME_NONNULL_END
