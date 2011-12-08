//
//  NSQueue.m
//  KittensVPuppies
//
//  Created by Nicholas Locascio on 12/7/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//
#import "NSQueue.h"

@implementation NSQueue
- (id)init
{
    if (self=[super init])
    {
        objects=[[NSMutableArray alloc] init];
    }
    return self;
}
- (void)push:(id)object
{
    NSLog(@"rahha");
    [objects addObject:object];
    NSLog(@"guyguytgt%i", [objects count]);
}
- (id)pop
{
    id object=nil;
    if ([objects count])
    {
        object=[objects objectAtIndex:0];
        [object retain];
        [objects removeObjectAtIndex:0];
    }
    return [object autorelease];
}
- (NSMutableArray *)superPeek
{
    return objects;
}
- (id)peekFirst
{
    id object=nil;
    if ([objects count])
    {
        object=[objects objectAtIndex:0];
        [object retain];
    }
    return [object autorelease];
}
-(id)peekLast
{
    id object=nil;
    if ([objects count])
    {
        object=[objects objectAtIndex:[objects count] - 1];
        [object retain];
    }
    return [object autorelease];
}
@end