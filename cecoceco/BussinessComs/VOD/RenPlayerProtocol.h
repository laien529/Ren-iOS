//
//  RenPlayerProtocol.h
//  Ren
//
//  Created by Cedric Cheng on 2020/12/25.
//

#import <Foundation/Foundation.h>
#import "RenPlayerDelegate.h"

NS_ASSUME_NONNULL_BEGIN

@protocol RenPlayerProtocol <NSObject>

@property(nonatomic, weak) id<RenPlayerDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
