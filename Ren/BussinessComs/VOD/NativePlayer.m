//
//  NativePlayer.m
//  Ren
//
//  Created by Cedric Cheng on 2020/12/23.
//

#import "NativePlayer.h"

@implementation NativePlayer

- (instancetype)initWithUrl:(NSString*)url {
    self = [super init];
    if (self) {
        
        _playerItem = [AVPlayerItem playerItemWithURL:[NSURL URLWithString:url]];
        [_playerItem addObserver:self forKeyPath:@"status" options:NSKeyValueObservingOptionNew context:nil];
        _avPlayer = [AVPlayer playerWithPlayerItem:_playerItem];
        _playerLayer = [AVPlayerLayer playerLayerWithPlayer:_avPlayer];
    }
    return self;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    if ([object isKindOfClass:[AVPlayerItem class]] && [keyPath isEqualToString:@"status"]) {
        AVPlayerItemStatus status = [change[NSKeyValueChangeNewKey] intValue];
        switch (status) {
            case AVPlayerItemStatusUnknown:
                
                break;
            case AVPlayerItemStatusReadyToPlay:
                
                break;;
            default:
                break;
        }
    }
}
@end
