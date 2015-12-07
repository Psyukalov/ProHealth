//
//  RecipesViewController.m
//  ProHealth
//
//  Created by Admin on 24.11.15.
//  Copyright © 2015 Natalia Zubareva. All rights reserved.
//

#import "RecipesViewController.h"
#import "RecipesTableViewCell.h"
#import "Recipe.h"

@interface RecipesViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableRecipes;
@property (strong, nonatomic) NSArray <Recipe *> *recipes;

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
    cell.recipeName = self.recipes[indexPath.row].name;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    Recipe *selectedRecipe = self.recipes[indexPath.row];
    NSLog(@"selected recipe: %@", selectedRecipe);
    // TODO: go to recipe details view controller
}

@end
