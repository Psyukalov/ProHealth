//
//  StartViewController.m
//  ProHealth
//
//  Created by Admin on 24.11.15.
//  Copyright © 2015 Natalia Zubareva. All rights reserved.
//


#import "StartViewController.h"
#import "Helper.h"
#import "MainMenuViewController.h"
#import "ExercisesViewController.h"
#import "WaterViewController.h"
#import "UIView+Snapshot.h"
#import "CaloriesViewController.h"

//tmp
#import "ExerciseDetailsViewController.h"
//


@interface StartViewController ()

@property (weak, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet UIImageView *image;
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

#pragma mark - Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = Local(@"Start.Title");
    self.navigationController.navigationBarHidden = NO;
    [Helper applyCornerRadius:6 forViews:@[_contentView]];
    [Helper applyCornerRadius:_btnFire.frame.size.height / 2 forViews:@[_btnFire, _btnWater, _btnFoot]];
    [_lblToday setText:[NSString stringWithFormat:@"%@ %ld %@", Local(@"Start.LblToday"), (long)[Helper currentDay], [Helper currentMonthNameWithStyle:NSDateFormatterLongStyle withFormat:@"MMMM"]]];
    [_lblFire setText:Local(@"Start.BtnFire")];
    [_lblWater setText:Local(@"Start.BtnWater")];
    [_lblFoot setText:Local(@"Start.BtnFoot")];
    NSInteger morning = 6;
    NSInteger afternoon = 12;
    NSInteger evening = 17;
    NSInteger hour = [Helper currentHour];
    NSString *imageName;
    NSString *greeting;
    NSString *tip;
    if ((hour >= morning) && (hour < afternoon)) {
        imageName = @"img_morning.png";
        greeting = [NSString stringWithFormat:@"Start.LblGreeting.%d", 1];
        tip = [NSString stringWithFormat:@"Start.Tip.%d", 1];
    }
    if ((hour >= afternoon) && (hour < evening)) {
        imageName = @"img_afternoon.png";
        greeting = [NSString stringWithFormat:@"Start.LblGreeting.%d", 2];
        tip = [NSString stringWithFormat:@"Start.Tip.%d", 2];
    }
    if ((hour >= evening) && (hour < 24)) {
        imageName = @"img_evening.png";
        greeting = [NSString stringWithFormat:@"Start.LblGreeting.%d", 3];
        tip = [NSString stringWithFormat:@"Start.Tip.%d", 3];
    }
    if ((hour >= 0) && (hour < morning)) {
        imageName = @"img_night.png";
        greeting = [NSString stringWithFormat:@"Start.LblGreeting.%d", 4];
        tip = [NSString stringWithFormat:@"Start.Tip.%d", 4];
    }
    [_image setImage:[UIImage imageNamed:imageName]];
    [_lblGreeting setText:[NSString stringWithFormat:@"%@", Local(greeting)]];
    [_lblTip setText:[NSString stringWithFormat:@"%@", Local(tip)]];
    UIBarButtonItem *btnMenu = [[UIBarButtonItem alloc] init];
    [btnMenu setImage:[UIImage imageNamed:@"menu.png"]];
    [btnMenu setTintColor:RGB(1, 225, 255)];
    [btnMenu setTarget:self];
    [btnMenu setAction:@selector(btnMenu_Tap)];
    self.navigationItem.leftBarButtonItem = btnMenu;
}

#pragma mark - Custom methods

- (void)btnMenu_Tap {
    UIWindow *mainWindow = [[UIApplication sharedApplication].delegate window];
    UIImage *snapshotImage = [mainWindow blurredSnapshot];
    MainMenuViewController *mainMenuVC = [[MainMenuViewController alloc] initWithMainNavigationController:self.navigationController blurredSnapshotImage:snapshotImage];
    mainMenuVC.modalPresentationStyle = UIModalPresentationOverCurrentContext;
    mainMenuVC.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:mainMenuVC animated:YES completion:nil];
}

#pragma mark - Actions

- (IBAction)btnFire_Tap:(UIButton *)sender {
    CaloriesViewController *caloriesVC = [[CaloriesViewController alloc] init];
    [self.navigationController pushViewController:caloriesVC animated:YES];
}

- (IBAction)btnWater_Tap:(UIButton *)sender {
    WaterViewController *waterVC = [[WaterViewController alloc] init];
    [self.navigationController pushViewController:waterVC animated:YES];
}

- (IBAction)btnFoot_Tap:(id)sender {
    //Cooming soon
    
    //tmp
    ExerciseDetailsViewController *exerciseDetailrVC = [[ExerciseDetailsViewController alloc] init];
    [self.navigationController pushViewController:exerciseDetailrVC animated:YES];
    //
}

@end