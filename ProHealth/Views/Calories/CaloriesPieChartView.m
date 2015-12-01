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
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setup];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        [self setup];
    }
    return self;
}

#pragma mark - Setup 

- (void)setup
{
    self.layer.maxRadius = 110;
    self.layer.minRadius = 100;
    self.layer.animationDuration = kCaloriesPieChartViewAnimationDuration;
    self.layer.showTitles = ShowTitlesNever;
    self.layer.startAngle = 90;
    self.layer.endAngle = 450;
    if ([self.layer.self respondsToSelector:@selector(setContentsScale:)])
    {
        self.layer.contentsScale = [[UIScreen mainScreen] scale];
    }
}


#pragma mark - Static methods

+ (Class)layerClass
{
    return [PieLayer class];
}


@end
