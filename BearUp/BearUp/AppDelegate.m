//
//  AppDelegate.m
//  BearUp
//
//  Created by Tebuy on 16/10/12.
//  Copyright © 2016年 Lee2Go. All rights reserved.
//

#import "AppDelegate.h"
#import "BaseViewController.h"
#import "BaseNavigationController.h"
#import "HomeDrawerViewController.h"
#import "LaunchViewController.h"
#include "easyar/utility.hpp"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    _window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    [_window makeKeyAndVisible];
    _window.backgroundColor = [UIColor lightGrayColor];
    _window.rootViewController = [LaunchViewController new];
    _active = true;
    return YES;
    
}


- (void)applicationWillResignActive:(UIApplication *)application {
    _active = false;
    EasyAR::onPause();
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    _active = true;
    EasyAR::onResume();
}


- (void)applicationWillTerminate:(UIApplication *)application {
    _active = false;
}


@end
