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
#import "UIViewController+CustomDraw.h"


CGFloat const marginFromSuperview = 20;

CGFloat const marginHeightLabels = 6;
CGFloat const marginWidhtForLeftLabels = 20;
CGFloat const marginWidhtForRightLabels = 16;

CGFloat const widthLabels = 82;
CGFloat const heightLabels = 21;

CGFloat const widthButtonBack = 32;
CGFloat const heightButtonBack = 32;

CGFloat const marginHeightButtonBack = 191;

CGFloat const marginWidthLabel100g = 20;
CGFloat const marginHeightLabel100g = 191;
CGFloat const widthLabel100g = 168;
CGFloat const heightLabel100g = 21;

@interface RecipeDetailsViewController ()

@property (strong, nonatomic) Recipe *recipe;
@property (strong, nonatomic) DataManager *context;
@property (weak, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet UIView *contentImageView;
@property (weak, nonatomic) IBOutlet UIView *contentIngridientView;
@property (strong, nonatomic) UIView *nutritionalView;
@property (weak, nonatomic) IBOutlet UILabel *lblName;
@property (weak, nonatomic) IBOutlet UIImageView *imageRecipe;
@property (weak, nonatomic) IBOutlet UIButton *btnMoreInfo;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *heightConstrIngridientsView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *heigntConstrMainContentView;
@property (weak, nonatomic) IBOutlet UITextView *textFormula;
@property (weak, nonatomic) IBOutlet UIButton *btnAcceptRecipe;

@property (copy, nonatomic) NSString *name;

@end


@implementation RecipeDetailsViewController

#pragma mark - Lifecycle

- (instancetype)initWithName:(NSString *)name {
    if (self = [super init]) {
        _name = name;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
//  TODO: Test method
    [self testRecipe];
    [self setNavigationBackButton];
    self.title = self.name;
    [Helper applyCornerRadius:6 forViews:@[_contentView]];
    [Helper applyCornerRadius:_btnMoreInfo.frame.size.width / 2 forViews:@[_btnMoreInfo, _btnAcceptRecipe]];
    [_lblName setText:self.recipe.name];
    self.context = [DataManager sharedManager];
    [self.context managedObjectContext];
    [self createNutritionalLabels];
    [self createLabel100g];
    [self createBackButton];
    [self createIngridientsLabels];
    [_textFormula setText:self.recipe.text];
    [self.view layoutIfNeeded];
    CGRect frame = _contentView.frame;
    CGSize size = [_textFormula sizeThatFits:CGSizeMake(SCREEN_WIDTH - 40, FLT_MAX)];
    frame.size.height += size.height - _textFormula.frame.size.height;
    [_heigntConstrMainContentView setConstant:frame.size.height];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = NO;
    NSURLSession *session = [NSURLSession sharedSession];
    __weak RecipeDetailsViewController *_weakSelf = self;
    NSURL *imgURL = [NSURL URLWithString:self.recipe.imagePathURL];
    [[session dataTaskWithURL:imgURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (!error) {
            if (data && _weakSelf) {
                _weakSelf.imageRecipe.image = [UIImage imageWithData:data scale:SCREEN_SCALE];
            }
        }
    }] resume];
}

#pragma mark - Custom methods

//  TODO: Delete this method
- (void)testRecipe {
    self.recipe = [[Recipe alloc] init];
    self.recipe.name = @"САЛАТ С МОРКОВКОЙ";
    self.recipe.imagePathURL = @"https://semseo.md/images/https2210.jpg";
    self.recipe.text = @"Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";
    self.recipe.nutritional = [[NSMutableArray alloc] init];
    NSDictionary *newDic = @{@"name" : @"Калории",
                             @"value" : [NSNumber numberWithInt:100]};
    [self.recipe.nutritional addObject:newDic];
    newDic = @{@"name" : @"Жиры",
               @"value" : [NSNumber numberWithInt:200]};
    [self.recipe.nutritional addObject:newDic];
    newDic = @{@"name" : @"Белки",
               @"value" : [NSNumber numberWithInt:300]};
    [self.recipe.nutritional addObject:newDic];
    newDic = @{@"name" : @"Углеводы",
               @"value" : [NSNumber numberWithInt:400]};
    [self.recipe.nutritional addObject:newDic];
    
    self.recipe.ingredients = [[NSMutableArray alloc] init];
    NSDictionary *newIngr = @{@"name" : @"Помидор",
                              @"value" : @"2 шт"};
    [self.recipe.ingredients addObject:newIngr];
    newIngr = @{@"name" : @"Огурец",
                @"value" : @"3 шт"};
    [self.recipe.ingredients addObject:newIngr];
    newIngr = @{@"name" : @"Майонез",
                @"value" : @"100 г"};
    [self.recipe.ingredients addObject:newIngr];
    newIngr = @{@"name" : @"Масло",
                @"value" : @"20 г"};
    [self.recipe.ingredients addObject:newIngr];
    newIngr = @{@"name" : @"Помидор",
                @"value" : @"2 шт"};
    [self.recipe.ingredients addObject:newIngr];
    newIngr = @{@"name" : @"Огурец",
                @"value" : @"3 шт"};
    [self.recipe.ingredients addObject:newIngr];
    newIngr = @{@"name" : @"Майонез",
                @"value" : @"100 г"};
    [self.recipe.ingredients addObject:newIngr];
    newIngr = @{@"name" : @"Масло",
                @"value" : @"20 г"};
    [self.recipe.ingredients addObject:newIngr];
}

- (void)createNutritionalLabels {
    int x = marginWidhtForLeftLabels;
    int y = marginHeightLabels;
    int width = widthLabels;
    int height = heightLabels;
    self.nutritionalView = [[UIView alloc] initWithFrame:_contentImageView.bounds];
    [self.nutritionalView setBackgroundColor:RGB(60, 95, 111)];
    self.nutritionalView.frame = _contentImageView.frame;
    for (int i = 1; i <= self.recipe.nutritional.count; i++) {
        UILabel *newLblNutritional = [[UILabel alloc] initWithFrame:self.nutritionalView.bounds];
        [newLblNutritional setTextColor:RGB(255, 255, 255)];
        [newLblNutritional setFrame:CGRectMake(x, i * y + (i - 1) * height, width, height)];
        [newLblNutritional setText:self.recipe.nutritional[i - 1][@"name"]];
        UILabel *newLblNutritionalWeight = [[UILabel alloc] initWithFrame:self.nutritionalView.bounds];
        [newLblNutritionalWeight setTextColor:RGB(255, 255, 255)];
        [newLblNutritionalWeight setFrame:CGRectMake(SCREEN_WIDTH - marginWidhtForRightLabels - width, i * y + (i - 1) * height, width, height)];
        [newLblNutritionalWeight setText:[NSString stringWithFormat:@"%@ г", self.recipe.nutritional[i - 1][@"value"]]];
        [self.nutritionalView addSubview:newLblNutritional];
        [self.nutritionalView addSubview:newLblNutritionalWeight];
    }
}

- (void)createIngridientsLabels {
    int x = marginWidhtForLeftLabels;
    int y = marginHeightLabels;
    int width = widthLabels;
    int height = heightLabels;
    NSUInteger count = self.recipe.ingredients.count;
    [_heightConstrIngridientsView setConstant:count * height + (count - 1) * y + 2 * x];
    for (int i = 1; i <= self.recipe.ingredients.count; i++) {
        UILabel *newLblIngridient = [[UILabel alloc] initWithFrame:_contentIngridientView.bounds];
        [newLblIngridient setTextColor:RGB(44, 62, 80)];
        [newLblIngridient setFrame:CGRectMake(x, i * y + (i - 1) * height, width, height)];
        [newLblIngridient setText:self.recipe.ingredients[i - 1][@"name"]];
        UILabel *newLblIngridientWeight = [[UILabel alloc] initWithFrame:self.nutritionalView.bounds];
        [newLblIngridientWeight setTextColor:RGB(44, 62, 80)];
        [newLblIngridientWeight setFrame:CGRectMake(SCREEN_WIDTH - marginWidhtForRightLabels - width, i * y + (i - 1) * height, width, height)];
        [newLblIngridientWeight setText:self.recipe.ingredients[i - 1][@"value"]];
        [_contentIngridientView addSubview:newLblIngridient];
        [_contentIngridientView addSubview:newLblIngridientWeight];
    }
}

- (void)createLabel100g {
    int x = marginWidthLabel100g;
    int y = marginHeightLabel100g;
    int width = widthLabel100g;
    int height = heightLabel100g;
    UILabel *lblInfo = [[UILabel alloc] initWithFrame:self.nutritionalView.bounds];
    [lblInfo setTextColor:RGB(255, 255, 255)];
    [lblInfo setFrame:CGRectMake(x, y, width, height)];
    [lblInfo setText:@"На 100 г продукта"];
    [self.nutritionalView addSubview:lblInfo];
}

- (void)createBackButton {
    UIButton *btnBack = [[UIButton alloc] initWithFrame:self.nutritionalView.bounds];
    int width = widthButtonBack;
    int height = heightButtonBack;
    int x = SCREEN_WIDTH - 2 * marginFromSuperview - marginWidhtForRightLabels - width;
    int y = marginHeightButtonBack;
    [btnBack setFrame:CGRectMake(x, y, width, height)];
    [btnBack addTarget:self action:@selector(btnBack_Tab) forControlEvents:UIControlEventTouchUpInside];
    [btnBack setImage:[UIImage imageNamed:@"arrow_back.png"] forState:UIControlStateNormal];
    [self.nutritionalView addSubview:btnBack];
}

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
    [newCalories setValue:self.recipe.nutritional[0][@"value"] forKey:@"calories"];
    [newCalories setValue:[NSDate date] forKey:@"date"];
    [self.context saveContext];
}

@end