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
@interface SCLightBox()
{
    SCFriend *_selectedfriend;
}
@end
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
        
        self.editButton = [[UIButton alloc] initWithFrame:CGRectMake(11, 50, 72, 30)];
        self.editButton.backgroundColor = [UIColor clearColor];
        self.editButton.layer.borderColor = [UIColor lightGreenColor].CGColor;
        self.editButton.layer.borderWidth = 1;
        self.editButton.titleLabel.font = [UIFont boldSystemFontOfSize:12.0];
        
        [self.editButton setTitle:@"Edit Name" forState:UIControlStateNormal];
        [self.editButton setTitleColor:[UIColor lightGreenColor] forState:UIControlStateNormal];
        
        self.deleteButton = [[UIButton alloc] initWithFrame:CGRectMake(94, 50, 72, 30)];
        self.deleteButton.backgroundColor = [UIColor clearColor];
        self.deleteButton.layer.borderColor = [UIColor lightGreenColor].CGColor;
        self.deleteButton.layer.borderWidth = 1;
        self.deleteButton.titleLabel.font = [UIFont boldSystemFontOfSize:12.0];
        [self.deleteButton setTitle:@"Delete" forState:UIControlStateNormal];
        [self.deleteButton setTitleColor:[UIColor lightGreenColor] forState:UIControlStateNormal];
        [self.deleteButton addTarget:self action:@selector(deleteFriend:) forControlEvents:UIControlEventTouchUpInside];

        self.blockButton = [[UIButton alloc] initWithFrame:CGRectMake(177, 50, 72, 30)];
        self.blockButton.backgroundColor = [UIColor clearColor];
        self.blockButton.layer.borderColor = [UIColor lightGreenColor].CGColor;
        self.blockButton.layer.borderWidth = 1;
        self.blockButton.titleLabel.font = [UIFont boldSystemFontOfSize:12.0];
        [self.blockButton setTitle:@"Block" forState:UIControlStateNormal];
        [self.blockButton setTitleColor:[UIColor lightGreenColor] forState:UIControlStateNormal];
        
        /*change the below label to something else to allow for editing the text */
        self.name = [[UILabel alloc] initWithFrame:CGRectMake(30,10,200,30)];
        self.name.text = _selectedfriend.nickname;
        self.name.textColor = [UIColor lightGreenColor];
        self.name.textAlignment = UITextAlignmentCenter;
        
        self.score = [[UILabel alloc] initWithFrame:CGRectMake(11,100,250,20)];
        self.score.text = [NSString stringWithFormat:@"Score: %d", (int)_selectedfriend.points];
        
        self.bestfriends = [[UILabel alloc] initWithFrame:CGRectMake(11,130,250,20)];
        self.bestfriends.text = @"Best Friends";
        
        NSArray *friendarray = _selectedfriend.bestFriends;
        self.bfriend1 = [[UILabel alloc] initWithFrame:CGRectMake(36,155,225,15)];
        self.bfriend1.text = ((SCFriend *)[friendarray objectAtIndex:0]).nickname;
        self.bfriend1.font = [UIFont systemFontOfSize:10.0];
        
        self.bfriend2 = [[UILabel alloc] initWithFrame:CGRectMake(36,175,225,15)];
        self.bfriend2.text = ((SCFriend *)[friendarray objectAtIndex:1]).nickname;
        self.bfriend2.font = [UIFont systemFontOfSize:10.0];
        
        self.bfriend3 = [[UILabel alloc] initWithFrame:CGRectMake(36,195,225,15)];
        self.bfriend3.text = ((SCFriend *)[friendarray objectAtIndex:2]).nickname;
        self.bfriend3.font = [UIFont systemFontOfSize:10.0];
        
        self.bullet1 = [[UIImageView alloc] initWithFrame:CGRectMake(11,155,15,15)];
        [bullet1 setImage:[UIImage imageNamed:@"starBullet"]];
    
        self.bullet2 = [[UIImageView alloc] initWithFrame:CGRectMake(11,175,15,15)];
        [bullet2 setImage:[UIImage imageNamed:@"starBullet"]];

        self.bullet3 = [[UIImageView alloc] initWithFrame:CGRectMake(11,195,15,15)];
        [bullet3 setImage:[UIImage imageNamed:@"starBullet"]];
        
        self.groups = [[UILabel alloc] initWithFrame:CGRectMake(11,220,250,20)];
        self.groups.text = @"Groups";
        
        NSMutableArray *grouparray = _selectedfriend.groups;
        for (int i = 0; i < [grouparray count]; i++) {
            CGFloat y_pos = 245 + i * 20;
            UIImageView *groupbullet = [[UIImageView alloc] initWithFrame:CGRectMake(11, y_pos, 15, 15)];
            UILabel *grouplabel = [[UILabel alloc] initWithFrame:CGRectMake(36,y_pos, 150, 15)];
            UIButton *groupremove = [[UIButton alloc] initWithFrame:CGRectMake(186, y_pos, 60, 15)];
            grouplabel.text = ((SCGroup *) [grouparray objectAtIndex:i]).groupname;
            grouplabel.font = [UIFont systemFontOfSize:10.0];
            [groupremove setTitle:@"Remove" forState:UIControlStateNormal];
            [groupremove setTitleColor:[UIColor lightGreenColor] forState:UIControlStateNormal];
            [groupbullet setImage:[UIImage imageNamed:@"circleBullet"]];
            groupremove.titleLabel.font = [UIFont boldSystemFontOfSize:12.0];
            groupremove.layer.borderColor = [UIColor lightGreenColor].CGColor;
            groupremove.layer.borderWidth = 1;
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
- (SCFriend *)selectedfriend
{
    return _selectedfriend;
}
- (void)deleteFriend:(UIButton *)sender
{
    [self.delegate deleteFriend:self.selectedfriend];
}
- (void)setSelectedfriend:(SCFriend *)select
{
    _selectedfriend = select;
    NSArray *friendarray = _selectedfriend.bestFriends;
    
    /*change the below label to something else to allow for editing the text */
    self.name.text = _selectedfriend.nickname;
    
    self.score.text = [NSString stringWithFormat:@"Score: %d", (int)_selectedfriend.points];
    
    self.bfriend1.text = ((SCFriend *)[friendarray objectAtIndex:0]).nickname;
    
    self.bfriend2.text = ((SCFriend *)[friendarray objectAtIndex:1]).nickname;
    
    self.bfriend3.text = ((SCFriend *)[friendarray objectAtIndex:2]).nickname;
    
    NSMutableArray *grouparray = _selectedfriend.groups;
    for (int i = 0; i < [grouparray count]; i++) {
        CGFloat y_pos = 245 + i * 20;
        UIImageView *groupbullet = [[UIImageView alloc] initWithFrame:CGRectMake(11, y_pos, 15, 15)];
        UILabel *grouplabel = [[UILabel alloc] initWithFrame:CGRectMake(36,y_pos, 150, 15)];
        UIButton *groupremove = [[UIButton alloc] initWithFrame:CGRectMake(186, y_pos, 60, 15)];
        grouplabel.text = ((SCGroup *) [grouparray objectAtIndex:i]).groupname;
        grouplabel.font = [UIFont systemFontOfSize:10.0];
        [groupremove setTitle:@"Remove" forState:UIControlStateNormal];
        [groupremove setTitleColor:[UIColor lightGreenColor] forState:UIControlStateNormal];
        [groupbullet setImage:[UIImage imageNamed:@"circleBullet"]];
        groupremove.titleLabel.font = [UIFont boldSystemFontOfSize:12.0];
        groupremove.layer.borderColor = [UIColor lightGreenColor].CGColor;
        groupremove.layer.borderWidth = 1;
        [self addSubview: grouplabel];
        [self addSubview: groupremove];
        [self addSubview: groupbullet];
    }
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
