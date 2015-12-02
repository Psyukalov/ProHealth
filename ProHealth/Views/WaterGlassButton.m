//
//  WaterGlassButton.m
//  ProHealth
//
//  Created by Vladimir Psyukalov on 02.12.15.
//  Copyright © 2015 Natalia Zubareva. All rights reserved.
//


#import "WaterGlassButton.h"


@implementation WaterGlassButton

@synthesize previos = _previos;
@synthesize next = _next;
@synthesize emptyGlass = _emptyGlass;
@synthesize addGlass = _addGlass;
@synthesize fullGlass = _fullGlass;

- (id)init {
    self = [super init];
    if (self) {
        [self setImage:[UIImage imageNamed:@"img_empty_glass.png"] forState:UIControlStateNormal];
    }
    return self;
}

- (void)addImage {
    if (self.previos == nil) {
        [self setImage:self.addGlass forState:UIControlStateNormal];
    } else {
        [self setImage:self.emptyGlass forState:UIControlStateNormal];
    }
}

@end