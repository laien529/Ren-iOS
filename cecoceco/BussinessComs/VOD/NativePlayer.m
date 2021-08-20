//
//  NativePlayer.m
//  Ren
//
//  Created by Cedric Cheng on 2020/12/23.
//

#import "NativePlayer.h"

@interface NativePlayer () {
    dispatch_queue_t _nativePlayerQueue;
}

@end

@implementation NativePlayer

- (instancetype)initWithUrl:(NSString*)url {
    self = [super init];
    if (self) {
        _playerItem = [AVPlayerItem playerItemWithURL:[NSURL URLWithString:url]];
        [_playerItem addObserver:self forKeyPath:@"status" options:NSKeyValueObservingOptionNew context:nil];
        _avPlayer = [AVPlayer playerWithPlayerItem:_playerItem];
        _playerLayer = [AVPlayerLayer playerLayerWithPlayer:_avPlayer];
        _nativePlayerQueue = dispatch_queue_create("ren.nativePlayer.queue", NULL);
        __weak typeof(self) weakSelf = self;
        [_avPlayer addPeriodicTimeObserverForInterval:CMTimeMake(1, 1) queue:_nativePlayerQueue usingBlock:^(CMTime time) {
            NSInteger duration = weakSelf.playerItem.duration.value / weakSelf.playerItem.duration.timescale;
            NSInteger currentTime = weakSelf.playerItem.currentTime.value / weakSelf.playerItem.currentTime.timescale;

            if (weakSelf.delegate && [weakSelf.delegate respondsToSelector:@selector(player:intervalCurrentTime:totalDuration:)]) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    [weakSelf.delegate player:weakSelf intervalCurrentTime:currentTime totalDuration:duration];
                }) ;
            }
        }];
    }
    return self;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    if ([object isKindOfClass:[AVPlayerItem class]] && [keyPath isEqualToString:@"status"]) {
        AVPlayerItemStatus newStatus = [change[NSKeyValueChangeNewKey] intValue];
        AVPlayerItemStatus oldStatus = [change[NSKeyValueChangeOldKey] intValue];
        
        switch (newStatus) {
            case AVPlayerItemStatusUnknown:
                
                break;
            case AVPlayerItemStatusReadyToPlay:
                
                break;
            default:
                break;
        }
        if (self.delegate && [self.delegate respondsToSelector:@selector(player:from:to:)]) {
            [self.delegate player:self from:oldStatus to:newStatus];
        }
    }
}
@end
