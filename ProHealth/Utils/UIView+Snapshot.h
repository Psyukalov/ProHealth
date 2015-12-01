//
//  UIView+Snapshot.h
//  ProHealth
//
//  Created by Anton Yurichev on 25.11.15.
//  Copyright © 2015 Natalia Zubareva. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Snapshot)

- (UIImage *)takeSnapshot;
- (UIImage *)blurredSnapshotWithRadius:(CGFloat)radius tintColor:(UIColor *)tintColor;

@end
