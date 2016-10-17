//
//  SquareView.m
//  
//
//  Created by stone on 16/9/19.
//
//

#import "SquareView.h"
#import "RecommendNetwork.h"
#import "MeModel.h"
#import "CustomBtn.h"
#import "XMGWebViewController.h"
static NSInteger colNum = 4;
static CGFloat space = 1;


@interface SquareView()

@end

@implementation SquareView
-(NSMutableArray *)array{
    if (_array == nil) {
        _array = [[NSMutableArray alloc]init];
    }
    return _array;
}

-(instancetype)initWithItems:(NSArray *)array{
    if (self = [super init]) {
        self.backgroundColor = [UIColor clearColor];
        [self.array addObjectsFromArray:array];
        [self setupUI];
    }
    return self;
}


//为view添加背景图片
-(void)drawRect:(CGRect)rect{
//    [[UIImage imageNamed:@"mainCellBackground"] drawInRect:rect];
}

-(void)setupUI{

    CGFloat width = (ZMSCREENW - 3*space) / 4;
    CGFloat height = width;
    for (NSInteger i=0; i<self.array.count; i++) {
        NSInteger row = i/colNum;
        NSInteger col = i%4;
        CGFloat x = col*width + col*space;
        CGFloat y = row*height + row*space ;
        MeSqureListModel* model = self.array[i];
        CustomBtn* button = [CustomBtn buttonWithType:UIButtonTypeCustom];
        button.model = model;
        [self addSubview:button];
        button.frame = CGRectMake(x, y, width, height);
        button.tag = i+100;
        [button addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    self.height = (height+space)*(self.array.count/4 + 1);

}


-(void)btnClick:(CustomBtn*)button{
    NSInteger tag = button.tag;
    NSLog(@"%ld",tag);
    if (![button.model.url hasPrefix:@"http"]) return;

    XMGWebViewController *web = [[XMGWebViewController alloc] init];
    web.url = button.model.url;
    web.title = button.model.name;

    // 取出当前的导航控制器
    UITabBarController *tabBarVc = (UITabBarController *)[UIApplication sharedApplication].keyWindow.rootViewController;
    UINavigationController *nav = (UINavigationController *)tabBarVc.selectedViewController;
    [nav pushViewController:web animated:YES];


}

@end
