//
//  KeyPadRootViewController.h
//  ViewTransitions
//
//  Created by Julie Johnson on 2/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

@class KeyPadView;

@class KeyPatternView;

@class AppDelegate;

@class DCRoundSwitch;

#import <UIKit/UIKit.h>
#import "AppDelegate.h"


@interface KeyPadRootViewController : UIViewController
{
    DCRoundSwitch *rswitchshowhide; 
    KeyPadView *KeyPadView1;
    KeyPadView *KeyPadView2;
    KeyPatternView *KeyPatternView1;
    KeyPatternView *KeyPatternView2;
    UIView *tmp;
    BOOL transitioning;
    UILabel *lblenterPCode;
    UILabel *lblfiveMin;
    @public UILabel *lbldisplaycodes;
    UIButton *buttonClear;
    UIButton *buttonBack;
    UIButton *buttonNext;
    UIButton *buttonRecover;

    int screeninstance;
    
    AppDelegate *hhiappDelegate;
}

@property (nonatomic,copy) NSString *labeltwotext;
@property (assign) BOOL isNumericPad;                  //this makes it appear as a Numeric pad or a Combination Pad
@property (assign) BOOL isEntry;                       //this makes it appear in Setup or Entry Mode

-(void)performClear;

-(void)performTransitionNext;

-(void)performTransitionBack;

-(void)performSave;

-(void)displayCombo:(NSString*)combo;

-(void)performRecover;


@end
