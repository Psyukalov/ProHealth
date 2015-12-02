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
#import "Helper.h"
#import "MainMenuViewController.h"
#import "UIView+Snapshot.h"

@interface CaloriesViewController ()

@property (assign, nonatomic) BOOL hasViewSize;
@property (strong, nonatomic) IBOutlet CaloriesPieChartView *caloriesPieChartView;
@property (weak, nonatomic) IBOutlet UICountingLabel *labelCaloriesCount;
@property (weak, nonatomic) IBOutlet UIButton *buttonAdd;

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
    
    [Helper applyCornerRadius:self.buttonAdd.bounds.size.width / 2 forViews:@[self.buttonAdd]];
    self.labelCaloriesCount.format = @"%d\nккал";
    self.labelCaloriesCount.method = UILabelCountingMethodLinear;
    self.caloriesPieChartView.alpha = 0.0f;
    [UIView animateKeyframesWithDuration:1.0f delay:0 options:kNilOptions animations:^{
        self.caloriesPieChartView.alpha = 1.0f;
    } completion:nil];
    
    NSLog(@"pie chart frame: %@", NSStringFromCGRect(self.caloriesPieChartView.frame));
    PieElement *full = [PieElement pieElementWithValue:30 color:kCaloriesPieChartViewFillColor];
    [self.caloriesPieChartView.layer insertValues:@[full] atIndexes:@[@(0)] animated:NO];
    PieElement *calories = [PieElement pieElementWithValue:20 color:kCaloriesPieChartViewResultColor];
    [self.caloriesPieChartView.layer insertValues:@[calories] atIndexes:@[@(0)] animated:YES];
    [self.labelCaloriesCount countFrom:0 to:2345 withDuration:1.5f];
    
    
}

- (IBAction)buttonAdd_Tap:(UIButton *)sender {
    UIWindow *mainWindow = [[UIApplication sharedApplication].delegate window];
    UIImage *snapshot = [mainWindow blurredSnapshot];
    MainMenuViewController *mainMenuVC = [[MainMenuViewController alloc] init];
    mainMenuVC.snapshotImage = snapshot;
    mainMenuVC.modalPresentationStyle = UIModalPresentationOverCurrentContext;
    mainMenuVC.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:mainMenuVC animated:YES completion:nil];
}

@end
