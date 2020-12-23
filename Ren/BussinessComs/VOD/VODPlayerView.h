//
//  VODPlayerView.h
//  Ren
//
//  Created by Cedric Cheng on 2020/12/23.
//

#import <UIKit/UIKit.h>
#import "NativePlayer.h"

NS_ASSUME_NONNULL_BEGIN

@interface VODPlayerView : UIView

@property(nonatomic, strong)NativePlayer *player;

@end

NS_ASSUME_NONNULL_END
