//
//  ReommendViewController.m
//  BaiSi
//
//  Created by stone on 16/9/5.
//  Copyright © 2016年 zm. All rights reserved.
//

#import "ReommendViewController.h"
#import "RecommentLeftViewModel.h"
#import "RecommendRightViewModel.h"
#import "LeftCatagoryCell.h"
#import "RightCatagoryCell.h"

@interface ReommendViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *leftTableView;
@property (nonatomic,strong)RecommentLeftViewModel* viewModel;
@property (nonatomic,strong)RecommendRightViewModel* rightModel;
@property (weak, nonatomic) IBOutlet UITableView *rightTableView;
@property (nonatomic,assign)NSInteger categoryID;
@property (nonatomic,strong)UIView* cellbgView;
@property (nonatomic,strong)NSMutableDictionary* dic; //用于解决重复请求的问题
@property (nonatomic,assign)NSInteger flag;   //判断是否是同一个请求

@end

@implementation ReommendViewController
-(NSMutableDictionary *)dic{
    if (_dic == nil) {
        _dic = [[NSMutableDictionary alloc]init];
    }
    return _dic;
}

-(UIView *)cellbgView{
    if (_cellbgView == nil) {
        _cellbgView = [[UIView alloc]init];
        _cellbgView.backgroundColor = [UIColor whiteColor];
    }
    return _cellbgView;
}

-(RecommentLeftViewModel *)viewModel{
    if (_viewModel == nil) {
        _viewModel = [[RecommentLeftViewModel alloc]init];
    }
    return _viewModel;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self refreshLeftTableView];
}

-(void)refreshLeftTableView{
    __weak typeof(self) weakSelf = self;
    [self.viewModel getDataFromNetCompleteHandle:^(NSError *error) {
        if (error) {
            [SVProgressHUD showErrorWithStatus:@"加载数据时败"];
        }
        else{
            weakSelf.categoryID = [weakSelf.viewModel getRecommendIDForRow:0];
            [weakSelf.leftTableView reloadData];
            [weakSelf refreshRightTableView:0];  //刷新右侧tableView
        }
        //默认选中首行
        NSIndexPath* index = [NSIndexPath indexPathForRow:0 inSection:0];
        [weakSelf.leftTableView selectRowAtIndexPath:index animated:YES scrollPosition:UITableViewScrollPositionNone];
        [weakSelf.leftTableView.mj_header endRefreshing];
    }];

}

-(void)refreshRightTableView:(NSInteger)row{

    /**
     此处总结：为了防止快速点击，网络有延迟，所以，当调用方法时： 
     a.取消上次的请求
     b.先立刻刷新表格，防止旧的内容显示
     c.结束表头的刷新
     d.然后在开启任务
     */
    __weak typeof(self) weakSelf = self;
    [self.rightModel cancelTask];
    self.rightModel = nil;
    [self.rightTableView reloadData];
    self.rightModel = [[RecommendRightViewModel alloc]initWithCategoryID:self.categoryID];
    
    self.rightTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
         [weakSelf.rightTableView.mj_header endRefreshing];
        [weakSelf.rightModel getDataFromNetCompleteHandle:^(NSError *error) {

            if (error) {
                    [SVProgressHUD showErrorWithStatus:@"加载数据失败，请检查网络设置"];
                    [weakSelf.rightTableView.mj_header endRefreshing];
                    return ;
                }
                [weakSelf.rightTableView reloadData];
                [weakSelf.dic setObject:weakSelf.rightModel.dataArr forKey:[weakSelf.viewModel getRecommendNameForRow:row]];//为了防止重复请求，缓存以前的请求结果，
                [weakSelf.rightTableView.mj_header endRefreshing];

            }];
        }];
     [self.rightTableView.mj_header beginRefreshing];

}

#pragma mark - 数据源
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
        return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (tableView == self.leftTableView) {
         return self.viewModel.dataArr.count;
    }else{
        return self.rightModel.dataArr.count;
    }

}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    if (self.leftTableView == tableView) {
       return  [self setLeftCellForRowAtIndexPath:indexPath tableView:tableView];
    }else{
        return [self setRightCellForRowAtIndexPath:indexPath tableView:tableView];
    }
}
#pragma mark - 左侧的cell
-(UITableViewCell*)setLeftCellForRowAtIndexPath:(NSIndexPath *)indexPath tableView:(UITableView*)tableView{

    LeftCatagoryCell* cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];

    if (cell == nil) {
        cell = [[NSBundle mainBundle]loadNibNamed:@"LeftCatagoryCell" owner:self options:nil].firstObject;
    }
    cell.textLabel.text = [self.viewModel getRecommendNameForRow:indexPath.row];
    return cell;
}
#pragma  mark - 右侧的cell
-(UITableViewCell*)setRightCellForRowAtIndexPath:(NSIndexPath *)indexPath tableView:(UITableView*)tableView{
    RightCatagoryCell* cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];

    if (cell == nil) {
        cell = [[NSBundle mainBundle]loadNibNamed:@"RightCatagoryCell" owner:self options:nil].firstObject;
    }
    cell.model = [self.rightModel getModelForRow:indexPath.row];

    return cell;
}

#pragma mark - UITableViewDelegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{


    if (self.leftTableView == tableView) {
        if (self.dic[[self.viewModel getRecommendNameForRow:indexPath.row]]) { //先判断是否有缓存
            /**
             如果有缓存，那么就将缓存中的数据给表格来刷新，不用再进行网络请求
             */
            self.rightModel.dataArr = self.dic[[self.viewModel getRecommendNameForRow:indexPath.row]];
            [self.rightTableView reloadData];
        }else{
        self.categoryID = [self.viewModel getRecommendIDForRow:indexPath.row];
        [self refreshRightTableView:indexPath.row];

        }
    }else{
        //TODO:点击右侧表格要处理的事

    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView == self.rightTableView) {
        return 60;
    }else{
        return 44;
    }
}

-(void)dealloc{
    ZMLogfunc;
    self.dic = nil;
    [self.rightModel cancelTask];
}


@end
