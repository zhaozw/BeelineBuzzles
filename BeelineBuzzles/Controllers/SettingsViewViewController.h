//
//  SettingsViewViewController.h
//  BeelineBuzzles
//
//  Created by Кирилл Кунст on 28.09.12.
//  Copyright (c) 2012 Create. All rights reserved.
//

#import "BaseViewController.h"

@interface SettingsViewViewController : BaseViewController<UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UIScrollView *scrollVIew;
@property (strong, nonatomic) IBOutlet UITextField *fieldCurrentPassword;
@property (strong, nonatomic) IBOutlet UITextField *fieldNewPassword;
@property (strong, nonatomic) IBOutlet UITextField *fieldRepeatPassword;
@property (strong, nonatomic) IBOutlet UIButton *btnNotifications;
- (IBAction)notificationClick:(id)sender;
- (IBAction)saveClick:(id)sender;

@end
