//
//  Macros.h
//  BankFilter
//
//  Created by Roman on 12/15/12.
//  Copyright (c) 2012 IronWaterStudio. All rights reserved.
//

#import "float.h"

#ifndef Psycho_Macros_h
#define Psycho_Macros_h

#ifndef RGBA
	#define RGBA(r, g, b, a) [UIColor colorWithRed:(r)/255.f green:(g)/255.f blue:(b)/255.f alpha:(a)/255.f]
#endif

#ifndef RGB
	#define RGB(r, g, b) [UIColor colorWithRed:(r)/255.f green:(g)/255.f blue:(b)/255.f  alpha:1.0]
#endif

#ifndef RGBAlpha
    #define RGBAlpha(r, g, b, a) [UIColor colorWithRed:(r)/255.f green:(g)/255.f blue:(b)/255.f  alpha:(a)]
#endif

#ifndef resizableImage
/**
 Resize image to container size by using fixed offsets (top, left, bottom, right)
 
 @param top @b Top offset
 @param left @b Left offset
 @param bottom @b Bottom offset
 @param right @b Right offset
 
 @return Instance of resized UIImage.
 */
	#define resizableImage(top, left, bottom, right) resizableImageWithCapInsets:UIEdgeInsetsMake(top, left, bottom, right)
#endif

//TODO: CGRectChangeX & CGRectChangeY can use CGRectOffset
#define CGRectChangeX(Rect, X) CGRectMake((Rect).origin.x + (X), (Rect).origin.y, (Rect).size.width, (Rect).size.height)
#define CGRectChangeY(Rect, Y) CGRectMake((Rect).origin.x, (Rect).origin.y + (Y), (Rect).size.width, (Rect).size.height)
#define CGRectChangeWidth(Rect, Width) CGRectMake((Rect).origin.x, (Rect).origin.y, (Rect).size.width + (Width), (Rect).size.height)
#define CGRectChangeHeight(Rect, Height) CGRectMake((Rect).origin.x, (Rect).origin.y, (Rect).size.width, (Rect).size.height + (Height))

#define CGRectSetX(Rect, X) CGRectMake((X), (Rect).origin.y, (Rect).size.width, (Rect).size.height)
#define CGRectSetY(Rect, Y) CGRectMake((Rect).origin.x, (Y), (Rect).size.width, (Rect).size.height)
#define CGRectSetPos(Rect, Pos) CGRectMake((Pos).x, (Pos).y, (Rect).size.width, (Rect).size.height)
#define CGRectSetWidth(Rect, Width) CGRectMake((Rect).origin.x, (Rect).origin.y, (Width), (Rect).size.height)
#define CGRectSetHeight(Rect, Height) CGRectMake((Rect).origin.x, (Rect).origin.y, (Rect).size.width, (Height))
#define CGRectSetSize(Rect, Size) CGRectMake((Rect).origin.x, (Rect).origin.y, (Size).width, (Size).height)
#define CGRectCeil(Rect) CGRectMake(ceilf((Rect).origin.x), ceilf((Rect).origin.y), ceilf((Rect).size.width), ceilf((Rect).size.height))

#define CGSizeChangeWidth(Size, Width) CGSizeMake((Size).width + (Width), (Size).height)
#define CGSizeChangeHeight(Size, Height) CGSizeMake((Size).width, (Size).height + (Height))

#define CGSizeSetWidth(Size, Width) CGSizeMake((Width), (Size).height)
#define CGSizeSetHeight(Size, Height) CGSizeMake((Size).width, (Height))

#define NSLogRect(Rect) NSLog(@"X: %f, Y: %f, Width: %f, Height: %f", (Rect).origin.x, (Rect).origin.y, (Rect).size.width, (Rect).size.height);
#define NSLogSize(Size) NSLog(@"Width: %f, Height: %f", (Size).width, (Size).height);
#define NSLogPoint(Point) NSLog(@"X: %f, Y: %f", (Point).x, (Point).y);

#define DegToRad(Degrees) (Degrees) * 0.01745329f
#define RGB01(RGB255) (RGB255) / 255.0f

#define DeviceUDID [[UIDevice currentDevice] uniqueIdentifier]

#define APP_NAME [[[NSBundle mainBundle] localizedInfoDictionary] objectForKey:@"CFBundleDisplayName"] ?: [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleDisplayName"]
#define APP_VERSION [[NSBundle mainBundle] objectForInfoDictionaryKey:(NSString*)kCFBundleVersionKey]


//#define IS_IPHONE_5 ( fabs( ( double ) [ [ UIScreen mainScreen ] bounds ].size.height - ( double )568 ) < DBL_EPSILON )
#define IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define IS_IOS7 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)
#define IS_IOS8 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)
#define IS_IOS6 ([[[UIDevice currentDevice] systemVersion] floatValue] < 7.0)
#define IS_RETINA (([[UIScreen mainScreen] respondsToSelector:@selector(displayLinkWithTarget:selector:)] && [[UIScreen mainScreen] scale] == 2.0 ? YES : NO))
#define SCREEN_SCALE [UIScreen mainScreen].scale

#define IS_IPHONE_DEVICE ([[UIDevice currentDevice].model rangeOfString:@"iPhone"].location != NSNotFound)

#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)
#define SCREEN_MAX_LENGTH (MAX(SCREEN_WIDTH, SCREEN_HEIGHT))
#define SCREEN_MIN_LENGTH (MIN(SCREEN_WIDTH, SCREEN_HEIGHT))

#define IS_IPHONE_4 [UIScreen mainScreen].bounds.size.height <= 480
#define IS_IPHONE_5 (IS_IPHONE && SCREEN_MAX_LENGTH == 568.0)
#define IS_IPHONE_6 (IS_IPHONE && SCREEN_MAX_LENGTH == 667.0)
#define IS_IPHONE_6P (IS_IPHONE && SCREEN_MAX_LENGTH == 736.0)

#define ScreenHeight ([[UIScreen mainScreen] bounds].size.height)
#define ScreenWidth ([[UIScreen mainScreen] bounds].size.width)
#define FrameHeight ([[UIScreen mainScreen] bounds].size.height - 20)
#define FrameWidth ScreenWidth

#define ScreenHeightLandscape ([[UIScreen mainScreen] bounds].size.width)
#define ScreenWidthLandscape ([[UIScreen mainScreen] bounds].size.height)
#define FrameHeightLandscape ([[UIScreen mainScreen] bounds].size.width - 20)
#define FrameWidthLandscape ScreenWidthLandscape

#define Local(String) NSLocalizedString((String), @"")

#define BlockSelf __block typeof(self)
#define loadViewFromNib [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] firstObject]



#if TARGET_IPHONE_SIMULATOR
	#define IS_SIMULATOR YES
#else
	#define IS_SIMULATOR NO
#endif

#endif
