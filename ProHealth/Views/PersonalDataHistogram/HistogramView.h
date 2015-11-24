//
//  HistogramView.h
//  ProHealth
//
//  Created by Admin on 24.11.15.
//  Copyright © 2015 Natalia Zubareva. All rights reserved.
//


#import <UIKit/UIKit.h>


@interface HistogramView : UIView

@property (strong, nonatomic) NSArray *values;
@property (assign, nonatomic) int maxValue;
@property (assign, nonatomic) int minTitleValue;
@property (assign, nonatomic) int barDelta;
@property (strong, nonatomic) UIColor *firstColor;
@property (strong, nonatomic) UIColor *secondColor;
@property (assign, nonatomic) int upBorder;
@property (assign, nonatomic) int leftBorder;

- (HistogramView *)initWithFrame:(CGRect)frame
                          values:(NSArray *)values
                        maxValue:(int)maxValue
                   minTitleValue:(int)minTitleValue
                        barDelta:(int)barDelta
                      firstColor:(UIColor *)firstColor
                     secondColor:(UIColor *)secondColor
                    withUpBorder:(int)upBorder
                   andLeftBorder:(int)leftBorder;

@end
