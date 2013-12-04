//
//  SCMenuView.m
//  Snapchat
//
//  Created by Jessica Liang on 12/2/13.
//  Copyright (c) 2013 Jessica Liang. All rights reserved.
//

#import "SCMenuView.h"

@implementation SCMenuView
@synthesize messages;
@synthesize camera;
@synthesize friends;
@synthesize settings;
@synthesize delegate;
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setBackgroundColor:[UIColor greenColor]];
        self.messages = [[UIButton alloc] initWithFrame:CGRectMake(80, 160, 30, 30)];
        self.messages.backgroundColor = [UIColor purpleColor];
        [self.messages addTarget:self action:@selector(messagePressed:) forControlEvents:UIControlEventTouchUpInside];
        
        self.camera = [[UIButton alloc] initWithFrame:CGRectMake(140, 200, 30, 30)];
        self.camera.backgroundColor = [UIColor blueColor];
        [self.camera addTarget:self action:@selector(cameraPressed:) forControlEvents:UIControlEventTouchUpInside];

        self.friends = [[UIButton alloc] initWithFrame:CGRectMake(80, 200, 30, 30)];
        self.friends.backgroundColor = [UIColor orangeColor];
        [self.friends addTarget:self action:@selector(friendsPressed:) forControlEvents:UIControlEventTouchUpInside];

        self.settings = [[UIButton alloc] initWithFrame:CGRectMake(140, 160, 30, 30)];
        self.settings.backgroundColor = [UIColor whiteColor];
        [self.settings addTarget:self action:@selector(settingsPressed:) forControlEvents:UIControlEventTouchUpInside];

        [self addSubview:messages];
        [self addSubview:camera];
        [self addSubview:friends];
        [self addSubview:settings];
    }
    return self;
}
- (void)messagePressed: (UIButton *) sender
{
    NSLog(@"message selected");
}
- (void)cameraPressed: (UIButton *) sender
{
    NSLog(@"camera selected");
}
- (void)friendsPressed: (UIButton *) sender
{
    NSLog(@"friends selected");
}
- (void)settingsPressed: (UIButton *) sender
{
    NSLog(@"settings selected");
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
