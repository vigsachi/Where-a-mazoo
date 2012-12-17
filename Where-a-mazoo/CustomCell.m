//
//  CustomCell.m
//  Where-a-mazoo
//
//  Created by Vig Sachidananda on 9/16/12.
//  Copyright (c) 2012 Vig Sachidananda. All rights reserved.
//

#import "CustomCell.h"

@implementation CustomCell
@synthesize titleLabel;
@synthesize subTitleLabel;
@synthesize dateLabel;
@synthesize dateLabel2;



- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        NSArray *nibArray = [[NSBundle mainBundle]loadNibNamed:@"CustomCell" owner:self options:nil];
        self = [nibArray objectAtIndex:0];
    
    
    
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
