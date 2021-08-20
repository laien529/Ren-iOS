//
//  RenScaffold.h
//  Ren
//
//  Created by Cedric Cheng on 2020/12/18.
//

#import <UIKit/UIKit.h>
#import "RenNavigationBar.h"
#import "RenTabBarController.h"

NS_ASSUME_NONNULL_BEGIN

@interface RenScaffold : UIView

@property(nonatomic, strong) RenNavigationBar *navigationBar;
@property(nonatomic, strong) UIView *contentView;
@property(nonatomic, assign) CGFloat tabbarHeight;

@end

NS_ASSUME_NONNULL_END
