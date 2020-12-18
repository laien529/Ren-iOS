//
//  RenTableViewCell.m
//  Ren
//
//  Created by Cedric Cheng on 2020/12/18.
//

#import "RenTableViewCell.h"
#import "FeedFlowCellFactory.h"

@implementation RenTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)setData:(id)data cellType:(nonnull NSString *)cellType {
    id<RenTableViewCellProtocol> cellContentView = [FeedFlowCellFactory getCellByType:cellType];
    [cellContentView setData:data cellType:cellType];
    self.block = cellContentView.block;
    self.cellHeight = cellContentView.cellHeight;
    [self.contentView addSubview:(UIView*)cellContentView];

}
@end
