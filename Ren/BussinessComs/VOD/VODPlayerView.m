//
//  VODPlayerView.m
//  Ren
//
//  Created by Cedric Cheng on 2020/12/23.
//

#import "VODPlayerView.h"

@implementation VODPlayerView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame {
    self  = [super initWithFrame:frame];
    if (self) {
//        self.userInteractionEnabled = NO;
        _player = [[NativePlayer alloc] initWithUrl:@"http://gslb.miaopai.com/stream/oxX3t3Vm5XPHKUeTS-zbXA__.mp4"];
        _player.playerLayer.frame = frame;
        [self.layer addSublayer:_player.playerLayer];
    }
    return self;;
}

- (void)play {
    if (_player.avPlayer.timeControlStatus == AVPlayerTimeControlStatusPlaying) {
        [_player.avPlayer pause];
    } else if (_player.avPlayer.timeControlStatus == AVPlayerTimeControlStatusPaused) {
        [_player.avPlayer play];
    }
}
@end
