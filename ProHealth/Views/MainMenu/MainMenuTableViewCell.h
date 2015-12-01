//
//  MainMenuTableViewCell.h
//  ProHealth
//
//  Created by Anton Yurichev on 01.12.15.
//  Copyright © 2015 Natalia Zubareva. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kMainMenuTableViewCellReuseID @"MainMenuTableViewCell"

@interface MainMenuTableViewCell : UITableViewCell

@property (strong, nonatomic) NSString *title;

+ (void)registerFor:(UITableView *)tableView;


@end
