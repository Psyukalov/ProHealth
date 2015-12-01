//
//  MainMenuTableViewCell.m
//  ProHealth
//
//  Created by Anton Yurichev on 01.12.15.
//  Copyright © 2015 Natalia Zubareva. All rights reserved.
//

#import "MainMenuTableViewCell.h"

@interface MainMenuTableViewCell ()

@property (weak, nonatomic) IBOutlet UILabel *labelTitle;

@end

@implementation MainMenuTableViewCell

#pragma mark - Lifecycle

- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated {
    [super setHighlighted:highlighted animated:animated];
    
    self.contentView.backgroundColor = highlighted ? [UIColor whiteColor] : [UIColor clearColor];
    self.labelTitle.textColor = highlighted ? RGB(44, 80, 62) : [UIColor whiteColor];
}

- (void)setTitle:(NSString *)title {
    _title = title;
    
    // Setup UI
    self.labelTitle.text = title;
}

#pragma mark - Static methods
+ (void)registerFor:(UITableView *)tableView {
    [tableView registerNib:[UINib nibWithNibName:NSStringFromClass([self class]) bundle:nil] forCellReuseIdentifier:kMainMenuTableViewCellReuseID];
}

@end
