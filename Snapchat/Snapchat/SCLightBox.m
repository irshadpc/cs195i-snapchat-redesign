//
//  SCLightBox.m
//  Snapchat
//
//  Created by Jessica Liang on 12/4/13.
//  Copyright (c) 2013 Jessica Liang. All rights reserved.
//

#import "SCLightBox.h"
#import "UIColor+SCColorPalette.h"
#import "SCGroup.h"
@implementation SCLightBox
@synthesize selectedfriend;
@synthesize exitButton;
@synthesize editButton;
@synthesize deleteButton;
@synthesize blockButton;
@synthesize name;
@synthesize score;
@synthesize bestfriends;
@synthesize groups;
@synthesize bfriend1;
@synthesize bfriend2;
@synthesize bfriend3;
@synthesize bullet1;
@synthesize bullet2;
@synthesize bullet3;
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setBackgroundColor:[UIColor whiteColor]];
        
        self.exitButton = [[UIButton alloc] initWithFrame:CGRectMake(10, 10, 20, 20)];
        self.exitButton.backgroundColor = [UIColor redColor];
        [self.exitButton addTarget:self action:@selector(dismiss:) forControlEvents:UIControlEventTouchUpInside];
        
        self.editButton = [[UIButton alloc] initWithFrame:CGRectMake(5, 80, 80, 40)];
        self.editButton.backgroundColor = [UIColor clearColor];
        [self.editButton setTitle:@"Edit Name" forState:UIControlStateNormal];
        [self.editButton setTitleColor:[UIColor lightGreenColor] forState:UIControlStateNormal];
        
        self.deleteButton = [[UIButton alloc] initWithFrame:CGRectMake(90, 80, 80, 40)];
        self.deleteButton.backgroundColor = [UIColor clearColor];
        [self.deleteButton setTitle:@"Delete" forState:UIControlStateNormal];
        [self.deleteButton setTitleColor:[UIColor lightGreenColor] forState:UIControlStateNormal];
        
        self.blockButton = [[UIButton alloc] initWithFrame:CGRectMake(175, 80, 80, 40)];
        self.blockButton.backgroundColor = [UIColor clearColor];
        [self.blockButton setTitle:@"Block" forState:UIControlStateNormal];
        [self.blockButton setTitleColor:[UIColor lightGreenColor] forState:UIControlStateNormal];
        
        /*change the below label to something else to allow for editing the text */
        self.name = [[UILabel alloc] initWithFrame:CGRectMake(0,40,260,30)];
        self.name.text = selectedfriend.nickname;
        self.name.textAlignment = UITextAlignmentCenter;
        
        self.score = [[UILabel alloc] initWithFrame:CGRectMake(5,130,250,20)];
        self.score.text = [NSString stringWithFormat:@"Score: %d", (int)selectedfriend.points];
        
        self.bestfriends = [[UILabel alloc] initWithFrame:CGRectMake(5,160,250,20)];
        self.bestfriends.text = @"Best Friends";
        
        NSArray *friendarray = selectedfriend.bestFriends;
        self.bfriend1 = [[UILabel alloc] initWithFrame:CGRectMake(30,185,100,15)];
        self.bfriend1.text = ((SCFriend *)[friendarray objectAtIndex:0]).nickname;
        
        self.bfriend2 = [[UILabel alloc] initWithFrame:CGRectMake(30,185,100,15)];
        self.bfriend2.text = ((SCFriend *)[friendarray objectAtIndex:1]).nickname;
        
        self.bfriend3 = [[UILabel alloc] initWithFrame:CGRectMake(30,185,100,15)];
        self.bfriend3.text = ((SCFriend *)[friendarray objectAtIndex:2]).nickname;
        
        self.bullet1 = [[UIImageView alloc] initWithFrame:CGRectMake(5,185,15,15)];
        //set image for bullet1
        self.bullet2 = [[UIImageView alloc] initWithFrame:CGRectMake(5,205,15,15)];
        //set image for bullet1
        self.bullet3 = [[UIImageView alloc] initWithFrame:CGRectMake(5,225,15,15)];
        //set image for bullet1
        
        self.groups = [[UILabel alloc] initWithFrame:CGRectMake(5,250,250,20)];
        self.groups.text = @"Groups";
        
        NSMutableArray *grouparray = selectedfriend.groups;
        for (int i = 0; i < [grouparray count]; i++) {
            UIImageView *groupbullet = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 24, 24)];
            UILabel *grouplabel = [[UILabel alloc] initWithFrame:CGRectMake(10,10, 24, 24)];
            UIButton *groupremove = [[UIButton alloc] initWithFrame:CGRectMake(10, 10, 24, 24)];
            grouplabel.text = ((SCGroup *) [grouparray objectAtIndex:i]).groupname;
            [groupremove setTitle:@"Remove" forState:UIControlStateNormal];
            [groupremove setTitleColor:[UIColor lightGreenColor] forState:UIControlStateNormal];
            //add command to set image of groupbullet
            [self addSubview: grouplabel];
            [self addSubview: groupremove];
            [self addSubview: groupbullet];
        }
        
        [self addSubview:editButton];
        [self addSubview:deleteButton];
        [self addSubview:blockButton];
        [self addSubview:name];
        [self addSubview:score];
        [self addSubview:bestfriends];
        [self addSubview:bfriend1];
        [self addSubview:bfriend2];
        [self addSubview:bfriend3];
        [self addSubview:bullet1];
        [self addSubview:bullet2];
        [self addSubview:bullet3];
        [self addSubview:groups];
        [self addSubview: self.exitButton];
        self.layer.borderColor = [UIColor lightGreenColor].CGColor;
        self.layer.borderWidth = 2.0f;
        
    }
    return self;
}
- (void)removeFromSuperview
{
    [super removeFromSuperview];
    
}
- (void) dismiss: (UIButton*)sender
{
    [self removeFromSuperview];
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
