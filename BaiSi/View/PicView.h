//
//  PicView.h
//  BaiSi
//
//  Created by stone on 16/9/10.
//  Copyright © 2016年 zm. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EssenceModel.h"
@interface PicView : UIView

@property (nonatomic,strong)NSString* imageName;
@property (nonatomic,strong)EssenceListModel* model;
@property (nonatomic,assign)BOOL isGif;
@property (nonatomic,assign)BOOL isBigPic;


+(instancetype)standPicView;

@end
