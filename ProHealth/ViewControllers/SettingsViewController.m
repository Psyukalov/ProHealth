//
//  SettingsViewController.h
//  ProHealth
//
//  Created by Admin on 24.11.15.
//  Copyright © 2015 Natalia Zubareva. All rights reserved.
//

#import "SettingsViewController.h"
#import "PersonalDataViewController.h"

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
    [Helper applyCornerRadius:6 forViews:@[_contentView, _btnChangeAvatar, _btnEdit, _btnFullVersion]];
    [Helper applyShadowForViews:@[_contentView]];
    [Helper applyTransparentLayerFormImage:_imageRectAvatar withColor:RGB(0, 0, 0)];
    [Helper applyCornerRadius:_imageCircleAvatar.frame.size.width / 2 forViews:@[_imageCircleAvatar]];
}

- (void)viewWillAppear:(BOOL)animated {
    _imageRectAvatar.image = [UIImage imageWithData:self.person.avatar];
    _imageCircleAvatar.image = [UIImage imageWithData:self.person.avatar];
    _labelName.text = self.person.name;
    NSString *startDate = [Helper applyRussianStyleForDate:self.person.startDate];
    _labelStartDate.text = [NSString stringWithFormat:@"Мы вместе с %@", startDate];
    _labelWeight.text = [NSString stringWithFormat:@"%1.1f кг", self.person.weight];
    _labelGrowth.text = [NSString stringWithFormat:@"%1.2f кг", self.person.growth];
    _labelBirthday.text = [Helper applyRussianStyleForDate:self.person.birthday];
    _labelGender.text = self.person.gender;
}

#pragma mark - Image Picker Controller

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    UIImage *image = [info objectForKey:UIImagePickerControllerEditedImage];
    _imageRectAvatar.image = image;
    _imageCircleAvatar.image = image;
    self.person.avatar = UIImagePNGRepresentation(_imageRectAvatar.image);
    [self dismissViewControllerAnimated:true completion:nil];
    
}

#pragma mark - Actions

- (IBAction)btnChangeAvatar_Tab:(UIButton *)sender {
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.delegate = self;
        [picker setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
        picker.allowsEditing = YES;
        [self presentViewController:picker animated:true completion:nil];
    }
}

- (IBAction)btnEdit_Tab:(UIButton *)sender {
    PersonalDataViewController *personalDataVC = [[PersonalDataViewController alloc] initWithPerson:self.person];
    [self presentViewController:personalDataVC animated:YES completion:nil];
}

- (IBAction)btnFullVersion_Tab:(UIButton *)sender {
    //
}

@end