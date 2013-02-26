//
//  TTSoftFollow.m
//  TTSoftFollow
//
//  Created by taoru on 13/02/26.
//  Copyright (c) 2013年 taoru. All rights reserved.
//

#import "TTSoftFollow.h"
#import "CGPointExtension.h"

@interface TTSoftFollow ()

@property (nonatomic, retain) CCNode  *followedNode;
@property (nonatomic, assign) CGFloat strength;
@property (nonatomic, assign) CGFloat distance;

@end

@implementation TTSoftFollow

+ (id)actionWithTarget:(CCNode *)followedNode
{
    return [self actionWithTarget:followedNode strength:1.0f];
}

+ (id)actionWithTarget:(CCNode *)followedNode strength:(float)strength
{
    return [self actionWithTarget:followedNode strength:strength distance:0.0f];
}

+ (id)actionWithTarget:(CCNode *)followedNode strength:(float)strength distance:(float)distance
{
    return [[[self alloc] initWithTarget:followedNode strength:strength distance:distance] autorelease];
}

- (id)initWithTarget:(CCNode *)followedNode strength:(float)strength distance:(float)distance
{
    if (self = [super init]) {
        _followedNode   = [followedNode retain];
        _strength       = strength;
        _distance       = distance;
    }
    return self;
}

- (id)copyWithZone:(NSZone *)zone
{
    CCAction *copy = [[[self class] allocWithZone:zone] init];
    copy.tag = _tag;
    return copy;
}

- (void)dealloc
{
    [_followedNode release];
    [super dealloc];
}

- (void)step:(ccTime)dt
{
    float distX = self.followedNode.position.x - [_target position].x;
    float distY = self.followedNode.position.y - [_target position].y;
    kmVec2 nodeToTargetVec = (kmVec2){distX,distY};
    
    if (kmVec2Length(&nodeToTargetVec) > _distance) {
        // ベクトルをdistanceの大きさまで縮める
        kmVec2 goalToTargetVec;
        kmVec2Scale(&goalToTargetVec, &nodeToTargetVec, _distance/kmVec2Length(&nodeToTargetVec));
        
        // nodeからgoalまでのベクトル
        kmVec2 nodeToGoalVec;
        kmVec2Subtract(&nodeToGoalVec, &nodeToTargetVec, &goalToTargetVec);
        
        // strengthを乗算
        kmVec2 resultVec;
        kmVec2Scale(&resultVec, &nodeToGoalVec, min(_strength,1));
        
        // 単位ベクトル分だけ必ず進むようにする
        if (kmVec2Length(&resultVec) < 1) {
            kmVec2Normalize(&resultVec, &resultVec);
        }
        
        [_target setPosition:ccpAdd([_target position], ccp(resultVec.x, resultVec.y))];
    }
}

- (BOOL)isDone
{
    return !self.followedNode.isRunning;
}

@end
