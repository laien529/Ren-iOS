//
//  FeedFlowCellProtocol.h
//  Ren
//
//  Created by Cedric Cheng on 2020/12/17.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^ClickBlock)(id data);
@protocol RenTableViewCellProtocol <NSObject>

@property(nonatomic, assign) CGFloat cellHeight;
@property(nonatomic, copy) ClickBlock block;

@required
- (void)setData:(id)data cellType:(NSString*)cellType ;

@optional
- (void)didClick:(id)data;

@end

NS_ASSUME_NONNULL_END
