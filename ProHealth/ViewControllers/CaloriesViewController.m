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


@property (weak, nonatomic) IBOutlet UIView *contentView;
@property (assign, nonatomic) BOOL hasViewSize;
@property (strong, nonatomic) IBOutlet CaloriesPieChartView *caloriesPieChartView;
@property (weak, nonatomic) IBOutlet UICountingLabel *labelCaloriesCount;
@property (weak, nonatomic) IBOutlet UILabel *labelCaloriesTitle;

@property (weak, nonatomic) IBOutlet UIButton *buttonAdd;

@property (weak, nonatomic) IBOutlet UILabel *labelProteinTitle;
@property (weak, nonatomic) IBOutlet UILabel *labelProtein;
@property (weak, nonatomic) IBOutlet UILabel *labelProteinWarning;
@property (weak, nonatomic) IBOutlet UIImageView *imgProteinStatus;

@property (weak, nonatomic) IBOutlet UILabel *labelCarboTitle;
@property (weak, nonatomic) IBOutlet UILabel *labelCarbo;
@property (weak, nonatomic) IBOutlet UILabel *labelCarboWarning;
@property (weak, nonatomic) IBOutlet UIImageView *imgCarboStatus;

@property (weak, nonatomic) IBOutlet UILabel *labelFatTitle;
@property (weak, nonatomic) IBOutlet UILabel *labelFat;
@property (weak, nonatomic) IBOutlet UILabel *labelFatWarning;
@property (weak, nonatomic) IBOutlet UIImageView *imgFatStatus;

@property (weak, nonatomic) IBOutlet UILabel *labelDay;
@property (weak, nonatomic) IBOutlet UILabel *labelMonth;

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
    [self loadLocalization];

    [Helper applyCornerRadius:self.buttonAdd.bounds.size.width / 2 forViews:@[self.buttonAdd]];
    [Helper applyCornerRadius:6.0f forViews:@[self.contentView]];
    self.labelCaloriesCount.format = @"%d\nккал";
    self.labelCaloriesCount.method = UILabelCountingMethodLinear;
    self.caloriesPieChartView.alpha = 0.0f;
    [UIView animateKeyframesWithDuration:1.0f delay:0 options:kNilOptions animations:^{
        self.caloriesPieChartView.alpha = 1.0f;
    } completion:nil];
 
}

- (void)loadLocalization {
    self.title = Local(@"Calories.Title");
    self.labelFatTitle.text = Local(@"Calories.Fat.Title");
    self.labelProteinTitle.text = Local(@"Calories.Protein.Title");
    self.labelCarboTitle.text = Local(@"Calories.Carbo.Title");
    self.labelCaloriesTitle.text = Local(@"Calories.Calories.Title");
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    //NSLog(@"pie chart frame: %@", NSStringFromCGRect(self.caloriesPieChartView.frame));
    PieElement *full = [PieElement pieElementWithValue:30 color:kCaloriesPieChartViewFillColor];
    [self.caloriesPieChartView.layer insertValues:@[full] atIndexes:@[@(0)] animated:NO];
    PieElement *calories = [PieElement pieElementWithValue:20 color:kCaloriesPieChartViewResultColor];
    [self.caloriesPieChartView.layer insertValues:@[calories] atIndexes:@[@(0)] animated:YES];
    [self.labelCaloriesCount countFrom:0 to:1234 withDuration:0.7f];
}
#pragma mark - Actions

- (IBAction)buttonAdd_Tap:(UIButton *)sender {
    // Show menu with blurred image of snapshot of current window
    UIWindow *mainWindow = [[UIApplication sharedApplication].delegate window];
    UIImage *snapshot = [mainWindow blurredSnapshot];
    MainMenuViewController *mainMenuVC = [[MainMenuViewController alloc] init];
    mainMenuVC.snapshotImage = snapshot;
    mainMenuVC.modalPresentationStyle = UIModalPresentationOverCurrentContext;
    mainMenuVC.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:mainMenuVC animated:YES completion:nil];
}

@end
