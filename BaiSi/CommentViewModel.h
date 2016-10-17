//
//  CommentViewModel.h
//  BaiSi
//
//  Created by stone on 16/9/17.
//  Copyright © 2016年 zm. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseViewModel.h"
#import "CommentModel.h"

@interface CommentViewModel : BaseViewModel

@property (nonatomic,assign)NSInteger page;
@property (nonatomic,strong)NSString* dataID;

-(instancetype)initWithDataID:(NSString*)dataID;

-(CommentDataModel*)getModelForRow:(NSInteger)row;

@end
