//
//  Helper.h
//  ProHealth
//
//  Created by Anton Yurichev on 25.11.15.
//  Copyright © 2015 Natalia Zubareva. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Helper : NSObject

+ (void)applyCornerRadius:(CGFloat)cornerRadius forViews:(nonnull NSArray<UIView *> *)views;

+ (void)applyTransparentLayerFormImage:(nonnull UIImageView *)image withColor:(nonnull UIColor *)color;

@end