//
//  GameTimeView.m
//  BeelineBuzzles
//
//  Created by Кирилл Кунст on 03.10.12.
//  Copyright (c) 2012 Create. All rights reserved.
//

#import "GameTimeView.h"

@interface GameTimeView ()

@end

@implementation GameTimeView

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
}

-(void)initTopBar{
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bar_title.png"]];
    self.navigationItem.titleView = imageView;
    
    UIImage* image3 = [UIImage imageNamed:@"btn_game"];
    CGRect  frameimg = CGRectMake(0, 0, 51, 30);
    UIButton *someButton = [[UIButton alloc] initWithFrame:frameimg];
	[someButton setBackgroundImage:image3 forState:UIControlStateNormal];
	[someButton addTarget:self action:@selector(leftBarItemClick:)
		 forControlEvents:UIControlEventTouchUpInside];
    
	UIBarButtonItem *backBtn =[[UIBarButtonItem alloc] initWithCustomView:someButton];
    self.navigationItem.leftBarButtonItem = backBtn;
}

-(void)leftBarItemClick:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}


@end
