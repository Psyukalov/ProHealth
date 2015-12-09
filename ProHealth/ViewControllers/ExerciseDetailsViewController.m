//
//  ExerciseDetailsViewController.m
//  ProHealth
//
//  Created by Anton Yurichev on 08.12.15.
//  Copyright © 2015 Natalia Zubareva. All rights reserved.
//

#import "ExerciseDetailsViewController.h"
#import "Helper.h"
#import "Exercises.h"
#import <AVKit/AVKit.h>
#import <AVFoundation/AVFoundation.h>
#import "UIViewController+CustomDraw.h"

@interface ExerciseDetailsViewController ()

@property (strong, nonatomic) Exercises *exercise;
@property (weak, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet UIButton *btnPlay;
@property (weak, nonatomic) IBOutlet UIButton *btnConfirm;
@property (strong, nonatomic) AVPlayerViewController *playerVC;
@property (strong, nonatomic) AVPlayer *avPlayer;
@property (weak, nonatomic) IBOutlet UILabel *lblName;
@property (strong, nonatomic) IBOutlet UIView *playerView;
@property (weak, nonatomic) IBOutlet UILabel *lblTimer;
@property (weak, nonatomic) IBOutlet UILabel *lblRepeat;
@property (weak, nonatomic) IBOutlet UILabel *lblDescription;

@end

@implementation ExerciseDetailsViewController

#pragma mark - Lifecycle 

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setNavigationBackButton];
    [Helper applyCornerRadius:6 forViews:@[_contentView]];
    [Helper applyCornerRadius:_btnConfirm.frame.size.height / 2 forViews:@[_btnConfirm]];
    [Helper applyCornerRadius:_btnPlay.frame.size.height / 2 forViews:@[_btnPlay]];
    self.exercise = [[Exercises alloc] init];
    
    //TODO: test code
    self.exercise.name = @"Приседания";
    self.exercise.time = 130;
    self.exercise.repeats = @"3-4 раза";
    self.exercise.exerDescript = @"Это упражнение направлено на укрепление мышц спины, преса и ног. Приступая к упражнению, помните о технике безопастности.";
    self.exercise.videoURL = @"https://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4";
    //
    
    [_lblName setText:self.exercise.name];
    [_lblTimer setText:[NSString stringWithFormat:@"%ld %@", (long)self.exercise.time, Local(@"ExerciseDetail.Sec")]];
    [_lblRepeat setText:self.exercise.repeats];
    [_lblDescription setText:self.exercise.exerDescript];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    NSURL *videoURL = [NSURL URLWithString:self.exercise.videoURL];
    self.avPlayer = [AVPlayer playerWithURL:videoURL];
    self.playerVC = [[AVPlayerViewController alloc] init];
    self.playerVC.player = self.avPlayer;
    self.playerVC.view.frame = _playerView.frame;
    [_playerView insertSubview:self.playerVC.view belowSubview:_btnPlay];
    [self.playerVC.player addObserver:self
                           forKeyPath:@"rate"
                              options:(NSKeyValueObservingOptionNew |
                                       NSKeyValueObservingOptionOld)
                              context:NULL];
}

- (void)viewDidDisappear:(BOOL)animated {
    [self.playerVC.player removeObserver:self forKeyPath:@"rate"];
    [super viewDidDisappear:animated];
}

- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary *)change
                       context:(void *)context {
    if ([keyPath isEqual:@"rate"]) {
        float newRate = [change[NSKeyValueChangeNewKey] floatValue];
        if (newRate == 0) {
            [_btnPlay setHidden:NO];
            [_lblName setHidden:NO];
        }
    }
}

#pragma mark - Actions

- (IBAction)btnPlay_Tab:(UIButton *)sender {
    [self.avPlayer play];
    [_btnPlay setHidden:YES];
    [_lblName setHidden:YES];
}

- (IBAction)btnConfirm_Tab:(UIButton *)sender {
    //
}

@end