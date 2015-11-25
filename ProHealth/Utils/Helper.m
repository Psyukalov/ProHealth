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

+ (void)applyCornerRadius:(CGFloat)cornerRadius forButtons:(NSArray<UIButton *> *)buttons {
    for (UIButton *button in buttons) {
        button.layer.cornerRadius = cornerRadius;
        button.clipsToBounds = YES;
    }
}

@end
