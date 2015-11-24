//
//  PersonalDataViewController.m
//  ProHealth
//
//  Created by Admin on 24.11.15.
//  Copyright © 2015 Natalia Zubareva. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()

@property (strong, nonatomic) Person *person;
@property (weak, nonatomic) IBOutlet UIImageView *imageRectAvatar;
@property (weak, nonatomic) IBOutlet UIImageView *imageCircleAvatar;
@property (weak, nonatomic) IBOutlet UILabel *labelName;
@property (weak, nonatomic) IBOutlet UILabel *labelStartDate;
@property (weak, nonatomic) IBOutlet UILabel *labelWeight;
@property (weak, nonatomic) IBOutlet UILabel *labelGrowth;
@property (weak, nonatomic) IBOutlet UILabel *labelBirthday;
@property (weak, nonatomic) IBOutlet UILabel *labelGender;

- (IBAction)changeAvatar:(id)sender;
- (IBAction)editPersonalData:(id)sender;
- (IBAction)fullVersion:(id)sender;

@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.person = [Person sharedPerson];
}

- (void)viewWillAppear:(BOOL)animated {
    _imageRectAvatar.image = [UIImage imageWithData:self.person.avatar];
    _imageRectAvatar.image = [UIImage imageWithData:self.person.avatar];
    _labelName.text = self.person.name;
    _labelStartDate.text = [NSString stringWithFormat:@"Мы вместе с %@", self.person.startDate];
    _labelWeight.text = [NSString stringWithFormat:@"%f кг", self.person.weight];
    _labelGrowth.text = [NSString stringWithFormat:@"%f кг", self.person.growth];
    _labelBirthday.text = [NSString stringWithFormat:@"%@ кг", self.person.birthday];
    _labelGender.text = self.person.gender;
}

- (IBAction)changeAvatar:(id)sender {
    //
}

- (IBAction)editPersonalData:(id)sender {
    //
}

- (IBAction)fullVersion:(id)sender {
    //
}

@end