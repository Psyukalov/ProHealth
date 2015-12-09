//
//  ExercisesTableViewCell.m
//  ProHealth
//
//  Created by Anton Yurichev on 08.12.15.
//  Copyright © 2015 Natalia Zubareva. All rights reserved.
//

#import "ExercisesTableViewCell.h"

@interface ExercisesTableViewCell ()

@property (weak, nonatomic) IBOutlet UILabel *labelExerciseName;

@end

@implementation ExercisesTableViewCell

#pragma mark - Lifecycle

- (void)awakeFromNib {
    // Initialization code
}

- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated {
    [super setHighlighted:highlighted animated:animated];
    
    self.contentView.backgroundColor = highlighted ? [UIColor whiteColor] : [UIColor clearColor];
    self.labelExerciseName.textColor = highlighted ? RGB(44, 80, 62) : [UIColor whiteColor];
}

#pragma mark - Custom accessors

- (void)setExerciseName:(NSString *)exerciseName {
    _exerciseName = exerciseName;
    
    // Update UI
    self.labelExerciseName.text = _exerciseName.uppercaseString;
}

#pragma mark - Static methods

+ (void)registerFor:(UITableView *)tableView {
    [tableView registerNib:[UINib nibWithNibName:NSStringFromClass([self class]) bundle:nil] forCellReuseIdentifier:kExercisesTableViewCellReuseID];
}

@end
