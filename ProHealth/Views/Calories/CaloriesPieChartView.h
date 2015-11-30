//
//  CaloriesPieChartView.h
//  ProHealth
//
//  Created by Anton Yurichev on 26.11.15.
//  Copyright © 2015 Natalia Zubareva. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PieLayer.h"

#define kCaloriesPieChartViewFillColor RGB(0,0,0)
#define kCaloriesPieChartViewResultColor RGB(255,255,255)

static const NSTimeInterval kCaloriesPieChartViewAnimationDuration = 0.6f;
static const CGFloat kCaloriesPieChartViewMargins = 114.0f;
static const CGFloat kCaloriesPieChartViewDefaultCircleWidth = 10.0f;

@interface CaloriesPieChartView : UIView

- (instancetype)initWithCaloriesValue:(NSInteger)caloriesValue normalValue:(NSInteger)normalValue viewWidth:(CGFloat)viewWidth;

@end

@interface CaloriesPieChartView (PieLayer)

@property(nonatomic,readonly,strong) PieLayer *layer;

@end

