//
//  PicView.m
//  BaiSi
//
//  Created by stone on 16/9/10.
//  Copyright © 2016年 zm. All rights reserved.
//

#import "PicView.h"
#import "ShowPhotoViewController.h"
#import "DALabeledCircularProgressView.h"
@interface PicView()

@property (weak, nonatomic) IBOutlet UIImageView *isgifImageView;
@property (weak, nonatomic) IBOutlet UIButton *lookBigPicBt;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property (weak, nonatomic) IBOutlet DALabeledCircularProgressView *progressView;

@end


@implementation PicView

+(instancetype)standPicView{
    return [[[NSBundle mainBundle]loadNibNamed:NSStringFromClass(self) owner:nil options:nil] lastObject];
}
-(void)awakeFromNib{
    [super awakeFromNib];
    self.lookBigPicBt.hidden = YES;
    self.isgifImageView.hidden = YES;
    UITapGestureRecognizer* tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(showPic)];
    [self.imageView addGestureRecognizer:tap];
}

-(void)showPic{


    ShowPhotoViewController* vc = [[ShowPhotoViewController alloc]init];
    vc.model = self.model;
    //推出控制器
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:vc animated:YES completion:nil];

}


-(void)setImageName:(NSString *)imageName{

    self.progressView.progress = 0;
    if (self.isBigPic) {
        self.imageView.contentMode = UIViewContentModeTop;
        self.imageView.clipsToBounds = YES;
    }else{
        self.imageView.contentMode = UIViewContentModeScaleAspectFill;
        self.imageView.clipsToBounds = YES;
    }
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:imageName] placeholderImage:nil options:SDWebImageCacheMemoryOnly progress:^(NSInteger receivedSize, NSInteger expectedSize) {

        self.progressView.hidden = NO;
        CGFloat progress = receivedSize * 1.0 / expectedSize;
        [self.progressView setProgress:progress animated:YES];
        self.progressView.progressLabel.textColor = [UIColor whiteColor];
        NSString* text = [NSString stringWithFormat:@"%.0f%%",progress * 100];
        text = [text stringByReplacingOccurrencesOfString:@"-" withString:@""];
        self.progressView.progressLabel.text = text;

    } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {

        self.progressView.hidden = YES;
    }];
    //获取图片的扩展名
    NSString* extensionStr = imageName.pathExtension;
    if ([extensionStr.lowercaseString isEqualToString:@"gif"]) {
        self.isgifImageView.hidden = NO;
    }else{
        self.isgifImageView.hidden = YES;
    }
   
}
-(void)setIsBigPic:(BOOL)isBigPic{
    _isBigPic = isBigPic;
    self.lookBigPicBt.hidden = !isBigPic;
}


@end
