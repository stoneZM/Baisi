//
//  UIBarButtonItem+extension.m
//  BaiSi
//
//  Created by stone on 16/9/5.
//  Copyright © 2016年 zm. All rights reserved.
//

#import "UIBarButtonItem+extension.h"

@implementation UIBarButtonItem (extension)

+(instancetype)itemWithImage:(NSString *)image hightlightImage:(NSString *)hightlightImage target:(id)target action:(SEL)action{
    UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setBackgroundImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:hightlightImage] forState:UIControlStateHighlighted];
    [button sizeToFit];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem* item = [[UIBarButtonItem alloc]initWithCustomView:button];

    return item;
}

@end
