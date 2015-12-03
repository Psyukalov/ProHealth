//
//  WaterGlassButton.h
//  ProHealth
//
//  Created by Vladimir Psyukalov on 02.12.15.
//  Copyright © 2015 Natalia Zubareva. All rights reserved.
//


#import <UIKit/UIKit.h>


@interface WaterGlassButton : UIButton

@property (strong, nonatomic) WaterGlassButton *previos;
@property (strong, nonatomic) WaterGlassButton *next;
@property (assign, nonatomic) BOOL isUsed;
@property (strong, nonatomic) UIImage *emptyGlass;
@property (strong, nonatomic) UIImage *addGlass;
@property (strong, nonatomic) UIImage *fullGlass;

- (id)initWithUsedGlass:(BOOL)isUsed;

- (void)redrawImage;

- (BOOL)useGlass;

@end