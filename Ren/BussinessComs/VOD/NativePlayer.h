//
//  NativePlayer.h
//  Ren
//
//  Created by Cedric Cheng on 2020/12/23.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NativePlayer : NSObject

@property(nonatomic, strong)AVPlayer *avPlayer;
@property(nonatomic, strong)AVPlayerLayer *playerLayer;
@property(nonatomic, strong)AVPlayerItem *playerItem;
- (instancetype)initWithUrl:(NSString*)url;
@end

NS_ASSUME_NONNULL_END
