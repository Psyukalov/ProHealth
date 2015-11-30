//
//  CaloriesViewController.m
//  ProHealth
//
//  Created by Admin on 24.11.15.
//  Copyright © 2015 Natalia Zubareva. All rights reserved.
//

#import "CaloriesViewController.h"
#import "CaloriesPieChartView.h"

@interface CaloriesViewController ()

@property (assign, nonatomic) BOOL hasViewSize;

@end

@implementation CaloriesViewController

#pragma mark - Lifecycle

- (instancetype)initWithCalories:(NSInteger)calories protein:(NSInteger)protein carbohydrate:(NSInteger)carbohydrate fat:(NSInteger)fat {
    if (self = [super init]) {
        _calories = calories;
        _protein = protein;
        _carbohydrate = carbohydrate;
        _fat = fat;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    if (!self.hasViewSize) {
        [self.view layoutIfNeeded];
        NSLog(@"calories frame::%@", NSStringFromCGRect(self.view.frame));
        CaloriesPieChartView *caloriesPieChartView = [[CaloriesPieChartView alloc] initWithCaloriesValue:10 normalValue:20 viewWidth:314];
        caloriesPieChartView.translatesAutoresizingMaskIntoConstraints = NO;
        [self.view addSubview:caloriesPieChartView];
        [self.view addConstraints:@[[NSLayoutConstraint constraintWithItem:caloriesPieChartView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1 constant:0]]];
        self.hasViewSize = YES;
    }
}

@end
