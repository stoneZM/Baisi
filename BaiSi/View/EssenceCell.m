//
//  EssenceCell.m
//  
//
//  Created by stone on 16/9/7.
//
//

#import "EssenceCell.h"
#import "PicView.h"
#import "VoiceView.h"
#import "VideoView.h"
#import "VideoTool.h"

@interface EssenceCell()
@property (weak, nonatomic) IBOutlet UIView *frameView;
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *screenName;
@property (weak, nonatomic) IBOutlet UILabel *dataLb;
@property (weak, nonatomic) IBOutlet UILabel *contextLb;
@property (weak, nonatomic) IBOutlet UIButton *caiBtn;
@property (weak, nonatomic) IBOutlet UIButton *dingBtn;
@property (weak, nonatomic) IBOutlet UIButton *commentBtn;
@property (weak, nonatomic) IBOutlet UIButton *zhuanfaBtn;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *contextConstraintH;

@property (nonatomic,weak) PicView* picView;
@property (nonatomic,weak) VoiceView* voiceView;
@property (nonatomic,weak) VideoView* videoView;

@end


@implementation EssenceCell

+(instancetype)standCell{
    return [[NSBundle mainBundle]loadNibNamed:@"EssenceCell" owner:nil options:nil].firstObject;
}


-(PicView *)picView{
    if (_picView == nil) {
        _picView = [PicView standPicView];
        [self.frameView addSubview:_picView];
        [_picView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];

    }
    return _picView;
}
-(VoiceView *)voiceView{
    if (_voiceView == nil) {
        _voiceView = [VoiceView standVoiceView];
        [self.frameView addSubview:_voiceView];
        [_voiceView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];

    }
    return _voiceView;
}

-(VideoView *)videoView{

    if(_videoView == nil){
        _videoView = [VideoView standVideoView];
        [self.frameView addSubview:_videoView];
        [_videoView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];

    }
    return _videoView;
}


- (void)awakeFromNib {
    [super awakeFromNib];
    self.backgroundView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"mainCellBackground"]];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.iconImageView.layer.cornerRadius = 16;
    self.iconImageView.layer.masksToBounds = YES;
}



-(void)setModel:(EssenceListModel *)model{

    _model = model;
    CGFloat height = [model.height floatValue];
    CGFloat width = [model.width floatValue];
    CGFloat rate = self.frameView.width / width;

    if ([model.type isEqualToString:@"10"]) {
        if (height > 1000.0) {
            self.picView.isBigPic = YES;
            height = 450;
        }else{
            self.picView.isBigPic = NO;
        }
        self.contextConstraintH.constant = height * rate;
        self.picView.imageName = model.image2;
        self.picView.model = model;
    }else if([model.type isEqualToString:@"29"]){
        self.contextConstraintH.constant = 0.1;
    }else if([model.type isEqualToString:@"41"]){
        self.videoView.model = model;
    }

    else if ([model.type isEqualToString:@"31"]){
        self.voiceView.model = model;
    }
    


    [self.iconImageView sd_setImageWithURL:[NSURL URLWithString:_model.profile_image] placeholderImage:[UIImage imageNamed:@"defaultUserIcon"]];

    self.screenName.text = model.screen_name;
    self.dataLb.text = model.created_at;
    self.contextLb.text = model.text;
    self.dataLb.text = model.passtime;
    [self.caiBtn setTitle:model.cai forState:UIControlStateNormal];
    [self.dingBtn setTitle:model.ding forState:UIControlStateNormal];
    [self.commentBtn setTitle:model.comment forState:UIControlStateNormal];
    [self.zhuanfaBtn setTitle:model.repost forState:UIControlStateNormal];

}

-(void)prepareForReuse{
    if ([self.model.type isEqualToString:@"31"]){
            self.voiceView.playBtn.selected = NO;
            [VideoTool stopPlayAudio];
    }if([self.model.type isEqualToString:@"41"]){
        self.videoView.flag = 1;
    }

}


@end
