//
//  CaloriesViewController.m
//  ProHealth
//
//  Created by Admin on 24.11.15.
//  Copyright © 2015 Natalia Zubareva. All rights reserved.
//

#import "CaloriesViewController.h"
#import "CaloriesPieChartView.h"
#import "PieElement.h"
#import "UICountingLabel.h"

@interface CaloriesViewController ()

@property (assign, nonatomic) BOOL hasViewSize;
@property (strong, nonatomic) IBOutlet CaloriesPieChartView *caloriesPieChartView;
@property (weak, nonatomic) IBOutlet UICountingLabel *labelCalories;

@end

@implementation CaloriesViewController

#pragma mark - Lifecycle

- (instancetype)initWithCalories:(NSInteger)calories protein:(NSInteger)protein carbohydrate:(NSInteger)carbohydrate fat:(NSInteger)fat {
    if (self = [super init]) {
        _calories = calories;
        _protein = protein;
        _carbohydrate = carbohydrate;
        _fat = fat;
        
        // TODO:
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.labelCalories.format = @"%d\nккал";
    self.labelCalories.method = UILabelCountingMethodLinear;
    self.caloriesPieChartView.alpha = 0.0f;
    [UIView animateKeyframesWithDuration:1.0f delay:0 options:kNilOptions animations:^{
        self.caloriesPieChartView.alpha = 1.0f;
    } completion:nil];
    
    NSLog(@"pie chart frame: %@", NSStringFromCGRect(self.caloriesPieChartView.frame));
    PieElement *full = [PieElement pieElementWithValue:30 color:kCaloriesPieChartViewFillColor];
    [self.caloriesPieChartView.layer insertValues:@[full] atIndexes:@[@(0)] animated:NO];
    PieElement *calories = [PieElement pieElementWithValue:20 color:kCaloriesPieChartViewResultColor];
    [self.caloriesPieChartView.layer insertValues:@[calories] atIndexes:@[@(0)] animated:YES];
    [self.labelCalories countFrom:0 to:2345 withDuration:1.5f];

}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    if (!self.hasViewSize) {
        self.hasViewSize = YES;

        
    }

}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
 
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

@end
