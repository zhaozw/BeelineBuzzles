//
//  AppDelegate.h
//  BeelineBuzzles
//
//  Created by Кирилл Кунст on 20.09.12.
//  Copyright (c) 2012 Create. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate, UITabBarControllerDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) UINavigationController *navController;
@property (nonatomic, strong) UITabBarController *tabController;
@end
