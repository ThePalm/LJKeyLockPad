//
//  KeyPadView.h
//  ViewTransitions
//
//  Created by Julie Johnson on 2/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "HHISoundModule.h"

@class AppDelegate;
@class KeyPadRootViewController;

@interface KeyPadView : UIView
{
    CGRect keys[12];
    CALayer *myButtons[12];
	int currentKeyTouch;
	int keyCombination[12];
	int keyComboCount;
    int key;
	BOOL keyComboIsValid;
    BOOL buttonspainted;
    BOOL firstpass;
    @public NSString *strkeycombination;
    AppDelegate *hhiappDelegate;
    @public KeyPadRootViewController *myViewController;
    HHISoundModule * sharedModule;
}

@property (nonatomic) BOOL keyMode;
@property (nonatomic,copy) NSString *labelonetext;		
@property (nonatomic,copy) NSString *labeltwotext;
@property (nonatomic, readonly) UIFont *labelFont;
@property (nonatomic, readonly) UIFont *labelFontBig;
@property (nonatomic,copy) NSString *instnum;
@property (retain) KeyPadRootViewController *myViewController;


-(void)deemKeyCombinationInvalid;

@end
