//
//  MainMenuViewController.h
//  ProHealth
//
//  Created by Admin on 24.11.15.
//  Copyright © 2015 Natalia Zubareva. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MealsMenuViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

- (instancetype)initWithMainNavigationController:(UINavigationController *)mainNavigationController blurredSnapshotImage:(UIImage *)blurredSnapshotImage;

@end
