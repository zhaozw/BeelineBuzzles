//
//  InfoView.m
//  BeelineBuzzles
//
//  Created by Кирилл Кунст on 24.09.12.
//  Copyright (c) 2012 Create. All rights reserved.
//

#import "InfoView.h"

@interface InfoView ()

@end

@implementation InfoView
@synthesize infos;
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
    self.infos = [Information createInfo];
}

- (void)viewDidUnload
{
    [self setInfoTable:nil];
    [super viewDidUnload];

}

-(void)initUI{
    self.navigationItem.title = @"Информация";
    self.infoTable.delegate = self;
    self.infoTable.dataSource = self;
}

#pragma mark - UITableView Datasource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return infos.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"InfoCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:cellIdentifier owner:nil options:nil] objectAtIndex:0];
    }
    Information *info = [infos objectAtIndex:indexPath.row];
    UILabel *label = (UILabel *)[cell viewWithTag:1];
    [label setText:info.name];
    return cell;
}

#pragma mark - UITableView Delegate methods

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}



@end
