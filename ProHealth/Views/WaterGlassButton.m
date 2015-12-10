//
//  WaterGlassButton.m
//  ProHealth
//
//  Created by Vladimir Psyukalov on 02.12.15.
//  Copyright © 2015 Natalia Zubareva. All rights reserved.
//


#import "WaterGlassButton.h"


@implementation WaterGlassButton

- (id)initWithUsedGlass:(BOOL)isUsed {
    self = [super init];
    if (self) {
        _isUsed = isUsed;
    }
    return self;
}

- (void)redrawImage {
    if (self.isUsed) {
        [self setImage:self.fullGlass forState:UIControlStateNormal];
        [self.next setImage:self.addGlass forState:UIControlStateNormal];
    } else {
        if (self.previos == nil) {
            [self setImage:self.addGlass forState:UIControlStateNormal];
        }
        [self.next setImage:self.emptyGlass forState:UIControlStateNormal];
    }
}

- (BOOL)useGlass {
    BOOL result = NO;
    if (!self.isUsed && (self.previos.isUsed || self.previos == nil)) {
        self.isUsed = YES;
        [self setImage:self.fullGlass forState:UIControlStateNormal];
        [self.next setImage:self.addGlass forState:UIControlStateNormal];
        result = YES;
    }
    return result;
}

@end