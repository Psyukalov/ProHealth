//
//  HistogramView.m
//  ProHealth
//
//  Created by Admin on 24.11.15.
//  Copyright © 2015 Natalia Zubareva. All rights reserved.
//


#import "HistogramView.h"


@implementation HistogramView

@synthesize values = _values;
@synthesize maxValue = _maxValue;
@synthesize minTitleValue = _minTitleValue;
@synthesize barDelta = _barDelta;
@synthesize firstColor = _firstColor;
@synthesize secondColor = _secondColor;
@synthesize upBorder = _upBorder;
@synthesize leftBorder = _leftBorder;

- (HistogramView * )initWithFrame:(CGRect)frame
                            values:(NSArray *)values
                          maxValue:(int)maxValue
                     minTitleValue:(int)minTitleValue
                          barDelta:(int)barDelta
                        firstColor:(UIColor *)firstColor
                       secondColor:(UIColor *)secondColor
                      withUpBorder:(int)upBorder
                     andLeftBorder:(int)leftBorder {
    self = [super initWithFrame:frame];
    if (self) {
        _values = values;
        _maxValue = maxValue;
        _minTitleValue = minTitleValue;
        _barDelta = barDelta;
        _firstColor = firstColor;
        _secondColor = secondColor;
        _upBorder = upBorder;
        _leftBorder = leftBorder;
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    // Заливка фона белым цветом
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [UIColor whiteColor].CGColor);
    CGContextFillRect(context, rect);
    double pointSize = 4;
    double lineLength = self.frame.size.height - (self.frame.size.height - self.upBorder) * self.minTitleValue / self.maxValue;
    double width = self.frame.size.width / self.values.count - self.barDelta;
    for (int i = 0; i <= self.values.count - 1; i++) {
        double height = (self.frame.size.height - self.upBorder) * [[self.values objectAtIndex:i] integerValue] / self.maxValue;
        CGRect newRect = CGRectMake(i * width + i * self.barDelta,
                                    self.frame.size.height - height,
                                    width,
                                    height);
        UIColor *color;
        if (fmod(i, 2) == 0) {
            color = self.firstColor;
        } else {
            color = self.secondColor;
        }
        CGContextSetFillColorWithColor(context, color.CGColor);
        CGContextFillRect(context, newRect);
    }
    // Линии
    [[UIColor blackColor] set];
    CGContextSetLineWidth(context, 1.0);
    CGContextMoveToPoint(context, self.leftBorder, self.upBorder);
    CGContextAddLineToPoint(context, self.leftBorder, lineLength);
    CGContextStrokePath(context);
    // Точки
    CGContextFillRect(context, CGRectMake(self.leftBorder - pointSize / 2, self.upBorder - pointSize / 2, pointSize, pointSize));
    CGContextFillRect(context, CGRectMake(self.leftBorder - pointSize / 2, self.upBorder / 2 + lineLength / 2 - pointSize / 2, pointSize, pointSize));
    CGContextFillRect(context, CGRectMake(self.leftBorder - pointSize / 2, lineLength - pointSize / 2, pointSize, pointSize));
    // Подписи
    UILabel *maxValue = [[UILabel alloc] initWithFrame:CGRectMake(self.leftBorder + 6, self.upBorder - 10.5, 64, 21)];
    maxValue.text = [NSString stringWithFormat:@"%1d", self.maxValue];
    [maxValue setFont:[UIFont systemFontOfSize:14]];
    [self addSubview:maxValue];
    UILabel *averageValue = [[UILabel alloc] initWithFrame:CGRectMake(self.leftBorder + 6, self.upBorder / 2 + + lineLength / 2 - 10.5, 64, 21)];
    averageValue.text = [NSString stringWithFormat:@"%1d", (self.maxValue - self.minTitleValue) / 2 + self.minTitleValue];
    [averageValue setFont:[UIFont systemFontOfSize:14]];
    [self addSubview:averageValue];
    UILabel *minValue = [[UILabel alloc] initWithFrame:CGRectMake(self.leftBorder + 6, lineLength - 10.5 , 64, 21)];
    minValue.text = [NSString stringWithFormat:@"%1d", self.minTitleValue];
    [minValue setFont:[UIFont systemFontOfSize:14]];
    [self addSubview:minValue];
}

@end