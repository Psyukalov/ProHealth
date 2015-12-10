//
//  PersonalStatsViewController.m
//  ProHealth
//
//  Created by Admin on 24.11.15.
//  Copyright © 2015 Natalia Zubareva. All rights reserved.
//


#import "PersonalStatsViewController.h"
#import "SettingsViewController.h"
#import "DataManager.h"
#import "Eating+CoreDataProperties.h"
#import "Eating.h"
#import "UIViewController+CustomDraw.h"

@interface PersonalStatsViewController ()

@property (strong, nonatomic) Person *person;
@property (strong, nonatomic) DataManager *dataManager;
@property (strong, nonatomic) NSCalendar *calendar;
@property (strong, nonatomic) NSDate *date;
@property (strong, nonatomic) NSMutableArray *calories;
@property (weak, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet UIView *histogramView;
@property (weak, nonatomic) IBOutlet UIImageView *imageRectAvatar;
@property (weak, nonatomic) IBOutlet UIImageView *imageCircleAvatar;
@property (weak, nonatomic) IBOutlet UILabel *lblName;
@property (weak, nonatomic) IBOutlet UILabel *lblStartDate;
@property (weak, nonatomic) IBOutlet UILabel *lblEmptyDB;

@end


@implementation PersonalStatsViewController

#pragma mark - Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = Local(@"PersonalStats.Title");
   
    self.dataManager = [DataManager sharedManager];
    [self.dataManager managedObjectContext];
    self.calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [[NSCalendar currentCalendar] components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay fromDate:[NSDate date]];
    self.date = [[NSCalendar currentCalendar] dateFromComponents:components];
    
    UIBarButtonItem *btnSetting = [[UIBarButtonItem alloc] init];
    [btnSetting setImage:[UIImage imageNamed:@"gear.png"]];
    [btnSetting setTintColor:RGB(1, 225, 255)];
    [btnSetting setAction:@selector(btnSettings_Tap:)];
    [btnSetting setTarget:self];
    self.navigationItem.rightBarButtonItem = btnSetting;
    //[self.navigationController.navigationBar setBackgroundColor:RGB(1, 225, 255)];
     [self setNavigationBackButton];
    [Helper applyCornerRadius:6 forViews:@[_contentView]];
    [Helper applyShadowForViews:@[_contentView]];
    [Helper applyTransparentLayerFormImage:_imageRectAvatar withColor:RGB(0, 0, 0)];
    [Helper applyCornerRadius:_imageCircleAvatar.frame.size.width / 2 forViews:@[_imageCircleAvatar]];
    
    self.person = [Person sharedPerson];
    _imageRectAvatar.image = [UIImage imageWithData:self.person.avatar];
    _imageCircleAvatar.image = [UIImage imageWithData:self.person.avatar];
    _lblName.text = self.person.name;
    NSString *startDate = [Helper applyRussianStyleForDate:self.person.startDate];
    _lblStartDate.text = [NSString stringWithFormat:@"Мы вместе с %@", startDate];
    NSArray *btnCaptions = @[@"День", @"Неделя", @"Месяц", @"Год"];
    float viewWidth = [UIScreen mainScreen].bounds.size.width - 40;
    float viewHeight = _histogramView.frame.size.height;
    float btnWidth = viewWidth / 4;
    float btnHeight = 84;
    
    for (int i = 0; i <= 3; i++) {
        UIButton *newButton = [[UIButton alloc] initWithFrame:_histogramView.frame];
        newButton.frame = CGRectMake(i * btnWidth, viewHeight - btnHeight, btnWidth, btnHeight);
        [newButton setTag:i];
        [newButton addTarget:self action:@selector(btnRequestFromButtonTag:) forControlEvents:UIControlEventTouchUpInside];
        [newButton setTitle:btnCaptions[i] forState:UIControlStateNormal];
        [newButton setTitleColor:RGB(0, 0, 0) forState:UIControlStateSelected];
        [newButton setTitleColor:RGB(44, 62, 80) forState:UIControlStateNormal];
        [_histogramView insertSubview:newButton atIndex:1];
    }
    
    [self drawHistogram:[self getArrayFromTag:0]];
}

#pragma mark - Custom methods

- (NSArray *)getArrayFromTag:(NSInteger)tag {
    NSDateComponents *dateComponent = [[NSDateComponents alloc] init];
    NSDate *newDate;
    switch (tag) {
        case 0:
            dateComponent.day = 0;
            break;
        case 1:
            dateComponent.weekOfYear = -1;
            break;
        case 2:
            dateComponent.month = -1;
            break;
        case 3:
            dateComponent.year = -1;
            break;
        default:
            break;
    }
    
    newDate = [self.calendar dateByAddingComponents:dateComponent toDate:self.date options:0];
    NSError *fetchRequestError;
    self.calories = [NSMutableArray arrayWithArray:[self.dataManager requestEatingsFromDate:newDate error:&fetchRequestError]];
    
    NSMutableArray *result = nil;
    if (!fetchRequestError) {
        if (self.calories.count > 0) {
            result = [[NSMutableArray alloc] init];
            for (Eating *eating in self.calories) {
                [result addObject:eating.calories];
            }
        }
    } else {
        NSLog(@"en error occured during executing fetch request: %@", fetchRequestError);
    }
    return result;
}

- (void)drawHistogram:(NSArray *)values {
    if (values.count == 0) {
        [_lblEmptyDB setText:@"Данных еще нет"];
        return;
    }
    HistogramView *histogram = [[HistogramView alloc] initWithFrame:_histogramView.bounds
                                                     histogramWidth:[UIScreen mainScreen].bounds.size.width - 40
                                                             values:values
                                                           maxValue:600
                                                      minTitleValue:100
                                                           barDelta:0
                                                         firstColor:RGB(1, 225, 255)
                                                        secondColor:RGB(0, 209, 239)
                                                       withUpBorder:8
                                                      andLeftBorder:8];
    [_histogramView insertSubview:histogram atIndex:0];
}

#pragma mark - Actions

- (void)btnSettings_Tap:(UIBarButtonItem *)sender {
    SettingsViewController *settingsVC = [[SettingsViewController alloc] init];
    [self.navigationController pushViewController:settingsVC animated:YES];
}

- (void)btnRequestFromButtonTag:(UIButton *)button {
    [self drawHistogram:[self getArrayFromTag:button.tag]];
}

@end