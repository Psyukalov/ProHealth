//
//  GuideViewController.m
//  ProHealth
//
//  Created by Admin on 24.11.15.
//  Copyright © 2015 Natalia Zubareva. All rights reserved.
//

#import "GuideViewController.h"

@interface GuideViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imgBackground;
@property (weak, nonatomic) IBOutlet UILabel *lblCaption;
@property (weak, nonatomic) IBOutlet UIButton *btnStart;

@end

@implementation GuideViewController

#pragma mark - Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self loadLocalization];
    
}

- (void)loadLocalization {
    self.title = NSLocalizedString(@"Guide.Title", @"NATALIA ZUBAREVA");
}

#pragma mark - Actions

- (IBAction)btnStart_Tap:(UIButton *)sender {
}

@end
