//
//  SeekIndicator.h
//  Ren
//
//  Created by Cedric Cheng on 2020/12/25.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SeekIndicator : UIView

@property(nonatomic, assign)CGFloat totalDuraion;
@property(nonatomic, assign)CGFloat targetDuraion;

- (void)endSeek;

@end

NS_ASSUME_NONNULL_END
