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
        
        UIView* separatorLineView1 = [[UIView alloc] initWithFrame:CGRectMake(0, 101, 320, 1)];
        separatorLineView1.backgroundColor = [UIColor separatorColor]; // set color as you want.

        
        self.phonenumber = [[UILabel alloc] initWithFrame:CGRectMake(10, 111, 180, 30)];
        self.phonenumber.text = @"Mobile #";
        //[self.camera addTarget:self action:@selector(cameraPressed:) forControlEvents:UIControlEventTouchUpInside];
        
        UIView* separatorLineView2 = [[UIView alloc] initWithFrame:CGRectMake(0, 142, 320, 1)];
        separatorLineView2.backgroundColor = [UIColor separatorColor]; // set color as you want.
        
        self.email = [[UILabel alloc] initWithFrame:CGRectMake(10, 152, 180, 30)];
        self.email.text = @"Email Address";
        //[self.camera addTarget:self action:@selector(cameraPressed:) forControlEvents:UIControlEventTouchUpInside];
        
        UIView* separatorLineView3 = [[UIView alloc] initWithFrame:CGRectMake(0, 183, 320, 1)];
        separatorLineView3.backgroundColor = [UIColor separatorColor]; // set color as you want.
        
        self.sounds = [[UILabel alloc] initWithFrame:CGRectMake(10, 193, 180, 30)];
        self.sounds.text = @"Notification Sounds";
        //[self.camera addTarget:self action:@selector(cameraPressed:) forControlEvents:UIControlEventTouchUpInside];
        
        UIView* separatorLineView4 = [[UIView alloc] initWithFrame:CGRectMake(0, 224, 320, 1)];
        separatorLineView4.backgroundColor = [UIColor separatorColor]; // set color as you want.
        
        self.privacy = [[UILabel alloc] initWithFrame:CGRectMake(10, 234, 210, 30)];
        self.privacy.text = @"Who Can Send Me Snaps?";
        //[self.camera addTarget:self action:@selector(cameraPressed:) forControlEvents:UIControlEventTouchUpInside];
        
        UIView* separatorLineView5 = [[UIView alloc] initWithFrame:CGRectMake(0, 265, 320, 1)];
        separatorLineView5.backgroundColor = [UIColor separatorColor]; // set color as you want.

        
        self.username_field = [[UITextField alloc] initWithFrame:CGRectMake(160, 70, 150, 30)];
        self.username_field.text = @"jck2";
        self.username_field.textColor = [UIColor lightGreenColor];
        self.username_field.enabled = NO;
        self.username_field.textAlignment = UITextAlignmentRight;
        //[self.camera addTarget:self action:@selector(cameraPressed:) forControlEvents:UIControlEventTouchUpInside];
        
        self.phonenumber_field = [[UITextField alloc] initWithFrame:CGRectMake(160, 111, 150, 30)];
        self.phonenumber_field.text = @"123-456-7890";
        self.phonenumber_field.textColor = [UIColor lightGreenColor];
        self.phonenumber_field.textAlignment = UITextAlignmentRight;
        //[self.camera addTarget:self action:@selector(cameraPressed:) forControlEvents:UIControlEventTouchUpInside];

        self.email_field = [[UITextField alloc] initWithFrame:CGRectMake(160, 152, 150, 30)];
        self.email_field.text = @"j@brown.edu"; //might need escape character for @
        self.email_field.textColor = [UIColor lightGreenColor];
        self.email_field.textAlignment = UITextAlignmentRight;
        //[self.camera addTarget:self action:@selector(cameraPressed:) forControlEvents:UIControlEventTouchUpInside];
        
        self.sounds_field = [[UITextField alloc] initWithFrame:CGRectMake(160, 193, 150, 30)];
        self.sounds_field.text = @"Off"; //might need escape character for @
        self.sounds_field.textColor = [UIColor lightGreenColor];
        self.sounds_field.textAlignment = UITextAlignmentRight;
        //[self.camera addTarget:self action:@selector(cameraPressed:) forControlEvents:UIControlEventTouchUpInside];
        
        self.privacy_field = [[UITextField alloc] initWithFrame:CGRectMake(160, 234, 150, 30)];
        self.privacy_field.text = @"My Friends"; //might need escape character for @
        self.privacy_field.textColor = [UIColor lightGreenColor];
        self.privacy_field.textAlignment = UITextAlignmentRight;
        //[self.camera addTarget:self action:@selector(cameraPressed:) forControlEvents:UIControlEventTouchUpInside];
        
        self.save = [[UIButton alloc] initWithFrame:CGRectMake(110, 270, 100, 40)];
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
        [self addSubview:separatorLineView1];
        [self addSubview:separatorLineView2];
        [self addSubview:separatorLineView3];
        [self addSubview:separatorLineView4];
        [self addSubview:separatorLineView5];

  
        
        
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
