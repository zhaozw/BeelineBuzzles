//
//  BaseViewController.h
//  BeelineBuzzles
//
//  Created by Кирилл Кунст on 21.09.12.
//  Copyright (c) 2012 Create. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 Базовый контроллер
 */
@interface BaseViewController : UIViewController
/**
 Инициализация графических элементов
 */
-(void)initUI;

/**
 Инициализация navigation bar
 */
-(void)initTopBar;

/**
 Клик по кнопке "Выйти
 */
-(void)leftBarItemClick:(id)sender;
@end
