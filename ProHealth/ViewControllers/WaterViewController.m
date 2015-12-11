//
//  WaterViewController.m
//  ProHealth
//
//  Created by Admin on 24.11.15.
//  Copyright © 2015 Natalia Zubareva. All rights reserved.
//

#import "AppDelegate.h"
#import "WaterViewController.h"
#import "Helper.h"
#import "WaterGlassButton.h"
#import "UIViewController+CustomDraw.h"

CGFloat const marginFromSuperView = 20;
int const glassVolume = 250;
CGFloat const waterButtonWidth = 40;
CGFloat const waterButtonHeight = 62;
CGFloat const buttonWidthMargin = 40;
CGFloat const buttonHeightMargin = 62;

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
    [self setNavigationBackButton];
    self.title = Local(@"WaterVC.Title");
    //tmp
    self.countGlass = 20;
    self.countLines = 4;
    self.usedGlass = 1;
    //
    [Helper applyCornerRadius:6 forViews:@[_contentView]];
    [Helper applyCornerRadius:_btnConfirm.frame.size.height / 2 forViews:@[_btnConfirm]];

    // Delete dot in month
    NSString *newMonth = [Helper currentMonthNameWithStyle:NSDateFormatterShortStyle
                                                withFormat:@"MMM"];
    NSMutableString *month = [NSMutableString stringWithString:newMonth];
    [month deleteCharactersInRange:[month rangeOfString:@"."]];
    month = [NSMutableString stringWithString:[month uppercaseString]];
    _lblMonth.text = [NSString stringWithFormat:@"%@", month];
    
    _lblDay.text = [NSString stringWithFormat:@"%ld", (long)[Helper currentDay]];
    _lblAllWater.text = [NSString stringWithFormat:@"из %d мл", self.countGlass * glassVolume];
    [self applyLabelTextUsedWater];
    [self createWaterButtons];
}

#pragma mark - Custom methods

- (void)createWaterButtons {
    self.btnArray = [[NSMutableArray alloc] init];
    BOOL isUsed;
    NSInteger count = 0;
    CGFloat deltaWidth = (SCREEN_WIDTH - 2 * marginFromSuperView) / (self.countGlass / self.countLines) - buttonWidthMargin;
    CGFloat deltaHeight = _contentBtnWaterView.frame.size.height / self.countLines - buttonHeightMargin;
    for (int j = 0; j <= self.countLines - 1; j++) {
        for (int i = 0; i <= self.countGlass / self.countLines - 1; i++) {
            if (count < self.usedGlass) {
                isUsed = YES;
            } else {
                isUsed = NO;
            }
            WaterGlassButton *btnWaterGlass = [[WaterGlassButton alloc] initWithUsedGlass:isUsed];
            [btnWaterGlass addTarget:self
                              action:@selector(btnWaterGlass_Tap:)
                    forControlEvents:UIControlEventTouchUpInside];
            [btnWaterGlass setFrame:CGRectMake(deltaWidth / 2 + i * buttonWidthMargin + i * deltaWidth, deltaHeight / 2 + j * buttonHeightMargin + j * deltaHeight, buttonWidthMargin, buttonHeightMargin)];
            btnWaterGlass.emptyGlass = [UIImage imageNamed:@"img_empty_glass.png"];
            btnWaterGlass.addGlass = [UIImage imageNamed:@"img_add_glass.png"];
            btnWaterGlass.fullGlass = [UIImage imageNamed:@"img_full_glass.png"];
            [self.btnArray addObject:btnWaterGlass];
            [_contentBtnWaterView addSubview:self.btnArray[count]];
            count++;
        }
    }
    for (int i = 0; i <= self.countGlass - 1; i++) {
        WaterGlassButton *button = self.btnArray[i];
        if (i == 0) {
            button.previos = nil;
            button.next = self.btnArray[i + 1];
        } else if (i == self.countGlass - 1) {
            button.previos = self.btnArray[i - 1];
            button.next = nil;
        } else {
            button.previos = self.btnArray[i - 1];
            button.next = self.btnArray[i + 1];
        }
    }
    for (int i = 0; i <= self.countGlass - 1; i++) {
        [self.btnArray[i] redrawImage];
    }
}

- (void)applyLabelTextUsedWater {
    [_lblWater setText:[NSString stringWithFormat:@"%d", self.usedGlass * glassVolume]];
}

#pragma mark - Actions

- (void)btnWaterGlass_Tap:(WaterGlassButton *)button {
    if ([button useGlass]) {
        self.usedGlass++;
        [self applyLabelTextUsedWater];
    }
}

- (IBAction)BtnConfirm_Tap:(UIButton *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

@end