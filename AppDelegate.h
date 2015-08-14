//
//  AppDelegate.h
//  LJKeyLockPad
//
//  Created by Julie Johnson on 2/22/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ViewController;
@class KeyPadRootViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) ViewController *viewController;

@property (assign) BOOL isNumericPad;                  //this makes it appear as a Numeric pad or a Combination Pad
@property (assign) BOOL isEntry;                       //this makes it appear in Setup or Entry Mode

@end
