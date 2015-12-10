//
//  SettingsViewController.h
//  ProHealth
//
//  Created by Admin on 24.11.15.
//  Copyright © 2015 Natalia Zubareva. All rights reserved.
//

#import "SettingsViewController.h"
#import "PersonalDataViewController.h"
#import "UIViewController+CustomDraw.h"

@interface SettingsViewController () <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (strong, nonatomic) Person *person;
@property (weak, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet UIImageView *imageRectAvatar;
@property (weak, nonatomic) IBOutlet UIImageView *imageCircleAvatar;
@property (weak, nonatomic) IBOutlet UILabel *labelName;
@property (weak, nonatomic) IBOutlet UILabel *labelStartDate;
@property (weak, nonatomic) IBOutlet UILabel *labelWeight;
@property (weak, nonatomic) IBOutlet UILabel *labelGrowth;
@property (weak, nonatomic) IBOutlet UILabel *labelBirthday;
@property (weak, nonatomic) IBOutlet UILabel *labelGender;
@property (weak, nonatomic) IBOutlet UIButton *btnChangeAvatar;
@property (weak, nonatomic) IBOutlet UIButton *btnEdit;
@property (weak, nonatomic) IBOutlet UIButton *btnFullVersion;

@end

@implementation SettingsViewController

#pragma mark - Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.person = [Person sharedPerson];
    self.title = Local(@"Settings.Title");
    [self setNavigationBackButton];
    
    [Helper applyCornerRadius:6 forViews:@[self.contentView,self.btnChangeAvatar,self.btnEdit,self.btnFullVersion]];
    [Helper applyShadowForViews:@[self.contentView]];
    [Helper applyTransparentLayerFormImage:_imageRectAvatar withColor:RGB(0, 0, 0)];
    [Helper applyCornerRadius:_imageCircleAvatar.frame.size.width / 2 forViews:@[_imageCircleAvatar]];
    
}

- (void)viewWillAppear:(BOOL)animated {

    [super viewWillAppear:animated];
    
    self.imageRectAvatar.image = [UIImage imageWithData:self.person.avatar];
    self.imageCircleAvatar.image = [UIImage imageWithData:self.person.avatar];
    self.labelName.text = self.person.name;
    NSString *startDate = [Helper applyRussianStyleForDate:self.person.startDate];
    self.labelStartDate.text = [NSString stringWithFormat:@"Мы вместе с %@", startDate];
    self.labelWeight.text = [NSString stringWithFormat:@"%1.1f кг", self.person.weight];
    self.labelGrowth.text = [NSString stringWithFormat:@"%1.2f кг", self.person.growth];
    self.labelBirthday.text = [Helper applyRussianStyleForDate:self.person.birthday];
    self.labelGender.text = self.person.gender;
}

#pragma mark - UIImagePickerControllerDelegate

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    UIImage *image = [info objectForKey:UIImagePickerControllerEditedImage];
   self.imageRectAvatar.image = image;
   self.imageCircleAvatar.image = image;
    self.person.avatar = UIImagePNGRepresentation(_imageRectAvatar.image);
    [self dismissViewControllerAnimated:true completion:nil];
}

#pragma mark - Actions

- (IBAction)btnChangeAvatar_Tap:(UIButton *)sender {
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.delegate = self;
        [picker setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
        picker.allowsEditing = YES;
        [self presentViewController:picker animated:true completion:nil];
    }
}

- (IBAction)btnEdit_Tap:(UIButton *)sender {
    PersonalDataViewController *personalDataVC = [[PersonalDataViewController alloc] initWithPerson:self.person];
    [self presentViewController:personalDataVC animated:YES completion:nil];
}

- (IBAction)btnFullVersion_Tap:(UIButton *)sender {
    //
}

@end