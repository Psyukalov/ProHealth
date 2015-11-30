//
//  CaloriesViewController.h
//  ProHealth
//
//  Created by Admin on 24.11.15.
//  Copyright © 2015 Natalia Zubareva. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CaloriesViewController : UIViewController

@property (assign, nonatomic) NSInteger calories;
@property (assign, nonatomic) NSInteger protein;
@property (assign, nonatomic) NSInteger carbohydrate;
@property (assign, nonatomic) NSInteger fat;

- (instancetype)initWithCalories:(NSInteger)calories protein:(NSInteger)protein
                    carbohydrate:(NSInteger)carbohydrate fat:(NSInteger) fat;



@end
