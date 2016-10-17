//
//  CommentModel.h
//  BaiSi
//
//  Created by stone on 16/9/17.
//  Copyright © 2016年 zm. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CommentDataUserModel,CommentDataModel;

@interface CommentModel : NSObject

@property (nonatomic, assign) double total;
@property (nonatomic, strong) NSArray<CommentDataModel*> *data;
@property (nonatomic, strong) NSString *author;
@end



@interface CommentDataModel : NSObject

@property (nonatomic, strong) NSString *data_identifier;
@property (nonatomic, strong) NSString *precid;
@property (nonatomic, strong) CommentDataUserModel *user;
@property (nonatomic, strong) NSString *data_id;
@property (nonatomic, strong) NSArray *precmt;
@property (nonatomic, strong) NSString *voicetime;
@property (nonatomic, strong) NSString *ctime;
@property (nonatomic, strong) NSString *like_count;
@property (nonatomic, strong) NSString *voiceuri;
@property (nonatomic, strong) NSString *preuid;
@property (nonatomic, strong) NSString *status;
@property (nonatomic, strong) NSString *content;

@end

@interface CommentDataUserModel : NSObject
@property (nonatomic, assign) BOOL isVip;
@property (nonatomic, strong) NSString *qq_uid;
@property (nonatomic, strong) NSString *weibo_uid;
@property (nonatomic, strong) NSString *user_identifier;
@property (nonatomic, strong) NSString *personal_page;
@property (nonatomic, strong) NSString *username;
@property (nonatomic, strong) NSString *qzone_uid;
@property (nonatomic, strong) NSString *total_cmt_like_count;
@property (nonatomic, strong) NSString *sex;
@property (nonatomic, strong) NSString *profile_image;
@end
