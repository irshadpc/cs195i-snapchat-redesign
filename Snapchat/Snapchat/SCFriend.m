//
//  SCFriend.m
//  Snapchat
//
//  Created by Jessica Liang on 12/3/13.
//  Copyright (c) 2013 Jessica Liang. All rights reserved.
//

#import "SCFriend.h"

@implementation SCFriend
@synthesize username;
@synthesize nickname;
@synthesize bestFriends;
@synthesize points;
@synthesize groups;
@synthesize isBlocked;
@synthesize isAdded;
- (id) init
{
    if (self = [super init]) {
        self.bestFriends = [NSMutableArray array];
        self.groups = [NSMutableArray array];
    }
    return self;
}
@end
