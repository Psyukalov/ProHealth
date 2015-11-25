//
//  MealsMenuViewController.m
//  ProHealth
//
//  Created by Admin on 24.11.15.
//  Copyright © 2015 Natalia Zubareva. All rights reserved.
//

#import "MealsMenuViewController.h"

@interface MealsMenuViewController ()

@property (strong, nonatomic) UIImage *blurredSnapshot;
@property (weak, nonatomic) IBOutlet UIImageView *backgroundImageView;

@end

@implementation MealsMenuViewController
/* TODO: commented blur functionality
#pragma mark - Lifecycle
- (instancetype)initWithBlurredSnapshot:(UIImage *)blurredSnapshot {
    if (self = [super init]) {
        self.blurredSnapshot = blurredSnapshot;
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.backgroundImageView.image = self.blurredSnapshot;
}
*/
@end
