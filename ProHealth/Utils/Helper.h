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
+ (void)applyTransparentLayerFormImage:(nonnull UIImageView *)image
                             withColor:(nonnull UIColor *)color;
+ (nonnull NSString *)applyRussianStyleForDate:(nonnull NSDate *)date;
+ (void)applyShadowForViews:(nonnull NSArray<UIView *> *)views;
+ (nonnull NSCalendar *)sharedCalendar;
+ (nonnull NSDateFormatter *)sharedDateFormatter;
+ (nonnull NSString *)currentMonthNameWithStyle:(NSDateFormatterStyle)style
                                     withFormat:(nonnull NSString *)format;
+ (NSInteger)currentDay;
+ (NSInteger)currentHour;

@end