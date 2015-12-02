//
//  WaterViewController.m
//  ProHealth
//
//  Created by Admin on 24.11.15.
//  Copyright © 2015 Natalia Zubareva. All rights reserved.
//


#import "WaterViewController.h"
#import "Helper.h"


@interface WaterViewController ()
@property (weak, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet UILabel *lblDay;
@property (weak, nonatomic) IBOutlet UILabel *lblMonth;
@property (weak, nonatomic) IBOutlet UILabel *lblWater;
@property (weak, nonatomic) IBOutlet UIButton *btnAddGlass;
@property (weak, nonatomic) IBOutlet UILabel *lblTip;
@property (weak, nonatomic) IBOutlet UIButton *btnConfirm;

@end


@implementation WaterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [Helper applyCornerRadius:6 forViews:@[_contentView]];
    [Helper applyCornerRadius:_btnConfirm.frame.size.height / 2 forViews:@[_btnConfirm]];
    [_lblDay setText:[NSString stringWithFormat:@"%d", [Helper currentDay]]];
    NSString *newMonth = [Helper currentMonthNameWithStyle:NSDateFormatterShortStyle
                                                withFormat:@"MMM"];
    NSMutableString *month = [NSMutableString stringWithString:newMonth];
    [month deleteCharactersInRange:[month rangeOfString:@"."]];
    month = [NSMutableString stringWithString:[month uppercaseString]];
    [_lblMonth setText:[NSString stringWithFormat:@"%@", month]];
}

#pragma mark - Actions

- (IBAction)BtnConfirm_Tab:(UIButton *)sender {
    //
}

@end