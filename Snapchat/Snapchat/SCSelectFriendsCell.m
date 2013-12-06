//
//  SCSelectFriendsCell.m
//  Snapchat
//
//  Created by Jessica Liang on 12/4/13.
//  Copyright (c) 2013 Jessica Liang. All rights reserved.
//

#import "SCSelectFriendsCell.h"

@implementation SCSelectFriendsCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        CGFloat width = [UIScreen mainScreen].bounds.size.width;
        CGFloat height = [UIScreen mainScreen].bounds.size.height;

        self.selectedButton = [[UIButton alloc]initWithFrame:CGRectMake(width - 38, 8, 30, 30)];
        [self.selectedButton setBackgroundImage:[UIImage imageNamed:@"unchecked"] forState:UIControlStateNormal];
        [self addSubview:self.selectedButton];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
