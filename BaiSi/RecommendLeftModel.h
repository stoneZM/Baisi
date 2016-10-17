//
//  RecommendLeftModel.h
//  BaiSi
//
//  Created by stone on 16/9/6.
//  Copyright © 2016年 zm. All rights reserved.
//

#import <Foundation/Foundation.h>

@class RecommendLeftInfoModel,RecommendLeftListModel;
@interface RecommendLeftModel : NSObject

@property (nonatomic, assign) NSInteger size;

@property (nonatomic, strong) RecommendLeftInfoModel *info;

@property (nonatomic, strong) NSArray<RecommendLeftListModel *> *list;

@property (nonatomic, assign) NSInteger total;

@end


@interface RecommendLeftInfoModel : NSObject

@property (nonatomic, assign) NSInteger count;

@property (nonatomic, assign) NSInteger np;

@end

@interface RecommendLeftListModel : NSObject

@property (nonatomic, assign) NSInteger count;

@property (nonatomic, assign) NSInteger ID;

@property (nonatomic, copy) NSString *name;

@end

