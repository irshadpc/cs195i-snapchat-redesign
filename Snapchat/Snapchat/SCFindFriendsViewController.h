//
//  SCFindFriendsViewController.h
//  Snapchat
//
//  Created by Jessica Liang on 12/5/13.
//  Copyright (c) 2013 Jessica Liang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SCSearchResultsController.h"
#import "SCSearchBar.h"
@interface SCFindFriendsViewController : UIViewController<UITextFieldDelegate>
@property UIViewController *delegate;
@property UITextField *textfield;
@property SCSearchResultsController *tvc;
@property SCSearchBar *bar;
@end
