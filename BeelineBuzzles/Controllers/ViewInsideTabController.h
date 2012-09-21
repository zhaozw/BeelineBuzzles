//
//  ViewInsideTabController.h
//  BeelineBuzzles
//
//  Created by Кирилл Кунст on 21.09.12.
//  Copyright (c) 2012 Create. All rights reserved.
//

#import "BaseViewController.h"

/**
 Базовый контроллер для контроллеров внутри TabBar,
 инкапсулирует отображение корректного navigationBar 
 */
@interface ViewInsideTabController : BaseViewController
-(void)leftBarItemClick:(id)sender;
-(void)rightBarItemClick:(id)sender;
@end
