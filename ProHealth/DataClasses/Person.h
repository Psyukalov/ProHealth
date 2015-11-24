//
//  Person.h
//  ProHealth
//
//  Created by Admin on 24.11.15.
//  Copyright © 2015 Natalia Zubareva. All rights reserved.
//


#import <Foundation/Foundation.h>


@interface Person : NSObject

@property (strong, nonatomic) NSData *avatar;
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSDate *startDate;
@property (assign, nonatomic) double weight;
@property (assign, nonatomic) double growth;
@property (strong, nonatomic) NSDate *birthday;
@property (strong, nonatomic) NSString *gender;

- (instancetype) init __attribute__((unavailable("init is not available; use sharedPerson instead")));
+ (id)sharedPerson;

@end
