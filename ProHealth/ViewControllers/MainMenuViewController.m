//
//  MainMenuViewController.m
//  ProHealth
//
//  Created by Anton Yurichev on 25.11.15.
//  Copyright © 2015 Natalia Zubareva. All rights reserved.
//

#import "MainMenuViewController.h"
#import "MainMenuTableViewCell.h"

@interface MainMenuViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableMenu;
@property (strong, nonatomic) NSArray<NSString *> *menuItems;
@property (weak, nonatomic) IBOutlet UIButton *buttonClose;
@property (weak, nonatomic) IBOutlet UIImageView *imgSnapshotView;

@end

@implementation MainMenuViewController

#pragma mark - Lifecycle
- (instancetype)init {
    if (self = [super init]) {
        NSMutableArray *menuItems = [NSMutableArray array];
        for (int i = 1; i <= kMainMenuItemsCount; ++i) {
            NSString *localizationKey = [NSString stringWithFormat:@"MainMenu.Item.%d", i];
            [menuItems addObject:NSLocalizedString(localizationKey, nil)];
        }
        _menuItems = [[NSArray alloc] initWithArray:menuItems];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.imgSnapshotView.image = self.snapshotImage;
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
}
#pragma mark - Actions

- (IBAction)buttonClose_Tap:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
