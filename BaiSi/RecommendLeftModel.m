//
//  RecommendLeftModel.m
//  BaiSi
//
//  Created by stone on 16/9/6.
//  Copyright © 2016年 zm. All rights reserved.
//

#import "RecommendLeftModel.h"

@implementation RecommendLeftModel


+ (NSDictionary *)objectClassInArray{
    return @{@"list" : [RecommendLeftListModel class]};
}
@end
@implementation RecommendLeftInfoModel

@end


@implementation RecommendLeftListModel

+(NSDictionary *)replacedKeyFromPropertyName{
    return @{@"ID" : @"id"};
}

@end


