//
//  RecipesTableViewCell.m
//  ProHealth
//
//  Created by Admin on 24.11.15.
//  Copyright © 2015 Natalia Zubareva. All rights reserved.
//

#import "RecipesTableViewCell.h"

@interface RecipesTableViewCell ()

@property (weak, nonatomic) IBOutlet UILabel *labelRecipeName;

@end

@implementation RecipesTableViewCell

#pragma mark - Lifecycle

- (void)awakeFromNib {
    // Initialization code
}

- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated {
    [super setHighlighted:highlighted animated:animated];
    
    self.contentView.backgroundColor = highlighted ? [UIColor whiteColor] : [UIColor clearColor];
    self.labelRecipeName.textColor = highlighted ? RGB(44, 80, 62) : [UIColor whiteColor];
}

#pragma mark - Custom accessors
- (void)setRecipeName:(NSString *)recipeName {
    _recipeName = recipeName;
    
    // Update UI
    self.labelRecipeName.text = recipeName;
}

#pragma mark - Static methods

+ (void)registerFor:(UITableView *)tableView {
    [tableView registerNib:[UINib nibWithNibName:NSStringFromClass([self class]) bundle:nil] forCellReuseIdentifier:kRecipesTableViewCellReuseID];
}

@end
