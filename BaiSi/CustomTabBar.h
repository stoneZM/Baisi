//
//  CustomTabBar.h
//  BaiSi
//
//  Created by stone on 16/9/5.
//  Copyright © 2016年 zm. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CustomTabBar;

@protocol CustomTabBarDelegate

-(void)customTabbar:(CustomTabBar*)tabBar didClickComposeBtn:(UIButton*)button;

@end

@interface CustomTabBar : UITabBar <NSObject>


@property (nonatomic,weak)id<CustomTabBarDelegate> delagate;

@end
