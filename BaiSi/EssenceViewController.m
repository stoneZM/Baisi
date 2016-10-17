//
//  EssenceViewController.m
//  BaiSi
//
//  Created by stone on 16/9/5.
//  Copyright © 2016年 zm. All rights reserved.
//

#import "EssenceViewController.h"
#import "EssenceTableViewController.h"
#import "NewViewController.h"
@interface EssenceViewController ()<UIScrollViewDelegate>
//@property (nonatomic,strong)UIButton* tagSubBtn;
//@property (nonatomic,strong)UIView* indicatorView;
//@property (nonatomic,strong)UIScrollView* scrollView;
//@property (nonatomic,strong)UIButton* selectedBtn;
//@property (nonatomic,strong)UIScrollView* contentView;
//@property (nonatomic,strong)NSArray* childVCS;
//@property (nonatomic,strong)UIView* showingView;

@end

@implementation EssenceViewController

/**
 提供每个题目所对应的控制器的类型，题目和类型数量必须一致
 */
+(NSArray*)viewControllerClasses{
    NSMutableArray* arr = [NSMutableArray new];
    for (int i = 0; i < [self itemNames].count ; i++) {
        [ arr addObject:[EssenceTableViewController class]];
    }
    return [arr copy];
}
+(NSArray*)newvViewControllerClasses{
    NSMutableArray* arr = [NSMutableArray new];
    for (int i = 0; i < [self itemNames].count ; i++) {
        [ arr addObject:[NewViewController class]];
    }
    return [arr copy];
}


+(instancetype)createVCWithIsNew:(BOOL)isNew{

        NSArray* vcClass = isNew ? [self newvViewControllerClasses] : [self viewControllerClasses];
        EssenceViewController* wmVC = [[EssenceViewController alloc]initWithViewControllerClasses:vcClass andTheirTitles:[self itemNames]];
        wmVC.keys = [[self vcKeys] mutableCopy];
        wmVC.values = [[self vcValues] mutableCopy];
        wmVC.menuViewStyle = WMMenuViewStyleLine;
        wmVC.progressWidth = 40;
        wmVC.menuHeight = 40;
        wmVC.menuView.backgroundColor = [UIColor redColor];
        return wmVC;
}
/** 提供每个VC对应的values值数组 */
+ (NSArray *)vcValues{
    NSArray* type = @[@(10),@(29),@(31),@(41),@(1),@(10)];
    NSMutableArray *arr = [NSMutableArray new];
    for (int i = 0; i <[self itemNames].count; i++) {
        //数值上，vc的infoType的枚举值 恰好和i值相同
        [arr addObject:type[i]];
    }
    return arr;
}
/** 提供每个VC对应的key值数组 */
+ (NSArray *)vcKeys{
    NSMutableArray *arr = [NSMutableArray new];
    for (int i = 0; i <[self itemNames].count; i++){
        [arr addObject:@"type"];
    }
    return [arr copy];
}

/** 提供题目数组 */
+ (NSArray *)itemNames{
    return @[@"全部",@"段子",@"音屏",@"视屏",@"全部",@"图片"];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = ZMGlobolgb;
    [self setNavi];
//    [self addMenu];
}

-(void)setNavi{

    self.navigationItem.titleView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"MainTitle"]];
    UIBarButtonItem* fixItem =[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    fixItem.width = TagSubItemSpaceToleft;
    UIBarButtonItem* item = [UIBarButtonItem itemWithImage:@"MainTagSubIcon" hightlightImage:@"MainTagSubIconClick" target:self action:@selector(mainBtn)];
    self.navigationItem.leftBarButtonItems = @[fixItem,item];
}
#pragma mark - 左上角按钮的事件监听
-(void)mainBtn{
    ZMLog(@"mianBtn----click");
}
-(void)dealloc{
    ZMLogfunc;
}






























#pragma mark - 添加菜单栏
//-(void)addMenu{
//
//
//    self.automaticallyAdjustsScrollViewInsets = NO; //取消scrolleView的....
//
//    NSArray* titles = [self getTitles];
//    /**
//     设置标题栏的scrollView
//     */
//    self.scrollView = [[UIScrollView alloc]init];
//    [self.view addSubview:self.scrollView];
//    self.scrollView.frame = CGRectMake(0, 64, ZMSCREENW, 35);     /**
//     设置底部的指示器
//     */
//     self.scrollView.backgroundColor = [UIColor colorWithWhite:1.0 alpha:0.9];
//    self.indicatorView = [[UIView alloc]init];
//    self.indicatorView.backgroundColor = [UIColor redColor];
//    self.indicatorView.y = 33;
//    self.indicatorView.height = 2;
//    [self.scrollView addSubview:self.indicatorView];
//        /**
//     设置contentView
//     */
//    self.contentView = [[UIScrollView alloc]init];
//    self.contentView.pagingEnabled = YES;
//    self.contentView.delegate = self;
//    self.contentView.contentSize = CGSizeMake(self.view.width*titles.count, 0);
//    self.contentView.backgroundColor = [UIColor redColor];
//    [self.view insertSubview:self.contentView atIndex:0];
//    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
//       make.left.right.top.bottom.mas_equalTo(0);
//    }];
//
//    /**
//     添加标题按钮按钮
//     */
//    CGFloat x = 0;
//
//    for (NSInteger i=0; i< titles.count; i++) {
//        UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
//        [button setTitle:titles[i] forState:UIControlStateNormal];
//        [button sizeToFit];
//        button.frame = CGRectMake(x, 0, button.width, 35);
//        x += button.width + 20;
//        [button addTarget:self action:@selector(menuBtn:) forControlEvents:UIControlEventTouchUpInside];
//        [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
//        [button setTitleColor:[UIColor redColor] forState:UIControlStateDisabled];
//        button.tag = i + 100;
//        [self.scrollView addSubview:button];
//        if (i == 0) {
//            [self menuBtn:button];
//        }
//    }
//    self.scrollView.contentSize = CGSizeMake(x-20, 35);
//    self.scrollView.showsHorizontalScrollIndicator = NO;
//
//}
//-(NSArray*)getTitles{
//    NSArray* titles = @[@"全部",@"视屏",@"图片",@"段子",@"网红",@"美女",@"冷知识",@"游戏",@"声音"];
//    return titles;
//}
//#pragma  mark - 添加控制器
//-(NSArray *)childVCS{
//    //	1为全部，10为图片，29为段子，31为音频，41为视频，默认为1 all = 0,
//
//    if (_childVCS == nil) {
//        EssenceTableViewController* vc1 = [[EssenceTableViewController alloc]initWithType:all];
//        EssenceTableViewController* vc2 = [[EssenceTableViewController alloc]initWithType:defualt];
//        EssenceTableViewController* vc3 = [[EssenceTableViewController alloc]initWithType:duanzi];
//        EssenceTableViewController* vc4 = [[EssenceTableViewController alloc]initWithType:pic];
//        EssenceTableViewController* vc5 = [[EssenceTableViewController alloc]initWithType:voice];
//        EssenceTableViewController* vc6 = [[EssenceTableViewController alloc]initWithType:viode];
//        EssenceTableViewController* vc7 = [[EssenceTableViewController alloc]initWithType:defualt];
//        EssenceTableViewController* vc8 = [[EssenceTableViewController alloc]initWithType:duanzi];
//        EssenceTableViewController* vc9 = [[EssenceTableViewController alloc]initWithType:duanzi];
//        _childVCS = @[vc1,vc2,vc3,vc4,vc5,vc6,vc7,vc8,vc9];
//    }
//    return _childVCS;
//}


//#pragma  mark - 菜单栏的按钮点击事件
//-(void)menuBtn:(UIButton*)button{
//
//    self.selectedBtn.enabled = YES;
//    button.enabled = NO;
//    self.selectedBtn = button;
//
//    __weak typeof(self) weakSelf = self;
//    [UIView animateWithDuration:0.25 animations:^{
//        self.indicatorView.width = button.width;
//        self.indicatorView.centerX = button.centerX;
//        weakSelf.scrollView.contentOffset = CGPointMake(button.x - self.view.width*0.5 + button.width*0.5,0);
//        if (weakSelf.scrollView.contentOffset.x<0) {
//            weakSelf.scrollView.contentOffset = CGPointMake(0, 0);
//        }if (weakSelf.scrollView.contentOffset.x>weakSelf.scrollView.contentSize.width - weakSelf.view.width) {
//            weakSelf.scrollView.contentOffset = CGPointMake(weakSelf.scrollView.contentSize.width - weakSelf.view.width, 0);
//        }
//    }];
//    /**
//     contentView的滚动
//     */
//    NSInteger tag = button.tag;
//    CGPoint offset = self.contentView.contentOffset;
//    offset.x = (tag-100)*self.view.width;
//    [self.contentView setContentOffset:offset animated:YES];
//}

#pragma UIScrollViewDelegate
///**
// 滚动完加载图片
// */
//- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
//
//    //根据偏移量取出子控制器
//    NSInteger index = scrollView.contentOffset.x / scrollView.width;
//    UITableViewController* vc = self.childVCS[index];
//    vc.tableView.contentInset = UIEdgeInsetsMake(100, 0, 44, 0);
//    //添加自控制器的是视图
//    [scrollView addSubview:vc.tableView];
//    vc.tableView.frame = CGRectMake(scrollView.contentOffset.x, 0, scrollView.width, scrollView.height);
//}
///**
// 手动拖动的时候加载控制器
// */
//-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
//    //根据偏移量取出子控制器
//    NSInteger index = scrollView.contentOffset.x / scrollView.width;
//    UITableViewController* vc = self.childVCS[index];
//    vc.tableView.contentInset = UIEdgeInsetsMake(100, 0, 44, 0);
//    //添加自控制器的是视图
//    [scrollView addSubview:vc.tableView];
//    vc.tableView.frame = CGRectMake(scrollView.contentOffset.x, 0, ZMSCREENW, ZMSCREENH);
//
//    NSInteger tag = index + 100 ;
//    UIButton* button = [self.scrollView viewWithTag:tag];
//    [self menuBtn:button];
//}




@end
