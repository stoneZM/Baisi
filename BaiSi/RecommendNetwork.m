//
//  RecommendNetwork.m
//  BaiSi
//
//  Created by stone on 16/9/6.
//  Copyright © 2016年 zm. All rights reserved.
//

#import "RecommendNetwork.h"
#import "RecommndRightModel.h"
#import "CommentModel.h"
#import "MeModel.h"
@implementation RecommendNetwork

/**
 获取推荐列表左侧的类别
 */
+(id)getRecommendLeftModel:(void (^)(id, NSError *))completeHandle{

    NSString* path = @"http://api.budejie.com/api/api_open.php";
    NSMutableDictionary* params = [NSMutableDictionary dictionary];
    [params setValue:@"category" forKey:@"a"];
    [params setValue:@"subscribe" forKey:@"c"];
    return  [self GET:path parameters:params completionHandler:^(id responseObj, NSError *error) {
        completeHandle([RecommendLeftModel mj_objectWithKeyValues:responseObj],error);
    }];

}

/**
 获取推荐列表的右侧类别
 */
+(id)getRecommendRightModelWithID:(NSInteger)categoryID  completeHandle:(void(^)(id responseObje,NSError* error))completeHandle{

    NSString* path = @"http://api.budejie.com/api/api_open.php";
    NSMutableDictionary* params = [NSMutableDictionary dictionary];
    [params setValue:@"list" forKey:@"a"];
    [params setValue:@"subscribe" forKey:@"c"];
    [params setValue:[NSString stringWithFormat:@"%ld",(long)categoryID] forKey:@"category_id"];

   return  [self GET:path parameters:params completionHandler:^(id responseObj, NSError *error) {

       completeHandle([RecommndRightModel mj_objectWithKeyValues:responseObj],error);
    }];
}


/**
 获取essence列表的数据
 */
//http://api.budejie.com/api/api_open.php?a=list&c=data&maxtime=nil&page=0

+(id)getEssenceDataWithType:(InfoType)type a:(NSString*)listType Maxtime:(NSInteger)maxtime page:(NSInteger)page completeHandle:(void (^)(id, NSError *))completeHandle{

    NSString* path = @"http://api.budejie.com/api/api_open.php";
    NSMutableDictionary* params = [NSMutableDictionary dictionary];
    [params setValue:listType forKey:@"a"];
    [params setValue:@"data" forKey:@"c"];
    [params setValue:[NSString stringWithFormat:@"%ld",(long)maxtime] forKey:@"maxtime"];
    [params setValue:[NSString stringWithFormat:@"%ld",(long)page] forKey:@"page"];
    [params setValue:[NSString stringWithFormat:@"%ld",(long)type] forKey:@"type"];

    return  [self GET:path parameters:params completionHandler:^(id responseObj, NSError *error) {

        completeHandle([EssenceModel mj_objectWithKeyValues:responseObj],error);
    }];
}

/*
 * 获取评论
 **/
//http://api.budejie.com/api/api_open.php?a=dataList&c=comment&data_id=20694046
+(id)getCommentWithDataID:(NSString*)dataID page:(NSInteger)page completeHandle:(void(^)(id responseObj,NSError* error))completeHandle{

    NSString* path = @"http://api.budejie.com/api/api_open.php";
    NSMutableDictionary* params = [[NSMutableDictionary alloc]init];
    [params setValue:@"dataList" forKey:@"a"];
    [params setValue:@"comment" forKey:@"c"];
    [params setValue:dataID forKey:@"data_id"];
    [params setValue:[NSString stringWithFormat:@"%ld",page] forKey:@"page"];
    return [self GET:path parameters:params completionHandler:^(id responseObj, NSError *error) {
        completeHandle([CommentModel mj_objectWithKeyValues:responseObj],error);
    }];
}

/*
 获取me模块的标题
 **/
//http://api.budejie.com/api/api_open.php?a=square&c=topic
+(id)getMeModuleCompleteHandle:(void(^)(id responseObj,NSError* error))completeHadle{

    NSString* path = @"http://api.budejie.com/api/api_open.php?a=square&c=topic";
    return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
        completeHadle([MeModel mj_objectWithKeyValues:responseObj],error);
    }];
}

@end
