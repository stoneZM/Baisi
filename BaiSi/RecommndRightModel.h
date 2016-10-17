//
//  RecommndRightModel.h
//  BaiSi
//
//  Created by stone on 16/9/6.
//  Copyright © 2016年 zm. All rights reserved.
//

#import "RecommndRightModel.h"

@class RecommendListModel;
@interface RecommndRightModel : NSObject


@property (nonatomic, assign) NSInteger total_page;

@property (nonatomic, assign) NSInteger count;

@property (nonatomic, strong) NSArray<RecommendListModel *> *list;

@property (nonatomic, assign) NSInteger total;

@property (nonatomic, assign) NSInteger next_page;


@end
@interface RecommendListModel : NSObject

@property (nonatomic, copy) NSString *header;

@property (nonatomic, assign) NSInteger uid;

@property (nonatomic, assign) BOOL is_vip;

@property (nonatomic, assign) NSInteger is_follow;

@property (nonatomic, copy) NSString *introduction;

@property (nonatomic, assign) NSInteger fans_count;

@property (nonatomic, assign) NSInteger gender;

@property (nonatomic, assign) NSInteger tiezi_count;

@property (nonatomic, copy) NSString *screen_name;

@end

