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

- (void)seekTo:(NSInteger)duration;
- (void)next;

@end

NS_ASSUME_NONNULL_END
