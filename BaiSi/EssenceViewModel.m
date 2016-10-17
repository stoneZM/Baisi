//
//  EssenceViewModel.m
//  BaiSi
//
//  Created by stone on 16/9/10.
//  Copyright © 2016年 zm. All rights reserved.
//

#import "EssenceViewModel.h"
#import "RecommendNetwork.h"


@interface EssenceViewModel()

@property (nonatomic,assign)NSInteger page;
@property (nonatomic,assign)NSInteger maxtime;

@end


@implementation EssenceViewModel


-(instancetype)initWithType:(InfoType)type listtype:(NSString*)listType{
    if (self = [super init]) {
        self.type = type;
        self.listType = listType;
        
    }
    return self;
}

-(void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle{
    [RecommendNetwork getEssenceDataWithType:self.type a:self.listType  Maxtime:self.maxtime page:self.page completeHandle:^(id responseObj, NSError *error) {
        EssenceModel* model  = (EssenceModel*)responseObj;
        NSLog(@"%ld",model.info.page);
        if (self.page == 0) {
             [self.dataArr removeAllObjects];
             [self.dataArr addObjectsFromArray:model.list];
             self.maxtime = [model.info.maxtime integerValue];
            completionHandle(error);
            return ;
        }
        if (self.page < model.info.page) {
            NSLog(@"-----%ld",self.page);
            [self.dataArr addObjectsFromArray:model.list];
            self.maxtime = [model.info.maxtime integerValue];
        }
        completionHandle(error);
    }];
}

-(void)getMoreDataCompletionHandle:(CompletionHandle)completionHandle{

    self.page++;
    NSLog(@"--------");
    [self getDataFromNetCompleteHandle:completionHandle];
}

-(void)refreshDataCompletionHandle:(CompletionHandle)completionHandle{
    self.page = 0;
    self.maxtime = 0;
    [self getDataFromNetCompleteHandle:completionHandle];
}

-(EssenceListModel *)getEssenceListModelForRow:(NSInteger)row{

    return self.dataArr[row];
}

@end
