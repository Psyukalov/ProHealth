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

+ (nonnull NSString *)applyRussianStyleForDate:(nonnull NSDate *)date {
    NSDateFormatter *formatter = [self sharedDateFormatter];
    [formatter setDateFormat:@"dd.MM.yyyy"];
    return [formatter stringFromDate:date];
}
    
+ (void)applyShadowForViews:(NSArray<UIView *> *)views {
//    for (UIView *view in views) {
//        view.layer.shadowColor = [[UIColor blackColor] CGColor];
//        view.layer.shadowRadius = 6;
//        view.layer.shadowOpacity = 0.5;
//        view.layer.shadowOffset = CGSizeMake(0, 8);
//        view.layer.masksToBounds = NO;
//    }
}

#pragma mark - Date utils

+ (NSCalendar *)sharedCalendar {
    static NSCalendar *calendar = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        calendar = [NSCalendar currentCalendar];
    });
    return calendar;
}

+ (NSDateFormatter *)sharedDateFormatter {
    static NSDateFormatter *dateFormatter = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dateFormatter = [[NSDateFormatter alloc] init];
        NSLocale *locale =[NSLocale localeWithLocaleIdentifier:@"ru_RU"];
        dateFormatter.locale = locale;
    });
    return dateFormatter;
}

+ (NSInteger)currentDay {
    NSDateComponents *comps = [[self sharedCalendar] components:NSCalendarUnitDay fromDate:[NSDate date]];
    return comps.day;
}

+ (NSString *)currentMonthNameWithStyle:(NSDateFormatterStyle)style withFormat:(NSString *)format {
    [[self sharedDateFormatter] setDateStyle:style];
    [[self sharedDateFormatter] setDateFormat:format];
    NSString *month = [[self sharedDateFormatter] stringFromDate:[NSDate date]];
    return month;
}

+ (NSInteger)currentHour {
    NSInteger hour = [[self sharedCalendar] component:NSCalendarUnitHour fromDate:[NSDate date]];
    return hour;
}

@end