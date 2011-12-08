//
//  ScrollingBackground.m
//  KittensVPuppies
//
//  Created by Nicholas Locascio on 12/7/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ScrollingBackground.h"


@implementation ScrollingBackground

-(id) init
{
    if( (self=[super init])) {
            
        [[CCDirector sharedDirector] setProjection:CCDirectorProjection2D];
        
        spriteQueue = [NSQueue new];
        [spriteQueue init];
        spriteString = @"Default.png";
        
        CCSprite *newSprite = [CCSprite spriteWithFile:@"Default.png"];
        newSprite.position = ccp(240, 160);
        [spriteQueue push:newSprite];
        
        [self addChild:newSprite];
        
        NSMutableArray *curArray = [spriteQueue superPeek];
        NSLog(@"%i", [curArray count]);
        
        parallaxConstant = 5;
        velX = 5;
    }
        
    return self;
}

-(void)update:(ccTime)dt
{
    [self scroll:dt];
    [self checkAdd];
    [self checkDelete];
}

-(void)scroll:(ccTime)dt
{
    NSMutableArray *curArray = [spriteQueue superPeek];
    for(CCSprite *piece in curArray)
    {
        piece.position = ccp(piece.position.x - 2*dt * parallaxConstant * velX, piece.position.y);
    }
    NSLog(@"how many?? %i", [curArray count]);
}

-(void) checkAdd
{
    CCSprite *curSprite = [spriteQueue peekLast];
    if((curSprite.position.x + curSprite.contentSize.width/2) < 480)
    {
        [self addNew];
        //[self checkAdd];
    }
}

-(void) checkDelete
{
    CCSprite *curSprite = [spriteQueue peekFirst];
    if((curSprite.position.x + curSprite.contentSize.width/2) < 0)
    {
        [spriteQueue pop];
        [self removeChild:curSprite cleanup:YES];
        [self checkDelete];
    }
}

-(void) addNew
{
    CCSprite *newSprite = [CCSprite spriteWithFile:@"Default.png"];
    CCSprite *lastSprite = [spriteQueue peekLast];
    newSprite.position = ccp(lastSprite.position.x + floor(lastSprite.contentSize.width/2) + floor(newSprite.contentSize.width/2), 160);
    [spriteQueue push:newSprite];
    [self addChild:newSprite];
    NSLog(@"addedNow");
}




@end
