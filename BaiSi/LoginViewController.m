//
//  LoginViewController.m
//  BaiSi
//
//  Created by stone on 16/9/8.
//  Copyright © 2016年 zm. All rights reserved.
//

#import "LoginViewController.h"
#import "ZMCustomtextField.h"
@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet ZMCustomtextField *phoneNumber;
@property (weak, nonatomic) IBOutlet ZMCustomtextField *pwd;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *loginModulLeftConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *registerModulLeadConstraint;
@property (weak, nonatomic) IBOutlet UIView *registerModule;
@property (weak, nonatomic) IBOutlet UIView *loginModule;


@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.registerModulLeadConstraint.constant = ZMSCREENW;
//    self.registerModule.hidden = YES;
}

-(void)dealloc{
    ZMLogfunc;
}
- (IBAction)dismissBtn:(id)sender {
    [self resignFirstRespond];
    [self dismissViewControllerAnimated:YES completion:nil];
    ZMLogfunc;
}
- (IBAction)registerBtn:(UIButton*)sender {
    ZMLogfunc;
    [self resignFirstRespond];
    sender.selected = !sender.selected;
    self.loginModulLeftConstraint.constant =  sender.selected? -ZMSCREENW : 0;
    self.registerModulLeadConstraint.constant = sender.selected? 0 : ZMSCREENW;
    [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:0.9 initialSpringVelocity:3 options:UIViewAnimationOptionTransitionNone animations:^{
        [self.view layoutSubviews];
    } completion:^(BOOL finished) {
       
    }];
}
- (IBAction)loginBtn:(id)sender {
    ZMLogfunc;
}
- (IBAction)forgetPwdBtn:(id)sender {
    ZMLogfunc;
}
- (IBAction)QQLoginBtn:(id)sender {
    ZMLogfunc;
}
- (IBAction)weiboLoginBtn:(id)sender {
    ZMLogfunc;
}
- (IBAction)telentLoginBtn:(id)sender {
    ZMLogfunc;
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self resignFirstRespond];
}

-(void)resignFirstRespond{
    [self.phoneNumber resignFirstResponder];
    [self.pwd resignFirstResponder];
}

@end
