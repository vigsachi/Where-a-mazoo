//
//  AddTripViewController.h
//  Where-a-mazoo
//
//  Created by Vig Sachidananda on 9/15/12.
//  Copyright (c) 2012 Vig Sachidananda. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WMTextField.h"
#import "WMTrip.h"

@protocol AddTripViewControllerDelegate;

@interface AddTripViewController : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet WMTextField *locationField;
@property (weak, nonatomic) IBOutlet WMTextField *startDateField;
@property (weak, nonatomic) IBOutlet WMTextField *endDateField;
@property (weak, nonatomic) IBOutlet WMTextField *commentsField;
@property (weak, nonatomic) id <AddTripViewControllerDelegate> delegate;


- (IBAction)doneAdding : (id) sender;


@end


@protocol AddTripViewControllerDelegate <NSObject>

- (void) viewController: (AddTripViewController *) viewController
             didAddTrip: (WMTrip *) trip;
            
@end