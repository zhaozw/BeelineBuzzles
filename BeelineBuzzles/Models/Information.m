//
//  Information.m
//  BeelineBuzzles
//
//  Created by Кирилл Кунст on 24.09.12.
//  Copyright (c) 2012 Create. All rights reserved.
//

#import "Information.h"

@implementation Information

-(id)initWithName:(NSString *)name{
    self.name = name;
    return self;
}

+(NSArray *)createInfo{
    NSMutableArray *infos = [[NSMutableArray alloc] init];
    
    Information *info = [[Information alloc] initWithName:@"Пополнение счета"];
    [infos addObject:info];
    
    info = [[Information alloc] initWithName:@"Призы/бонусы"];
    [infos addObject:info];
    info = [[Information alloc] initWithName:@"Достижения"];
    [infos addObject:info];
    info = [[Information alloc] initWithName:@"Игра"];
    [infos addObject:info];
    info = [[Information alloc] initWithName:@"Рейтинг"];
    [infos addObject:info];
    info = [[Information alloc] initWithName:@"XXL-розыгрыш"];
    [infos addObject:info];
    
    return infos;
}
@end
