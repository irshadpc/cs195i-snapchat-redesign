//
//  SCSettingsView.m
//  Snapchat
//
//  Created by Jessica Liang on 12/2/13.
//  Copyright (c) 2013 Jessica Liang. All rights reserved.
//

#import "SCSettingsView.h"
#import "UIColor+SCColorPalette.h"
@implementation SCSettingsView
@synthesize username;
@synthesize phonenumber;
@synthesize email;
@synthesize sounds;
@synthesize privacy;
@synthesize save;
@synthesize username_field;
@synthesize phonenumber_field;
@synthesize email_field;
@synthesize sounds_field;
@synthesize privacy_field;
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setBackgroundColor:[UIColor whiteColor]];
        CGFloat width = frame.size.width;
        CGFloat height = frame.size.height;
        NSLog(@"Width: %f, Height: %f", width, height);
        self.username = [[UILabel alloc] initWithFrame:CGRectMake(10, 70, 180, 30)];
        self.username.text = @"Username";
        //[self.messages addTarget:self action:@selector(messagePressed:) forControlEvents:UIControlEventTouchUpInside];
        
        self.phonenumber = [[UILabel alloc] initWithFrame:CGRectMake(10, 110, 180, 30)];
        self.phonenumber.text = @"Mobile #";
        //[self.camera addTarget:self action:@selector(cameraPressed:) forControlEvents:UIControlEventTouchUpInside];
        
        self.email = [[UILabel alloc] initWithFrame:CGRectMake(10, 150, 180, 30)];
        self.email.text = @"Email Address";
        //[self.camera addTarget:self action:@selector(cameraPressed:) forControlEvents:UIControlEventTouchUpInside];
        
        self.sounds = [[UILabel alloc] initWithFrame:CGRectMake(10, 190, 180, 30)];
        self.sounds.text = @"Notification Sounds";
        //[self.camera addTarget:self action:@selector(cameraPressed:) forControlEvents:UIControlEventTouchUpInside];
        
        self.privacy = [[UILabel alloc] initWithFrame:CGRectMake(10, 230, 210, 30)];
        self.privacy.text = @"Who Can Send Me Snaps?";
        //[self.camera addTarget:self action:@selector(cameraPressed:) forControlEvents:UIControlEventTouchUpInside];
        
        self.username_field = [[UITextField alloc] initWithFrame:CGRectMake(160, 70, 150, 30)];
        self.username_field.text = @"jck2";
        self.username_field.textColor = [UIColor lightGreenColor];
        self.username_field.enabled = NO;
        self.username_field.textAlignment = UITextAlignmentRight;
        //[self.camera addTarget:self action:@selector(cameraPressed:) forControlEvents:UIControlEventTouchUpInside];
        
        self.phonenumber_field = [[UITextField alloc] initWithFrame:CGRectMake(160, 110, 150, 30)];
        self.phonenumber_field.text = @"123-456-7890";
        self.phonenumber_field.textColor = [UIColor lightGreenColor];
        self.phonenumber_field.textAlignment = UITextAlignmentRight;
        //[self.camera addTarget:self action:@selector(cameraPressed:) forControlEvents:UIControlEventTouchUpInside];

        self.email_field = [[UITextField alloc] initWithFrame:CGRectMake(160, 150, 150, 30)];
        self.email_field.text = @"j@brown.edu"; //might need escape character for @
        self.email_field.textColor = [UIColor lightGreenColor];
        self.email_field.textAlignment = UITextAlignmentRight;
        //[self.camera addTarget:self action:@selector(cameraPressed:) forControlEvents:UIControlEventTouchUpInside];
        
        self.sounds_field = [[UITextField alloc] initWithFrame:CGRectMake(160, 190, 150, 30)];
        self.sounds_field.text = @"Off"; //might need escape character for @
        self.sounds_field.textColor = [UIColor lightGreenColor];
        self.sounds_field.textAlignment = UITextAlignmentRight;
        //[self.camera addTarget:self action:@selector(cameraPressed:) forControlEvents:UIControlEventTouchUpInside];
        
        self.privacy_field = [[UITextField alloc] initWithFrame:CGRectMake(160, 230, 150, 30)];
        self.privacy_field.text = @"My Friends"; //might need escape character for @
        self.privacy_field.textColor = [UIColor lightGreenColor];
        self.privacy_field.textAlignment = UITextAlignmentRight;
        //[self.camera addTarget:self action:@selector(cameraPressed:) forControlEvents:UIControlEventTouchUpInside];
        
        self.save = [[UIButton alloc] initWithFrame:CGRectMake(120, 270, 100, 40)];
        self.save.backgroundColor = [UIColor separatorColor];
        [self.save setTitleColor:[UIColor lightGreenColor] forState:UIControlStateNormal];
        [self.save setTitle:@"Save" forState:UIControlStateNormal];
        //[self.save addTarget:self action:@selector(messagePressed:) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:username];
        [self addSubview:phonenumber];
        [self addSubview:email];
        [self addSubview:sounds];
        [self addSubview:privacy];
        [self addSubview:username_field];
        [self addSubview:phonenumber_field];
        [self addSubview:email_field];
        [self addSubview:sounds_field];
        [self addSubview:privacy_field];
        [self addSubview:save];
  
        
        
    }
    return self;
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
