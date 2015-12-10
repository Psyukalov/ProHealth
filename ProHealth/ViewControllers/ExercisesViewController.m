//
//  ExercisesViewController.m
//  ProHealth
//
//  Created by Admin on 24.11.15.
//  Copyright © 2015 Natalia Zubareva. All rights reserved.
//

#import "ExercisesViewController.h"
#import "ExercisesTableViewCell.h"
#import "ExerciseDetailsViewController.h"
#import "UIViewController+CustomDraw.h"

@interface ExercisesViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableExercises;
@property (strong, nonatomic) NSArray <NSString *> *exercises;

@end

@implementation ExercisesViewController

#pragma mark - Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setNavigationBackButton];
    
    // Test code
    self.exercises = @[@"Приседания", @"Жим ногами", @"Армейский жим", @"Махи ногами", @"Разводка гантелей от груди", @"Французский жим"];
    //
    
    self.title = Local(@"Exercises.Title");
    
    [ExercisesTableViewCell registerFor:self.tableExercises];
    [self.tableExercises reloadData];
    self.tableExercises.estimatedRowHeight = 64.0f;
    self.tableExercises.rowHeight = UITableViewAutomaticDimension;
}

#pragma mark - UITableViewDataSource, UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSInteger numberOfRows = self.exercises.count;
    return numberOfRows;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ExercisesTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kExercisesTableViewCellReuseID forIndexPath:indexPath];
    cell.exerciseName = self.exercises[indexPath.row];
    return cell;
}

-  (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    ExerciseDetailsViewController *exerciseDetailsVC = [[ExerciseDetailsViewController alloc] initWithName:self.exercises[indexPath.row]];
    [self.navigationController pushViewController:exerciseDetailsVC animated:YES];
}

@end
