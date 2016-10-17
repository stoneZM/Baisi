//
//  LeftCatagoryCell.m
//  BaiSi
//
//  Created by stone on 16/9/6.
//  Copyright © 2016年 zm. All rights reserved.
//

#import "LeftCatagoryCell.h"

@interface LeftCatagoryCell()
@property (weak, nonatomic) IBOutlet UIView *indicateView;

@end

@implementation LeftCatagoryCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.backgroundColor = [UIColor clearColor];
    UIView* bgView = [[UIView alloc]init];
    bgView.backgroundColor = [UIColor whiteColor];
    self.selectedBackgroundView = bgView;

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    self.indicateView.hidden = !selected;
    self.textLabel.textColor = selected? [UIColor redColor] : [UIColor blackColor];
}

@end
