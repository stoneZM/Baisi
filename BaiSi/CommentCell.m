//
//  CommentCell.m
//  BaiSi
//
//  Created by stone on 16/9/17.
//  Copyright © 2016年 zm. All rights reserved.
//

#import "CommentCell.h"

@interface CommentCell()
@property (weak, nonatomic) IBOutlet UIImageView *iconIV;
@property (weak, nonatomic) IBOutlet UIImageView *sexIV;
@property (weak, nonatomic) IBOutlet UILabel *screenNameLb;
@property (weak, nonatomic) IBOutlet UILabel *levelLb;
@property (weak, nonatomic) IBOutlet UILabel *contentLb;
@property (weak, nonatomic) IBOutlet UIButton *likeBtn;


@end


@implementation CommentCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}


-(void)setModel:(CommentDataModel *)model{

    [self.iconIV sd_setImageWithURL:[NSURL URLWithString:model.user.profile_image] placeholderImage:[UIImage imageNamed:@"defaultUserIcon"]];
    self.sexIV.image = [model.user.sex isEqualToString:@"m"] ? [UIImage imageNamed:@"profile_manIcon"] : [UIImage imageNamed:@"profile_womanIcon"];
    self.screenNameLb.text = model.user.username;
    self.contentLb.text = model.content;
    [self.likeBtn setTitle:model.like_count forState:UIControlStateNormal];
}

- (IBAction)likeBtn:(id)sender {
}

@end
