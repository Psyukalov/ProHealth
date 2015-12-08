//
//  ExercisesTableViewCell.h
//  ProHealth
//
//  Created by Anton Yurichev on 08.12.15.
//  Copyright © 2015 Natalia Zubareva. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kExercisesTableViewCellReuseID @"ExercisesTableViewCell"

@interface ExercisesTableViewCell : UITableViewCell

@property (copy, nonatomic) NSString *exerciseName;

+ (void)registerFor:(UITableView *)tableView;

@end
