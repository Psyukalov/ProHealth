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

@property (retain, nonatomic) NSArray<NSString *> *imageNames;
@property (retain, nonatomic) NSArray<NSString *> *captions;

@end

@implementation GuideViewController

#pragma mark - Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self loadLocalization];
    self.imageNames = @[@"pr1.png", @"pr2.png", @"pr3.png"];
    //self.captions = @[, @"ЗАБУДЬТЕ ПРО ГОЛОДАНИЕ", @"ОПЫТНЫЙ ДИЕТОЛОГ"];
}

- (void)loadLocalization {
    self.title = NSLocalizedString(@"Guide.Title", @"NATALIA ZUBAREVA");
}

#pragma mark - Actions

- (IBAction)btnStart_Tap:(UIButton *)sender {
}

@end
