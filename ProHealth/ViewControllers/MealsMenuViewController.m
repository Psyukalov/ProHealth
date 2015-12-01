//
//  MainMenuViewController.m
//  ProHealth
//
//  Created by Admin on 24.11.15.
//  Copyright © 2015 Natalia Zubareva. All rights reserved.
//

#import "MealsMenuViewController.h"
#import "MealsMenuTableViewCell.h"

static const NSInteger kMenuItemsCount = 4;

@interface MealsMenuViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tblMenu;
@property (strong, nonatomic) NSMutableArray<NSString *> *menuItemNames;
@property (strong, nonatomic) NSArray<NSString *> *menuItemImages;
@property (weak, nonatomic) IBOutlet UIVisualEffectView *blurView;

@end

@implementation MealsMenuViewController

#pragma mark - Lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view from its nib.
    [self loadResources];
    [MealsMenuTableViewCell registerFor:self.tblMenu];
    [self.tblMenu reloadData];
}

- (void)loadResources
{
    if (!self.menuItemNames)
        self.menuItemNames = [NSMutableArray array];
    for (int i = 1; i <= kMenuItemsCount; ++i) {
        NSString *localizableKey = [NSString stringWithFormat:@"MealsMenu.Item.%d", i];
        [self.menuItemNames addObject:NSLocalizedString(localizableKey, nil)];
    }
    self.menuItemImages = @[@"menu_breakfast", @"menu_second_breakfast", @"menu_lunch", @"menu_dinner"];
}

#pragma mark - UITableViewDataSource, UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return kMenuItemsCount;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MealsMenuTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kMealsMenuTableViewCellReuseID forIndexPath:indexPath];
    [cell fillWithImageName:self.menuItemImages[indexPath.row] text:self.menuItemNames[indexPath.row]];
    return cell;
}

@end
