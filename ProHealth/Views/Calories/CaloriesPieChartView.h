//
//  CaloriesPieChartView.h
//  ProHealth
//
//  Created by Anton Yurichev on 26.11.15.
//  Copyright © 2015 Natalia Zubareva. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PieLayer.h"

#define kCaloriesPieChartViewFillColor RGB(1, 225, 255)
#define kCaloriesPieChartViewResultColor RGB(44, 62, 80)

static const NSTimeInterval kCaloriesPieChartViewAnimationDuration = 1.5f;
static const CGFloat kCaloriesPieChartViewMargins = 114.0f;
static const CGFloat kCaloriesPieChartViewDefaultCircleWidth = 10.0f;

@interface CaloriesPieChartView : UIView

@end

@interface CaloriesPieChartView (PieLayer)

@property(nonatomic,readonly,strong) PieLayer *layer;

@end

