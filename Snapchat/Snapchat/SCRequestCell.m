//
//  SCRequestCell.m
//  Snapchat
//
//  Created by Jessica Liang on 12/4/13.
//  Copyright (c) 2013 Jessica Liang. All rights reserved.
//

#import "SCRequestCell.h"

@implementation SCRequestCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.textLabel.text = @"asdlkjflkdsafjdsfk";
        [self.textLabel setTextColor:[UIColor blackColor]];
    }
    return self;
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    if (!acceptButton) {
        acceptButton = [[UIButton alloc] initWithFrame:CGRectMake(width -80, 12, 24, 24)];
        [acceptButton setBackgroundImage:[UIImage imageNamed:@"darkGreenCheckSmall"] forState:UIControlStateNormal];
        [acceptButton addTarget:self action:@selector(removeRequest:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:acceptButton];
    }
    if (!rejectButton) {
        rejectButton = [[UIButton alloc] initWithFrame:CGRectMake(width -40, 12, 24, 24)];
        [rejectButton setBackgroundImage:[UIImage imageNamed:@"redXSmall"] forState:UIControlStateNormal];
        [rejectButton addTarget:self action:@selector(removeRequest:) forControlEvents:UIControlEventTouchUpInside];

        [self addSubview: rejectButton];
    }
}
- (void)removeRequest: (UIButton *)sender
{
    [self.delegate deleteCellForFriend:self.friend];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
