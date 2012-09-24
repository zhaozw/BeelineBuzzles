//
//  Information.h
//  BeelineBuzzles
//
//  Created by Кирилл Кунст on 24.09.12.
//  Copyright (c) 2012 Create. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Information : NSObject
{
    NSString *name;
}

@property (nonatomic,strong) NSString *name;

+(NSArray *)createInfo;

@end
