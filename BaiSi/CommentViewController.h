//
//  CommentViewController.h
//  BaiSi
//
//  Created by stone on 16/9/17.
//  Copyright © 2016年 zm. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EssenceModel.h"
#import "EssenceCell.h"
@interface CommentViewController : UITableViewController

@property (nonatomic,strong)NSString* dataID;
@property (nonatomic,strong)EssenceListModel* model;
@property (nonatomic,assign)NSInteger height;

-(instancetype)initWithDataID:(NSString*)dataID;



@end
