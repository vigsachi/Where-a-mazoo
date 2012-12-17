//
//  AddTripViewController.m
//  Where-a-mazoo
//
//  Created by Vig Sachidananda on 9/15/12.
//  Copyright (c) 2012 Vig Sachidananda. All rights reserved.
//

#import "AddTripViewController.h"
#import "WMTextField.h"
#import "WMTrip.h"

@interface AddTripViewController ()

@end

@implementation AddTripViewController{
    UIDatePicker *_startPicker;
    UIDatePicker *_endPicker;

}
@synthesize delegate = _delegate;

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    WMTextField *resigner = (WMTextField *)textField;
    [resigner resignFirstResponder];
    return [resigner.nextField becomeFirstResponder];
    
}

- (void) viewDidLoad

{
    _startPicker = [[UIDatePicker alloc] init];
    _startPicker.datePickerMode = UIDatePickerModeDate;
    self.startDateField.inputView = _startPicker;
    _endPicker = [[UIDatePicker alloc] init];
    _endPicker.datePickerMode = UIDatePickerModeDate;
    self.endDateField.inputView = _endPicker;
    [super viewDidLoad];
}




- (IBAction)doneAdding:(id)sender {
    WMTrip *_newTrip = [[WMTrip alloc]init];
    _newTrip.tripLocation = self.locationField.text;
    _newTrip.tripStartDate = self.startDateField.text;
    _newTrip.tripEndDate = self.endDateField.text;
    _newTrip.tripComments = self.commentsField.text;
    [_delegate viewController:self didAddTrip:_newTrip];

}

 
@end
