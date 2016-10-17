//
//  RecommendRightViewModel.m
//  BaiSi
//
//  Created by stone on 16/9/6.
//  Copyright © 2016年 zm. All rights reserved.
//

#import "RecommendRightViewModel.h"
#import "RecommendNetwork.h"

@implementation RecommendRightViewModel

{
    NSInteger _flag;
}

-(instancetype)initWithCategoryID:(NSInteger)categoryID{
    if (self = [super init]) {
        self.categoryID = categoryID;
    }
    return self;
}



-(void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle{
     __weak typeof(self) weakSelf = self;
   self.dataTask = [RecommendNetwork getRecommendRightModelWithID:self.categoryID completeHandle:^(id responseObje, NSError *error) {
        RecommndRightModel* model = responseObje;
        weakSelf.dataArr = [model.list copy];
        completionHandle(error);
    }];
}

/**
 获取每一行的模型
 */
-(RecommendListModel*)getModelForRow:(NSInteger)row{
    return self.dataArr[row];
}

-(void)cancelTask{
     ZMLogfunc;
    [self.dataTask cancel];
}

@end
