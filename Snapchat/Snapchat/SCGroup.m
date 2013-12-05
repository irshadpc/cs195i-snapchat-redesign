//
//  SCGroup.m
//  Snapchat
//
//  Created by Jake Kaufman on 12/4/13.
//  Copyright (c) 2013 Jessica Liang. All rights reserved.
//

#import "SCGroup.h"

@implementation SCGroup
//nothing see properties synthesized in groups.h
@synthesize groupname;
@synthesize friends;
- (id)init {
    self = [super init];
    if (self) {
        self.friends = [NSMutableArray array];
    }
    return self;
}
@end
