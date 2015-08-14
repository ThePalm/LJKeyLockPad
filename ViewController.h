//
//  ViewController.h
//  LJKeyLockPad
//
//  Created by Julie Johnson on 2/22/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

@class KeyPadRootViewController;

@class AppDelegate;

#import <UIKit/UIKit.h>
#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    
KeyPadRootViewController *keypadrootcontroller;
AppDelegate *hhiappDelegate;
UIButton *buttonCancel;
UIButton *buttonNext;

    
}

-(void)pickOne:(id)sender;

-(void)performNext;

-(void)performCancel;


@end
