//
//  NSQueue.h
//  KittensVPuppies
//
//  Created by Nicholas Locascio on 12/7/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

@interface NSQueue:NSObject
{
    NSMutableArray* objects;
}
- (void)push:(id)object;
- (id)pop;
- (id)peekFirst;
- (id)peekLast;
- (NSMutableArray *)superPeek;
@end