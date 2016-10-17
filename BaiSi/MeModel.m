//
//  MeModel.m
//  
//
//  Created by stone on 16/9/19.
//
//

#import "MeModel.h"

//http://api.budejie.com/api/api_open.php?a=square&c=topic

@implementation MeModel

+(NSDictionary *)mj_objectClassInArray{
    return @{@"tag_list":[MeTagListModel class],@"square_list":[MeSqureListModel class]};
}

@end


@implementation MeSqureListModel

@end


@implementation MeTagListModel

@end
