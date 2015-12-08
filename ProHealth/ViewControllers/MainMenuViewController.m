//
//  MainMenuViewController.m
//  ProHealth
//
//  Created by Anton Yurichev on 25.11.15.
//  Copyright © 2015 Natalia Zubareva. All rights reserved.
//

#import "MainMenuViewController.h"
#import "MainMenuTableViewCell.h"
#import "StartViewController.h"

@interface MainMenuViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableMenu;
@property (strong, nonatomic) NSArray<NSString *> *menuItems;
@property (weak, nonatomic) IBOutlet UIButton *buttonClose;
@property (weak, nonatomic) IBOutlet UIImageView *imgSnapshotView;
@property (strong, nonatomic) UIImage *blurredSnapshotImage;
@property (weak, nonatomic) UINavigationController *mainNavigationController;
@property (weak, nonatomic) UIViewController *currentController;

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
    // TODO: go to other controller
    // there will be routing code for loading controllers
    UIViewController *selectedViewController = [[StartViewController alloc] init];
    [self loadSelectedViewController:selectedViewController];
}

- (void)loadSelectedViewController:(UIViewController *)selectedViewController {
    __weak MainMenuViewController *_weakSelf = self;
    [self dismissViewControllerAnimated:YES completion:^{
        if (![self.currentController isEqual:selectedViewController]) {
            _weakSelf.currentController = selectedViewController;
            [_weakSelf.mainNavigationController setViewControllers:@[selectedViewController] animated:YES];
        }
    }];
}
#pragma mark - Actions

- (IBAction)buttonClose_Tap:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
