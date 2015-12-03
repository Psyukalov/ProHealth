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
@property (assign, nonatomic) int countLines;
@property (assign, nonatomic) int usedGlass;
@property (strong, nonatomic) NSMutableArray <WaterGlassButton *> *btnArray;
@property (weak, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet UILabel *lblDay;
@property (weak, nonatomic) IBOutlet UILabel *lblMonth;
@property (weak, nonatomic) IBOutlet UILabel *lblWater;
@property (weak, nonatomic) IBOutlet UILabel *lblAllWater;
@property (weak, nonatomic) IBOutlet UIView *contentBtnWaterView;
@property (weak, nonatomic) IBOutlet UILabel *lblTip;
@property (weak, nonatomic) IBOutlet UIButton *btnConfirm;

@end


@implementation WaterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //tmp
    self.countGlass = 20;
    self.countLines = 4;
    self.usedGlass = 0;
    //
    [Helper applyCornerRadius:6 forViews:@[_contentView]];
    [Helper applyCornerRadius:_btnConfirm.frame.size.height / 2 forViews:@[_btnConfirm]];
    [_lblDay setText:[NSString stringWithFormat:@"%d", [Helper currentDay]]];
    NSString *newMonth = [Helper currentMonthNameWithStyle:NSDateFormatterShortStyle
                                                withFormat:@"MMM"];
    NSMutableString *month = [NSMutableString stringWithString:newMonth];
    [month deleteCharactersInRange:[month rangeOfString:@"."]];
    month = [NSMutableString stringWithString:[month uppercaseString]];
    [_lblMonth setText:[NSString stringWithFormat:@"%@", month]];
    [self setLebelTextUsedWater];
    [_lblAllWater setText:[NSString stringWithFormat:@"из %d мл", self.countGlass * 250]];
    self.btnArray = [[NSMutableArray alloc] init];
    BOOL isUsed;
    NSInteger count = 0;
    CGFloat delWidth = (SCREEN_WIDTH - 40) / (self.countGlass / self.countLines) - 40;
    CGFloat delHeight = _contentBtnWaterView.frame.size.height / self.countLines - 62;
    for (int j = 0; j <= self.countLines - 1; j++) {
        for (int i = 0; i <= self.countGlass / self.countLines - 1; i++) {
            if (count < self.usedGlass) {
                isUsed = YES;
            } else {
                isUsed = NO;
            }
            WaterGlassButton *btnWaterGlass = [[WaterGlassButton alloc] initWithUsedGlass:isUsed];
            [btnWaterGlass addTarget:self action:@selector(btnWaterGlass_Tab:) forControlEvents:UIControlEventTouchUpInside];
            [btnWaterGlass setFrame:CGRectMake(delWidth / 2 + i * 40 + i * delWidth, delHeight / 2 + j * 62 + j * delHeight, 40, 62)];
            btnWaterGlass.emptyGlass = [UIImage imageNamed:@"img_empty_glass.png"];
            btnWaterGlass.addGlass = [UIImage imageNamed:@"img_add_glass.png"];
            btnWaterGlass.fullGlass = [UIImage imageNamed:@"img_full_glass.png"];
            [self.btnArray addObject:btnWaterGlass];
            [_contentBtnWaterView addSubview:self.btnArray[count]];
            count++;
        }
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
    }
    for (int i = 0; i <= self.countGlass - 1; i++) {
        [self.btnArray[i] redrawImage];
    }
}

#pragma mark - Custom methods

- (void)setLebelTextUsedWater {
    [_lblWater setText:[NSString stringWithFormat:@"%d", self.usedGlass * 250]];
}

#pragma mark - Actions

- (void)btnWaterGlass_Tab:(WaterGlassButton *)button {
    if ([button useGlass]) {
        self.usedGlass++;
        [self setLebelTextUsedWater];
    }
}

- (IBAction)BtnConfirm_Tab:(UIButton *)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
}

@end