//
//  AppDelegate.h
//  ProHealth
//
//  Created by Admin on 24.11.15.
//  Copyright © 2015 Natalia Zubareva. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, MainMenuItem) {
    MainMenuItemNone = 0, 
    MainMenuItemRecipes = 1,
    MainMenuItemExercises,
    MainMenuItemTips,
    MainMenuItemConsult,
    MainMenuItemPersonalData,
    MainMenuItemHelp
};

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (assign, nonatomic) MainMenuItem selectedMenuItem;

@end