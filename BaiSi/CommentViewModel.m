//
//  CommentViewModel.m
//  BaiSi
//
//  Created by stone on 16/9/17.
//  Copyright © 2016年 zm. All rights reserved.
//

#import "CommentViewModel.h"

#import "RecommendNetwork.h"
@implementation CommentViewModel

-(instancetype)initWithDataID:(NSString *)dataID {

    if (self = [super init]) {
        self.dataID = dataID;
        self.page = 1;
    }
    return self;
}


-(void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle{

    [RecommendNetwork getCommentWithDataID:self.dataID page:self.page completeHandle:^(id responseObj, NSError *error) {
        CommentModel* model = (CommentModel*)responseObj;
        self.dataArr = [model.data copy];
        completionHandle(error);
    }];

}

-(CommentDataModel *)getModelForRow:(NSInteger)row{

    return self.dataArr[row];
}



@end
