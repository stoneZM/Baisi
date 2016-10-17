//
//  EssenceViewModel.h
//  BaiSi
//
//  Created by stone on 16/9/10.
//  Copyright © 2016年 zm. All rights reserved.
//

#import "BaseViewModel.h"
#import "RecommendNetwork.h"

@interface EssenceViewModel : BaseViewModel


@property (nonatomic,assign)InfoType type;
@property (nonatomic,strong)NSString* listType;

-(EssenceListModel*)getEssenceListModelForRow:(NSInteger)row;

-(instancetype)initWithType:(InfoType)type listtype:(NSString*)listType;


@end
