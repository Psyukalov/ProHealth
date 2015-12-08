//
//  UIViewController+CustomDraw.h
//  BankFilter
//
//  Created by Vyacheslav Ksenofontov on 11/18/13
//  Updated by Stanislav Grinberg on 10/15/15
//  Copyright (c) 2013 IronWaterStudio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIButton+Block.h"
#import "Helper.h"

@interface UIViewController(CustomDraw) <UIGestureRecognizerDelegate>

#pragma mark - UIButton
- (UIButton*) buttonWithImage:(NSString *)imageName withPressed:(BOOL)hasPressedImage action:(SEL)selector;

#pragma mark - UIBarButtonItem
- (UIBarButtonItem*)barButtonWithImage:(NSString *)imageName action:(SEL)selector;
- (UIBarButtonItem*)barButtonWithImage:(NSString *)imageName actionBlock:(ActionBlock)actionBlock;
- (void)setNavigationBackButton;
- (void)setNavigationBackButtonWithPopToRoot:(BOOL)popToRoot;
- (void)setNavigationBackButtonWithPopToRoot:(BOOL)popToRoot withSelector:(SEL)selClick;
- (void)setNavigationForwardButtonWithActionBlock:(ActionBlock)actionBlock;
- (void)setNavigationMenuButtonWithSelector:(SEL)selClick;
- (void)setNavigationCancelButtonWithSelector:(SEL)selClick;
- (void)setNavigationApplyButtonWithSelector:(SEL)selClick;

- (void)fixDesign;
- (void)clearSearchBar:(UISearchBar *)searchBar withBackgroundImage:(NSString *)imageName;
- (void)appendCustomTitle:(NSString *)customTitle;

#pragma mark - Scroll view
- (void)layoutSubviews:(NSArray *)subviews inVerticalScrollView:(UIScrollView *)scrollView margin:(CGFloat)margin;

//#pragma mark - This project
//- (void)applyWhiteNavigationBarBackground;
//- (void)applyDefaultNavigationBarBackground;
//- (void)applyDefaultNavigationBarTextAttributes;
//- (void)applyNavigationBarTextAttributesWithFontSize:(CGFloat)fontSize;

@end
