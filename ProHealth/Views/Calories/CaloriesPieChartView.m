//
//  CaloriesPieChartView.m
//  ProHealth
//
//  Created by Anton Yurichev on 26.11.15.
//  Copyright © 2015 Natalia Zubareva. All rights reserved.
//

#import "CaloriesPieChartView.h"

@interface CaloriesPieChartView ()

@end

@implementation CaloriesPieChartView

#pragma mark - Lifecycle

- (id)init
{
    self = [super init];
    if(self){
        [self setup];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if(self){
        [self setup];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self){
        [self setup];
    }
    return self;
}

#pragma mark - Setup 

- (void)setup
{
    self.layer.maxRadius = 220;
    self.layer.minRadius = 220 - kCaloriesPieChartViewDefaultCircleWidth;
    self.layer.animationDuration = 0.6;
    self.layer.showTitles = ShowTitlesNever;
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
