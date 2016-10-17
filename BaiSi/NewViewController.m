//
//  NewViewController.m
//  BaiSi
//
//  Created by stone on 16/9/5.
//  Copyright © 2016年 zm. All rights reserved.
//

#import "NewViewController.h"
#import "EssenceCell.h"
#import "ShowPhotoViewController.h"
@interface NewViewController ()
@property (nonatomic,strong)UIButton* tagSubBtn;
@property (nonatomic,strong)EssenceViewModel* viewmodel;
@property (nonatomic,strong)UIView* tipView;
@property (nonatomic,strong)UILabel* label;
@end

@implementation NewViewController

-(UIView *)tipView{
    if (_tipView == nil) {
        _tipView = [[UIView alloc]init];
        _tipView.height = 30;
        _tipView.x = 0;
        _tipView.y = 30;
        _tipView.width = ZMSCREENW;
        self.label = [[UILabel alloc]init];
        [_tipView addSubview:self.label];
        self.label.frame = _tipView.bounds;
        [self.navigationController.view insertSubview:_tipView belowSubview:self.navigationController.navigationBar];
        self.label.textAlignment = NSTextAlignmentCenter;
        self.label.textColor = [UIColor whiteColor];
        _tipView.backgroundColor = ZMRandomColor;
        _tipView.hidden = YES;
    }
    return _tipView;
}


-(EssenceViewModel *)viewmodel{
    if (_viewmodel == nil) {
        _viewmodel = [[EssenceViewModel alloc]initWithType:self.type listtype:@"newlist"];
    }
    return _viewmodel;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tipView.hidden = NO;
    self.tableView.estimatedRowHeight = 100;
    self.tableView.separatorColor = [UIColor redColor];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;

    [self.tableView registerNib:[UINib nibWithNibName:@"EssenceCell" bundle:nil] forCellReuseIdentifier:@"cell"];
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self.viewmodel getDataFromNetCompleteHandle:^(NSError *error) {

            if (error) {
                self.label.text = @"暂时无新数据";
                [self.tableView.mj_header endRefreshing];
                [self animationTipView];
            }else{
                [self.tableView reloadData];
                [self.tableView.mj_header endRefreshing];
                self.label.text = [NSString stringWithFormat:@"%ld",self.viewmodel.dataArr.count];
                [self animationTipView];
            }

        }];
    }];
    [self.tableView.mj_header beginRefreshing];

    self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [self.viewmodel getMoreDataCompletionHandle:^(NSError *error) {
            [self.tableView.mj_footer endRefreshing];
            if (error) {
                NSLog(@"error:%@",error);
                return ;
            }
            [self.tableView reloadData];

        }];
    }];

}

-(void)animationTipView{
    self.tipView.hidden = NO;
    [UIView animateWithDuration:1 animations:^{
        self.tipView.y = 64;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:1 animations:^{
            self.tipView.y = 34;
        } completion:^(BOOL finished) {
            self.tipView.hidden = YES;
        }];
    }];

}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return self.viewmodel.dataArr.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    EssenceCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];

    cell.model = [self.viewmodel getEssenceListModelForRow:indexPath.section];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 0;
    }else{
        return 20;
    }
}


-(void)setNavi{

    self.navigationItem.titleView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"MainTitle"]];
    UIBarButtonItem* fixItem =[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    fixItem.width = TagSubItemSpaceToleft;
     UIBarButtonItem* item = [UIBarButtonItem itemWithImage:@"MainTagSubIcon" hightlightImage:@"MainTagSubIconClick" target:self action:@selector(newBtn)];
    self.navigationItem.leftBarButtonItems = @[fixItem,item];

}
#pragma mark - 左上角按钮的事件监听
-(void)newBtn{
    ZMLog(@"newBtn----click");
}


- (void)dealloc
{
    ZMLogfunc;
}
@end
