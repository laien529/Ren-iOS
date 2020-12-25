//
//  PlayerGestureLayer.h
//  Ren
//
//  Created by Cedric Cheng on 2020/12/24.
//

#import <UIKit/UIKit.h>
#import "PlayerControlLayerProtocol.h"

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, PlayerGestureType) {
    PlayerGestureTypeVolume = 0,
    PlayerGestureTypeLight,
    PlayerGestureTypeSeek
};

@interface PlayerGestureLayer : UIView

@property(nonatomic, weak)id<PlayerControlLayerProtocol> delegate;

@end

NS_ASSUME_NONNULL_END
