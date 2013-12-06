//
//  SCSelectFriendsCell.m
//  Snapchat
//
//  Created by Jessica Liang on 12/4/13.
//  Copyright (c) 2013 Jessica Liang. All rights reserved.
//

#import "SCSelectFriendsCell.h"
#import "UIColor+SCColorPalette.h"
@interface SCSelectFriendsCell()
{
    BOOL isSelected;
}
@end
@implementation SCSelectFriendsCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        CGFloat width = [UIScreen mainScreen].bounds.size.width;
        isSelected  = NO;
        self.selectedButton = [[UIButton alloc]initWithFrame:CGRectMake(width - 38, 8, 30, 30)];
        [self.selectedButton setBackgroundImage:[UIImage imageNamed:@"unchecked"] forState:UIControlStateNormal];
        [self addSubview:self.selectedButton];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}
- (void)hideButton
{
    [self.selectedButton removeFromSuperview];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    if (selected) {
    if (isSelected) {
        [self.selectedButton setBackgroundImage:[UIImage imageNamed:@"unchecked"] forState:UIControlStateNormal];
        self.textLabel.textColor = [UIColor blackColor];
    } else {
        [self.selectedButton setBackgroundImage:[UIImage imageNamed:@"lightGreenCheckBig"] forState:UIControlStateNormal];
        self.textLabel.textColor = [UIColor lightGreenColor];
    }
    [self setNeedsDisplay];
    isSelected =  !isSelected;
    }
    // Configure the view for the selected state
}

@end
