//
//  Exercises.h
//  ProHealth
//
//  Created by Vladimir Psyukalov on 08.12.15.
//  Copyright © 2015 Natalia Zubareva. All rights reserved.
//


#import <Foundation/Foundation.h>


@interface Exercises : NSObject

@property (assign, nonatomic) NSInteger identifier;
@property (strong, nonatomic) NSString  *name;
@property (assign, nonatomic) NSInteger time;
@property (strong, nonatomic) NSString *repeats;
@property (strong, nonatomic) NSString *exerDescript;
@property (strong, nonatomic) NSString *videoURL;

@end