//
//  ExerciseDetailsViewController.m
//  ProHealth
//
//  Created by Anton Yurichev on 08.12.15.
//  Copyright © 2015 Natalia Zubareva. All rights reserved.
//

#import "ExerciseDetailsViewController.h"
#import "Helper.h"
#import <AVKit/AVKit.h>
#import <AVFoundation/AVFoundation.h>

@interface ExerciseDetailsViewController ()

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
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    NSURL *videoURL = [NSURL URLWithString:@"https://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4"];
    self.avPlayer = [AVPlayer playerWithURL:videoURL];
    self.playerVC = [[AVPlayerViewController alloc] init];
    self.playerVC.player = self.avPlayer;
    self.playerVC.view.frame = _playerView.frame;
    [_playerView addSubview:self.playerVC.view];
}

#pragma mark - Actions;

- (IBAction)btnConfirm_Tab:(UIButton *)sender {
    //
}

@end
