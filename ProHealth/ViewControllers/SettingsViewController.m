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
@property (weak, nonatomic) IBOutlet UIImageView *imageRectAvatar;
@property (weak, nonatomic) IBOutlet UIImageView *imageCircleAvatar;
@property (weak, nonatomic) IBOutlet UILabel *labelName;
@property (weak, nonatomic) IBOutlet UILabel *labelStartDate;
@property (weak, nonatomic) IBOutlet UILabel *labelWeight;
@property (weak, nonatomic) IBOutlet UILabel *labelGrowth;
@property (weak, nonatomic) IBOutlet UILabel *labelBirthday;
@property (weak, nonatomic) IBOutlet UILabel *labelGender;

@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.person = [Person sharedPerson];
//    [Helper applyCornerRadius:6 forViews:@[self.view]];
}

- (void)viewWillAppear:(BOOL)animated {
    _imageRectAvatar.image = [UIImage imageWithData:self.person.avatar];
    _imageCircleAvatar.image = [UIImage imageWithData:self.person.avatar];
    _labelName.text = self.person.name;
    _labelStartDate.text = [NSString stringWithFormat:@"Мы вместе с %@", self.person.startDate];
    _labelWeight.text = [NSString stringWithFormat:@"%1.1f кг", self.person.weight];
    _labelGrowth.text = [NSString stringWithFormat:@"%1.2f кг", self.person.growth];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"dd.MM.yyyy"];
    _labelBirthday.text = [formatter stringFromDate:self.person.birthday];
    _labelGender.text = self.person.gender;
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    UIImage *image = [info objectForKey:UIImagePickerControllerEditedImage];
    _imageRectAvatar.image = image;
    _imageCircleAvatar.image = image;
    self.person.avatar = UIImagePNGRepresentation(_imageRectAvatar.image);
    [self dismissViewControllerAnimated:true completion:nil];
    
}

- (IBAction)btnChangeAvatar_Tab:(UIButton *)sender {
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.delegate = self;
        [picker setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
        picker.allowsEditing = YES;
        [self presentViewController:picker animated:true completion:nil];
    }
}

- (IBAction)btnConfirm_Tab:(UIButton *)sender {
    PersonalDataViewController *personalDataVC = [[PersonalDataViewController alloc] initWithPerson:self.person];
    [self presentViewController:personalDataVC animated:YES completion:nil];
}

- (IBAction)btnFullVersion_Tab:(UIButton *)sender {
    //
}

@end