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

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark - Custom accessors

- (void)setExerciseName:(NSString *)exerciseName {
    _exerciseName = exerciseName;
    
    // Update UI
    self.labelExerciseName.text = _exerciseName;
}

#pragma mark - Static methods

+ (void)registerFor:(UITableView *)tableView {
    [tableView registerNib:[UINib nibWithNibName:NSStringFromClass([self class]) bundle:nil] forCellReuseIdentifier:kExercisesTableViewCellReuseID];
}

@end
