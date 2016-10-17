//
//  EssenceCell.h
//  
//
//  Created by stone on 16/9/7.
//
//

#import <UIKit/UIKit.h>
#import "EssenceModel.h"
@interface EssenceCell : UITableViewCell
@property (nonatomic,strong)EssenceListModel* model;


+(instancetype)standCell;

@end
