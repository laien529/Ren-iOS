//
//  RenPlayerDelegate.h
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
@protocol RenPlayerProtocol;
@protocol RenPlayerDelegate <NSObject>

@required
- (void)player:(id<RenPlayerProtocol>)player from:(RenPlayerStatus)from to:(RenPlayerStatus)to;
- (void)player:(id<RenPlayerProtocol>)player intervalCurrentTime:(NSInteger)currentTime totalDuration:(NSInteger)totalDuration;
@end

NS_ASSUME_NONNULL_END
