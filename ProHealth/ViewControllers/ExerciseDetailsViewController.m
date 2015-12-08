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

@interface ExerciseDetailsViewController ()

@property (strong, nonatomic) Exercises *exercise;
@property (weak, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet UIButton *btnConfirm;
@property (strong, nonatomic) AVPlayerViewController *playerVC;
@property (strong, nonatomic) AVPlayer *avPlayer;
@property (strong, nonatomic) IBOutlet UIView *playerView;
@property (weak, nonatomic) IBOutlet UILabel *lblTimer;
@property (weak, nonatomic) IBOutlet UILabel *lblRepeat;
@property (weak, nonatomic) IBOutlet UILabel *lblDescription;

@end

@implementation ExerciseDetailsViewController

#pragma mark - Lifecycle 

- (void)viewDidLoad {
    [super viewDidLoad];
    [Helper applyCornerRadius:6 forViews:@[_contentView]];
    [Helper applyCornerRadius:_btnConfirm.frame.size.height / 2 forViews:@[_btnConfirm]];
    self.exercise = [[Exercises alloc] init];
    //tmp
    self.exercise.name = @"Приседания";
    self.exercise.time = 130;
    self.exercise.repeats = @"3-4 раза";
    self.exercise.exerDescript = @"Это упражнение направлено на укрепление мышц спины, преса и ног. Приступая к упражнению, помните о технике безопастности.";
    self.exercise.videoURL = @"https://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4";
    //
    [_lblTimer setText:[NSString stringWithFormat:@"%d %@", self.exercise.time, Local(@"ExerciseDetail.Sec")]];
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
    [_playerView addSubview:self.playerVC.view];
}

#pragma mark - Actions;

- (IBAction)btnConfirm_Tab:(UIButton *)sender {
    
}

@end