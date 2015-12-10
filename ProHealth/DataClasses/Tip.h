//
//  Tip.h
//  ProHealth
//
//  Created by Vladimir Psyukalov on 09.12.15.
//  Copyright © 2015 Natalia Zubareva. All rights reserved.
//


#import <Foundation/Foundation.h>


@interface Tip : NSObject

@property (assign, nonatomic) NSInteger identifier;
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *text;
@property (strong, nonatomic) NSString *imageURL;

@end