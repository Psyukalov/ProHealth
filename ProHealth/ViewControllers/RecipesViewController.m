//
//  RecipesViewController.m
//  ProHealth
//
//  Created by Admin on 24.11.15.
//  Copyright © 2015 Natalia Zubareva. All rights reserved.
//

#import "RecipesViewController.h"
#import "RecipeDetailsViewController.h"
#import "RecipesTableViewCell.h"
#import "Recipe.h"
#import "UIViewController+CustomDraw.h"

@interface RecipesViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableRecipes;
@property (strong, nonatomic) NSArray <NSString *> *recipes;
@property (copy, nonatomic) NSString *name;

@end

@implementation RecipesViewController

- (instancetype)initWithName:(NSString *)name  {
    if (self = [super init]) {
        _name = name;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavigationBackButton];
    self.title = self.name;

    [RecipesTableViewCell registerFor:self.tableRecipes];
    NSArray *testRecipesNames = @[@"Рецепт 1", @"Рецепт 2 подлиннее", @"Очень длинное название рецепта номер три, проверяем перенос строк и размеры", @"Рецепт 4", @"Рецепт 5", @"Длинный рецепт 6, чтобы занял пару строк", @"Рецепт 7", @"Рецепт 8", @"Рецепт 9", @"Рецепт 10"];
    self.recipes = testRecipesNames;
    self.tableRecipes.estimatedRowHeight = 64.0f;
    self.tableRecipes.rowHeight = UITableViewAutomaticDimension;
    
    [self.tableRecipes reloadData];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBarHidden = NO;
}

#pragma mark - UITableViewDataSource, UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSInteger numberOfRows = self.recipes.count;
    return numberOfRows;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    RecipesTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kRecipesTableViewCellReuseID forIndexPath:indexPath];
    cell.recipeName = self.recipes[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *selectedRecipe = self.recipes[indexPath.row];
    NSLog(@"selected recipe: %@", selectedRecipe);
    // TODO: go to recipe details view controller
    RecipeDetailsViewController *recipeDetailsVC = [[RecipeDetailsViewController alloc] initWithName:self.name];
    [self.navigationController pushViewController:recipeDetailsVC animated:YES];
}

@end
