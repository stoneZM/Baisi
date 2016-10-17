//
//  FriendTrendsViewController.m
//  BaiSi
//
//  Created by stone on 16/9/5.
//  Copyright © 2016年 zm. All rights reserved.
//

#import "FriendTrendsViewController.h"
#import "ReommendViewController.h"
#import "LoginViewController.h"
@interface FriendTrendsViewController ()
@property (nonatomic,strong)UIButton* friendBtn;
@end

@implementation FriendTrendsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = ZMGlobolgb;
    [self setNavi];
}
/**
 设置界面
 */
-(void)setNavi{
    self.navigationItem.title = @"我的关注";
    UIBarButtonItem* fixItem =[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    fixItem.width = TagSubItemSpaceToleft;
    UIBarButtonItem* Item = [UIBarButtonItem itemWithImage:@"friendsRecommentIcon"  hightlightImage:@"friendsRecommentIcon-click" target:self action:@selector(newBtn)];
    self.navigationItem.leftBarButtonItems = @[fixItem,Item];
}

#pragma mark - 左上角按钮的事件监听
-(void)newBtn{
    ZMLog(@"friendBtn----click");
    ReommendViewController* vc = [[ReommendViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}
- (IBAction)loginBtn:(id)sender {
    ZMLogfunc;
    LoginViewController* vc = [[LoginViewController alloc]init];
    [self presentViewController:vc animated:YES completion:nil];
}



@end
