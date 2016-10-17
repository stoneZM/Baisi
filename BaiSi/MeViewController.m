//
//  MeViewController.m
//  BaiSi
//
//  Created by stone on 16/9/5.
//  Copyright © 2016年 zm. All rights reserved.
//

#import "MeViewController.h"
#import "SettingViewController.h"
#import "SquareView.h"
#import "CustomCell.h"
#import "RecommendNetwork.h"
#import "MeModel.h"
#import "TZImagePickerController.h"
@interface MeViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong)UIButton* moonBtn;
@property (nonatomic,strong)UIButton* setBtn;

@property (nonatomic,strong)UITableView* tableView;
@end

@implementation MeViewController

-(UITableView *)tableView{

    if (_tableView == nil) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [self.view addSubview:_tableView];
        _tableView.frame = CGRectMake(0, 0, ZMSCREENW, ZMSCREENH);

    }
    return _tableView;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavi];

    [RecommendNetwork getMeModuleCompleteHandle:^(id responseObj, NSError *error) {
        if (error) {
            NSLog(@"error:%@",error);
            return ;
        }
        MeModel* model = (MeModel*)responseObj;
       
        self.tableView.tableFooterView  = [[SquareView alloc]initWithItems:model.square_list];
        [self.tableView reloadData];
    }];

}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.view.backgroundColor = [SkinTool getBgColor];
}
/**
 设置界面
 */
-(void)setNavi{
    self.navigationItem.title = @"我的";
    self.moonBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    UIBarButtonItem* moonItem = [UIBarButtonItem itemWithImage:@"mine-moon-icon" hightlightImage:@"mine-moon-icon-click" target:self action:@selector(moonBtnClick:)];
    UIBarButtonItem* setItem = [UIBarButtonItem itemWithImage:@"mine-setting-icon" hightlightImage:@"mine-setting-icon-click" target:self action:@selector(setBtnClick)];
    UIBarButtonItem* fixItem =[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    fixItem.width = TagSubItemSpaceToleft;
    UIBarButtonItem* fixItem1 =[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    fixItem1.width = 5;
    self.navigationItem.rightBarButtonItems = @[fixItem,setItem,fixItem1,moonItem];

    self.tableView.backgroundColor = [UIColor clearColor];

}
#pragma mark - 右上角按钮的事件监听
-(void)moonBtnClick:(UIButton*)button{

    button.selected = !button.selected;
    [button setBackgroundImage:[UIImage imageNamed:@"mine-sun-icon-click"] forState:UIControlStateSelected];
    if (button.isSelected) {
        [SkinTool setSkinColor:@"gray"];
    }else{
        [SkinTool setSkinColor:@"black"];
    }
    self.view.backgroundColor = [SkinTool getBgColor];
    ZMLog(@"moonBtn----click");
}
-(void)setBtnClick{
    ZMLog(@"setBtn----click");
    SettingViewController* vc = [SettingViewController standSettingVC];
    [self.navigationController pushViewController:vc animated:YES];

}



#pragma mark - TableViewDelegate

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    if (indexPath.section == 0) {
        CustomCell* cell = [[NSBundle mainBundle]loadNibNamed:@"CustomCell" owner:nil options:nil].firstObject;
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        return cell;
    }else{
    UITableViewCell* cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:nil];
        cell.textLabel.text = @"离线下载";
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
         return cell;
     }
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (section == 0) {
        return 0.1;
    }
    return 10;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 45;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
