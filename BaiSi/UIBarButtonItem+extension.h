//
//  UIBarButtonItem+extension.h
//  BaiSi
//
//  Created by stone on 16/9/5.
//  Copyright © 2016年 zm. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (extension)
+(instancetype)itemWithImage:(NSString *)image hightlightImage:(NSString *)hightlightImage target:(id)target action:(SEL)action;
@end
