//
//  MainMenuTableViewCell.h
//  ProHealth
//
//  Created by Admin on 24.11.15.
//  Copyright © 2015 Natalia Zubareva. All rights reserved.
//

#import <UIKit/UIKit.h>

NSString * const kMainMenuTableViewCellReuseID = @"MainMenuTableViewCell";

@interface MainMenuTableViewCell : UITableViewCell

- (void)fillWithImageName:(NSString *)imageName text:(NSString *)text;

@end
