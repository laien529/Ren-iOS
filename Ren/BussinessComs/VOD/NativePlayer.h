//
//  NativePlayer.h
//  Ren
//
//  Created by Cedric Cheng on 2020/12/23.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>
#import "RenPlayerProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface NativePlayer : NSObject<RenPlayerProtocol>

@property(nonatomic, strong)AVPlayer *avPlayer;
@property(nonatomic, strong)AVPlayerLayer *playerLayer;
@property(nonatomic, strong)AVPlayerItem *playerItem;
@property(nonatomic, weak)id<RenPlayerDelegate> delegate;
- (instancetype)initWithUrl:(NSString*)url;
@end

NS_ASSUME_NONNULL_END
