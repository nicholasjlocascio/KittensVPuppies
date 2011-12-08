//
//  Hero.h
//  KittensVPuppies
//
//  Created by Nicholas Locascio on 12/7/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface Hero : CCSprite {
    CGPoint wh;
    float posY, velY, accY;
    float posX;
    NSString *selfTextureAtlas;
    int health;
    BOOL isScreenTouched;
    CCSprite *hSprite;
    int remainingJumps;
    int maxJumps;
    float impulse;
}

-(void) touchesBegan:(CGPoint) location;
-(void) touchesEnded:(CGPoint) location;
-(void) update:(ccTime)dt;
-(void) specialUpdate;
-(void) takeDamage;
-(void) handlePhysics:(ccTime)dt;
-(CGRect) getHeroRect;

@end
