//
//  StartViewController.m
//  ProHealth
//
//  Created by Admin on 24.11.15.
//  Copyright © 2015 Natalia Zubareva. All rights reserved.
//


#import "StartViewController.h"
#import "Helper.h"


@interface StartViewController ()

@property (strong, nonatomic) NSArray * monthSymbols;
@property (weak, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet UILabel *lblGreeting;
@property (weak, nonatomic) IBOutlet UILabel *lblToday;
@property (weak, nonatomic) IBOutlet UILabel *lblTip;
@property (weak, nonatomic) IBOutlet UIButton *btnFire;
@property (weak, nonatomic) IBOutlet UIButton *btnWater;
@property (weak, nonatomic) IBOutlet UIButton *btnFoot;
@property (weak, nonatomic) IBOutlet UILabel *lblFire;
@property (weak, nonatomic) IBOutlet UILabel *lblWater;
@property (weak, nonatomic) IBOutlet UILabel *lblFoot;

@end


@implementation StartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [Helper applyCornerRadius:6 forViews:@[_contentView]];
    [Helper applyCornerRadius:_btnFire.frame.size.height / 2 forViews:@[_btnFire, _btnWater, _btnFoot]];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    NSLocale *locale =[NSLocale localeWithLocaleIdentifier:@"ru_RU"];
    dateFormatter.locale = locale;
    self.monthSymbols = dateFormatter.monthSymbols;
    [_lblGreeting setText:[NSString stringWithFormat:@"%@", Local(@"Start.LblGreeting.1")]];
    [_lblFire setText:Local(@"Start.BtnFire")];
    [_lblWater setText:Local(@"Start.BtnWater")];
    [_lblFoot setText:Local(@"Start.BtnFoot")];
}

- (IBAction)btnFire_Tab:(UIButton *)sender {
    
}

- (IBAction)btnWater_Tab:(UIButton *)sender {
    
}

- (IBAction)btnFoot_Tab:(id)sender {
    //Cooming soon
}

@end