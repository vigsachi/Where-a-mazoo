//
//  WMTextField.m
//  Where-a-mazoo
//
//  Created by Vig Sachidananda on 9/15/12.
//  Copyright (c) 2012 Vig Sachidananda. All rights reserved.
//

#import "WMTextField.h"

@implementation WMTextField

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


- (BOOL)resignFirstResponder

{

    if ([self.inputView respondsToSelector:@selector(date)])
    {
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
        [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
        self.text =[dateFormatter stringFromDate:[((UIDatePicker *)self.inputView) date]];
    
        
    }
    return [super resignFirstResponder];




}











/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
