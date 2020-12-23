//
//  VODControlViewV.h
//  Ren
//
//  Created by Cedric Cheng on 2020/12/23.
//

#import <UIKit/UIKit.h>
#import "PlayerControlLayerProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface VODControlViewV : UIView
@property(nonatomic, weak) id<PlayerControlLayerProtocol> delegate;
@end

NS_ASSUME_NONNULL_END
