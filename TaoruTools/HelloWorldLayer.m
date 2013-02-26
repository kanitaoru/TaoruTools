//
//  HelloWorldLayer.m
//  TaoruTools
//
//  Created by taoru on 13/02/27.
//  Copyright taoru 2013年. All rights reserved.
//


// Import the interfaces
#import "HelloWorldLayer.h"

// Needed to obtain the Navigation Controller
#import "AppDelegate.h"

// Transition
#import "TestTTSoftFollowLayer.h"

@implementation HelloWorldLayer

+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	HelloWorldLayer *layer = [HelloWorldLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

-(id) init
{
	if( (self=[super init]) ) {
        
        CGSize size = [[CCDirector sharedDirector] winSize];

		// Default font size will be 28 points.
		[CCMenuItemFont setFontSize:28];
        
        CCMenuItemFont *itemSoftFollow = [CCMenuItemFont itemWithString:@"SoftFollow"
                                                                  block:^(id sender) {
                                                                      [[CCDirector sharedDirector] replaceScene:[TestTTSoftFollowLayer scene]];
                                                                  }];
		
		CCMenu *menu = [CCMenu menuWithItems:itemSoftFollow, nil];
		
		[menu alignItemsHorizontallyWithPadding:20];
		[menu setPosition:ccp( size.width/2, size.height/2 - 50)];
		
		// Add the menu to the layer
		[self addChild:menu];

	}
	return self;
}

- (void) dealloc
{
	[super dealloc];
}

@end
