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

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
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
