//
//  GameLayer.m
//  KittensVPuppies
//
//  Created by Nicholas Locascio on 12/7/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "GameLayer.h"


@implementation GameLayer


+(CCScene *) scene
{
	CCScene *scene = [CCScene node];
	
	GameLayer *layer = [GameLayer node];
	
	[scene addChild: layer];
	
	return scene;
}

-(id) init
{
	if( (self=[super init])) {
        
        player = [Hero node];
        player.position = ccp(0,0);
        [self addChild:player];
        [self scheduleUpdate];
        
        theBackground = [ScrollingBackground node];
        theBackground.position = ccp(0,0);
        [self addChild:theBackground];
        
        self.isTouchEnabled = YES;
        
    }
    
    return self;
}

-(void)update:(ccTime)dt
{
    [player update:dt];
    [theBackground update:dt];
}

-(void) ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInView:[touch view]];
    location = [[CCDirector sharedDirector] convertToGL:location];
    [player touchesBegan:location];
    
}

-(void) ccTouchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInView:[touch view]];
    location = [[CCDirector sharedDirector] convertToGL:location];
    [player touchesEnded:location];

    
}

-(void) ccTouchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInView:[touch view]];
    location = [[CCDirector sharedDirector] convertToGL:location];
    [player touchesEnded:location];

    
}

@end
