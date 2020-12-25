//
//  VODViewController.h
//  Ren
//
//  Created by Cedric Cheng on 2020/12/23.
//

#import <UIKit/UIKit.h>
#import "PlayerControlLayerProtocol.h"
NS_ASSUME_NONNULL_BEGIN

@interface VODViewController : UIViewController<PlayerControlLayerProtocol>

- (instancetype)initWithHorizontal;
- (instancetype)initWithVertical;

@end

NS_ASSUME_NONNULL_END
