//
//  CaloriesPieChartView.m
//  ProHealth
//
//  Created by Anton Yurichev on 26.11.15.
//  Copyright © 2015 Natalia Zubareva. All rights reserved.
//

#import "CaloriesPieChartView.h"
#import "PieElement.h"
@interface CaloriesPieChartView ()

@end

@implementation CaloriesPieChartView

#pragma mark - Lifecycle
- (instancetype)initWithCaloriesValue:(NSInteger)caloriesValue normalValue:(NSInteger)normalValue viewWidth:(CGFloat)viewWidth {
    if (self = [super init]) {
        [self setupWithCaloriesValue:caloriesValue normalValue:normalValue viewWidth:viewWidth];
    }
    return self;
}

#pragma mark - Setup 

- (void)setupWithCaloriesValue:(NSInteger)caloriesValue normalValue:(NSInteger)normalValue viewWidth:(CGFloat)viewWidth
{
    self.layer.maxRadius = viewWidth - kCaloriesPieChartViewMargins;
    self.layer.minRadius = self.layer.maxRadius - kCaloriesPieChartViewDefaultCircleWidth;
    self.layer.animationDuration = kCaloriesPieChartViewAnimationDuration;
    self.layer.showTitles = ShowTitlesNever;
    if ([self.layer.self respondsToSelector:@selector(setContentsScale:)])
    {
        self.layer.contentsScale = [[UIScreen mainScreen] scale];
    }
    PieElement *calories = [PieElement pieElementWithValue:20 color:kCaloriesPieChartViewFillColor];
    PieElement *full = [PieElement pieElementWithValue:30 color:kCaloriesPieChartViewResultColor];
    
    [self.layer insertValues:@[calories, full] atIndexes:@[@(0), @(1)] animated:YES];
}


#pragma mark - Static methods

+ (Class)layerClass
{
    return [PieLayer class];
}


@end
