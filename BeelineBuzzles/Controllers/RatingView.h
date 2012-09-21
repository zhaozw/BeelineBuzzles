//
//  RatingView.h
//  BeelineBuzzles
//
//  Created by Кирилл Кунст on 21.09.12.
//  Copyright (c) 2012 Create. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewInsideTabController.h"

@interface RatingView : ViewInsideTabController<UITableViewDataSource,UITableViewDelegate, UITextFieldDelegate>
@property (unsafe_unretained, nonatomic) IBOutlet UITableView *tableView;





@end
