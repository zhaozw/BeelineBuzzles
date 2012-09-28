//
//  ViewInsideTabController.m
//  BeelineBuzzles
//
//  Created by Кирилл Кунст on 21.09.12.
//  Copyright (c) 2012 Create. All rights reserved.
//

#import "ViewInsideTabController.h"
#import "InfoView.h"
#import "SettingsViewViewController.h"

@interface ViewInsideTabController ()

@end

@implementation ViewInsideTabController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	[self initUI];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self initUI];
}

-(void)initUI{
    [self initTopBar];
}


-(void)addLogoToTopBar{
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bar_title.png"]];
    self.tabBarController.navigationItem.titleView = imageView;
}

-(void)initTopBar{
    self.tabBarController.navigationItem.title = @"Баззлы";
    self.tabBarController.navigationController.navigationBarHidden = NO;
    
    UIImage* image3 = [UIImage imageNamed:@"bar_btn_exit"];
    CGRect frameimg = CGRectMake(0, 0, 61, 30);
    //UIButton *someButton = [[UIButton alloc] initWithFrame:frameimg];
    
	UIButton *someButton = [[UIButton alloc] initWithFrame:frameimg];
	[someButton setBackgroundImage:image3 forState:UIControlStateNormal];
	[someButton addTarget:self action:@selector(leftBarItemClick:)
		 forControlEvents:UIControlEventTouchUpInside];
    
	UIBarButtonItem *backBtn =[[UIBarButtonItem alloc] initWithCustomView:someButton];
    self.tabBarController.navigationItem.leftBarButtonItem = backBtn;
    
    [self customizeNavController];
    [self addLogoToTopBar];

}

-(void)customizeNavController{
    UIToolbar *tools = [[UIToolbar alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 103.0f, 44.01f)];
    tools.clearsContextBeforeDrawing = NO;
    tools.clipsToBounds = NO;
    tools.tintColor = self.tabBarController.navigationController.navigationBar.tintColor;
    tools.barStyle = -1; // clear background
    NSMutableArray *buttons = [[NSMutableArray alloc] initWithCapacity:3];
    
    
    UIImage* image3 = [UIImage imageNamed:@"bar_btn_info"];
    CGRect frameimg = CGRectMake(0, 0, 30, 30);
    
	UIButton *someButton = [[UIButton alloc] initWithFrame:frameimg];
	[someButton setBackgroundImage:image3 forState:UIControlStateNormal];
	[someButton addTarget:self action:@selector(goToInfo:)
		 forControlEvents:UIControlEventTouchUpInside];
    
	UIBarButtonItem *infoBtn =[[UIBarButtonItem alloc] initWithCustomView:someButton];
    [buttons addObject:infoBtn];
    
    image3 = [UIImage imageNamed:@"bar_btn_setting"];
    frameimg = CGRectMake(0, 0, 25, 25);
    
	someButton = [[UIButton alloc] initWithFrame:frameimg];
	[someButton setBackgroundImage:image3 forState:UIControlStateNormal];
	[someButton addTarget:self action:@selector(goToSettings:)
		 forControlEvents:UIControlEventTouchUpInside];
    
	UIBarButtonItem *settingsBtn =[[UIBarButtonItem alloc] initWithCustomView:someButton];
    [buttons addObject:settingsBtn];
        
    [tools setItems:buttons animated:NO];
    self.tabBarController.navigationItem.rightBarButtonItems = buttons;
    
}

-(void)leftBarItemClick:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)goToInfo:(id)sender{
    InfoView *v = [[InfoView alloc] initWithNibName:@"InfoView" bundle:nil];
    [self.tabBarController.navigationController pushViewController:v animated:YES];
}

-(void)goToSettings:(id)sender{
    SettingsViewViewController *v= [[SettingsViewViewController alloc] initWithNibName:@"SettingsViewViewController" bundle:nil];
    [self.tabBarController.navigationController pushViewController:v animated:YES];
}

@end
