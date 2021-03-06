//
//  TipsViewController.m
//  ProHealth
//
//  Created by Admin on 24.11.15.
//  Copyright © 2015 Natalia Zubareva. All rights reserved.
//


#import "TipsViewController.h"
#import "Helper.h"
#import "Tip.h"
#import "UIViewController+CustomDraw.h"


@interface TipsViewController ()

@property (strong, nonatomic) NSMutableArray <Tip *> *tips;
@property (assign, nonatomic) NSInteger currentIndex;
@property (weak, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet UIImageView *imageTip;
@property (weak, nonatomic) IBOutlet UILabel *lblName;
@property (weak, nonatomic) IBOutlet UILabel *lblText;
@property (weak, nonatomic) IBOutlet UIButton *btnConfirm;

@end

@implementation TipsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavigationBackButton];
    self.title = Local(@"Tips.Title");
    [Helper applyCornerRadius:6 forViews:@[_contentView]];
    [Helper applyCornerRadius:_btnConfirm.frame.size.height / 2 forViews:@[_btnConfirm]];
    self.currentIndex = 0;
    self.tips = [[NSMutableArray alloc] init];
    
    //tmp
    for (int i = 0; i <= 4; i++) {
        Tip *tip = [[Tip alloc] init];
        tip.identifier = 0;
        tip.name = [NSString stringWithFormat:@"ВРЕМЯ ПОЕСТЬ! - %d", i];
        tip.text = @"Раз в сутки суп должен быть в желудке. Приятного аппетита!";
        tip.imageURL = @"https://s-media-cache-ak0.pinimg.com/736x/56/5e/69/565e698b5eae4fc0070731970839adc1.jpg";
        [self.tips addObject:tip];
    }
    //
    
    [self loadTip:self.currentIndex];
}

#pragma mark - UI

- (void)loadTip:(NSInteger)index {
    NSURL *imageURL = [NSURL URLWithString:self.tips[index].imageURL];
    //NSData *imageData = [NSData dataWithContentsOfURL:imageURL];
    
    // Load image async
    __weak TipsViewController *_weakSelf = self;
    [[[NSURLSession sharedSession] dataTaskWithURL:imageURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            UIImage *headerImage = [UIImage imageWithData:data scale:SCREEN_SCALE];
            dispatch_async(dispatch_get_main_queue(), ^{
                _weakSelf.imageTip.image = headerImage;
            });
        });
    }] resume];
    
    //[_imageTip setImage:[UIImage imageWithData:imageData scale:SCREEN_SCALE]];
    [_lblName setText:self.tips[index].name];
    [_lblText setText:self.tips[index].text];
}

- (void)playAnimationWithTransition:(UIViewAnimationTransition)transition {
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.5];
    [UIView setAnimationCurve:UIViewAnimationCurveLinear];
    [UIView setAnimationTransition:transition forView:self.view cache:YES];
    [UIView commitAnimations];
}

#pragma mark - Actions

- (IBAction)btnConfirm_Tap:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (IBAction)swToRight_Swipe:(UISwipeGestureRecognizer *)sender {
    if (self.currentIndex < self.tips.count - 1) {
        self.currentIndex += 1;
        [self loadTip:self.currentIndex];
        [self playAnimationWithTransition:UIViewAnimationTransitionFlipFromRight];
    }
}

- (IBAction)swToLeft_Swipe:(UISwipeGestureRecognizer *)sender {
    if (self.currentIndex > 0) {
        self.currentIndex -= 1;
        [self loadTip:self.currentIndex];
        [self playAnimationWithTransition:UIViewAnimationTransitionFlipFromLeft];
    }
}

@end