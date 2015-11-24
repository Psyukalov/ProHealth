//
//  MainMenuTableViewCell.m
//  ProHealth
//
//  Created by Admin on 24.11.15.
//  Copyright © 2015 Natalia Zubareva. All rights reserved.
//

#import "MainMenuTableViewCell.h"

@interface MainMenuTableViewCell ()

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *cImgHeight;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *cImgWidth;

@property (weak, nonatomic) IBOutlet UIImageView *imgMenu;
@property (weak, nonatomic) IBOutlet UILabel *lblTitle;

@end

@implementation MainMenuTableViewCell

#pragma mark - Ligecycle
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated
{
    [super setHighlighted:highlighted animated:animated];
    
    // Highlight image
    self.imgMenu.highlighted = highlighted;
}

#pragma mark - Public methods
- (void)fillWithImageName:(NSString *)imageName text:(NSString *)text
{
    // Set up UI
    UIImage *image = [UIImage imageNamed:imageName];
    UIImage *imageHighlighted = [UIImage imageNamed:[imageName stringByAppendingString:@"_highlighted"]];
    self.cImgWidth.constant = image.size.width;
    self.cImgHeight.constant = image.size.height;
    self.imgMenu.image = image;
    self.imgMenu.highlightedImage = imageHighlighted;
    self.lblTitle.text = text;
}

@end
