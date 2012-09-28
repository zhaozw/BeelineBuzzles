//
//  PrizesView.m
//  BeelineBuzzles
//
//  Created by Кирилл Кунст on 21.09.12.
//  Copyright (c) 2012 Create. All rights reserved.
//

#import "PrizesView.h"

@interface PrizesView ()

@end

@implementation PrizesView

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
}

- (void)viewDidUnload
{
    [super viewDidUnload];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

- (IBAction)goToDepositClick:(id)sender {
    DepositView *v = [[DepositView alloc] initWithNibName:@"DepositView" bundle:nil];
    [self.tabBarController.navigationController pushViewController:v animated:YES];
}
@end
