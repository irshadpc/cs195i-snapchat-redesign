//
//  SCNewGroupBox.h
//  Snapchat
//
//  Created by Jessica Liang on 12/6/13.
//  Copyright (c) 2013 Jessica Liang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SCGroupLightBox.h"
@interface SCNewGroupBox : UIView <UITextFieldDelegate>
@property UITextField *name;
@property UIButton *addButton;
@property UIButton *saveButton;
@property UIButton *exitButton;
@property UITableViewController<SCGroupLightBoxDelegate> *delegate;

@end
