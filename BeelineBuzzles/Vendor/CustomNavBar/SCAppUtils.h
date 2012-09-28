//
//  SCAppUtils.h
//  MegaTyumen
//
//  Created by Yazhenskikh Stanislaw on 28.12.11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define kSCNavBarImageTag 6183746
#define kSCNavBarColor [UIColor colorWithRed:0.227 green:0.259 blue:0.322 alpha:1]

@interface SCAppUtils : NSObject

+ (void)customizeNavigationController:(UINavigationController *)navController;

@end
