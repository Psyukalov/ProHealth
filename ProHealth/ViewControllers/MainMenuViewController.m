//
//  MainMenuViewController.m
//  ProHealth
//
//  Created by Admin on 24.11.15.
//  Copyright © 2015 Natalia Zubareva. All rights reserved.
//

#import "MainMenuViewController.h"
#import "MainMenuTableViewCell.h"

static const NSInteger kMenuItemsCount = 4;

@interface MainMenuViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tblMenu;
@property (strong, nonatomic) NSMutableArray<NSString *> *menuItemNames;
@property (strong, nonatomic) NSMutableArray<NSString *> *menuItemImages;
@property (weak, nonatomic) IBOutlet UIVisualEffectView *blurView;

@end

@implementation MainMenuViewController

#pragma mark - Lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view from its nib.
    [self loadResources];
    [MainMenuTableViewCell registerFor:self.tblMenu];
    [self.tblMenu reloadData];
}

- (void)loadResources
{
    if (!self.menuItemNames)
        self.menuItemNames = [NSMutableArray array];
    for (int i = 1; i <= kMenuItemsCount; ++i) {
        NSString *localizableKey = [NSString stringWithFormat:@"MainMenu.Item.%d", i];
        [self.menuItemNames addObject:NSLocalizedString(localizableKey, nil)];
    }
}

#pragma mark - UITableViewDataSource, UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return kMenuItemsCount;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MainMenuTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kMainMenuTableViewCellReuseID forIndexPath:indexPath];
    [cell fillWithImageName:@"image" text:self.menuItemNames[indexPath.row]];
    return cell;
}

@end
