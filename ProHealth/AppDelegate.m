//
// AppDelegate.m
// ProHealth
//
// Created by Admin on 24.11.15.
// Copyright © 2015 Natalia Zubareva. All rights reserved.
//

#import "AppDelegate.h"
#import "MainMenuViewController.h"
#import "PersonalStatsViewController.h"
#import "SettingsViewController.h"
#import "DataManager.h"

#import "GuideViewController.h"
#import "StartViewController.h"

#import "RecipeDetailsViewController.h"
#import "UIImage+Color.h"

NSString *const isNotFirstRun = @"YES";

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    UIViewController *viewController;
    if ([[[NSUserDefaults standardUserDefaults] stringForKey:@"isNotFirstRun"] isEqualToString:isNotFirstRun]) {
        StartViewController *startVC = [[StartViewController alloc] init];
        viewController = startVC;
    
    } else {
        GuideViewController *guideVC = [[GuideViewController alloc] init];
        viewController = guideVC;
        [[NSUserDefaults standardUserDefaults] setObject:isNotFirstRun forKey:@"isNotFirstRun"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
    UINavigationController *navigationVC = [[UINavigationController alloc] initWithRootViewController:viewController];
    [self applyDesign];
    //navigationVC.navigationBar.translucent = NO;
    self.window.rootViewController = navigationVC;
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    // Saves changes in the application's managed object context before the application terminates.
    [[DataManager sharedManager] saveContext];
}

- (void)applyDesign
{
    //[[UINavigationBar appearance] setBarTintColor:RGB(44, 62, 80)];
    [[UINavigationBar appearance] setTranslucent:NO];
    NSShadow *shadow = [NSShadow new];
    shadow.shadowColor = [UIColor clearColor];
    shadow.shadowBlurRadius = .0f;
    shadow.shadowOffset = CGSizeZero;
    NSDictionary *navbarTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor],
                                           NSFontAttributeName : [UIFont fontWithName:@"HelveticaNeue-Light" size:18],
                                           NSShadowAttributeName : shadow};
    [[UINavigationBar appearance] setTitleTextAttributes:navbarTextAttributes];
    [[UINavigationBar appearance] setShadowImage:[UIImage new]];
    UIColor *navbarBackgroundColor = RGBAlpha(44, 62, 80, 1.0f);
    UIImage *navbarBackgroundImage = [UIImage imageWithColor:navbarBackgroundColor height:44.0f];
    UIImage *navbarBackgroundImage64 = [UIImage imageWithColor:navbarBackgroundColor height:64.0f];
    [[UINavigationBar appearance] setBackgroundImage:navbarBackgroundImage forBarPosition:UIBarPositionTop barMetrics:UIBarMetricsDefault];
    [[UINavigationBar appearance] setBackgroundImage:navbarBackgroundImage64 forBarPosition:UIBarPositionTopAttached barMetrics:UIBarMetricsDefault];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    
    
}

@end