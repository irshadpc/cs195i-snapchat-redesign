//
//  SCFriend.h
//  Snapchat
//
//  Created by Jessica Liang on 12/3/13.
//  Copyright (c) 2013 Jessica Liang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SCFriend : NSObject
@property NSString *username;
@property NSString *nickname;
@property NSArray *bestFriends;
@property NSInteger *points;
@property NSMutableArray *groups;
@property BOOL isBlocked;
@property BOOL isAdded;
@end
