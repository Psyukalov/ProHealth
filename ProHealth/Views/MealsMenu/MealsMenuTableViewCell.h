//
//  MainMenuTableViewCell.h
//  ProHealth
//
//  Created by Admin on 24.11.15.
//  Copyright © 2015 Natalia Zubareva. All rights reserved.
//

#import <UIKit/UIKit.h>

static NSString * _Nonnull const kMealsMenuTableViewCellReuseID = @"MealsMenuTableViewCell";

@interface MealsMenuTableViewCell : UITableViewCell

- (void)fillWithImageName:(NSString * _Nonnull)imageName text: (NSString * _Nonnull)text;

+ (void)registerFor:(UITableView * _Nonnull)tableView;

@end
