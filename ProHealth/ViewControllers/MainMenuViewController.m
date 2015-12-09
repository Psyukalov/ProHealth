//
//  MainMenuViewController.m
//  ProHealth
//
//  Created by Anton Yurichev on 25.11.15.
//  Copyright © 2015 Natalia Zubareva. All rights reserved.
//

#import "MainMenuViewController.h"
#import "MainMenuTableViewCell.h"
#import "UIView+Snapshot.h"

#import "AppDelegate.h"

#import "MealsMenuViewController.h"
#import "ExercisesViewController.h"
#import "TipsViewController.h"
#import "PersonalStatsViewController.h"

@interface MainMenuViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableMenu;
@property (strong, nonatomic) NSArray<NSString *> *menuItems;
@property (weak, nonatomic) IBOutlet UIButton *buttonClose;
@property (weak, nonatomic) IBOutlet UIImageView *imgSnapshotView;
@property (strong, nonatomic) UIImage *blurredSnapshotImage;
@property (weak, nonatomic) UINavigationController *mainNavigationController;

@end

@implementation MainMenuViewController

#pragma mark - Lifecycle
- (instancetype)initWithMainNavigationController:(UINavigationController *)mainNavigationController blurredSnapshotImage:(UIImage *)blurredSnapshotImage {
    if (self = [super init]) {
        NSMutableArray *menuItems = [NSMutableArray array];
        for (int i = 1; i <= kMainMenuItemsCount; ++i) {
            NSString *localizationKey = [NSString stringWithFormat:@"MainMenu.Item.%d", i];
            [menuItems addObject:NSLocalizedString(localizationKey, nil)];
        }
        _menuItems = [[NSArray alloc] initWithArray:menuItems];
        _blurredSnapshotImage = blurredSnapshotImage;
        _mainNavigationController = mainNavigationController;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.imgSnapshotView.image = self.blurredSnapshotImage;
    [MainMenuTableViewCell registerFor:self.tableMenu];
    [self.tableMenu reloadData];

}

#pragma mark - Functionality

- (void)loadSelectedViewController:(UIViewController *)selectedViewController {
    if (selectedViewController) {
        __weak MainMenuViewController *_weakSelf = self;
        if (![selectedViewController isKindOfClass:[MealsMenuViewController class]]) {
            [_weakSelf dismissViewControllerAnimated:YES completion:^{
                [_weakSelf.mainNavigationController pushViewController:selectedViewController animated:YES];
            }];
        } else {
            [_weakSelf dismissViewControllerAnimated:YES completion:^{
                selectedViewController.modalPresentationStyle = UIModalPresentationOverCurrentContext;
                selectedViewController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
                NSLog(@"topViewController: %@", _weakSelf.mainNavigationController.topViewController);
                [_weakSelf.mainNavigationController.topViewController presentViewController:selectedViewController animated:YES completion:nil];
            }];
        }
    }
}

#pragma UITableViewDataSource, UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.menuItems.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MainMenuTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kMainMenuTableViewCellReuseID forIndexPath:indexPath];
    cell.title = self.menuItems[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // TODO: go to other controllers
    // there will be routing code for loading controllers
    MainMenuItem selectedMenuItem = (MainMenuItem)indexPath.row + 1;
    AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    
    // Prevent selection of menu item that already selected
    if (selectedMenuItem == appDelegate.selectedMenuItem)
        return;
    UIViewController *selectedVC = nil;
    switch (selectedMenuItem) {
        case MainMenuItemRecipes:
            selectedVC = [[MealsMenuViewController alloc] initWithMainNavigationController:self.mainNavigationController blurredSnapshotImage:self.blurredSnapshotImage];
            break;
        case MainMenuItemExercises:
            selectedVC = [[ExercisesViewController alloc] init];
            break;
        case MainMenuItemTips:
            selectedVC = [[TipsViewController alloc] init];
            break;
        case MainMenuItemConsult:
            // Not now
            selectedVC = nil;
            break;
        case MainMenuItemPersonalData:
            selectedVC = [[PersonalStatsViewController alloc] init];
            break;
        case MainMenuItemHelp:
            selectedVC = nil;
            break;
        default:
            selectedVC = nil;
            break;
    }
    [self loadSelectedViewController:selectedVC];
}

#pragma mark - Actions

- (IBAction)buttonClose_Tap:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
