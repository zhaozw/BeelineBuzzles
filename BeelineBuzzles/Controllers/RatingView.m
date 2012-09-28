//
//  RatingView.m
//  BeelineBuzzles
//
//  Created by Кирилл Кунст on 21.09.12.
//  Copyright (c) 2012 Create. All rights reserved.
//

#import "RatingView.h"
#import "CustomCellBackgroundView.h"
#import "CustomCellView.h"
#import "CSCustomCellBackgroundView.h"

@interface RatingView ()
extern int const ROW_HEIGHT = 70;
@end

@implementation RatingView
@synthesize tableView;

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

- (void)viewDidUnload
{
    [self setTableView:nil];
    [super viewDidUnload];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}


-(void)initUI{
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}

#pragma mark - UITableView Datasource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"RatingManCell";
    UITableViewCell *cell = (CustomCellView *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = (CustomCellView *)[[[NSBundle mainBundle] loadNibNamed:cellIdentifier owner:nil options:nil] objectAtIndex:0];
    }
    
    CustomCellBackgroundViewPosition pos;
    
    pos = CustomCellBackgroundViewPositionBottom;
    
    if (indexPath.section != 1){
        if (indexPath.row == 0) {
            pos = CustomCellBackgroundViewPositionTop;
        } else {
            if (indexPath.row < [tableView numberOfRowsInSection:indexPath.section] -1) {
                pos = CustomCellBackgroundViewPositionMiddle;
            }
        }
        
        if ([tableView numberOfRowsInSection:indexPath.section] == 1) {
            pos = CustomCellBackgroundViewPositionSingle;
        }
        
        CustomCellBackgroundView *bkgView = [[CustomCellBackgroundView alloc] initWithFrame:cell.frame];
        if (indexPath.row % 2 == 0){
            bkgView.fillColor = [UIColor colorWithRed:0.91f green:0.91f blue:0.89f alpha:1.00f];
        } else {
            bkgView.fillColor = [UIColor colorWithRed:0.99f green:0.99f blue:0.96f alpha:1.00f];
        }
        
        bkgView.borderColor = [UIColor clearColor];
        //CSCustomCellBackgroundView *bkgView = [[CSCustomCellBackgroundView alloc] initWithFrame:cell.frame];
        
        
        bkgView.position = pos;
        cell.backgroundView = bkgView;
        
        CustomCellBackgroundView *selbkgView = [[CustomCellBackgroundView alloc] initWithFrame:cell.frame];
        selbkgView.fillColor = [UIColor colorWithRed:0.09f green:0.10f blue:0.13f alpha:1.00f];
        selbkgView.borderColor = [UIColor clearColor];
        selbkgView.position = pos;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.selectedBackgroundView = selbkgView;
        
    }

    
    return cell;
}

#pragma mark - UITableView Delegate methods

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return ROW_HEIGHT;
}

@end
