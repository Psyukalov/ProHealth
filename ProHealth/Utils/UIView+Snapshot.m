//
//  UIView+Snapshot.m
//  ProHealth
//
//  Created by Anton Yurichev on 25.11.15.
//  Copyright © 2015 Natalia Zubareva. All rights reserved.
//

#import "UIView+Snapshot.h"
#import "UIImageEffects.h"

#define kSnapshotDefaultTintColor RGBAlpha(44, 62, 80, 0.84)

static const CGFloat kSnapshotDefaulrBlurRadius = 4.0f;

@implementation UIView (Snapshot)

- (UIImage *)takeSnapshot {
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, NO, [UIScreen mainScreen].scale);
    
    [self drawViewHierarchyInRect:self.bounds afterScreenUpdates:YES];
    
    // old style [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

- (UIImage *)blurredSnapshotWithRadius:(CGFloat)radius tintColor:(UIColor *)tintColor {
    UIImage *snapshotImage = [self takeSnapshot];
    UIImage *blurredSnapshot = [UIImageEffects imageByApplyingBlurToImage:snapshotImage withRadius:radius tintColor:tintColor saturationDeltaFactor:1.0f maskImage:nil];
    return blurredSnapshot;
}

- (UIImage *)blurredSnapshot {
    return [self blurredSnapshotWithRadius:kSnapshotDefaulrBlurRadius tintColor:kSnapshotDefaultTintColor];
}

@end
