//
//  KeyPadView.m
//  ViewTransitions
//
//  Created by Julie Johnson on 2/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "KeyPadView.h"
#import "AppDelegate.h"
#import "KeyPadRootViewController.h"

#define POINT_SIZE			30.0

#define CIRCLE_SIZE			75.0

#define CIRCLE_X_START		38.0

#define CIRCLE_Y_START		9.0

#define CIRCLE_X_PADDING	90.0

#define CIRCLE_Y_PADDING	80.0

@implementation KeyPadView
@synthesize keyMode;
@synthesize labelonetext;		
@synthesize labeltwotext;
@synthesize labelFont;
@synthesize labelFontBig;
@synthesize instnum;
@synthesize myViewController;

- (id)initWithFrame:(CGRect)frame 
{
    keyMode = keyMode;
    firstpass = TRUE;  
   
    hhiappDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    sharedModule = [[HHISoundModule alloc]init];
    
    
    if ((self = [super initWithFrame:frame]))
    {
		buttonspainted = NO;
		// Create rectangles to draw buttons in
		for(int i = 0; i < 12; i++)
		{
			// Calculate the row number
			int row = floor(i/3);
			
			// Calculate row position
			int rowPos = i % 3;
			
			// Create the rect calculating it's position on screen.
			keys[i] = CGRectMake(CIRCLE_X_START + (rowPos * CIRCLE_X_PADDING), //x
								 CIRCLE_Y_START + (row * CIRCLE_Y_PADDING),    //y
								 76,                                  //width
								 67);                                 //height
            
     	}
		
		self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"gray-fabric-pattern.jpg"]];
        //self.backgroundColor = [UIColor redColor];
        
        
}
    
    return self;
}

- (BOOL) isMultipleTouchEnabled {return NO;}

// Checks if the given point is inside a button. If so, the button position
// is returned. If not, -1 is returned.
-(int) isTouchingKey:(CGPoint)point
{
	// Go through our key rect array and see if the users' finger is
	// inside any of the rectangles
	for(int i = 0; i < 12; i++)
	{
		if(CGRectContainsPoint(keys[i], point))
		{
			return i;
		}
	}
	
	return -1;
}

-(void) addKeyToCombo:(int)keyNumber                  // simply add it to the array at the end
{
	keyCombination[keyComboCount] = keyNumber;        // prob want to add it to the text box here. just clear text box and put the whole thing in
	keyComboCount++;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
	NSLog(@"Touch began");
        
	//keyComboCount = 0;
	keyComboIsValid = YES;
	
	CGPoint touchLocation = [[touches anyObject] locationInView:self];
    
	currentKeyTouch = [self isTouchingKey:touchLocation];
	
	if(currentKeyTouch > -1)
	{
        int comboval = (currentKeyTouch+1);
        
        if (comboval == 11) comboval = 0;
        
        if ((comboval != 10) && (comboval != 12))
        {        
            if (strkeycombination == nil)
            {
               strkeycombination = [[NSString stringWithFormat:@"%i",comboval] retain];
            }
            else
            {
            NSString *oldText = strkeycombination;
            strkeycombination = [[strkeycombination stringByAppendingString:[NSString stringWithFormat:@"%i",comboval]]retain];
            [oldText release];
            }
        
		[self addKeyToCombo:comboval];
        [sharedModule.Warning play];         // here!!!
         NSLog(@"combination: %@ ", strkeycombination);   
        [myViewController displayCombo:strkeycombination]; 
        }
        
        if (comboval == 10) 
        {        
         [myViewController displayCombo:@""]; 
         strkeycombination = @"";       //leak?
         keyComboCount = 0;
        [self setNeedsDisplay];
        }
        
        if (comboval == 12) 
        {        
            int combolength = strkeycombination.length;
            if (combolength > 0)
            {
             NSString *oldText = strkeycombination;
             strkeycombination = [[strkeycombination substringToIndex:combolength-1]retain];
             [oldText release];
             [myViewController displayCombo:strkeycombination]; 
            }
        }

    }

	
	[self setNeedsDisplay];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
	if(keyComboCount > 0)
	{
		// This occurs when the user lifts their finger from the screen
		NSLog(@"Touch ended");
		currentKeyTouch = -1;
		[self setNeedsDisplay];
        
		// If a delegate is set we want to inform which keys has been touched
//		if(delegate != nil)
//		{
//			NSMutableArray *keyCombo = [[[NSMutableArray alloc] init] autorelease];
//            
//			for(int i = 0; i < keyComboCount; i++)
//			{
//				[keyCombo addObject:[NSNumber numberWithInt:keyCombination[i]]];
//			}
//            
//			[delegate validateKeyCombination:keyCombo sender:self];
//		}
	}
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
//	CGPoint touchLocation = [[touches anyObject] locationInView:self];
//    
//    
//    
//    
//    
//	key = [self isTouchingKey:touchLocation];
//    
//    
//    
//    
//	
//	if(key > -1 && key != currentKeyTouch)      //currentKeyTouch is the LAST key touched misnomer!
//	{
//		BOOL addToCombo = YES;
//		
//		for(int i = 0; i < keyComboCount; i++)  // look and see if the key is in the list no duplicates allowed
//		{
//			if(keyCombination[i] == key)
//			{
//				addToCombo = NO;
//				break;
//			}
//		}
//		
//		if(addToCombo)
//		{
//			[self addKeyToCombo:key];   
//		}
//		
//	}
//	
//	currentKeyTouch = key; // set last key touched to this one.
//	
//	[self setNeedsDisplay];
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect                                    //draw rect is called every time the view needs or might need re painting. its called when the
{                                                                //view comes into being, or when its touched etc. just like an invalidated windows region in windows. 
 	
	CGContextRef context = UIGraphicsGetCurrentContext();
    
	    
    for(int i = 0; i < 12; i++)
    {
        // Calculate the row number
        int row = floor(i/3);
        
        // Calculate row position
        int rowPos = i % 3;
        
        myButtons[i] = [CALayer layer];
        myButtons[i].name = @"Button"; 
        myButtons[i].position=CGPointMake((CIRCLE_X_START) + (rowPos * CIRCLE_X_PADDING),(CIRCLE_Y_START) + (row * CIRCLE_Y_PADDING)); 
        
        myButtons[i].contents = (id)[[UIImage imageNamed:@"76x67_Up.png"] CGImage];
        
        if (currentKeyTouch == i && !firstpass)
        {
                myButtons[i].contents = (id)[[UIImage imageNamed:@"76x67_Down.png"] CGImage];
        }
        
        firstpass = FALSE;
                     
        //myButtons[i].contentsRect = CGRectMake(0.0f,0.0f,1.0f,1.0f);
        myButtons[i].bounds = CGRectMake(0.0f,0.0f,76.0f,67.0f);    // upperleft then width height
        //myButtons[i].backgroundColor = [UIColor lightGrayColor].CGColor;
        myButtons[i].cornerRadius = 5.0;
        myButtons[i].shadowOffset = CGSizeMake(0, 5);
        //myButtons[i].shadowRadius = 5.0;
        //myButtons[i].shadowColor = [UIColor blackColor].CGColor;
        //myButtons[i].shadowOpacity = 0.3;
        //myButtons[i].borderColor = [UIColor grayColor].CGColor; //border is in image
        //myButtons[i].borderWidth = 2.0;
        myButtons[i].masksToBounds =NO;
        myButtons[i].opaque = YES;
        [[self layer] addSublayer:myButtons[i]];  
        UIGraphicsBeginImageContext(myButtons[i].bounds.size);
        [myButtons[i] renderInContext:UIGraphicsGetCurrentContext()];
        UIImage *viewImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        [viewImage drawAtPoint:CGPointMake((CIRCLE_X_START-5) + (rowPos * CIRCLE_X_PADDING),(CIRCLE_Y_START-5) + (row * CIRCLE_Y_PADDING))];
        [myButtons[i] removeFromSuperlayer];
              
        UIGraphicsPushContext(context);
    	    
        // 'labelone' 
        CGPoint labeloneTextPoint = CGPointMake((CIRCLE_X_START+24) + (rowPos * CIRCLE_X_PADDING),(CIRCLE_Y_START+4) + (row * CIRCLE_Y_PADDING));
        CGPoint labeltwoTextPoint;
        
        [[UIColor grayColor] set];
        
        int j = i+1;
        
        
        if (j < 10)
        {
        
        self.labelonetext = [NSString stringWithFormat:@"%i",j];
                       
        [self.labelonetext drawAtPoint:labeloneTextPoint withFont:[UIFont boldSystemFontOfSize:ceilf(26)]];
        
        }
        
            
        switch (j)
        {
            case 1:
                
                //self.labeltwotext = @"";
                self.labeltwotext = self.instnum;

                
                labeltwoTextPoint = CGPointMake((CIRCLE_X_START+11) + (rowPos * CIRCLE_X_PADDING),(CIRCLE_Y_START + 35) + (row * CIRCLE_Y_PADDING));
                
                [self.labeltwotext drawAtPoint:labeltwoTextPoint withFont:[UIFont boldSystemFontOfSize:ceilf(13)]];
                
                break;
                
            case 2:
                
                self.labeltwotext = @"ABC";
                labeltwoTextPoint = CGPointMake((CIRCLE_X_START+19) + (rowPos * CIRCLE_X_PADDING),(CIRCLE_Y_START + 35) + (row * CIRCLE_Y_PADDING));
                
                [self.labeltwotext drawAtPoint:labeltwoTextPoint withFont:[UIFont boldSystemFontOfSize:ceilf(13)]];
                
                break;
                
            case 3:
                
                self.labeltwotext = @"DEF";
                labeltwoTextPoint = CGPointMake((CIRCLE_X_START+19) + (rowPos * CIRCLE_X_PADDING),(CIRCLE_Y_START + 35) + (row * CIRCLE_Y_PADDING));
                
                [self.labeltwotext drawAtPoint:labeltwoTextPoint withFont:[UIFont boldSystemFontOfSize:ceilf(13)]];

                break;
                
            case 4:
                
                self.labeltwotext = @"GHI";
                labeltwoTextPoint = CGPointMake((CIRCLE_X_START+19) + (rowPos * CIRCLE_X_PADDING),(CIRCLE_Y_START + 35) + (row * CIRCLE_Y_PADDING));
                [self.labeltwotext drawAtPoint:labeltwoTextPoint withFont:[UIFont boldSystemFontOfSize:ceilf(13)]];

                break;
                
            case 5:
                
                self.labeltwotext = @"JKL";
                labeltwoTextPoint = CGPointMake((CIRCLE_X_START+19) + (rowPos * CIRCLE_X_PADDING),(CIRCLE_Y_START + 35) + (row * CIRCLE_Y_PADDING));
                [self.labeltwotext drawAtPoint:labeltwoTextPoint withFont:[UIFont boldSystemFontOfSize:ceilf(13)]];

                break;
                
            case 6:
                
                self.labeltwotext = @"MNO";
                labeltwoTextPoint = CGPointMake((CIRCLE_X_START+17) + (rowPos * CIRCLE_X_PADDING),(CIRCLE_Y_START + 35) + (row * CIRCLE_Y_PADDING));
                [self.labeltwotext drawAtPoint:labeltwoTextPoint withFont:[UIFont boldSystemFontOfSize:ceilf(13)]];

                break;
                
            case 7:
                
                self.labeltwotext = @"PQRS";
                labeltwoTextPoint = CGPointMake((CIRCLE_X_START+15) + (rowPos * CIRCLE_X_PADDING),(CIRCLE_Y_START + 35) + (row * CIRCLE_Y_PADDING));
                [self.labeltwotext drawAtPoint:labeltwoTextPoint withFont:[UIFont boldSystemFontOfSize:ceilf(13)]];
                
                break;
                
            case 8:
                
                self.labeltwotext = @"TUV";
                labeltwoTextPoint = CGPointMake((CIRCLE_X_START+19) + (rowPos * CIRCLE_X_PADDING),(CIRCLE_Y_START + 35) + (row * CIRCLE_Y_PADDING));
                [self.labeltwotext drawAtPoint:labeltwoTextPoint withFont:[UIFont boldSystemFontOfSize:ceilf(13)]];
                
                break;

            case 9:
                
                self.labeltwotext = @"WXYZ";
                labeltwoTextPoint = CGPointMake((CIRCLE_X_START+12) + (rowPos * CIRCLE_X_PADDING),(CIRCLE_Y_START + 35) + (row * CIRCLE_Y_PADDING));
                [self.labeltwotext drawAtPoint:labeltwoTextPoint withFont:[UIFont boldSystemFontOfSize:ceilf(13)]];
                
                break;
                
            case 10:
                
                self.labelonetext = @"Clear";
                labeloneTextPoint = CGPointMake((CIRCLE_X_START+9) + (rowPos * CIRCLE_X_PADDING),(CIRCLE_Y_START+4) + (row * CIRCLE_Y_PADDING));
                [self.labelonetext drawAtPoint:labeloneTextPoint withFont:[UIFont boldSystemFontOfSize:ceilf(20)]];

                break;
                
            case 11:
                
                self.labelonetext = @"0";
                [self.labelonetext drawAtPoint:labeloneTextPoint withFont:[UIFont boldSystemFontOfSize:ceilf(26)]];
                
                break;
                
            case 12:
                
                self.labelonetext = @"Del";
                labeloneTextPoint = CGPointMake((CIRCLE_X_START+9) + (rowPos * CIRCLE_X_PADDING),(CIRCLE_Y_START+4) + (row * CIRCLE_Y_PADDING));
                [self.labelonetext drawAtPoint:labeloneTextPoint withFont:[UIFont boldSystemFontOfSize:ceilf(20)]];

                
      }

        UIGraphicsPopContext();
       
    }   
    
        
}
- (UIFont *)labelFont
{
	return [UIFont boldSystemFontOfSize:ceilf(myButtons[1].bounds.size.height * .6)]; // use the size of one calayer button cuz they are all the same size anyway.
}

- (UIFont *)labelFontBig
{
	return [UIFont boldSystemFontOfSize:ceilf(myButtons[1].bounds.size.height)]; // use the size of one calayer button cuz they are all the same size anyway.
}

-(void)deemKeyCombinationInvalid
{
	keyComboIsValid = NO;
	[self setNeedsDisplay];
}

- (void)dealloc
{

  [sharedModule release];
  [hhiappDelegate release]; 
  [strkeycombination release]; 
  [super dealloc];
}

@end
