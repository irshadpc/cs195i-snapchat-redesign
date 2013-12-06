//
//  SCSettingsView.h
//  Snapchat
//
//  Created by Jessica Liang on 12/2/13.
//  Copyright (c) 2013 Jessica Liang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SCSettingsView : UIView <UITextFieldDelegate>
@property UILabel *username;
@property UILabel *phonenumber;
@property UILabel *email;
@property UILabel *sounds;
@property UILabel *privacy;
@property UIButton *save;
@property UITextField *username_field;
@property UITextField *phonenumber_field;
@property UITextField *email_field;
@property UITextField *sounds_field;
@property UITextField *privacy_field;
@end
