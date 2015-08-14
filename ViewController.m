//
//  ViewController.m
//  LJKeyLockPad
//
//  Created by Julie Johnson on 2/22/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
#import "KeyPadRootViewController.h"
#import "AppDelegate.h"
#import <QuartzCore/QuartzCore.h>

@implementation ViewController

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
    for (UIView *aView in [self.view subviews])
    {
        [aView removeFromSuperview];
        aView.hidden = YES;   
        [aView release];
        aView = nil; 
        
    }   
    
    NSLog(@"Memory Warning in RootViewController!!!!");

}

#pragma mark - View lifecycle

- (void)viewDidLoad   // You only come here if there are no UserDefaults set up for KeyPad type and KeyCombination
{
    [super viewDidLoad];
    
    hhiappDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
	   
    buttonCancel = [[UIButton alloc] initWithFrame:CGRectMake(21, 415, 130, 37) ];
  	[buttonCancel setTitle:@"Cancel" forState:UIControlStateNormal];
	[buttonCancel setTitle:@"Cancel" forState:UIControlEventTouchDown];
    [buttonCancel setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [buttonCancel setTitleColor:[UIColor grayColor] forState:UIControlEventTouchDown];
    UIImage* myBackButtonImage = [UIImage imageNamed:@"130x37_Up.png"];
    [buttonCancel setBackgroundImage:myBackButtonImage forState:UIControlStateNormal];   
    UIImage* myBackButtonDownImage = [UIImage imageNamed:@"130x37_Down.png"];
    [buttonCancel setBackgroundImage:myBackButtonDownImage forState:UIControlEventTouchDown];   
 	buttonCancel.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
	buttonCancel.backgroundColor = [UIColor clearColor];
	[buttonCancel addTarget:self action:@selector(performCancel) forControlEvents:UIControlEventTouchUpInside];   // formerly buttonAction
	[self.view addSubview:buttonCancel]; 
    
    buttonNext = [[UIButton alloc] initWithFrame:CGRectMake(170, 415, 130, 37)];
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
	[buttonNext addTarget:self action:@selector(performNext) forControlEvents:UIControlEventTouchUpInside];   // formerly buttonAction
	[self.view addSubview:buttonNext]; // need to release original?
    
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"gray-fabric-pattern.jpg"]]];
    
    NSArray *itemArray = [NSArray arrayWithObjects: @"Numeric", @"Pattern", nil];
    UISegmentedControl *segmentedControl = [[UISegmentedControl alloc] initWithItems:itemArray];
    segmentedControl.frame = CGRectMake(75, 200, 160, 37);
    segmentedControl.segmentedControlStyle = UISegmentedControlStylePlain;
    //segmentedControl.selectedSegmentIndex = 0;
    [segmentedControl addTarget:self action:@selector(pickOne:)forControlEvents:UIControlEventValueChanged];  
    
    [self.view  addSubview:segmentedControl];
    [segmentedControl release]; 
    
 
}



- (void) pickOne:(id)sender
{
    [keypadrootcontroller = [KeyPadRootViewController alloc] init];
    
    UISegmentedControl *segmentedControl = (UISegmentedControl *)sender;
    NSString *text;
    text = [segmentedControl titleForSegmentAtIndex: [segmentedControl selectedSegmentIndex]];
    
    if([segmentedControl selectedSegmentIndex] == 0) 
    {
              
        keypadrootcontroller.isNumericPad = TRUE; 
        
    }
    else
    {
     
        keypadrootcontroller.isNumericPad = FALSE;
        
        
    }

            
    
}

-(void)performNext
{
              
        keypadrootcontroller.isEntry = FALSE;         
        
        [self.view addSubview:keypadrootcontroller.view];    
       
        keypadrootcontroller.view.hidden = NO;
    
}

-(void)performCancel
{
	    
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

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
