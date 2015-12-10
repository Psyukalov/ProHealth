//
//  TipsViewController.m
//  ProHealth
//
//  Created by Admin on 24.11.15.
//  Copyright © 2015 Natalia Zubareva. All rights reserved.
//


#import "TipsViewController.h"
#import "UIViewController+CustomDraw.h"

@interface TipsViewController ()

@property (weak, nonatomic) IBOutlet UIView *contentView;

@end

@implementation TipsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavigationBackButton];
    self.title = Local(@"Tips.Title");
}

@end