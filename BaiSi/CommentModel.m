//
//  CommentModel.m
//  BaiSi
//
//  Created by stone on 16/9/17.
//  Copyright © 2016年 zm. All rights reserved.
//

#import "CommentModel.h"


//http://api.budejie.com/api/api_open.php?a=dataList&c=comment&data_id=20694046
@implementation CommentModel
+ (NSDictionary *)mj_objectClassInArray{
    return @{@"data" : [CommentDataModel class]};
}

@end


@implementation CommentDataModel

@end


@implementation CommentDataUserModel

@end
