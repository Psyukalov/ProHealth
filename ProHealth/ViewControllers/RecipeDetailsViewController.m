//
//  RecipeDetailsViewController.m
//  ProHealth
//
//  Created by Admin on 24.11.15.
//  Copyright © 2015 Natalia Zubareva. All rights reserved.
//


#import "RecipeDetailsViewController.h"
#import "DataManager.h"
#import "Helper.h"


@interface RecipeDetailsViewController ()

@property (strong, nonatomic) Recipes *recipe;
@property (strong, nonatomic) DataManager *context;
@property (weak, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet UIView *contentImageView;
@property (strong, nonatomic) UIView *nutritionalView;
@property (weak, nonatomic) IBOutlet UILabel *lblName;
@property (weak, nonatomic) IBOutlet UIImageView *imageRecipe;
@property (weak, nonatomic) IBOutlet UIButton *btnMoreInfo;
@property (weak, nonatomic) IBOutlet UIView *contentIngridientView;
@property (weak, nonatomic) IBOutlet UITextView *textFormula;
@property (weak, nonatomic) IBOutlet UIButton *btnAcceptRecipe;

@end


@implementation RecipeDetailsViewController

#pragma mark - Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //tmp
    self.recipe = [[Recipes alloc] init];
    self.recipe.name = @"САЛАТ С МОРКОВКОЙ";
    self.recipe.imagePathURL = @"https://semseo.md/images/https2210.jpg";
    self.recipe.formula = @"Фасоль, нут, чечевицу, киноа для салатовтиспользуйте каждый день, особенно в пост.";
    self.recipe.nutritional = [[NSMutableArray alloc] init];
    [self.recipe.nutritional addObject:[NSDictionary dictionaryWithObject:[NSNumber numberWithInt:100] forKey:@"Калории"]];
    [self.recipe.nutritional addObject:[NSDictionary dictionaryWithObject:[NSNumber numberWithInt:200] forKey:@"Жиры"]];
    [self.recipe.nutritional addObject:[NSDictionary dictionaryWithObject:[NSNumber numberWithInt:300] forKey:@"Углеводы"]];
    [self.recipe.nutritional addObject:[NSDictionary dictionaryWithObject:[NSNumber numberWithInt:400] forKey:@"Белки"]];
    [Helper applyCornerRadius:6 forViews:@[_contentView]];
    [Helper applyCornerRadius:_btnMoreInfo.frame.size.width / 2 forViews:@[_btnMoreInfo, _btnAcceptRecipe]];
    [_lblName setText:self.recipe.name];
    [_textFormula setText:self.recipe.formula];
    NSURL *imgURL = [NSURL URLWithString:self.recipe.imagePathURL];
    NSData * imgData = [NSData dataWithContentsOfURL:imgURL];
    _imageRecipe.image = [UIImage imageWithData:imgData scale:SCREEN_SCALE];
    self.context = [DataManager sharedManager];
    [self.context managedObjectContext];
    // Динамическое добавление labels ингридиентов
    int x = 16;
    int y = 6;
    int width = 82;
    int height = 21;
    self.nutritionalView = [[UIView alloc] initWithFrame:_contentImageView.bounds];
    [self.nutritionalView setBackgroundColor:RGB(60, 95, 111)];
    self.nutritionalView.frame = _contentImageView.frame;
    for (int i = 1; i <= self.recipe.nutritional.count; i++) {
        UILabel *newLblIngridient = [[UILabel alloc] initWithFrame:self.nutritionalView.bounds];
        [newLblIngridient setTextColor:RGB(255, 255, 255)];
        [newLblIngridient setFrame:CGRectMake(x, i * y + (i - 1) * height, width, height)];
        [newLblIngridient setText:self.recipe.nutritional[i - 1].allKeys[0]];
        UILabel *newLblIngridientWeight = [[UILabel alloc] initWithFrame:self.nutritionalView.bounds];
        [newLblIngridientWeight setTextColor:RGB(255, 255, 255)];
        [newLblIngridientWeight setFrame:CGRectMake(SCREEN_WIDTH - 16 - width, i * y + (i - 1) * height, width, height)];
        [newLblIngridientWeight setText:[NSString stringWithFormat:@"%@ г", self.recipe.nutritional[i - 1].allValues[0]]];
        [self.nutritionalView insertSubview:newLblIngridient atIndex:0];
        [self.nutritionalView insertSubview:newLblIngridientWeight atIndex:1];
    }
    UIButton *btnBack = [[UIButton alloc] initWithFrame:self.nutritionalView.bounds];
    width = 62;
    height = 32;
    x = SCREEN_WIDTH - 40 - 16 - width;
    y = 191;
    [btnBack setFrame:CGRectMake(x, y, width, height)];
    [btnBack addTarget:self action:@selector(btnBack_Tab) forControlEvents:UIControlEventTouchUpInside];
    [btnBack setImage:[UIImage imageNamed:@"arrow_back.png"] forState:UIControlStateNormal];
    [self.nutritionalView insertSubview:btnBack atIndex:2];
}

#pragma mark - Custom methods

- (void)playAnimationForView:(UIView *)view
              WithTransition:(UIViewAnimationTransition)transition {
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.5];
    [UIView setAnimationCurve:UIViewAnimationCurveLinear];
    [UIView setAnimationTransition:transition forView:view cache:YES];
    [UIView commitAnimations];
    
}

#pragma mark - Actions

- (void)btnBack_Tab {
    [self.nutritionalView removeFromSuperview];
    [self playAnimationForView:_contentImageView
                WithTransition:UIViewAnimationTransitionFlipFromRight];
}

- (IBAction)btnMoreInfo_Tab:(id)sender {
    [_contentImageView addSubview:self.nutritionalView];
    [self playAnimationForView:_contentImageView
                WithTransition:UIViewAnimationTransitionFlipFromLeft];
}

- (IBAction)btnAcceptRecipe_Tab:(id)sender {
    NSManagedObject *newCalories = [NSEntityDescription insertNewObjectForEntityForName:@"Eating"
                                                                 inManagedObjectContext:self.context.managedObjectContext];
    [newCalories setValue:self.recipe.nutritional[0][@"Калории"] forKey:@"calories"];
    [newCalories setValue:[NSDate date] forKey:@"date"];
    [self.context saveContext];
}

@end