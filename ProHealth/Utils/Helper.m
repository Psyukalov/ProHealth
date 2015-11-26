//
//  Helper.m
//  ProHealth
//
//  Created by Anton Yurichev on 25.11.15.
//  Copyright © 2015 Natalia Zubareva. All rights reserved.
//

#import "Helper.h"

@implementation Helper

+ (void)applyCornerRadius:(CGFloat)cornerRadius forViews:(NSArray<UIView *> *)views {
    for (UIView *view in views) {
        view.layer.cornerRadius = cornerRadius;
        view.clipsToBounds = YES;
    }
}

+ (void)applyTransparentLayerFormImage:(nonnull UIImageView *)image withColor:(nonnull UIColor *)color {
    CALayer *transparentLayer = [CALayer layer];
    transparentLayer.frame = image.bounds;
    transparentLayer.cornerRadius = 2;
    transparentLayer.backgroundColor = [color CGColor];
    transparentLayer.opacity = 0.5;
    [image.layer addSublayer:transparentLayer];
}

@end