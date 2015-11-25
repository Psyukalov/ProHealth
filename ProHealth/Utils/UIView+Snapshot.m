//
//  UIView+Snapshot.m
//  ProHealth
//
//  Created by Anton Yurichev on 25.11.15.
//  Copyright © 2015 Natalia Zubareva. All rights reserved.
//

#import "UIView+Snapshot.h"
#import "UIImageEffects.h"

@implementation UIView (Snapshot)

- (UIImage *)takeSnapshot {
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, NO, [UIScreen mainScreen].scale);
    
    [self drawViewHierarchyInRect:self.bounds afterScreenUpdates:YES];
    
    // old style [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

- (UIImage *)blurredSnapshot {
    UIImage *snapshotImage = [self takeSnapshot];
    UIImage *blurredSnapshot = [UIImageEffects imageByApplyingBlurToImage:snapshotImage withRadius:4.0f tintColor:RGBA(44, 62, 80, 1) saturationDeltaFactor:1.0f maskImage:nil];
    return blurredSnapshot;
}
@end
