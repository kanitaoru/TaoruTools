//
//  TTSoftFollow.h
//  TTSoftFollow
//
//  Created by taoru on 13/02/26.
//  Copyright (c) 2013年 taoru. All rights reserved.
//

#import "CCNode.h"
#import "CCAction.h"

@interface TTSoftFollow : CCAction <NSCopying>

/**
 *  followedNode: 追いかける対象Node
 *  strength    : 引きよせる強さ。最大値は"1" 小さいほどゆったり追いかける。
 *  distance    : 対象と一定の距離を保ちたい場合に指定
 */
+ (id)actionWithTarget:(CCNode *)followedNode;
+ (id)actionWithTarget:(CCNode *)followedNode strength:(float)strength;
+ (id)actionWithTarget:(CCNode *)followedNode strength:(float)strength distance:(float)distance;

@end
