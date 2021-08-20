//
//  PlayerGestureLayer.m
//  Ren
//
//  Created by Cedric Cheng on 2020/12/24.
//

#import "PlayerGestureLayer.h"

@interface PlayerGestureLayer () {
    CGFloat _baselineX;
    CGFloat _startOffsetY;
    CGFloat _startOffsetX;
    BOOL _leftHalf;
    PlayerGestureType gestureType;
}

@end

@implementation PlayerGestureLayer

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _baselineX = self.centerY;
        gestureType = -1;
    }
    return self;
}

- (void)setBaseline:(CGFloat)baseline {
    _baselineX = baseline;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self];
    _startOffsetX = point.x;
    _startOffsetY = point.y;
    if (_startOffsetX > _baselineX) { //
        _leftHalf = NO;
    } else {
        _leftHalf = YES;
    }
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self];
    CGFloat pointX = point.x;
    CGFloat pointY = point.y;
    CGFloat offSetX = pointX - _startOffsetX;
    CGFloat offSetY = pointY - _startOffsetY;
    if ((offSetX == 0 && offSetY == 0) || (offSetX < 5 && offSetY < 5)) {
        return;
    }
    if (gestureType == -1) { //未判定手势类型前
        if (fabs(offSetY) < fabs(offSetX)) { //seeking, focus offSetX change
            gestureType = PlayerGestureTypeSeek;
        } else { //focus offSetY change
            if (_leftHalf) { //light
                gestureType = PlayerGestureTypeLight;
            } else { //volume
                gestureType = PlayerGestureTypeVolume;
            }
        }
    }
    
    switch (gestureType) {
        case PlayerGestureTypeSeek:{
            if (offSetX > 0) {
                if (_delegate && [_delegate respondsToSelector:@selector(seekForward:)]) {
                    [_delegate seekForward:offSetX];
                }
            } else if (offSetX < 0) {
                if (_delegate && [_delegate respondsToSelector:@selector(seekBackward:)]) {
                    [_delegate seekBackward:offSetX];
                }
            }
            break;
        }
        case PlayerGestureTypeLight:{
            if (offSetY > 0) {
                if (_delegate && [_delegate respondsToSelector:@selector(lightDown:)]) {
                    [_delegate lightDown:offSetY];
                }
            } else if (offSetY < 0){
                if (_delegate && [_delegate respondsToSelector:@selector(lightUp:)]) {
                    [_delegate lightUp:offSetY];
                }
            }
            break;
        }
        case PlayerGestureTypeVolume:{
            if (offSetY > 0) {
                if (_delegate && [_delegate respondsToSelector:@selector(volumeDown:)]) {
                    [_delegate volumeDown:offSetY];
                }
            } else if (offSetY < 0){
                if (_delegate && [_delegate respondsToSelector:@selector(volumeUp:)]) {
                    [_delegate volumeUp:offSetY];
                }
            }
            break;;
        }
        default:
            break;
    }
    
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    gestureType = -1;
    if (self.delegate && [self.delegate respondsToSelector:@selector(gestureEnd)]) {
        [self.delegate gestureEnd];
    }
}

- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
}
@end
