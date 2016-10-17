//
//  RecommendRightViewModel.h
//  BaiSi
//
//  Created by stone on 16/9/6.
//  Copyright © 2016年 zm. All rights reserved.
//

#import "BaseViewModel.h"
#import "RecommndRightModel.h"
@interface RecommendRightViewModel : BaseViewModel


@property (nonatomic,assign)NSInteger categoryID;



-(instancetype)initWithCategoryID:(NSInteger)categoryID;
-(RecommendListModel*)getModelForRow:(NSInteger)row;

@end
