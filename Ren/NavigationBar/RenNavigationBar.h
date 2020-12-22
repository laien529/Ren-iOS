//
//  RenNavigationBar.h
//  Ren
//
//  Created by Cedric Cheng on 2020/12/18.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

inline BOOL isNotchScreen() {
    
    if ([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad) {
        return NO;
    }
    
    CGSize size = [UIScreen mainScreen].bounds.size;
    NSInteger notchValue = size.width / size.height * 100;
    
    if (216 == notchValue || 46 == notchValue) {
        return YES;
    }
    
    return NO;
}

@interface RenNavigationBar : UIView
@property(nonatomic, assign)UIColor *bgColor;
@end

NS_ASSUME_NONNULL_END
