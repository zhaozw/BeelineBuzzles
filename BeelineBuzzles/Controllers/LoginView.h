//
//  LoginView.h
//  BeelineBuzzles
//
//  Created by Кирилл Кунст on 21.09.12.
//  Copyright (c) 2012 Create. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"

/**
 Экран авторизации
 */
@interface LoginView : BaseViewController<UITableViewDataSource,UITableViewDelegate, UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UITableView *tableView;
- (IBAction)loginClick:(id)sender;

/**
 Инициализация TabBar
 */
-(UITabBarController *)tabBar;
@end
