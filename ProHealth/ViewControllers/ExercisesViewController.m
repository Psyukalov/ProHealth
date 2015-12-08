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

@interface ExercisesViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableExercises;
@property (strong, nonatomic) NSArray *exercises;
@property (copy, nonatomic) NSString *name;

@end

@implementation ExercisesViewController

#pragma mark - Lifecycle

- (instancetype)initWithName:(NSString *)name  {
    if (self = [super init]) {
        _name = name;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = self.name;
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
    return cell;
}

-  (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    ExerciseDetailsViewController *exerciseDetailsVC = [[ExerciseDetailsViewController alloc] init];
    [self.navigationController pushViewController:exerciseDetailsVC animated:YES];
}

@end
