//
//  CaloriesViewController.m
//  ProHealth
//
//  Created by Admin on 24.11.15.
//  Copyright © 2015 Natalia Zubareva. All rights reserved.
//

#import "CaloriesViewController.h"

@interface CaloriesViewController ()

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


@end
