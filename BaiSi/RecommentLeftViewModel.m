//
//  RecommentLeftViewModel.m
//  BaiSi
//
//  Created by stone on 16/9/6.
//  Copyright © 2016年 zm. All rights reserved.
//

#import "RecommentLeftViewModel.h"
#import "RecommendNetwork.h"
#import "RecommendLeftModel.h"
@implementation RecommentLeftViewModel

/**
 网络请求获取数据
 */
-(void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle{
     __weak typeof(self) weakSelf = self;
   self.dataTask = [RecommendNetwork  getRecommendLeftModel:^(id responseObj, NSError *error) {
        RecommendLeftModel* model = responseObj;
        weakSelf.dataArr = [model.list copy];
        completionHandle(error);
    }];

}
/**
 获取每一列的模型
 */
-(RecommendLeftListModel*)modelForRow:(NSInteger)row{
    return self.dataArr[row];
}

/**
 获取每一行的标题
 */
-(NSString *)getRecommendNameForRow:(NSInteger)row{

    return [self modelForRow:row].name;
}
/**
 获取每一行的id
 */
-(NSInteger)getRecommendIDForRow:(NSInteger)row{
    return [self modelForRow:row].ID;
}


@end
