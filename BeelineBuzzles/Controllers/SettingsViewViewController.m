//
//  SettingsViewViewController.m
//  BeelineBuzzles
//
//  Created by Кирилл Кунст on 28.09.12.
//  Copyright (c) 2012 Create. All rights reserved.
//

#import "SettingsViewViewController.h"

@interface SettingsViewViewController ()

@end

@implementation SettingsViewViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initUI];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)initUI{
    [self initTopBar];
    self.scrollVIew.contentSize =CGSizeMake(320,700);
    self.fieldCurrentPassword.delegate = self;
    self.fieldNewPassword.delegate = self;
    self.fieldRepeatPassword.delegate = self;
}

-(void)initTopBar{
    UIImage* image3 = [UIImage imageNamed:@"btn_game"];
    CGRect frameimg = CGRectMake(0, 0, 51, 30);
    
	UIButton *someButton = [[UIButton alloc] initWithFrame:frameimg];
	[someButton setBackgroundImage:image3 forState:UIControlStateNormal];
	[someButton addTarget:self action:@selector(leftBarItemClick:)
		 forControlEvents:UIControlEventTouchUpInside];
    
	UIBarButtonItem *backBtn =[[UIBarButtonItem alloc] initWithCustomView:someButton];
    self.navigationItem.leftBarButtonItem = backBtn;
    
    self.navigationItem.title = @"Настройки";
}

-(void)leftBarItemClick:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewDidUnload {
    [self setScrollVIew:nil];
    [self setFieldCurrentPassword:nil];
    [self setFieldNewPassword:nil];
    [self setFieldRepeatPassword:nil];
    [self setBtnNotifications:nil];
    [super viewDidUnload];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}
- (IBAction)notificationClick:(id)sender {
    if (self.btnNotifications.isSelected) {
        [self.btnNotifications setSelected:NO];
        [self.btnNotifications setImage:[UIImage imageNamed:@"tog_off"] forState:UIControlStateNormal];
    } else {
        [self.btnNotifications setSelected:YES];
        [self.btnNotifications setImage:[UIImage imageNamed:@"tog_on"] forState:UIControlStateSelected];
    }
}

- (IBAction)saveClick:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
@end
