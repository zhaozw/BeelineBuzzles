//
//  GameView.m
//  BeelineBuzzles
//
//  Created by Кирилл Кунст on 21.09.12.
//  Copyright (c) 2012 Create. All rights reserved.
//

#import "GameView.h"

@interface GameView ()

@end

@implementation GameView

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
}

- (void)viewDidUnload
{
    [self setGamesTable:nil];
    [super viewDidUnload];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.gamesTable.delegate = self;
    self.gamesTable.dataSource = self;
}


#pragma mark - UITableView Datasource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"gameTableCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:cellIdentifier owner:nil options:nil] objectAtIndex:0];
    }
    UIView* backgroundView = [ [ UIView alloc ] initWithFrame:CGRectZero ];
    

    
    if (indexPath.row % 2 == 0){
        backgroundView.backgroundColor = [UIColor colorWithRed:0.91f green:0.91f blue:0.89f alpha:1.00f];
    } else {
        backgroundView.backgroundColor =  [UIColor colorWithRed:0.99f green:0.99f blue:0.96f alpha:1.00f];
    }
    cell.backgroundView = backgroundView;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

#pragma mark - UITableView Delegate methods

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

@end
