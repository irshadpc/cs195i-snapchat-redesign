//
//  SCConstants.m
//  Snapchat
//
//  Created by Jessica Liang on 12/4/13.
//  Copyright (c) 2013 Jessica Liang. All rights reserved.
//

#import "UIColor+SCColorPalette.h"
extern UIColor *lightGreen;
extern UIColor *darkGreen;
extern UIColor *separatorColor;

@implementation  UIColor(SCColorPalette)

+ (UIColor *) lightGreenColor
{
    return [[UIColor alloc] initWithRed:142.0f/255.0f green:212.0f/255.0f blue:189.0f/255.0f alpha:1.0];
}
+ (UIColor *)darkGreenColor
{
    return [[UIColor alloc]initWithRed:18.0f/255.0f green:165.0f/255.0f blue:117.0f/255.0f alpha:1.0];
}
+ (UIColor *)separatorColor
{
    return [[UIColor alloc] initWithRed:222.0f/255.0f green:222.0f/255.0f blue:222.0f/255.0f alpha:1.0];
}
@end
