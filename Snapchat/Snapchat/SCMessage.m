//
//  SCMessage.m
//  Snapchat
//
//  Created by Jessica Liang on 12/3/13.
//  Copyright (c) 2013 Jessica Liang. All rights reserved.
//

#import "SCMessage.h"

@implementation SCMessage
@synthesize  seen;
@synthesize isVideo;
@synthesize image;
@synthesize sender;
@synthesize timestamp;
@synthesize time;
@synthesize isRunning;
-(id)init {
    self = [super init];
    if (self) {
        self.isRunning = false;
    }
    return self;
}
@end
