//
//  SettingViewController.m
//  
//
//  Created by stone on 16/9/7.
//
//

#import "SettingViewController.h"

@interface SettingViewController ()

@end

@implementation SettingViewController


+(instancetype)standSettingVC{
    static SettingViewController* vc  = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        vc = [[UIStoryboard storyboardWithName:NSStringFromClass(self) bundle:nil]instantiateInitialViewController];
    });
    return vc;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}


#pragma  mark UITableViewDelegate 
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section == 0) {
        return ;
    }
    switch (indexPath.row) {
        case 0:
            ZMLog(@"%ld",indexPath.row);
            break;
        case 1:
            ZMLog(@"%ld",indexPath.row);

            break;
        case 2:
            ZMLog(@"%ld",indexPath.row);

            break;
        case 3:
            ZMLog(@"%ld",indexPath.row);

            break;
        case 4:
            ZMLog(@"%ld",indexPath.row);

            break;
        case 5:
            ZMLog(@"%ld",indexPath.row);

            break;
        case 6:
            ZMLog(@"%ld",indexPath.row);

            break;
        case 7:
            ZMLog(@"%ld",indexPath.row);

            break;
        case 8:
            ZMLog(@"%ld",indexPath.row);

            break;
        default:
            ZMLog(@"%ld",indexPath.row);

            break;
    }



}




-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return @"功能设置";
    }else{
        return @"其他设置";
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{

    return 40;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 1;
}

-(void)dealloc{
    ZMLogfunc;
}






@end
