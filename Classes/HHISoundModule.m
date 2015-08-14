//
//  HHISoundModule.m
//  Beach Havoc
//
//  Created by Lewis W. Johnson on 8/11/15.
//  Copyright (c) 2015 Hamilton Holt Incorporated. All rights reserved.
//

#import "HHISoundModule.h"

@implementation HHISoundModule

@synthesize Warning;

#pragma mark - Convenience Constructor & Init

+ (HHISoundModule *)sharedModule
{
    static dispatch_once_t onceToken = 0;
    
    __strong static id _sharedObject = nil;
    dispatch_once(&onceToken, ^{
        _sharedObject = [[self alloc] init];
    });
    return _sharedObject;
}

- (id)init
{
    if(self = [super init])
    {
        NSError* error = nil;
        NSURL * soundFileURL= [[NSBundle mainBundle] URLForResource:@"tap" withExtension:@"caf"];
        Warning = [[AVAudioPlayer alloc] initWithContentsOfURL:soundFileURL error:&error];
        if (error != nil) NSLog(@"Failed to load the sound:warningbeep %@", [error localizedDescription]);
        Warning.volume = 1;
//        _Warning.numberOfLoops = -1;
        [Warning prepareToPlay];
//        [_Warning play];
        
        
    }
    
    return self;
}

- (void) poot
{
    
}






@end
