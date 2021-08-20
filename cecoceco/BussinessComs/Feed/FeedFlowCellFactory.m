//
//  FeedFlowCellFactory.m
//  Ren
//
//  Created by Cedric Cheng on 2020/12/17.
//

#import "FeedFlowCellFactory.h"

@implementation FeedFlowCellFactory

+ (nonnull id<RenTableViewCellProtocol>)getCellByType:(NSString*)cellType {
    id<RenTableViewCellProtocol> cell = [[NSClassFromString(cellType) alloc] init];
    return cell;
}
@end
