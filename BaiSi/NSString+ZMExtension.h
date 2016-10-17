//
//  NSString+ZMExtension.h
//  分类
//
//  Created by stone on 16/6/10.
//  Copyright © 2016年 zm. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface NSString (ZMExtension)

#pragma mark - 路径方法
/** Documents文件的路径 */
+(NSString*)zm_pathForDocuments;


/** 返回Documents文件中某个子文件的路径 */
+(NSString*)zm_filePathAtDocumentsWithFileName:(NSString*)fileName;


/** 返回沙盒中Library下Caches文件的路径 */
+ (NSString *)zm_pathForCaches;

/** 返回沙盒中Library下Caches文件中某个子文件的路径 */
+ (NSString *)zm_filePathAtCachesWithFileName:(NSString *)fileName;

/** 返回MainBundle(资源捆绑包的)的路径 */
+ (NSString *)zm_pathForMainBundle;

/** 返回MainBundle(资源捆绑包的)中某个子文件的路径 */
+ (NSString *)zm_filePathAtMainBundleWithFileName:(NSString *)fileName;

/** 返回沙盒中，temp文件夹的路径 */
+ (NSString *)zm_pathForTemp;

/**  返回沙盒中，Temp 文件的中某个子文件的路径*/
+ (NSString *)zm_filePathAtTempWithFileName:(NSString *)fileName;

/** 返回沙盒中，Preferences文件夹的路径 */
+ (NSString *)zm_pathForPreferences;

/** 返回沙盒中，Preferences文件的中某个子文件的路径 */
+ (NSString *)zm_filePathAtPreferencesWithFileName:(NSString *)fileName;

/** 返回沙盒中，你指定的系统文件的路径  */
+ (NSString *)zm_pathForSystemFile:(NSSearchPathDirectory)directory;

/** 返回沙盒中，你指定的系统文件的中某个子文件的路径 */
+ (NSString *)zm_filePathForSystemFile:(NSSearchPathDirectory)directory withFileName:(NSString *)fileName;

#pragma mark - 文本计算方法

/**
 *  快速计算出文本的真实尺寸
 *
 *  @param font    文字的字体
 *  @param maxSize 文本的最大尺寸
 *
 *  @return 快速计算出文本的真实尺寸
 */
- (CGSize)zm_sizeWithFont:(UIFont *)font andMaxSize:(CGSize)maxSize;


/**
 *  快速计算出文本的真实尺寸
 *
 *  @param text    需要计算尺寸的文本
 *  @param font    文字的字体
 *  @param maxSize 文本的最大尺寸
 *
 *  @return 快速计算出文本的真实尺寸
 */
+ (CGSize)zm_sizeWithText:(NSString *)text andFont:(UIFont *)font andMaxSize:(CGSize)maxSize;


#pragma mark - 有效电话和邮箱的判别
/**
 *  判断是否是电话号码
 */
- (BOOL)zm_isValidPhoneNum;

/**
 *  判断是否是邮箱
 */
- (BOOL)zm_isValidEmail;
@end
