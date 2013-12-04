//
//  SCMessage.h
//  Snapchat
//
//  Created by Jessica Liang on 12/3/13.
//  Copyright (c) 2013 Jessica Liang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SCMessage : NSObject
@property BOOL seen;
@property BOOL isVideo;
@property UIImage *image;
@property NSString *sender;
@property NSDate *timestamp;
@end
