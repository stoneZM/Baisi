//
//  RecommentLeftViewModel.h
//  BaiSi
//
//  Created by stone on 16/9/6.
//  Copyright © 2016年 zm. All rights reserved.
//

#import "BaseViewModel.h"

@interface RecommentLeftViewModel : BaseViewModel


-(NSString*)getRecommendNameForRow:(NSInteger)row;
-(NSInteger)getRecommendIDForRow:(NSInteger)row;

@end
