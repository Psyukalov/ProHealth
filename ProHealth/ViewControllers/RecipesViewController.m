//
//  RecipesViewController.m
//  ProHealth
//
//  Created by Admin on 24.11.15.
//  Copyright © 2015 Natalia Zubareva. All rights reserved.
//

#import "RecipesViewController.h"
#import "RecipesTableViewCell.h"

@interface RecipesViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableRecipes;
@property (strong, nonatomic) NSArray *recipes;

@end

@implementation RecipesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [RecipesTableViewCell registerFor:self.tableRecipes];
    [self.tableRecipes reloadData];
}

#pragma mark - UITableViewDataSource, UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSInteger numberOfRows = self.recipes.count;
    return numberOfRows;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    RecipesTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kRecipesTableViewCellReuseID forIndexPath:indexPath];
    // TODO: fill cell with data
    return cell;
}

@end
