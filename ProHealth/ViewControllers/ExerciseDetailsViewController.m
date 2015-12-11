//
//  ExerciseDetailsViewController.m
//  ProHealth
//
//  Created by Anton Yurichev on 08.12.15.
//  Copyright © 2015 Natalia Zubareva. All rights reserved.
//

#import "ExerciseDetailsViewController.h"
#import "Helper.h"
#import "Exercise.h"
#import <AVKit/AVKit.h>
#import <AVFoundation/AVFoundation.h>
#import "UIViewController+CustomDraw.h"


static void *playerContext = &playerContext;
static NSString * const playerRatePropertyName = @"rate";

@interface ExerciseDetailsViewController ()

@property (copy, nonatomic) NSString *name;
@property (strong, nonatomic) Exercise *exercise;
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

- (instancetype)initWithName:(NSString *)name {
    if (self = [super init]) {
        _name = name;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = self.name.uppercaseString;
    [self setNavigationBackButton];
    [Helper applyCornerRadius:6 forViews:@[_contentView]];
    [Helper applyCornerRadius:_btnConfirm.frame.size.height / 2 forViews:@[_btnConfirm]];
    [Helper applyCornerRadius:_btnPlay.frame.size.height / 2 forViews:@[_btnPlay]];
    self.exercise = [[Exercise alloc] init];
    
    //TODO: test code
    self.exercise.name = self.name;
    self.exercise.time = 130;
    self.exercise.repeats = @"3-4 повтора";
    self.exercise.exerDescript = @"Это упражнение направлено на укрепление мышц спины, пресса и ног. Приступая к упражнению, помните о технике безопастности.";
    self.exercise.videoURL = @"https://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4";
    //
    
    self.lblName.text = self.exercise.name;
    _lblTimer.text = [NSString stringWithFormat:@"%ld %@", (long)self.exercise.time, Local(@"ExerciseDetail.Sec")];
    _lblRepeat.text = self.exercise.repeats;
    _lblDescription.text = self.exercise.exerDescript;
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    NSURL *videoURL = [NSURL URLWithString:self.exercise.videoURL];
    self.avPlayer = [AVPlayer playerWithURL:videoURL];
    self.playerVC = [[AVPlayerViewController alloc] init];
    self.playerVC.player = self.avPlayer;
    self.playerVC.view.frame = _playerView.frame;
    [_playerView insertSubview:self.playerVC.view belowSubview:_btnPlay];
    
    // Register for KVO
    [self.playerVC.player addObserver:self
                           forKeyPath:playerRatePropertyName
                              options:(NSKeyValueObservingOptionNew |
                                       NSKeyValueObservingOptionOld)
                              context:playerContext];
}

- (void)viewDidDisappear:(BOOL)animated {
    // Unregister for KVO
    [self.playerVC.player removeObserver:self forKeyPath:playerRatePropertyName context:playerContext];
    [super viewDidDisappear:animated];
}

#pragma mark - KVO

- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary *)change
                       context:(void *)context {
    if (context == playerContext) {
        if ([keyPath isEqual:playerRatePropertyName]) {
            float newRate = [change[NSKeyValueChangeNewKey] floatValue];
            if (newRate == 0) {
                [_btnPlay setHidden:NO];
                [_lblName setHidden:NO];
            }
        }
    }
}

#pragma mark - Actions

- (IBAction)btnPlay_Tap:(UIButton *)sender {
    [self.avPlayer play];
    [_btnPlay setHidden:YES];
    [_lblName setHidden:YES];
}

- (IBAction)btnConfirm_Tap:(UIButton *)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
}

@end