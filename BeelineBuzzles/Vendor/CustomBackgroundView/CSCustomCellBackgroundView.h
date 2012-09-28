//
//  CSCustomCellBackgroundView.h
//
#import "CustomCellBackgroundView.h"
#import <UIKit/UIKit.h>


@interface CSCustomCellBackgroundView : UIView 
{
    CustomCellBackgroundViewPosition position;
    CGGradientRef gradient;
}

@property(nonatomic) CustomCellBackgroundViewPosition position;

@end