//
//  RenPlayerProtocol.h
//  Ren
//
//  Created by Cedric Cheng on 2020/12/25.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, RenPlayerStatus) {
    RenPlayerStatusPause,
    RenPlayerStatusReadyToPlay,
    RenPlayerStatusPlaying
};

@protocol RenPlayerProtocol <NSObject>

- (void)player:(id<RenPlayerProtocol>)player from:(RenPlayerStatus)from to:(RenPlayerStatus)to;

@end

NS_ASSUME_NONNULL_END
