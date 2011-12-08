//
//  ScrollingBackground.h
//  KittensVPuppies
//
//  Created by Nicholas Locascio on 12/7/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "NSQueue.h"

@interface ScrollingBackground : CCLayer {
    NSQueue *spriteQueue;
    NSString *spriteString;
    float parallaxConstant;
    float posX, velX;
}

-(void)update:(ccTime)dt;
-(void)scroll:(ccTime)dt;
-(void)addNew;
-(void)checkAdd;
-(void)checkDelete;

@end
