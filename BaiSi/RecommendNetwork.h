//
//  RecommendNetwork.h
//  BaiSi
//
//  Created by stone on 16/9/6.
//  Copyright © 2016年 zm. All rights reserved.
//

#import "BaseNetManager.h"
#import "RecommendLeftModel.h"
#import "EssenceModel.h"

//1为全部，10为图片，29为段子，31为音频，41为视频，默认为1
typedef NS_ENUM(NSInteger,InfoType) {

    all = 0,
    pic = 10,
    duanzi = 29,
    voice = 31,
    viode = 41,
    defualt = 1

};





@interface RecommendNetwork : BaseNetManager

/**
    获取推荐列表左侧的类别
 */
+(id)getRecommendLeftModel:(void(^)(id responseObj,NSError* error))completeHandle;

/**
    获取推荐列表的右侧类别
 */
+(id)getRecommendRightModelWithID:(NSInteger)categoryID  completeHandle:(void(^)(id responseObje,NSError* error))completeHandle;


/**
 获取essence列表的数据
 */
//http://api.budejie.com/api/api_open.php?a=list&c=data&maxtime=nil&page=0

+(id)getEssenceDataWithType:(InfoType)type a:(NSString*)listType Maxtime:(NSInteger)maxtime page:(NSInteger)page completeHandle:(void(^)(id responseObj, NSError* error))completeHandle;


/*
 * 获取评论
 **/
//http://api.budejie.com/api/api_open.php?a=dataList&c=comment&data_id=20694046
+(id)getCommentWithDataID:(NSString*)dataID page:(NSInteger)page completeHandle:(void(^)(id responseObj,NSError* error))completeHandle;


/*
    获取me模块的标题
 **/
+(id)getMeModuleCompleteHandle:(void(^)(id responseObj,NSError* error))completeHadle;

@end
