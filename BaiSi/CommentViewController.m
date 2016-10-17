//
//  CommentViewController.m
//  BaiSi
//
//  Created by stone on 16/9/17.
//  Copyright © 2016年 zm. All rights reserved.
//

#import "CommentViewController.h"
#import "CommentCell.h"
#import "CommentViewModel.h"


@interface CommentViewController ()

@property (nonatomic,strong)CommentViewModel* viewModel;

@end

@implementation CommentViewController



-(CommentViewModel *)viewModel{
    if (_viewModel == nil) {
        _viewModel = [[CommentViewModel alloc]initWithDataID:self.dataID];
    }
    return _viewModel;
}

-(instancetype)initWithDataID:(NSString *)dataID{

    if (self = [super init]) {
        self.dataID = dataID;
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.mj_header = [MJRefreshHeader headerWithRefreshingBlock:^{
        [self.viewModel getDataFromNetCompleteHandle:^(NSError *error) {
            if (error) {
                [self.tableView.mj_header endRefreshing];
                return ;
            }else{
                [self.tableView.mj_header endRefreshing];
                [self.tableView reloadData];
        }
        }];
    }];
    [self.tableView.mj_header beginRefreshing];

}

-(void)setModel:(EssenceListModel *)model{

    _model = model;
    UIView* headerView = [[UIView alloc]init];
    headerView.backgroundColor = [UIColor orangeColor];

    EssenceCell* cell = [EssenceCell standCell];
    cell.backgroundColor = [UIColor redColor];
    [headerView addSubview:cell];
    cell.model = self.model;
    headerView.height = self.height;
   
    cell.frame = CGRectMake(0, 0, ZMSCREENW, self.height);
    self.tableView.tableHeaderView = headerView;
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.viewModel.dataArr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CommentCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];

    if (cell == nil) {
        cell = [[NSBundle mainBundle]loadNibNamed:@"CommentCell" owner:nil options:nil].firstObject;
    }
    cell.model = [self.viewModel getModelForRow:indexPath.row];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 15;
}



@end
