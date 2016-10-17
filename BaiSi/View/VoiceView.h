//
//  VoiceView.h
//  BaiSi
//
//  Created by stone on 16/9/13.
//  Copyright © 2016年 zm. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EssenceModel.h"
@interface VoiceView : UIView
@property (weak, nonatomic) IBOutlet UIButton *playBtn;


@property (nonatomic,strong)EssenceListModel* model;


+(instancetype)standVoiceView;

@end
