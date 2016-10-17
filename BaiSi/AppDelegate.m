//
//  AppDelegate.m
//  BaiSi
//
//  Created by stone on 16/9/5.
//  Copyright © 2016年 zm. All rights reserved.
//

#import "AppDelegate.h"
#import "TabBarController.h"
#import <AFNetworkActivityIndicatorManager.h>
#import "RecommendNetwork.h"
#import "SettingViewController.h"
#import "PushViewController.h"
#import "EssenceViewController.h"
@interface AppDelegate () <UIAlertViewDelegate>

@end


@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [self networkSetting];
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    TabBarController*  tabbar = [TabBarController new];
    self.window.rootViewController = tabbar;

    [self.window makeKeyAndVisible];
//    PushViewController* pushVC = [PushViewController standPushVC];
//    [self.window addSubview:pushVC.view];
     [RecommendNetwork getMeModuleCompleteHandle:^(id responseObj, NSError *error) {

            }];
    return YES;
}

-(void)networkSetting{

    //    电池条显示网络活动
    [[AFNetworkActivityIndicatorManager sharedManager] setEnabled:YES];
    //    检测网络状态
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        ZMLog(@"Reachability: %@", AFStringFromNetworkReachabilityStatus(status));
        switch (status) {
            case AFNetworkReachabilityStatusReachableViaWWAN:
            case AFNetworkReachabilityStatusReachableViaWiFi:
                self.onLine = YES;
                break;
            case AFNetworkReachabilityStatusNotReachable:
            default:
                self.onLine = NO;
                break;
        }
    }];
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];

}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {

}

@end
