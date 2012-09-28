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
    [self setBtnCheck:nil];
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
    UIButton *btnQuestion = (UIButton *)[cell viewWithTag:5];
    txtField.delegate = self;
    if (indexPath.row == 0){
        lblText.text = @"Логин";
        //txtField.placeholder = @"Логин";
    } else if (indexPath.row == 1){
        lblText.text = @"Пароль";
        btnQuestion.hidden = YES;
        //txtField.placeholder = @"Пароль";
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

- (IBAction)registerClick:(id)sender {
    UIButton *btn = (UIButton *)sender;
    if (btn.isSelected){
        [btn setSelected:NO];
        [btn setTitle:@"Зарегистроваться" forState:UIControlStateNormal];
    } else {
        [btn setSelected:YES];
        [btn setTitle:@"Зарегистрирован" forState:UIControlStateSelected];
    }
    
}

- (IBAction)checkClick:(id)sender {
    if (self.btnCheck.isSelected){
        [self.btnCheck setSelected:NO];
        [self.btnCheck setImage:[UIImage imageNamed:@"unchek"] forState:UIControlStateNormal];
    } else {
        [self.btnCheck setSelected:YES];
        [self.btnCheck setImage:[UIImage imageNamed:@"chek"] forState:UIControlStateSelected];
    }
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
    
    // бэкграунд для таб бара
    if ([tabController.tabBar respondsToSelector:@selector(setBackgroundImage:)])
    {
        // ios 5 code here
        //tabController.tabBar.frame = CGRectMake(0, -5, 320, 60);
        [tabController.tabBar setBackgroundImage:[UIImage imageNamed:@"background"]];
        
    }
    else
    {
        // ios 4 code here
        CGRect frame = CGRectMake(0, 0, 320, 60);
        UIView *tabbg_view = [[UIView alloc] initWithFrame:frame];
        UIImage *tabbag_image = [UIImage imageNamed:@"background"];
        UIColor *tabbg_color = [[UIColor alloc] initWithPatternImage:tabbag_image];
        tabbg_view.backgroundColor = tabbg_color;
        [tabController.tabBar insertSubview:tabbg_view atIndex:0];
    }

    [tabController.tabBar setSelectionIndicatorImage:[[UIImage alloc] init]];
    
    UIImage *selectedImage0 = [UIImage imageNamed:@"icon_1_prize_1"];
    UIImage *unselectedImage0 = [UIImage imageNamed:@"icon_1_prize_0"];
    
    UIImage *selectedImage1 = [UIImage imageNamed:@"icon_2-1"];
    UIImage *unselectedImage1 = [UIImage imageNamed:@"icon_2-0"];
    
    UIImage *selectedImage2 = [UIImage imageNamed:@"button_game_1"];
    UIImage *unselectedImage2 = [UIImage imageNamed:@"button_game_0"];
    
    UIImage *selectedImage3 = [UIImage imageNamed:@"icon_3-1"];
    UIImage *unselectedImage3 = [UIImage imageNamed:@"icon_3-0"];
    
    UIImage *selectedImage4 = [UIImage imageNamed:@"icon_4-1"];
    UIImage *unselectedImage4 = [UIImage imageNamed:@"icon_4-0"];
    
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
    
    UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleTopMargin;
    button.frame = CGRectMake(0.0, 0.0, unselectedImage2.size.width, unselectedImage2.size.height);
    [button setBackgroundImage:unselectedImage2 forState:UIControlStateNormal];
    [button setBackgroundImage:selectedImage2 forState:UIControlStateHighlighted];
    
    CGFloat heightDifference = unselectedImage2.size.height - tabController.tabBar.frame.size.height;
    if (heightDifference < 0)
        button.center = tabController.tabBar.center;
    else
    {
        CGPoint center = tabController.tabBar.center;
        center.y = center.y - heightDifference/2.0;
        button.center = center;
    }
    
    [item0 setFinishedSelectedImage:selectedImage0 withFinishedUnselectedImage:unselectedImage0];
    [item1 setFinishedSelectedImage:selectedImage1 withFinishedUnselectedImage:unselectedImage1];
    [item2 setFinishedSelectedImage:selectedImage2 withFinishedUnselectedImage:unselectedImage2];
    [item3 setFinishedSelectedImage:selectedImage3 withFinishedUnselectedImage:unselectedImage3];
    [item4 setFinishedSelectedImage:selectedImage4 withFinishedUnselectedImage:unselectedImage4];
   // [tabController.view addSubview:button];
    [tabController setSelectedIndex:2];
    
    [[UITabBarItem appearance] setTitleTextAttributes:
     [NSDictionary dictionaryWithObjectsAndKeys:
      [UIColor colorWithRed:0.97f green:0.67f blue:0.04f alpha:1.00f], UITextAttributeTextColor,
      [UIFont fontWithName:@"font" size:0.0], UITextAttributeFont,
      nil]
                                             forState:UIControlStateHighlighted];
    

     
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
