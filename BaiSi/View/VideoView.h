//
//  VideoView.h
//  BaiSi
//
//  Created by stone on 16/9/13.
//  Copyright © 2016年 zm. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EssenceModel.h"
@interface VideoView : UIView

@property (nonatomic,assign)NSUInteger flag;
@property (nonatomic,strong)EssenceListModel* model;


+(instancetype)standVideoView;


@end
