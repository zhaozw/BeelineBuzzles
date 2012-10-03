//
//  PasswordRecoveryViewViewController.m
//  BeelineBuzzles
//
//  Created by Кирилл Кунст on 03.10.12.
//  Copyright (c) 2012 Create. All rights reserved.
//

#import "PasswordRecoveryViewViewController.h"
#import "InfoView.h"

@interface PasswordRecoveryViewViewController ()

@end

@implementation PasswordRecoveryViewViewController

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
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)initUI{
    [self initTopBar];
}

-(void)initTopBar{
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bar_title_recovery.png"]];
    self.navigationItem.titleView = imageView;
    
    UIImage* image3 = [UIImage imageNamed:@"bar_btn_info"];
    CGRect frameimg = CGRectMake(0, 0, 30, 30);
    //UIButton *someButton = [[UIButton alloc] initWithFrame:frameimg];
    
	UIButton *someButton = [[UIButton alloc] initWithFrame:frameimg];
	[someButton setBackgroundImage:image3 forState:UIControlStateNormal];
	[someButton addTarget:self action:@selector(goToInfo:)
		 forControlEvents:UIControlEventTouchUpInside];
    
	UIBarButtonItem *infoBtn =[[UIBarButtonItem alloc] initWithCustomView:someButton];
    
    image3 = [UIImage imageNamed:@"btn_back"];
    frameimg = CGRectMake(0, 0, 57, 30);
    someButton = [[UIButton alloc] initWithFrame:frameimg];
	[someButton setBackgroundImage:image3 forState:UIControlStateNormal];
	[someButton addTarget:self action:@selector(leftBarItemClick:)
		 forControlEvents:UIControlEventTouchUpInside];
    
	UIBarButtonItem *backBtn =[[UIBarButtonItem alloc] initWithCustomView:someButton];
    self.navigationItem.leftBarButtonItem = backBtn;
    self.navigationItem.rightBarButtonItem = infoBtn;
}

-(void)goToInfo:(id)sender{
    InfoView *v = [[InfoView alloc] initWithNibName:@"InfoView" bundle:nil];
    [self.navigationController pushViewController:v animated:YES];
}

-(void)leftBarItemClick:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}


@end
