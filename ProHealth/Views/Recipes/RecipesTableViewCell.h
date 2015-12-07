//
//  RecipesTableViewCell.h
//  ProHealth
//
//  Created by Admin on 24.11.15.
//  Copyright © 2015 Natalia Zubareva. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kRecipesTableViewCellReuseID @"RecipesTableViewCell"

@interface RecipesTableViewCell : UITableViewCell

@property (strong, nonatomic) NSString *recipeName;

+ (void)registerFor:(UITableView *)tableView;

@end
