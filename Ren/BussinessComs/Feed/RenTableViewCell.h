//
//  RenTableViewCell.h
//  Ren
//
//  Created by Cedric Cheng on 2020/12/18.
//

#import <UIKit/UIKit.h>
#import "RenTableViewCellProtocol.h"
NS_ASSUME_NONNULL_BEGIN

@interface RenTableViewCell : UITableViewCell<RenTableViewCellProtocol>

@property(nonatomic, assign) CGFloat cellHeight;

@end

NS_ASSUME_NONNULL_END
