//
//  PushViewController.m
//  BaiSi
//
//  Created by stone on 16/9/9.
//  Copyright © 2016年 zm. All rights reserved.
//

#import "PushViewController.h"

@interface PushViewController ()

@end

@implementation PushViewController

+(instancetype)standPushVC{
    static PushViewController* pushVC = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        pushVC = [[PushViewController alloc]initWithNibName:NSStringFromClass(self) bundle:nil];
        pushVC.view.size = [UIScreen mainScreen].bounds.size;
    });
    return pushVC;
}


- (void)viewDidLoad {
    [super viewDidLoad];
}
- (IBAction)removePushViewBtn:(id)sender {
    ZMLogfunc;
    [self.view removeFromSuperview];
    self.view.hidden = YES;
}
-(void)dealloc{
    ZMLogfunc;
}
@end
