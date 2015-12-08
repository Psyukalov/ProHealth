//
//  MainMenuViewController.h
//  ProHealth
//
//  Created by Anton Yurichev on 25.11.15.
//  Copyright © 2015 Natalia Zubareva. All rights reserved.
//

#import <UIKit/UIKit.h>

static const NSInteger kMainMenuItemsCount = 6;

@interface MainMenuViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>


- (id)initWithMainNavigationController:(UINavigationController *)navigationController blurredSnapshotImage:(UIImage *)blurredSnapshotImage;
@end
