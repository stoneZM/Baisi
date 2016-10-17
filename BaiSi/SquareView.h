//
//  SquareView.h
//  
//
//  Created by stone on 16/9/19.
//
//

#import <UIKit/UIKit.h>

@interface SquareView : UIView
@property (nonatomic,strong)NSMutableArray* array;

-(instancetype)initWithItems:(NSArray*)array;

@end
