//
//  VideoView.m
//  BaiSi
//
//  Created by stone on 16/9/13.
//  Copyright © 2016年 zm. All rights reserved.
//

#import "VideoView.h"
#import <AVFoundation/AVFoundation.h>
#import <AVKit/AVKit.h>
@interface VideoView()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *totalLb;
@property (weak, nonatomic) IBOutlet UILabel *currentLb;

@end


@implementation VideoView

+(instancetype)standVideoView{
    return [[[NSBundle mainBundle]loadNibNamed:@"VideoView"owner:nil options:nil] lastObject];
}


- (IBAction)playBtn:(UIButton *)sender {
//    NSLog(@"%@",self.model.videouri);
    AVPlayer* player = [AVPlayer playerWithURL: [NSURL URLWithString:self.model.videouri]];
    [player play];
    [VideoView sharedInstance].player = player;
    [self addSubview:[VideoView sharedInstance].view];
    [VideoView sharedInstance].view.frame = self.bounds;

}
-(void)setModel:(EssenceListModel *)model{
    _model = model;
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:model.image2]];
    self.totalLb.text = model.videotime;
    self.currentLb.text = model.videotime;
}




//为了保证同一时间只有一个播放器，使用单例模式
+(AVPlayerViewController*)sharedInstance
{
    static AVPlayerViewController* vc = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        vc = [AVPlayerViewController new];
    });
    return vc;
}


-(void)setFlag:(NSUInteger)flag{
    [[VideoView sharedInstance].player pause];
    [VideoView sharedInstance].player = nil;
    [[VideoView sharedInstance].view removeFromSuperview];
}





@end
