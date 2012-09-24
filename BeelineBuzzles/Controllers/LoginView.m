//
//  LoginView.m
//  BeelineBuzzles
//
//  Created by Кирилл Кунст on 21.09.12.
//  Copyright (c) 2012 Create. All rights reserved.
//

#import "LoginView.h"
#import "PrizesView.h"
#import "AchievesView.h"
#import "RatingView.h"
#import "XXLView.h"
#import "GameView.h"

@interface LoginView ()

@end

@implementation LoginView
@synthesize tableView;

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
    [self setTableView:nil];
    [super viewDidUnload];
}

-(void)viewWillAppear:(BOOL)animated{
    [self initUI];
}
-(void)initUI{
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.navigationController.navigationBarHidden = YES;
}

#pragma mark - UITableView Datasource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"LoginCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:cellIdentifier owner:nil options:nil] objectAtIndex:0];
    }
    UILabel *lblText = (UILabel *)[cell viewWithTag:1];
    UITextField *txtField = (UITextField *)[cell viewWithTag:2];
    txtField.delegate = self;
    if (indexPath.row == 0){
        lblText.text = @"Логин";
        txtField.placeholder = @"Логин";
    } else if (indexPath.row == 1){
        lblText.text = @"Пароль";
        txtField.placeholder = @"Пароль";
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

#pragma mark - UITableView Delegate methods

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return NO;
}


- (IBAction)loginClick:(id)sender {
    UITabBarController *tabBarController = [self tabBar];
    [self.navigationController pushViewController:tabBarController animated:YES];
}


-(UITabBarController *)tabBar{
    UITabBarController *tabController = [[UITabBarController alloc] init];
    PrizesView *firstView = [[PrizesView alloc] initWithNibName:@"PrizesView" bundle:nil];
    AchievesView *secondView = [[AchievesView alloc] initWithNibName:@"AchievesView" bundle:nil];
    GameView *thirdView = [[GameView alloc] initWithNibName:@"GameView" bundle:nil];
    RatingView *foursView = [[RatingView alloc] initWithNibName:@"RatingView" bundle:nil];
    XXLView *fifthView = [[XXLView alloc] initWithNibName:@"XXLView" bundle:nil];
    
    NSArray *viewControllersArray = [[NSArray alloc] initWithObjects:firstView, secondView, thirdView, foursView,fifthView, nil];
    [tabController setViewControllers:viewControllersArray animated:YES];
    
    UITabBarItem *item0 = [tabController.tabBar.items objectAtIndex:0];
    item0.title = @"Призы";
    UITabBarItem *item1 = [tabController.tabBar.items objectAtIndex:1];
    item1.title = @"Достижения";
    UITabBarItem *item2 = [tabController.tabBar.items objectAtIndex:2];
    item2.title = @"Игра";
    UITabBarItem *item3 = [tabController.tabBar.items objectAtIndex:3];
    item3.title = @"Рейтинг";
    UITabBarItem *item4 = [tabController.tabBar.items objectAtIndex:4];
    item4.title = @"XXL-розыгрыш";
    [tabController setSelectedIndex:2];
    return tabController;
}

-(void)customizeNavController{
    UIToolbar *tools = [[UIToolbar alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 103.0f, 44.01f)];
    tools.clearsContextBeforeDrawing = NO;
    tools.clipsToBounds = NO;
    tools.tintColor = self.navigationController.navigationBar.tintColor;
    tools.barStyle = -1; // clear background
    NSMutableArray *buttons = [[NSMutableArray alloc] initWithCapacity:3];
    
    // Create a standard refresh button.
    UIBarButtonItem *bi = [[UIBarButtonItem alloc]
                           initWithBarButtonSystemItem:UIBarButtonSystemItemFastForward target:self action:@selector(refresh:)];
    [buttons addObject:bi];
    
    // Create a spacer.
    bi = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    bi.width = 12.0f;
    [buttons addObject:bi];
    
    // Add profile button.
    bi = [[UIBarButtonItem alloc] initWithTitle:@"Info" style:UIBarButtonItemStylePlain target:self action:@selector(goToProfile)];
    bi.style = UIBarButtonItemStyleBordered;
    [buttons addObject:bi];
    [tools setItems:buttons animated:NO];
    UIBarButtonItem *twoButtons = [[UIBarButtonItem alloc] initWithCustomView:tools];
    self.navigationItem.rightBarButtonItem = twoButtons;
}

@end
