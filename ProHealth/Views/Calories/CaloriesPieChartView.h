//
//  CaloriesPieChartView.h
//  ProHealth
//
//  Created by Anton Yurichev on 26.11.15.
//  Copyright © 2015 Natalia Zubareva. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PieLayer.h"

static const CGFloat kCaloriesPieChartViewDefaultCircleWidth = 10.0f;

@interface CaloriesPieChartView : UIView

@end

@interface CaloriesPieChartView (PieLayer)

@property(nonatomic,readonly,strong) PieLayer *layer;

@end

