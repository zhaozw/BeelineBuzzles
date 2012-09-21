//
//  ViewInsideTabController.m
//  BeelineBuzzles
//
//  Created by Кирилл Кунст on 21.09.12.
//  Copyright (c) 2012 Create. All rights reserved.
//

#import "ViewInsideTabController.h"

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
    UIBarButtonItem *cancelButton = [[UIBarButtonItem alloc] initWithTitle:@"Выйти" style:UIBarButtonItemStylePlain target:self action:@selector(leftBarItemClick:)];
    UIBarButtonItem *infoButton = [[UIBarButtonItem alloc] initWithTitle:@"Info" style:UIBarButtonSystemItemAction target:self action:@selector(rightBarItemClick:)];
    self.tabBarController.navigationItem.leftBarButtonItem = cancelButton;
    self.tabBarController.navigationItem.rightBarButtonItem = infoButton;

}

-(void)leftBarItemClick:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)rightBarItemClick:(id)sender{
    
}

@end
