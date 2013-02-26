//
//  TestTTSoftFollowLayer.m
//  TaoruTools
//
//  Created by taoru on 13/02/27.
//  Copyright (c) 2013年 taoru. All rights reserved.
//

#import "TestTTSoftFollowLayer.h"
#import "TTSoftFollow.h"

@interface TestTTSoftFollowLayer ()

@property (nonatomic, retain) CCSprite *dragSprite;

@end

@implementation TestTTSoftFollowLayer

- (id)init
{
    if (self = [super init]) {
        
        _dragSprite = [[CCSprite spriteWithFile:@"Icon-72.png"] retain];
        _dragSprite.position = ccpMult(ccpFromSize(self.contentSize), 0.5f);
        [self addChild:_dragSprite];
        
        CCSprite *followNode1 = [CCSprite spriteWithFile:@"Icon-72.png"];
        CCSprite *followNode2 = [CCSprite spriteWithFile:@"Icon-72.png"];
        CCSprite *followNode3 = [CCSprite spriteWithFile:@"Icon-72.png"];
        
        followNode1.color = ccRED;
        followNode2.color = ccGREEN;
        followNode3.color = ccYELLOW;
        
        [followNode1 runAction:[TTSoftFollow actionWithTarget:_dragSprite strength:0.2f distance:50.0f]];
        [followNode2 runAction:[TTSoftFollow actionWithTarget:followNode1 strength:0.2f distance:50.0f]];
        [followNode3 runAction:[TTSoftFollow actionWithTarget:followNode2 strength:0.2f distance:50.0f]];
        
        [self addChild:followNode1];
        [self addChild:followNode2];
        [self addChild:followNode3];
        
        self.touchEnabled = YES;
    }
    return self;
}

- (void)dealloc
{
    self.dragSprite = nil;
    [super dealloc];
}

- (void)ccTouchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint touchPoint = [[CCDirector sharedDirector] convertTouchToGL:touch];
    
    self.dragSprite.position = touchPoint;
}

@end
