//
//  SCImageView.h
//  Snapchat
//
//  Created by Jessica Liang on 12/5/13.
//  Copyright (c) 2013 Jessica Liang. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol SCImageViewDelegate
- (void)finishedViewing;
@end
@interface SCImageView : UIView
@property UITableViewController <SCImageViewDelegate> *delegate;
@end
