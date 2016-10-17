//
//  RightCatagoryCell.m
//  BaiSi
//
//  Created by stone on 16/9/6.
//  Copyright © 2016年 zm. All rights reserved.
//

#import "RightCatagoryCell.h"
@interface RightCatagoryCell()
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLb;
@property (weak, nonatomic) IBOutlet UILabel *fansLb;

@end


@implementation RightCatagoryCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}
-(void)setModel:(RecommendListModel *)model{
    self.nameLb.text = model.screen_name;
    self.fansLb.text = [NSString stringWithFormat:@"%ld人关注",(long)model.fans_count];
    [self.iconImageView sd_setImageWithURL:[NSURL URLWithString:model.header] placeholderImage:nil];
}


#pragma mark -- 关注按钮的点击
- (IBAction)followBtn:(UIButton *)sender {
    sender.selected = !sender.selected;
}





@end
