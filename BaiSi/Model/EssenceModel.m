//
//  EssenceModel.m
//  BaiSi
//
//  Created by stone on 16/9/10.
//  Copyright © 2016年 zm. All rights reserved.
//

#import "EssenceModel.h"

@implementation EssenceModel


+ (NSDictionary *)mj_objectClassInArray{
    return @{@"list" : [EssenceListModel class]};
}
@end
@implementation EssenceInfoModel

@end


@implementation EssenceListModel

-(instancetype)init{
    if (self = [super init]) {
        self.playing = NO;
    }
    return self;
}

-(void)setPlaying:(BOOL)playing{
    _playing = playing;
}

+ (NSDictionary*)mj_replacedKeyFromPropertyName{
    return @{@"ID" : @"id"};
}

@end


