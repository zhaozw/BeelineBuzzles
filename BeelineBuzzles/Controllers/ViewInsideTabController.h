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
/**
 Клик по кнопке "Выйти
 */
-(void)leftBarItemClick:(id)sender;

/**
 Клик по кнопке Info
 */
-(void)goToInfo:(id)sender;

/**
 Клик по кнопке Settings
 */
-(void)goToSettings:(id)sender;

/**
 Кастомизация бара 
 */
-(void)customizeNavController;
@end
