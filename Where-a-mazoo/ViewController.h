//
//  ViewController.h
//  Where-a-mazoo
//
//  Created by Vig Sachidananda on 9/15/12.
//  Copyright (c) 2012 Vig Sachidananda. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <Twitter/Twitter.h>
#import "AddTripViewController.h"
#import <DropboxSDK/DropboxSDK.h>
#import <CoreLocation/CoreLocation.h>
#import "CustomCell.h"


@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate, AddTripViewControllerDelegate> {
    IBOutlet MKMapView *mapView;
    IBOutlet UITableView *tableView;
    IBOutlet UIImageView *imageView;
    IBOutlet UIBarButtonItem *shareButton;
    IBOutlet UIButton *userName;
    IBOutlet UIButton *detail;
    IBOutlet UIPickerView *startDate;
    IBOutlet UIPickerView *endDate;

    UITextField *textfieldName;
    UITextField *textfieldPassword;
    
}


@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *shareButton;
@property (strong, nonatomic) IBOutlet UIButton *userName;
@property (strong, nonatomic) IBOutlet UIButton *detail;


@property (strong, nonatomic) UITextField *textfieldName;
@property (strong, nonatomic) UITextField *textfieldPassword;



- (IBAction)setMap:(id)sender;

- (IBAction)share:(id)sender;

- (IBAction)signIn:(id)sender;






@end
