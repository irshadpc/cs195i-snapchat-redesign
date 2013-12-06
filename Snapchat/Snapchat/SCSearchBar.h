//
//  SCSearchBar.h
//  Snapchat
//
//  Created by Jessica Liang on 12/5/13.
//  Copyright (c) 2013 Jessica Liang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SCSearchBar : UIView <UITextFieldDelegate>
@property UITextField *textField;
- (void)setDelegate:(UIViewController<UITextFieldDelegate> *)delegate;
@end
