//
//  AchievesView.m
//  BeelineBuzzles
//
//  Created by Кирилл Кунст on 21.09.12.
//  Copyright (c) 2012 Create. All rights reserved.
//

#import "AchievesView.h"
#import "QuartzCore/QuartzCore.h"

@interface AchievesView ()

@end

@implementation AchievesView
@synthesize scrollView;
@synthesize selectImageView;

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
    [self setScrollView:nil];
    [self setAchieveButtons:nil];
    [super viewDidUnload];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}

-(void)initUI{
    self.scrollView.contentSize = CGSizeMake(320, 100*5);
    int i = 0;
    for (UIButton *btn in self.achieveButtons){
        btn.tag = i++;
        btn.layer.zPosition = 100;

        [btn addTarget:self action:@selector(onImageTap:) forControlEvents:UIControlEventTouchDown];
    }
}

-(void)onImageTap:(id)sender{
    if (self.selectImageView != nil){
        [self.selectImageView removeFromSuperview];
    }
    UIButton *btn = (UIButton *)sender;
    CGRect frame = btn.frame;
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bage_insert"]];
    imageView.layer.zPosition = 1;
    frame = CGRectMake(btn.frame.origin.x - 6, btn.frame.origin.y -6, 70, 70);
    imageView.frame = frame;
    
    UIView *parentView = btn.superview;
    UIView *textView = [self labelWithText:@"Поймать 25 разных персонажей" aboveButton:btn];
    self.selectImageView = imageView;
    [parentView addSubview:self.selectImageView];
   // [parentView addSubview:textView];
    
}

-(UIView *)labelWithText:(NSString *)text aboveButton:(UIButton *)btn{
    UILabel *textLabel = [[UILabel alloc] init];
    textLabel.text = text;
    [textLabel sizeToFit];
    
    CGRect labelFrame = textLabel.frame;
    
    UIView *labelView = [[UIView alloc] init];
    labelView.frame = CGRectMake(btn.frame.origin.x-25, btn.frame.origin.y-20, 130, 66);
    
    UIImageView *background = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bage_mess"]];
    background.frame = labelView.frame;
    
    [labelView addSubview:background];
    //[labelView addSubview:textLabel];
    return labelView;
}
@end
