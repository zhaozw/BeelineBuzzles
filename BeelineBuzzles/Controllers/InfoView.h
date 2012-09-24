//
//  InfoView.h
//  BeelineBuzzles
//
//  Created by Кирилл Кунст on 24.09.12.
//  Copyright (c) 2012 Create. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "Information.h"

@interface InfoView : BaseViewController <UITableViewDataSource, UITableViewDelegate>
@property (unsafe_unretained, nonatomic) IBOutlet UITableView *infoTable;

@property (nonatomic,strong) NSArray *infos;
@end
