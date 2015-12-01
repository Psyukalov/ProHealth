//
//  Recipes.h
//  ProHealth
//
//  Created by Vladimir Psyukalov on 30.11.15.
//  Copyright © 2015 Natalia Zubareva. All rights reserved.
//


#import <Foundation/Foundation.h>


@interface Recipes : NSObject

@property (assign, nonatomic) NSInteger identifier;
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *imagePathURL;
@property (strong, nonatomic) NSString *formula;
@property (strong, nonatomic) NSMutableArray <NSDictionary *> *ingredients;
@property (strong, nonatomic) NSMutableArray <NSDictionary *> *nutritional;

@end