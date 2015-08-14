//
//  KeyPadRootViewController.m
//  ViewTransitions
//
//  Created by Julie Johnson on 2/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "KeyPadRootViewController.h"
#import "KeyPadView.h"
#import "KeyPatternView.h"
#import "DCRoundSwitch.h"
#import <QuartzCore/QuartzCore.h>

@implementation KeyPadRootViewController

@synthesize labeltwotext;
@synthesize isNumericPad;
@synthesize isEntry;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
            
    for (UIView *aView in [self.view subviews])
    {
        [aView removeFromSuperview];
        aView.hidden = YES;   
        [aView release];
        aView = nil; 
        
    }   
     
            NSLog(@"Memory Warning in KeyPadRootViewController!!!!");
   }

#pragma mark - View lifecycle

- (void)loadView  //  an empty one of these will cause you to loop till stack overflow 
{
    hhiappDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    self.view = [[UIView alloc] initWithFrame:CGRectMake(0, 40, 320, 480)];

	    
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"gray-fabric-pattern.jpg"]]];
    //[self.view setBackgroundColor:[UIColor whiteColor]];
    
    if (isNumericPad)   //*************** N U M E R I C    P A D  ******************************** 
    {
                   
           rswitchshowhide = [[DCRoundSwitch alloc]initWithFrame:CGRectMake(200, 30, 90, 27)];
           rswitchshowhide.on = NO;
           rswitchshowhide.onText = NSLocalizedString(@"Show", @"");
           rswitchshowhide.offText = NSLocalizedString(@"Hide", @"");
           [rswitchshowhide addTarget: self action:@selector(rswitchshowhideToggled:) forControlEvents:UIControlEventValueChanged];
                                              
           [self.view addSubview:rswitchshowhide];
           [rswitchshowhide release];
        
             
           lblenterPCode = [[UILabel alloc] initWithFrame:CGRectMake(18, 3, 290, 24)];
           lblenterPCode.text = @"Enter a Passcode";
           lblenterPCode.textAlignment = UITextAlignmentCenter;
           lblenterPCode.textColor = [UIColor grayColor];
           lblenterPCode.shadowColor = [UIColor blackColor];
           lblenterPCode.shadowOffset = CGSizeMake(1,1);
           lblenterPCode.font = [UIFont boldSystemFontOfSize:ceilf(22)];
           lblenterPCode.backgroundColor = [UIColor clearColor];
           [self.view addSubview:lblenterPCode];
           [lblenterPCode release];
        
           lbldisplaycodes = [[UILabel alloc] initWithFrame:CGRectMake(30, 30, 110, 30)];
           lbldisplaycodes.text = @"";
           lbldisplaycodes.textAlignment = UITextAlignmentCenter;
           lbldisplaycodes.textColor = [UIColor grayColor];
           //lbldisplaycodes.shadowColor = [UIColor blackColor];
           //lbldisplaycodes.shadowOffset = CGSizeMake(1,1);
           lbldisplaycodes.font = [UIFont systemFontOfSize:ceilf(15)];
           lbldisplaycodes.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"codelabelbckgrnd.png"]];
           [self.view addSubview:lbldisplaycodes];
           [lbldisplaycodes release];
           
           lblfiveMin = [[UILabel alloc] initWithFrame:CGRectMake(83, 43, 145, 30)];
           lblfiveMin.text = @"";
           lblfiveMin.textAlignment = UITextAlignmentCenter;
           lblfiveMin.textColor = [UIColor grayColor];
           lblfiveMin.shadowColor = [UIColor blackColor];
           lblfiveMin.shadowOffset = CGSizeMake(1,1);
           lblfiveMin.font = [UIFont boldSystemFontOfSize:ceilf(15)];
           lblfiveMin.backgroundColor = [UIColor clearColor];
           [self.view addSubview:lblfiveMin];
           [lblfiveMin release];
       
    }
    else
    {                 //*************** P A T T E R N    P A D  ******************************** 
        
    if(isEntry)   // NEEDS Remaiing attempts!
    {
        lblenterPCode = [[UILabel alloc] initWithFrame:CGRectMake(13, 50, 290, 30)];
        lblenterPCode.text = @"Draw the Passcode Pattern";
        lblenterPCode.font = [UIFont boldSystemFontOfSize:ceilf(18)];

    }
    else
    {
        lblenterPCode = [[UILabel alloc] initWithFrame:CGRectMake(10, 20, 290, 30)];
        lblenterPCode.text = @"Draw a Passcode Pattern";
        lblenterPCode.font = [UIFont boldSystemFontOfSize:ceilf(24)];
         
        lblfiveMin = [[UILabel alloc] initWithFrame:CGRectMake(83, 43, 145, 30)];
        lblfiveMin.text = @"5 Points Minimum.";
        lblfiveMin.textAlignment = UITextAlignmentCenter;
        lblfiveMin.textColor = [UIColor grayColor];
        lblfiveMin.shadowColor = [UIColor blackColor];
        lblfiveMin.shadowOffset = CGSizeMake(1,1);
        lblfiveMin.font = [UIFont boldSystemFontOfSize:ceilf(15)];
        lblfiveMin.backgroundColor = [UIColor clearColor];
        [self.view addSubview:lblfiveMin];
        [lblfiveMin release];


    }
        
 	lblenterPCode.textAlignment = UITextAlignmentCenter;
	lblenterPCode.textColor = [UIColor grayColor];
	lblenterPCode.shadowColor = [UIColor blackColor];
	lblenterPCode.shadowOffset = CGSizeMake(1,1);
	lblenterPCode.backgroundColor = [UIColor clearColor];
    [self.view addSubview:lblenterPCode];
	[lblenterPCode release];
    
            
        
    if(!isEntry)
    {
    
    buttonClear = [[UIButton alloc] initWithFrame:CGRectMake(21, 365, 280, 34) ];
  	[buttonClear setTitle:@"Clear Passcode" forState:UIControlStateNormal];
	[buttonClear setTitle:@"Clear Passcode" forState:UIControlEventTouchDown];
    [buttonClear setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [buttonClear setTitleColor:[UIColor grayColor] forState:UIControlEventTouchDown];
    UIImage* myClearButtonImage = [UIImage imageNamed:@"280x34_Up.png"];
    [buttonClear setBackgroundImage:myClearButtonImage forState:UIControlStateNormal];   
    UIImage* myClearButtonDownImage = [UIImage imageNamed:@"280x34_Down.png"];
    [buttonClear setBackgroundImage:myClearButtonDownImage forState:UIControlEventTouchDown];   
    buttonClear.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    buttonClear.backgroundColor = [UIColor clearColor];
    [buttonClear addTarget:self action:@selector(performClear) forControlEvents:UIControlEventTouchUpInside];   // formerly buttonAction
    [self.view addSubview:buttonClear]; 
    }
        
    }
       
    //                    /*************** B O T H    N U M E R I C    A N D   P A T T E R N     P A D  ********************************   
    if(isEntry)
    {
        buttonRecover = [[UIButton alloc] initWithFrame:CGRectMake(21, 400, 280, 34) ];
        [buttonRecover setTitle:@"Recover Lost Password" forState:UIControlStateNormal];
        [buttonRecover setTitle:@"Recover Lost Password" forState:UIControlEventTouchDown];
        [buttonRecover setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        UIImage* myBackButtonImage = [UIImage imageNamed:@"280x34_Up.png"];
        [buttonRecover setBackgroundImage:myBackButtonImage forState:UIControlStateNormal];   
        UIImage* myBackButtonDownImage = [UIImage imageNamed:@"280x34_Down.png"];
        [buttonRecover setBackgroundImage:myBackButtonDownImage forState:UIControlEventTouchDown];   
        buttonRecover.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
        buttonRecover.backgroundColor = [UIColor clearColor];
        [buttonRecover addTarget:self action:@selector(performRecover) forControlEvents:UIControlEventTouchUpInside];   // formerly buttonAction
        [self.view addSubview:buttonRecover]; 
           
    }
    else
    {
    buttonBack = [[UIButton alloc] initWithFrame:CGRectMake(21, 415, 130, 37) ];
  	[buttonBack setTitle:@"Back" forState:UIControlStateNormal];
	[buttonBack setTitle:@"Back" forState:UIControlEventTouchDown];
    [buttonBack setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    UIImage* myBackButtonImage = [UIImage imageNamed:@"130x37_Up.png"];
    [buttonBack setBackgroundImage:myBackButtonImage forState:UIControlStateNormal];   
    UIImage* myBackButtonDownImage = [UIImage imageNamed:@"130x37_Down.png"];
    [buttonBack setBackgroundImage:myBackButtonDownImage forState:UIControlEventTouchDown];   
 	buttonBack.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
	buttonBack.backgroundColor = [UIColor clearColor];
	[buttonBack addTarget:self action:@selector(performTransitionBack) forControlEvents:UIControlEventTouchUpInside];   // formerly buttonAction
	[self.view addSubview:buttonBack]; 
    
    
    buttonNext = [[UIButton alloc] initWithFrame:CGRectMake(170, 415, 130, 37) ];
	[buttonNext setTitle:@"Next" forState:UIControlStateNormal];
	[buttonNext setTitle:@"Next" forState:UIControlEventTouchDown];
	[buttonNext setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [buttonNext setTitleColor:[UIColor grayColor] forState:UIControlEventTouchDown];
    UIImage* myNextButtonImage = [UIImage imageNamed:@"130x37_Up.png"];
    [buttonNext setBackgroundImage:myNextButtonImage forState:UIControlStateNormal]; 
    UIImage* myNextButtonDownImage = [UIImage imageNamed:@"130x37_Down.png"];
    [buttonNext setBackgroundImage:myNextButtonDownImage forState:UIControlEventTouchDown];   
   	buttonNext.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
	buttonNext.backgroundColor = [UIColor clearColor];
	[buttonNext addTarget:self action:@selector(performTransitionNext) forControlEvents:UIControlEventTouchUpInside];   // formerly buttonAction
	[self.view addSubview:buttonNext]; // need to release original?
    }
    
} 

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // here we will check the mode flag to see if we are doing two for transition (set up mode)
    // or one for entry mode.
    
    // also we will check for if we are doing it in pattern mode or combination mode
    
    if (isNumericPad)
    {
          
        KeyPadView1 = [[KeyPadView alloc] initWithFrame:CGRectMake(0, 70, 321, 335)];
        KeyPadView1.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
        KeyPadView1.myViewController =  self;
        //KeyPadView1.instnum = @"ONE";
        //[KeyPadView1 setBackgroundColor:[UIColor redColor]];   
        
        KeyPadView2 = [[KeyPadView alloc] initWithFrame:CGRectMake(0, 70, 321, 335)];
        KeyPadView2.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
        KeyPadView2.myViewController =  self;
        
        //KeyPadView2.instnum = @"TWO";   
        //[KeyPadView2 setBackgroundColor:[UIColor blackColor]]; 
        
        [self.view addSubview:KeyPadView1]; 
        [self.view addSubview:KeyPadView2]; 
        
        KeyPadView1.hidden = NO;
        KeyPadView2.hidden = YES;
              
    }    
    else
    {
        KeyPatternView1 = [[KeyPatternView alloc] initWithFrame:CGRectMake(0, 90, 320, 260)];
        KeyPatternView1.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
        //[KeyPatternView1 setBackgroundColor:[UIColor blueColor]];       
        
        KeyPatternView2 = [[KeyPatternView alloc] initWithFrame:CGRectMake(0, 90, 320, 260)];
        KeyPatternView2.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;  
        //[KeyPatternView2 setBackgroundColor:[UIColor redColor]];
        
        [self.view addSubview:KeyPatternView1]; 
        [self.view addSubview:KeyPatternView2]; 
     
        KeyPatternView1.hidden = NO;
        KeyPatternView2.hidden = YES;

    }
       
    
}
-(void)performClear
{
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"CLEARED" message:@"Pass Pattern Cleared" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
	[alert show];
	[alert release];
    [KeyPatternView1 ClearKeyCombination];
    [KeyPatternView2 ClearKeyCombination];
    
    
}    

-(void)performRecover
{
	    
    
}    


-(void)performTransitionNext
{
	// First create a CATransition object to describe the transition
	CATransition *transition = [CATransition animation];
    
	// Animate over 3/4 of a second
	transition.duration = 0.75;
	// using the ease in/out timing function
	transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
	
	// Now to set the type of transition.
	//kCATransitionMoveIn, kCATransitionPush, kCATransitionReveal, kCATransitionFade};
    
	//NSString *subtypes[4] = {kCATransitionFromLeft, kCATransitionFromRight, kCATransitionFromTop, kCATransitionFromBottom};
    
    
	transition.type = kCATransitionMoveIn;
	transition.subtype = kCATransitionFromRight;
	
	
	// Finally, to avoid overlapping transitions we assign ourselves as the delegate for the animation and wait for the
	// -animationDidStop:finished: message. When it comes in, we will flag that we are no longer transitioning.
    
	transitioning = YES;
	//transition.delegate = self;
	
	// Next add it to the containerView's layer. This will perform the transition based on how we change its contents.
	[self.view.layer addAnimation:transition forKey:nil];
	
	// Here we hide view1, and show view2, which will cause Core Animation to animate view1 away and view2 in.
    
    if (isNumericPad)
    {
        KeyPadView1.hidden = YES;
        KeyPadView2.hidden = NO;
        
        [buttonNext setTitle:@"Save" forState:UIControlStateNormal];
        [buttonNext setTitle:@"Save" forState:UIControlEventTouchDown];
        [buttonNext removeTarget:self action:@selector(performTransitionNext) forControlEvents:UIControlEventTouchUpInside]; 
        [buttonNext addTarget:self action:@selector(performSave) forControlEvents:UIControlEventTouchUpInside];
        
        lblenterPCode.text = @"Re Enter the Passcode";
        lblfiveMin.text = @"";    
        if (rswitchshowhide.isOn)
        {
            lbldisplaycodes.text = KeyPadView2->strkeycombination;
        }
        else
        {
            lbldisplaycodes.text = @"";
        }

    }
    else
    {
        KeyPatternView1.hidden = YES;
        KeyPatternView2.hidden = NO;
    
        [buttonNext setTitle:@"Save" forState:UIControlStateNormal];
        [buttonNext setTitle:@"Save" forState:UIControlEventTouchDown];
        [buttonNext removeTarget:self action:@selector(performTransitionNext) forControlEvents:UIControlEventTouchUpInside]; 
        [buttonNext addTarget:self action:@selector(performSave) forControlEvents:UIControlEventTouchUpInside];
    
        lblenterPCode.text = @"Redraw the Passcode";
        lblfiveMin.text = @"";    
    }
    
}

-(void)performTransitionBack
{
	// First create a CATransition object to describe the transition
	CATransition *transition = [CATransition animation];
    
	// Animate over 3/4 of a second
	transition.duration = 0.75;
	// using the ease in/out timing function
	transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
	
	// Now to set the type of transition.
	//kCATransitionMoveIn, kCATransitionPush, kCATransitionReveal, kCATransitionFade};
    
	//NSString *subtypes[4] = {kCATransitionFromLeft, kCATransitionFromRight, kCATransitionFromTop, kCATransitionFromBottom};
    
    
	transition.type = kCATransitionMoveIn;
	transition.subtype = kCATransitionFromLeft;
	
	
	// Finally, to avoid overlapping transitions we assign ourselves as the delegate for the animation and wait for the
	// -animationDidStop:finished: message. When it comes in, we will flag that we are no longer transitioning.
    
	transitioning = YES;
	//transition.delegate = self;
	
	// Next add it to the containerView's layer. This will perform the transition based on how we change its contents.
	[self.view.layer addAnimation:transition forKey:nil];
	
	// Here we hide view1, and show view2, which will cause Core Animation to animate view1 away and view2 in.
 
    
    if (isNumericPad)
    {
             
        KeyPadView1.hidden = NO;
        KeyPadView2.hidden = YES;	
        
        [buttonNext setTitle:@"Next" forState:UIControlStateNormal];
        [buttonNext setTitle:@"Next" forState:UIControlEventTouchDown];
        [buttonNext removeTarget:self action:@selector(performSave) forControlEvents:UIControlEventTouchUpInside]; 
        [buttonNext addTarget:self action:@selector(performTransitionNext) forControlEvents:UIControlEventTouchUpInside]; 
        
        lblenterPCode.text = @"Enter a Passcode";
        lblfiveMin.text = @""; 
        if (rswitchshowhide.isOn)
        {
          lbldisplaycodes.text = KeyPadView1->strkeycombination;
        }
        else
        {
            lbldisplaycodes.text = @"";
        }

              
    }
    else
    {
        KeyPatternView1.hidden = NO;
        KeyPatternView2.hidden = YES;	
           
        [buttonNext setTitle:@"Next" forState:UIControlStateNormal];
        [buttonNext setTitle:@"Next" forState:UIControlEventTouchDown];
        [buttonNext removeTarget:self action:@selector(performSave) forControlEvents:UIControlEventTouchUpInside]; 
        [buttonNext addTarget:self action:@selector(performTransitionNext) forControlEvents:UIControlEventTouchUpInside]; 
    
        lblenterPCode.text = @"Draw a Passcode Pattern";
        lblfiveMin.text = @"5 Points Minimum.";    
    
    }

    
}

- (void)rswitchshowhideToggled:(id)sender
{
    DCRoundSwitch *myswitch = (DCRoundSwitch *)sender;
    if (myswitch.isOn)
    {
     if (isNumericPad)    
     {
         
         if (KeyPadView1 !=nil)                       
         {
             
             if (!KeyPadView1.hidden)      
             {
             lbldisplaycodes.text = KeyPadView1->strkeycombination;
             }
         }
        
         if (KeyPadView2 !=nil) 
         {
             if (!KeyPadView2.hidden)      
             {
                 lbldisplaycodes.text = KeyPadView2->strkeycombination;
             }

         }
       }   
    }
    else
    {
    lbldisplaycodes.text = @"";
    }
    
}


-(void)performSave
{
    if (isNumericPad)    
    {

      if ([KeyPadView1->strkeycombination isEqualToString:KeyPadView2->strkeycombination])
      {    
        //save combo
      }
      else
      {
      UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Passcode Issue" message:@"Passcodes did not match" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
	  [alert show];
	  [alert release];
      }
    }
    else
    {
        NSLog(@"KeyPatternView1: %@",  KeyPatternView1->strkeycombination);
        NSLog(@"KeyPatternView2: %@",  KeyPatternView2->strkeycombination);
        
        if ([KeyPatternView1->strkeycombination isEqualToString:KeyPatternView2->strkeycombination])
        {
            
        }
        else
        {
          UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Passcode Issue" message:@"Passcodes did not match" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
          [alert show];
          [alert release];
        }
            
            
            
    }
        
      
}

// keyCombination[9];
// keyComboCount;




-(void)displayCombo:(NSString*)combo
{
    if (rswitchshowhide.isOn)
    {
        lbldisplaycodes.text = combo;
    }
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    
    for (UIView *aView in [self.view subviews])
    {
        [aView removeFromSuperview];
        aView.hidden = YES;   
        [aView release];
        aView = nil; 
        
    }   
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
