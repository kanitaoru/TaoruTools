//
//  TTAbstractLayer.m
//  TaoruTools
//
//  Created by taoru on 13/02/27.
//  Copyright (c) 2013年 taoru. All rights reserved.
//

#import "TTAbstractLayer.h"

@implementation TTAbstractLayer

+ (CCScene *)scene
{
    CCScene *scene = [CCScene node];
    CCLayer *layer = [self node];
    
    [scene addChild:layer];
    return scene;
}

- (id)init
{
    if (self = [super init]) {
        
    }
    return self;
}

- (void)dealloc
{
    CCLOG(@"%@ : %@", self, NSStringFromSelector(_cmd));
    [super dealloc];
}

@end
