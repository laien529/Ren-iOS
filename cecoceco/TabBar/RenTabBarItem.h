//
//  RenTabBarItem.h
//  Ren
//
//  Created by Cedric Cheng on 2020/12/9.
//

#import <UIKit/UIKit.h>
#import "RenTabBarItemConfig.h"

NS_ASSUME_NONNULL_BEGIN

@protocol RenTabBarDelegate <NSObject>

- (void)didSelectItem:(NSInteger)index;

@end

@interface RenTabBarItem : UIView

@property(nonatomic, strong)RenTabBarItemConfig *itemConfig;
@property(nonatomic, weak) id<RenTabBarDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
