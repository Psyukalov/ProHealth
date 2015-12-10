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
#import "UIViewController+CustomDraw.h"

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
    self.usedGlass = 0;
    //
    
    [Helper applyCornerRadius:6 forViews:@[_contentView]];
    [Helper applyCornerRadius:_btnConfirm.frame.size.height / 2 forViews:@[_btnConfirm]];
    
    [_lblDay setText:[NSString stringWithFormat:@"%ld", (long)[Helper currentDay]]];
    NSString *newMonth = [Helper currentMonthNameWithStyle:NSDateFormatterShortStyle
                                                withFormat:@"MMM"];
    NSMutableString *month = [NSMutableString stringWithString:newMonth];
    [month deleteCharactersInRange:[month rangeOfString:@"."]];
    month = [NSMutableString stringWithString:[month uppercaseString]];
    [_lblMonth setText:[NSString stringWithFormat:@"%@", month]];
    [self setLabelTextUsedWater];
    [_lblAllWater setText:[NSString stringWithFormat:@"из %d мл", self.countGlass * 250]];
    self.btnArray = [[NSMutableArray alloc] init];
    BOOL isUsed;
    NSInteger count = 0;
    CGFloat deltaWidth = (SCREEN_WIDTH - 40) / (self.countGlass / self.countLines) - 40;
    CGFloat deltaHeight = _contentBtnWaterView.frame.size.height / self.countLines - 62;
    for (int j = 0; j <= self.countLines - 1; j++) {
        for (int i = 0; i <= self.countGlass / self.countLines - 1; i++) {
            if (count < self.usedGlass) {
                isUsed = YES;
            } else {
                isUsed = NO;
            }
            WaterGlassButton *btnWaterGlass = [[WaterGlassButton alloc] initWithUsedGlass:isUsed];
            [btnWaterGlass addTarget:self action:@selector(btnWaterGlass_Tap:) forControlEvents:UIControlEventTouchUpInside];
            [btnWaterGlass setFrame:CGRectMake(deltaWidth / 2 + i * 40 + i * deltaWidth, deltaHeight / 2 + j * 62 + j * deltaHeight, 40, 62)];
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

#pragma mark - Custom methods

- (void)setLabelTextUsedWater {
    [_lblWater setText:[NSString stringWithFormat:@"%d", self.usedGlass * 250]];
}

#pragma mark - Actions

- (void)btnWaterGlass_Tap:(WaterGlassButton *)button {
    if ([button useGlass]) {
        self.usedGlass++;
        [self setLabelTextUsedWater];
    }
}

- (IBAction)BtnConfirm_Tap:(UIButton *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

@end