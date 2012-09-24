//
//  ViewInsideTabController.m
//  BeelineBuzzles
//
//  Created by Кирилл Кунст on 21.09.12.
//  Copyright (c) 2012 Create. All rights reserved.
//

#import "ViewInsideTabController.h"
#import "InfoView.h"

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


-(void)initTopBar{
    self.tabBarController.navigationItem.title = @"Баззлы";
    self.tabBarController.navigationController.navigationBarHidden = NO;
    UIBarButtonItem *cancelButton = [[UIBarButtonItem alloc] initWithTitle:@"Выйти" style:UIBarButtonItemStylePlain target:self action:@selector(leftBarItemClick:)];;
    self.tabBarController.navigationItem.leftBarButtonItem = cancelButton;
    [self customizeNavController];

}

-(void)customizeNavController{
    UIToolbar *tools = [[UIToolbar alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 103.0f, 44.01f)];
    tools.clearsContextBeforeDrawing = NO;
    tools.clipsToBounds = NO;
    tools.tintColor = self.tabBarController.navigationController.navigationBar.tintColor;
    tools.barStyle = -1; // clear background
    NSMutableArray *buttons = [[NSMutableArray alloc] initWithCapacity:3];
    
    // Create a standard refresh button.
    UIBarButtonItem *bi = [[UIBarButtonItem alloc] initWithTitle:@"i" style:UIBarButtonItemStyleBordered target:self action:@selector(goToInfo:)];
    [buttons addObject:bi];
    
    // Add profile button.
    bi = [[UIBarButtonItem alloc] initWithTitle:@"S" style:UIBarButtonItemStylePlain target:self action:@selector(goToSettings:)];
    bi.style = UIBarButtonItemStyleBordered;
    [buttons addObject:bi];
    
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
    
}

@end
