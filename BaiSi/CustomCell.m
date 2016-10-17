//
//  CustomCell.m
//  BaiSi
//
//  Created by stone on 2016/10/3.
//  Copyright © 2016年 zm. All rights reserved.
//

#import "CustomCell.h"

@interface CustomCell()
@property (weak, nonatomic) IBOutlet UIImageView *iconIv;
@property (weak, nonatomic) IBOutlet UILabel *screenNameLb;

@end

@implementation CustomCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.iconIv.layer.cornerRadius = 17.5;
    self.iconIv.layer.masksToBounds = YES;
     NSLog(@"----%lf",self.height);
    ZMLogfunc;
}

-(void)layoutSubviews{
   
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

@end
