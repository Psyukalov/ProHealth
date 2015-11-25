//
//  MainMenuTableViewCell.m
//  ProHealth
//
//  Created by Admin on 24.11.15.
//  Copyright © 2015 Natalia Zubareva. All rights reserved.
//

#import "MainMenuTableViewCell.h"

@interface MainMenuTableViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *imgMenu;
@property (weak, nonatomic) IBOutlet UILabel *lblTitle;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *cImgHeight;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *cImgWidth;

@end

@implementation MainMenuTableViewCell

#pragma mark - Ligecycle

- (void)awakeFromNib {
    // Initialization code
}

- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated {
    [super setHighlighted:highlighted animated:animated];
    
    // Highlight image
    self.imgMenu.highlighted = highlighted;
    self.lblTitle.textColor = highlighted ? RGB(0, 255, 255) : [UIColor whiteColor];
}

#pragma mark - Public methods

- (void)fillWithImageName:(nonnull NSString *)imageName text:(nonnull NSString *)text {
    // Set up UI
    UIImage *image = [UIImage imageNamed:imageName];
    UIImage *imageHighlighted = [UIImage imageNamed:[imageName stringByAppendingString:@"_highlighted"]];
    self.cImgWidth.constant = image.size.width;
    self.cImgHeight.constant = image.size.height;
    self.imgMenu.image = image;
    self.imgMenu.highlightedImage = imageHighlighted;
    self.lblTitle.text = text;
}

#pragma mark - Static methods

+ (void)registerFor:(UITableView *)tableView {
    [tableView registerNib:[UINib nibWithNibName:NSStringFromClass([self class]) bundle:nil] forCellReuseIdentifier:kMainMenuTableViewCellReuseID];
}

@end
