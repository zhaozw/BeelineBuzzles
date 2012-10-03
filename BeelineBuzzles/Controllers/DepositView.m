//
//  DepositView.m
//  BeelineBuzzles
//
//  Created by Кирилл Кунст on 27.09.12.
//  Copyright (c) 2012 Create. All rights reserved.
//

#import "DepositView.h"

@interface DepositView ()

@end

@implementation DepositView

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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

-(void)initUI{
    [self initTopBar];
}
-(void)initTopBar{
    UIImage* image3 = [UIImage imageNamed:@"btn_back"];
    CGRect frameimg = CGRectMake(0, 0, 57, 30);
    
	UIButton *someButton = [[UIButton alloc] initWithFrame:frameimg];
	[someButton setBackgroundImage:image3 forState:UIControlStateNormal];
	[someButton addTarget:self action:@selector(leftBarItemClick:)
		 forControlEvents:UIControlEventTouchUpInside];
    
	UIBarButtonItem *backBtn =[[UIBarButtonItem alloc] initWithCustomView:someButton];
    self.navigationItem.leftBarButtonItem = backBtn;
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bar_title_schet.png"]];
    self.navigationItem.titleView = imageView;
}

-(void)leftBarItemClick:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}
@end
