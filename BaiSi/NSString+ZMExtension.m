//
//  NSString+ZMExtension.m
//  分类
//
//  Created by stone on 16/6/10.
//  Copyright © 2016年 zm. All rights reserved.
//

#import "NSString+ZMExtension.h"

@implementation NSString (ZMExtension)

+(NSString *)zm_pathForDocuments{
    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
}

+(NSString *)zm_filePathAtDocumentsWithFileName:(NSString *)fileName
{
    return [[self zm_pathForDocuments] stringByAppendingPathComponent:fileName];
}

+(NSString *)zm_pathForCaches
{
    return [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
}

+(NSString *)zm_filePathAtCachesWithFileName:(NSString *)fileName
{
    return [[self zm_pathForCaches] stringByAppendingPathComponent:fileName];
}

+(NSString *)zm_pathForMainBundle
{
    return [[NSBundle mainBundle]bundlePath];
}

+(NSString*)zm_filePathAtMainBundleWithFileName:(NSString *)fileName
{
    return [[self zm_pathForMainBundle] stringByAppendingString:fileName];
}

+(NSString *)zm_pathForTemp
{
    return NSTemporaryDirectory();
}

+(NSString *)zm_filePathAtTempWithFileName:(NSString *)fileName
{
    return [[self zm_pathForTemp] stringByAppendingString:fileName];
}

+ (NSString *)zm_pathForPreferences
{
    return [NSSearchPathForDirectoriesInDomains(NSPreferencePanesDirectory, NSUserDomainMask, YES) lastObject];
}

+ (NSString *)zm_filePathAtPreferencesWithFileName:(NSString *)fileName
{
    return [[self zm_pathForPreferences] stringByAppendingPathComponent:fileName];
}

+ (NSString *)zm_pathForSystemFile:(NSSearchPathDirectory)directory
{
    return [NSSearchPathForDirectoriesInDomains(directory, NSUserDomainMask, YES) lastObject];
}
+ (NSString *)zm_filePathForSystemFile:(NSSearchPathDirectory)directory withFileName:(NSString *)fileName
{
    return [[self zm_pathForSystemFile:directory] stringByAppendingPathComponent:fileName];
}

- (CGSize)zm_sizeWithFont:(UIFont *)font andMaxSize:(CGSize)maxSize
{
    NSDictionary *arrts = @{NSFontAttributeName:font};

    return [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:arrts context:nil].size;
}

+ (CGSize)zm_sizeWithText:(NSString *)text andFont:(UIFont *)font andMaxSize:(CGSize)maxSize
{
    return [text zm_sizeWithFont:font andMaxSize:maxSize];
}

- (BOOL)zm_isValidPhoneNum
{
    // 11位数字, 1开头
    NSString *phoneRegex =  @"^1(3[0-9]|4[57]|5[0-35-9]|8[025-9])\\d{8}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    return [phoneTest evaluateWithObject:self];
}

- (BOOL)zm_isValidEmail
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:self];
}

@end
