//
//  SkinTool.m
//  换肤
//
//  Created by stone on 16/9/12.
//  Copyright © 2016年 zm. All rights reserved.
//

#import "SkinTool.h"

@implementation SkinTool

static UIColor* bgColor = nil;

+(void)setSkinColor:(NSString*)color{

    NSString* path = [[NSBundle mainBundle]pathForResource:@"SkinColor" ofType:@"plist"];
    NSDictionary* dic = [[NSArray arrayWithContentsOfFile:path] firstObject];
    NSString* colorStr = dic[color];
    NSArray* colors = [colorStr componentsSeparatedByString:@","];
    [[NSUserDefaults standardUserDefaults] setObject:colors forKey:@"skinColor"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}


+(UIColor *)getBgColor{
    NSArray* colors = [[NSUserDefaults standardUserDefaults] objectForKey:@"skinColor"];
    if (colors == nil) {
        bgColor = [UIColor whiteColor];
    }else{
        bgColor = [UIColor colorWithRed:[colors[0] floatValue]/255.0 green:[colors[1] floatValue]/255.0 blue:[colors[2] floatValue]/255.0 alpha:1];
    }
    return bgColor;
}

@end
