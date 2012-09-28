//
//  AchievesView.h
//  BeelineBuzzles
//
//  Created by Кирилл Кунст on 21.09.12.
//  Copyright (c) 2012 Create. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewInsideTabController.h"

/**
 Экран Достижения
 */
@interface AchievesView : ViewInsideTabController
@property (unsafe_unretained, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *achieveButtons;
@property (strong,nonatomic) UIImageView *selectImageView;


-(void)onImageTap:(id)sender;

-(UIView *)labelWithText:(NSString *)text aboveButton:(UIButton *)btn;
@end
