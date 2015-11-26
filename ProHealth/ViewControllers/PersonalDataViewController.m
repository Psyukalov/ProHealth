//
//  PersonalDataViewController.m
//  ProHealth
//
//  Created by Admin on 24.11.15.
//  Copyright © 2015 Natalia Zubareva. All rights reserved.
//


#import "PersonalDataViewController.h"


@interface PersonalDataViewController () <UIPickerViewDataSource, UIPickerViewDelegate>

@property (weak, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet UITextField *textName;
@property (weak, nonatomic) IBOutlet UILabel *lblWeight;
@property (weak, nonatomic) IBOutlet UILabel *lblGrowth;
@property (weak, nonatomic) IBOutlet UIStepper *stepperWeight;
@property (weak, nonatomic) IBOutlet UIStepper *stepperGrowth;
@property (weak, nonatomic) IBOutlet UIDatePicker *dpBirthday;
@property (weak, nonatomic) IBOutlet UIPickerView *pickerGender;
@property (strong, nonatomic) NSArray *gender;
@property (weak, nonatomic) IBOutlet UIButton *btnConfirm;

@end


@implementation PersonalDataViewController

#pragma mark - Lifecycle

- (id)initWithPerson:(Person *)person {
    self = [super init];
    if (self) {
        _person = person;
        _gender = @[@"Мужской", @"Женский"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [Helper applyCornerRadius:6 forViews:@[_contentView, _btnConfirm]];
    [Helper applyShadowForViews:@[_contentView]];
    _textName.text = self.person.name;
    if (self.person.weight == 0) {
        self.person.weight = 80.0;
    }
    if (self.person.growth == 0) {
        self.person.growth = 1.7;
    }
    _lblWeight.text = [NSString stringWithFormat:@"Вес %1.1f кг", self.person.weight];
    _lblGrowth.text = [NSString stringWithFormat:@"Рост %1.2f м", self.person.growth];
    _stepperWeight.minimumValue = 10;
    _stepperWeight.maximumValue = 250;
    _stepperWeight.stepValue = 0.1;
    _stepperWeight.value = _person.weight;
    _stepperGrowth.minimumValue = 1;
    _stepperGrowth.maximumValue = 2.20;
    _stepperGrowth.stepValue = 0.01;
    _stepperGrowth.value = _person.growth;
    _dpBirthday.maximumDate = [NSDate date];
    _dpBirthday.date = self.person.birthday;
    if ([self.person.gender isEqualToString:@"Мужской"]) {
        [_pickerGender selectRow:0 inComponent:0 animated:YES];
    } else {
        [_pickerGender selectRow:1 inComponent:0 animated:YES];
    }
}

#pragma mark - Picker View

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return 2;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return [self.gender objectAtIndex:row];
}

#pragma mark - Actions

- (IBAction)btnConfirm_Tab:(UIButton *)sender {
    self.person.name = _textName.text;
    self.person.birthday = _dpBirthday.date;
    self.person.gender = self.gender[[_pickerGender selectedRowInComponent:0]];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)stepperChangeWeight:(UIStepper *)sender {
    
    self.person.weight = _stepperWeight.value;
    _lblWeight.text = [NSString stringWithFormat:@"Вес %1.1f кг", self.person.weight];
    
}

- (IBAction)stepperChangeGrowth:(UIStepper *)sender {
    
    self.person.growth = _stepperGrowth.value;
    _lblGrowth.text = [NSString stringWithFormat:@"Рост %1.2f м", self.person.growth];
    
}

@end