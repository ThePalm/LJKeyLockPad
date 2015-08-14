//
//  KeyPadView.h
//  ViewTransitions
//
//  Created by Julie Johnson on 2/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

@class AppDelegate;
@class SoundEffect;
@class KeyPadRootViewController;

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "AppDelegate.h"

@interface KeyPatternView : UIView
{
    CGRect keys[9];
    CALayer *myButtons[9];
	int currentKeyTouch;
	@public int keyCombination[9];
	@public int keyComboCount;
    int key;
	BOOL keyComboIsValid;
    BOOL buttonspainted;
    BOOL firstpass;
    @public NSString *strkeycombination;
    NSMutableString *temp;
    AppDelegate *hhiappDelegate;
    SoundEffect *clickSound;
}

@property (nonatomic,assign) NSString *keyMode;
@property (nonatomic,copy) NSString *labelonetext;		
@property (nonatomic,copy) NSString *labeltwotext;
@property (nonatomic, readonly) UIFont *labelFont;
@property (nonatomic, readonly) UIFont *labelFontBig;
@property (nonatomic,copy) KeyPadRootViewController *myViewController;

-(void)deemKeyCombinationInvalid;

-(void)ClearKeyCombination;

@end
