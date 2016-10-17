//
//  CustomBtn.m
//  BaiSi
//
//  Created by stone on 2016/10/3.
//  Copyright © 2016年 zm. All rights reserved.
//

#import "CustomBtn.h"
#import <UIButton+WebCache.h>
@implementation CustomBtn

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setLabel];
        [self setBackgroundColor:[UIColor whiteColor]];
    }
    return self;
}
-(void)awakeFromNib{
    [super awakeFromNib];

}



-(void)layoutSubviews{
    [super layoutSubviews];
    // 调整图片
    self.imageView.y = self.height * 0.15;
    self.imageView.width = self.width * 0.5;
    self.imageView.height = self.imageView.width;
    self.imageView.x = (self.width - self.imageView.width)*0.5;

    // 调整文字
    self.titleLabel.x = 0;
    self.titleLabel.y = CGRectGetMaxY(self.imageView.frame);
    self.titleLabel.width = self.width;
    self.titleLabel.height = self.height - self.titleLabel.y;
}


-(void)setLabel{
    self.imageView.contentMode = UIViewContentModeScaleAspectFit;
    [self setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    self.titleLabel.font = [UIFont systemFontOfSize:15];
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
}

- (void)setModel:(MeSqureListModel *)model
{
    _model = model;
    NSLog(@"%@",model.name);
    [self setTitle:model.name forState:UIControlStateNormal];
    [self sd_setImageWithURL:[NSURL URLWithString:model.icon] forState:UIControlStateNormal];
}

@end
