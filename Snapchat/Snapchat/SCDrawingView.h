//
//  SCDrawingView.h
//  Snapchat
//
//  Created by Jake Kaufman on 12/5/13.
//  Copyright (c) 2013 Jessica Liang. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface SCDrawingView : UIView <UITextFieldDelegate>
@property BOOL drawingOn;
@property UIColor *drawColor;
@end
