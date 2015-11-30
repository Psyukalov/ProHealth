//
//  GuideViewController.m
//  ProHealth
//
//  Created by Admin on 24.11.15.
//  Copyright © 2015 Natalia Zubareva. All rights reserved.
//

#import "GuideViewController.h"
#import "Helper.h"
#import "UIView+Snapshot.h"
#import "MealsMenuViewController.h"
#import "MealsMenuViewController.h"
#import "UICountingLabel.h"

@interface GuideViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imgBackground;
@property (weak, nonatomic) IBOutlet UILabel *lblCaption;
@property (weak, nonatomic) IBOutlet UIButton *btnStart;
@property (weak, nonatomic) IBOutlet UICountingLabel *countingLabel;

@property (strong, nonatomic) NSArray<NSString *> *imageNames;
@property (strong, nonatomic) NSArray<NSString *> *captions;
@property (strong, nonatomic) NSArray<NSString *> *captionTexts;

@property (assign, nonatomic) NSInteger currentTipNumber;


@end

@implementation GuideViewController

#pragma mark - Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.currentTipNumber = 0;
    [self loadResources];
    [Helper applyCornerRadius:6.0f forViews:@[self.imgBackground, self.lblCaption, self.btnStart]];
    [self refreshViewWithTipNumber:self.currentTipNumber];
}

- (void)loadResources {
    self.title = NSLocalizedString(@"Guide.Title", @"NATALIA ZUBAREVA");
    self.imageNames = @[@"guide_1", @"guide_2", @"guide_3"];
    self.captions = @[Local(@"Guide.Caption.EffectiveHelper"), Local(@"Guide.Caption.ForgotHungry"), Local(@"Guide.Caption.ExperiencedDietitian")];
    self.captionTexts = @[Local(@"Guide.Caption.EffectiveHelper.Text"), Local(@"Guide.Caption.ForgotHungry.Text"), Local(@"Guide.Caption.ExperiencedDietitian.Text")];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.countingLabel.format = @"%ld";
    self.countingLabel.method = UILabelCountingMethodLinear;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.countingLabel countFrom:0 to:2500 withDuration:1.0f];
    });
    
}

#pragma mark - UI

- (void)refreshViewWithTipNumber:(NSInteger)number {
    self.imgBackground.image = [UIImage imageNamed:self.imageNames[number]];
    self.lblCaption.text = [NSString stringWithFormat:@"%@\n%@", self.captions[number], self.captionTexts[number]];
}

- (void)playAnimationWithTransition:(UIViewAnimationTransition)transition {
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.5];
    [UIView setAnimationCurve:UIViewAnimationCurveLinear];
    [UIView setAnimationTransition:transition forView:self.view cache:YES];
    [UIView commitAnimations];
}

#pragma mark - Actions

- (IBAction)btnStart_Tap:(UIButton *)sender {
    // TODO: load start screen
    MealsMenuViewController *mealsMenuVC = [[MealsMenuViewController alloc] init];
    mealsMenuVC.modalPresentationStyle = UIModalPresentationOverCurrentContext;
    [self presentViewController:mealsMenuVC animated:YES completion:nil];
//    UIImage *blurredSnapshot = [self.navigationController.view blurredSnapshot];
//    MealsMenuViewController *mealsMenuVC = [[MealsMenuViewController alloc] initWithBlurredSnapshot:blurredSnapshot];
//    mealsMenuVC.modalPresentationStyle = UIModalPresentationOverCurrentContext;
//    [self presentViewController:mealsMenuVC animated:YES completion:nil];
}

- (IBAction)swRecLeft_Swipe:(UISwipeGestureRecognizer *)sender {
    if (self.currentTipNumber < (self.captions.count - 1)) {
        self.currentTipNumber += 1;
        [self playAnimationWithTransition:UIViewAnimationTransitionFlipFromRight];
        [self refreshViewWithTipNumber:self.currentTipNumber];
    }
}

- (IBAction)swRecRight_Swipe:(UISwipeGestureRecognizer *)sender {
    if (self.currentTipNumber > 0) {
        self.currentTipNumber -= 1;
        [self playAnimationWithTransition:UIViewAnimationTransitionFlipFromRight];
        [self refreshViewWithTipNumber:self.currentTipNumber];
        
    }
}

@end
