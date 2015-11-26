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

@interface PersonalStatsViewController ()

@property (strong, nonatomic) Person *person;
@property (strong, nonatomic) DataManager *context;
@property (strong, nonatomic) NSMutableArray *calories;
@property (weak, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet UIView *histogramView;
@property (weak, nonatomic) IBOutlet UIImageView *imageRectAvatar;
@property (weak, nonatomic) IBOutlet UIImageView *imageCircleAvatar;
@property (weak, nonatomic) IBOutlet UILabel *lblName;
@property (weak, nonatomic) IBOutlet UILabel *lblStartDate;
//tmp
@property (weak, nonatomic) IBOutlet UITextField *txt;

@end

@implementation PersonalStatsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.context = [DataManager sharedManager];
    [self.context managedObjectContext];
    UIBarButtonItem *btnSetting = [[UIBarButtonItem alloc] init];
    [btnSetting setImage:[UIImage imageNamed:@"gear.png"]];
    [btnSetting setAction:@selector(btnSettings_Tab:)];
    [btnSetting setTarget:self];
    self.navigationController.navigationBar.topItem.rightBarButtonItem = btnSetting;
    [self.navigationController.navigationBar setBackgroundColor:RGB(1, 225, 255)];
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
        [newButton setTitle:btnCaptions[i] forState:UIControlStateNormal];
        [newButton setTitleColor:RGB(0, 0, 0) forState:UIControlStateSelected];
        [newButton setTitleColor:RGB(44, 62, 80) forState:UIControlStateNormal];
        [_histogramView insertSubview:newButton atIndex:1];
    }
//    NSArray *values = @[@3200, @3300, @3400, @3255, @3600, @3200, @2900, @3100, @3000, @3200, @3350, @3150];
////    HistogramView *histogram = [[HistogramView alloc] initWithFrame:_histogramView.bounds];
////    histogram.width = [UIScreen mainScreen].bounds.size.width - 40;
////    histogram.minTitleValue = 1200;
////    histogram.barDelta = 0;
////    histogram.firstColor = RGB(1, 225, 255);
////    histogram.secondColor = RGB(0, 209, 239);
////    histogram.upBorder = 8;
////    histogram.leftBorder = 8;
//    HistogramView *histogram = [[HistogramView alloc] initWithFrame:_histogramView.bounds
//                                                     histogramWidth:[UIScreen mainScreen].bounds.size.width - 40
//                                                             values:values maxValue:5000
//                                                      minTitleValue:1200
//                                                           barDelta:0
//                                                         firstColor:RGB(1, 225, 255)
//                                                        secondColor:RGB(0, 209, 239)
//                                                       withUpBorder:8
//                                                      andLeftBorder:8];
////    [histogram drawWithValues:values];
//    [_histogramView insertSubview:histogram atIndex:0];
}

- (IBAction)add:(id)sender {
    NSManagedObject *newCal = [NSEntityDescription insertNewObjectForEntityForName:@"Eating" inManagedObjectContext:self.context.managedObjectContext];
    
    NSNumberFormatter *f = [[NSNumberFormatter alloc] init];
    f.numberStyle = NSNumberFormatterDecimalStyle;
    NSNumber *myNumber = [f numberFromString:_txt.text];
    
    [newCal setValue:myNumber forKey:@"calories"];
    [newCal setValue:[NSDate date] forKey:@"date"];
    [self.context saveContext];
    NSFetchRequest *req = [[NSFetchRequest alloc] initWithEntityName:@"Eating"];
    self.calories = [[self.context.managedObjectContext executeFetchRequest:req error:nil] mutableCopy];
    NSMutableArray *res = [[NSMutableArray alloc] init];
    for (int i = 0; i <= self.calories.count - 1; i++) {
        Eating *getCal = [self.calories objectAtIndex:i];
        [getCal valueForKey:@"calories"];
        [res addObject:getCal];
    }
    NSLog(@"%@", res);
//    if (res.count > 0 ) {
//    HistogramView *histogram = [[HistogramView alloc] initWithFrame:_histogramView.bounds
//                                                     histogramWidth:[UIScreen mainScreen].bounds.size.width - 40
//                                                             values:res
//                                                           maxValue:5000
//                                                      minTitleValue:1200
//                                                           barDelta:0
//                                                         firstColor:RGB(1, 225, 255)
//                                                        secondColor:RGB(0, 209, 239)
//                                                       withUpBorder:8
//                                                      andLeftBorder:8];
//    //    [histogram drawWithValues:values];
//    [_histogramView insertSubview:histogram atIndex:0];
//    }
}

- (void)btnSettings_Tab:(UIBarButtonItem *)sender {
    SettingsViewController *settingsVC = [[SettingsViewController alloc] init];
    [self.navigationController pushViewController:settingsVC animated:YES];
}

@end