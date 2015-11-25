//
//  PersonalDataViewController.h
//  ProHealth
//
//  Created by Admin on 24.11.15.
//  Copyright © 2015 Natalia Zubareva. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "Person.h"
#import "Helper.h"

@interface PersonalDataViewController : UIViewController

@property (strong, nonatomic) Person *person;

- (id)initWithPerson:(Person *)person;

@end