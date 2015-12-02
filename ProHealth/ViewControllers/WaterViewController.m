//
//  WaterViewController.m
//  ProHealth
//
//  Created by Admin on 24.11.15.
//  Copyright © 2015 Natalia Zubareva. All rights reserved.
//


#import "WaterViewController.h"
#import "Helper.h"
#import "WaterGlassButton.h"

@interface WaterViewController ()

@property (assign, nonatomic) int countGlass;
@property (strong, nonatomic) NSMutableArray <WaterGlassButton *> *btnArray;
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
    self.countGlass = 8;
    [Helper applyCornerRadius:6 forViews:@[_contentView]];
    [Helper applyCornerRadius:_btnConfirm.frame.size.height / 2 forViews:@[_btnConfirm]];
    [_lblDay setText:[NSString stringWithFormat:@"%d", [Helper currentDay]]];
    NSString *newMonth = [Helper currentMonthNameWithStyle:NSDateFormatterShortStyle
                                                withFormat:@"MMM"];
    NSMutableString *month = [NSMutableString stringWithString:newMonth];
    [month deleteCharactersInRange:[month rangeOfString:@"."]];
    month = [NSMutableString stringWithString:[month uppercaseString]];
    [_lblMonth setText:[NSString stringWithFormat:@"%@", month]];
    self.btnArray = [[NSMutableArray alloc] init];
    for (int i = 0; i <= self.countGlass - 1; i++) {
        WaterGlassButton *btnWaterGlass = [[WaterGlassButton alloc] init];
        [btnWaterGlass setFrame:CGRectMake(i * 32, SCREEN_HEIGHT / 2, 32, 32)];
        btnWaterGlass.emptyGlass = [UIImage imageNamed:@"img_empty_glass.png"];
        btnWaterGlass.addGlass = [UIImage imageNamed:@"img_add_glass.png"];
        btnWaterGlass.fullGlass = [UIImage imageNamed:@"img_full_glass.png"];
        [self.btnArray addObject:btnWaterGlass];
        [_contentView addSubview:self.btnArray[i]];
    }
    for (int i = 0; i <= self.countGlass - 1; i++) {
        if (i == 0) {
            self.btnArray[i].previos = nil;
            self.btnArray[i].next = self.btnArray[i + 1];
        } else if (i == self.countGlass - 1) {
            self.btnArray[i].previos = self.btnArray[i - 1];
            self.btnArray[i].next = nil;
        } else {
            self.btnArray[i].previos = self.btnArray[i - 1];
            self.btnArray[i].next = self.btnArray[i + 1];
        }
        [self.btnArray[i] addImage];
    }
}

#pragma mark - Actions

- (IBAction)BtnConfirm_Tab:(UIButton *)sender {
    //
}

@end