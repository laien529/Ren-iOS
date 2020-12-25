//
//  PlayerControlLayerProtocol.h
//  Ren
//
//  Created by Cedric Cheng on 2020/12/23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol PlayerControlLayerProtocol <NSObject>

@required
- (void)back;
- (void)play;

@optional
- (void)more;

- (void)seekForward:(NSInteger)duration;
- (void)seekBackward:(NSInteger)duration;
- (void)next;

- (void)volumeUp:(CGFloat)up;
- (void)volumeDown:(CGFloat)down;

- (void)lightUp:(CGFloat)up;
- (void)lightDown:(CGFloat)down;

- (void)gestureEnd;

@end

NS_ASSUME_NONNULL_END
