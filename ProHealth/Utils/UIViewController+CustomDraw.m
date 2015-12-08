//
//  UIViewController+CustomDraw.m
//  BankFilter
//
//  Created by Vyacheslav Ksenofontov on 11/18/13
//  Updated by Stanislav Grinberg on 10/15/15
//  Copyright (c) 2013 IronWaterStudio. All rights reserved.
//

#import "UIViewController+CustomDraw.h"
#import "UIButton+Block.h"


#define kTitleLabelCustomId 3078

@implementation UIViewController(CustomDraw)

#pragma mark - UIButton
- (UIButton*)buttonWithImage:(NSString *)imageName withPressed:(BOOL)hasPressedImage action:(SEL)selector
{
	UIImage* image = [UIImage imageNamed:[imageName stringByAppendingString:@".png"]];
	UIButton *button = [[[UIButton alloc] initWithFrame:CGRectMake(0, 0, image.size.width, image.size.height)] autorelease];
	
	[button setImage:image forState:UIControlStateNormal];
	if (hasPressedImage)
	{
		UIImage* imagePressed = [UIImage imageNamed:[imageName stringByAppendingString:@"_pressed.png"]];
		[button setBackgroundImage:imagePressed forState:UIControlStateHighlighted];
	}
	
	[button addTarget:self action:selector forControlEvents: UIControlEventTouchUpInside];

	return button;
}

#pragma mark - UIBarButtonItem
- (UIBarButtonItem*)barButtonWithImage:(NSString *)imageName action:(SEL)selector
{
	UIImage* image = [UIImage imageNamed:[imageName stringByAppendingString:@".png"]];
	UIImage* imagePressed = [UIImage imageNamed:[imageName stringByAppendingString:@"_pressed.png"]];
	
	//v1 when title text can be used
	/*
	UIButton *button = [UIButton buttonWithType: UIButtonTypeCustom];
	button.frame = CGRectMake(0, 0, image.size.width, image.size.height);
	[button setBackgroundImage:image forState:UIControlStateNormal];
	[button setBackgroundImage:imagePressed forState:UIControlStateSelected];
	*/
	
	//v2 without title text because we need to specify offsets
	UIButton *button = [UIButton buttonWithType: UIButtonTypeCustom];
	button.frame = CGRectMake(0, 0, image.size.width, image.size.height);
	if (!IS_IOS7)
		button.imageEdgeInsets = UIEdgeInsetsZero;

	[button setImage:image forState:UIControlStateNormal];
	[button setImage:image forState:UIControlStateDisabled];
	[button setImage:imagePressed forState:UIControlStateSelected];
	[button setImage:imagePressed forState:UIControlStateHighlighted];
	
	[button addTarget:self action:selector forControlEvents: UIControlEventTouchUpInside];
	return [[[UIBarButtonItem alloc] initWithCustomView: button] autorelease];
}

- (UIBarButtonItem*)barButtonWithImage:(NSString *)imageName actionBlock:(ActionBlock)actionBlock
{
	UIImage* image = [UIImage imageNamed:[imageName stringByAppendingString:@".png"]];
	UIImage* imagePressed = [UIImage imageNamed:[imageName stringByAppendingString:@"_pressed.png"]];
	
	//v1 when title text can be used
	/*
	UIButton* button = [UIButton buttonWithType: UIButtonTypeCustom];
	button.frame = CGRectMake(0, 0, image.size.width, image.size.height);
	[button setBackgroundImage:image forState:UIControlStateNormal];
	[button setBackgroundImage:imagePressed forState:UIControlStateSelected];
	[button setBackgroundImage:image forState:UIControlStateDisabled];
	*/
	
	//v2 without title text because we need to specify offsets
	UIButton* button = [UIButton buttonWithType: UIButtonTypeCustom];
	button.frame = CGRectMake(0, 0, image.size.width, image.size.height);
	if (!IS_IOS7)
		button.imageEdgeInsets = UIEdgeInsetsZero;

	[button setImage:image forState:UIControlStateNormal];
	[button setImage:image forState:UIControlStateDisabled];	
	[button setImage:imagePressed forState:UIControlStateSelected];
	[button setImage:imagePressed forState:UIControlStateHighlighted];
	
	[button addTarget:self actionWithBlock:actionBlock forControlEvents:UIControlEventTouchUpInside];
	return [[[UIBarButtonItem alloc] initWithCustomView: button] autorelease];
}

#pragma mark - Shortcuts
- (void)setNavigationBackButton
{
	[self setNavigationBackButtonWithPopToRoot:NO];
}

- (void)setNavigationBackButtonWithPopToRoot:(BOOL)popToRoot
{
	[self setNavigationBackButtonWithPopToRoot:popToRoot withSelector:nil];
}

/**
 * Set sletat back button with ability to back to root view controller or on prev. view controller in history.
 */
- (void)setNavigationBackButtonWithPopToRoot:(BOOL)popToRoot withSelector:(SEL)selClick
{
    __block UIViewController *_self = self;
	//UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
	//[negativeSpacer setWidth:-5];
	
	UIBarButtonItem *leftBarButtonItem = [self barButtonWithImage:@"back"
														 actionBlock:^{
															 if (selClick && [_self respondsToSelector:selClick])
																 [_self performSelector:selClick];
															 if (popToRoot)
																 [_self.navigationController popToRootViewControllerAnimated:YES];
															 else
																 [_self.navigationController popViewControllerAnimated:YES];
															 /*[_self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"navbar_bg"] forBarMetrics:UIBarMetricsDefault];
															 [_self.navigationController.navigationBar setShadowImage:[[[UIImage alloc] init] autorelease]];*/
														 }];
	self.navigationItem.leftBarButtonItems = @[/*negativeSpacer,*/ leftBarButtonItem];
	
	// ??? SWIPE BACK BUTTON ???
	// Prevent system back swipe to the root controller (when used left side menu)
	if (self != self.navigationController.viewControllers.firstObject)
	{
		// Allow return behaviour to the cases when not menu back navigaiont i.e. popToRoot = NO
		if (!popToRoot && [self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)])
		{
			//Need for back with swipe (enabled allows process swipe over scroll view)
			self.navigationController.interactivePopGestureRecognizer.enabled = YES;
			self.navigationController.interactivePopGestureRecognizer.delegate = self;//nil
		}
	}
}

- (void)setNavigationForwardButtonWithActionBlock:(ActionBlock)actionBlock
{
	self.navigationItem.rightBarButtonItem = [self barButtonWithImage:@"navbar_icon_next"
														  actionBlock:actionBlock];
}

- (void)setNavigationMenuButtonWithSelector:(SEL)selClick
{
 	UIBarButtonItem *buttonItem = [self barButtonWithImage:@"navbar_icon_menu"
													action:selClick];
	if (IS_IOS7)
	{
		UIBarButtonItem *spaceFix = [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:NULL] autorelease];
		spaceFix.width = -6;
		self.navigationItem.leftBarButtonItems = @[spaceFix, buttonItem];
	}
	else
	{
		UIBarButtonItem *spaceFix = [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:NULL] autorelease];
		spaceFix.width = 5;
		buttonItem.customView.frame = CGRectSetY(buttonItem.customView.frame, 20);
		self.navigationItem.leftBarButtonItems = @[spaceFix, buttonItem];
	}
}

- (void)setNavigationCancelButtonWithSelector:(SEL)selClick
{
 	UIBarButtonItem *buttonItem = [self barButtonWithImage:@"navbar_icon_cancel"
													action:selClick];
	if (IS_IOS7)
	{
		UIBarButtonItem *spaceFix = [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:NULL] autorelease];
		spaceFix.width = -6;
		self.navigationItem.leftBarButtonItems = @[spaceFix, buttonItem];
	}
	else
	{
		UIBarButtonItem *spaceFix = [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:NULL] autorelease];
		spaceFix.width = 5;
		buttonItem.customView.frame = CGRectSetY(buttonItem.customView.frame, 20);
		self.navigationItem.leftBarButtonItems = @[spaceFix, buttonItem];
	}
}

- (void)setNavigationApplyButtonWithSelector:(SEL)selClick
{
 	UIBarButtonItem *buttonItem = [self barButtonWithImage:@"navbar_icon_done"
													action:selClick];
	if (IS_IOS7)
	{
		UIBarButtonItem *spaceFix = [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:NULL] autorelease];
		spaceFix.width = -6;
		self.navigationItem.rightBarButtonItems = @[spaceFix, buttonItem];
	}
	else
	{
		UIBarButtonItem *spaceFix = [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:NULL] autorelease];
		spaceFix.width = -5;
		buttonItem.customView.frame = CGRectSetY(buttonItem.customView.frame, 20);
		self.navigationItem.rightBarButtonItems = @[spaceFix, buttonItem];
	}
}

- (void)fixDesign
{
	if (IS_IOS7)
	{
		self.automaticallyAdjustsScrollViewInsets = NO; // Avoid the top UITextView space, iOS7 (~bug?)
		self.edgesForExtendedLayout = UIRectEdgeNone;
		//self.navigationController.navigationBar.translucent = NO;
		self.view.bounds = CGRectMake(self.view.bounds.origin.x, -self.topLayoutGuide.length, self.view.bounds.size.width, self.view.bounds.size.height);
	}
}

- (void)clearSearchBar:(UISearchBar *)searchBar withBackgroundImage:(NSString *)imageName
{
	if (searchBar)
	{
		for (UIView *searchBarSubview in searchBar.subviews)
		{
			if ([searchBarSubview respondsToSelector:@selector(setBorderStyle:)])
			{
				[(UITextField *)searchBarSubview setBorderStyle:UITextBorderStyleRoundedRect];
				((UITextField *)searchBarSubview).background = nil;
				searchBarSubview.backgroundColor = [UIColor whiteColor];
				CALayer *layer = searchBarSubview.layer;
				layer.borderWidth = 0.0f;
				layer.borderColor = [UIColor grayColor].CGColor;
				//layer.borderColor = [UIColor grayColor].CGColor;
				layer.cornerRadius = 1.0f;
			}
		}
	}
	if (imageName)
		searchBar.backgroundImage = [UIImage imageNamed:imageName];
}

- (void)appendCustomTitle:(NSString *)customTitle
{
	// Set custom title label (needs for iPad because we can't set title in navigation controller by design rules
	self.title = @"";
	UILabel *titleLabel = (UILabel *)[self.view viewWithTag:kTitleLabelCustomId];
	if (!titleLabel)
	{
		// Make title label if it doesn't exist
		titleLabel = [[[UILabel alloc] init] autorelease];
		titleLabel.font = [UIFont fontWithName:@"GothamPro-Medium" size:17];
		titleLabel.textAlignment = NSTextAlignmentCenter;
		titleLabel.textColor = [UIColor whiteColor];
		titleLabel.backgroundColor = [UIColor clearColor];
		
		titleLabel.tag = kTitleLabelCustomId;
		[self.view addSubview:titleLabel];
	}
	titleLabel.text = customTitle;
	
	// Centering title label in self.view
	CGRect bounds = self.view.bounds;
	[titleLabel sizeToFit];
	CGRect titleBounds = titleLabel.bounds;
	CGRect titleFrame = CGRectMake((bounds.size.width - titleBounds.size.width) / 2,
								   20, titleBounds.size.width, titleBounds.size.height);
	titleLabel.frame = titleFrame;
}


- (void)layoutSubviews:(NSArray *)subviews inVerticalScrollView:(UIScrollView *)scrollView margin:(CGFloat)margin
{
	// Lay out sobviews in scroll view in vertical direction, add it and set correct content size
	if (subviews.count == 0)
		return;
	for (int i = 0; i < subviews.count; i++)
	{
		UIView *subview = subviews[i];
		CGPoint subviewPosition = CGPointMake(0.0f, i == 0 ? 0.0f : CGRectGetMaxY(((UIView *)subviews[i - 1]).frame));
		subviewPosition.y += margin;
		subview.frame = CGRectSetPos(subview.frame, subviewPosition);
		subview.frame = CGRectSetWidth(subview.frame, scrollView.frame.size.width);
		[scrollView addSubview:subview];
	}
	
	scrollView.contentSize = CGSizeMake(scrollView.frame.size.width, CGRectGetMaxY(((UIView *)subviews[subviews.count - 1]).frame));
}

@end
