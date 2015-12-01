//
//  PersonalStatsViewController.h
//  ProHealth
//
//  Created by Admin on 24.11.15.
//  Copyright © 2015 Natalia Zubareva. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "Helper.h"
#import "HistogramView.h"
#import "Person.h"


@interface PersonalStatsViewController : UIViewController

- (NSArray *)getArrayFromTag:(NSInteger)tag;
- (void)drawHistogram:(NSArray *)values;

@end