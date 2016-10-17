//
//  VoiceView.m
//  BaiSi
//
//  Created by stone on 16/9/13.
//  Copyright © 2016年 zm. All rights reserved.
//

#import "VoiceView.h"
#import "VideoTool.h"
@interface VoiceView()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *totalLb;
@property (weak, nonatomic) IBOutlet UILabel *currentLb;


@end


@implementation VoiceView
+(instancetype)standVoiceView{
    return [[[NSBundle mainBundle]loadNibNamed:@"VioceView"owner:nil options:nil] lastObject];
}

-(void)setModel:(EssenceListModel *)model{
    _model = model;
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:model.image1]];
    self.totalLb.text = model.voicelength;
    self.currentLb.text = model.videotime;


}
- (IBAction)playBtn:(UIButton *)sender {
    
    sender.selected = !sender.selected;
    if (sender.isSelected) {
        [VideoTool playAudioWithURL:self.model.voiceuri];
    }else{
        [VideoTool pausePlayAudio];
    }
}




@end
