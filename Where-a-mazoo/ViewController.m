//
//  ViewController.m
//  Where-a-mazoo
//
//  Created by Vig Sachidananda on 9/15/12.
//  Copyright (c) 2012 Vig Sachidananda. All rights reserved.
//

#import "ViewController.h"
#import "WMTrip.h"
#import "MapViewAnnotation.h"


@interface ViewController ()

@end



@implementation ViewController{
    NSMutableArray *_trips;

}
@synthesize mapView = _mapView;
@synthesize shareButton = _shareButton;
@synthesize tableView = _tableView;
@synthesize imageView= _imageView;
@synthesize textfieldName = _textfieldName;
@synthesize textfieldPassword = _textfieldPassword;
@synthesize userName = _userName;
@synthesize detail = _detail;


#pragma mark - Blog and Map Views


- (id) initWithCoder:(NSCoder *)aDecoder

{
    self = [super initWithCoder:aDecoder];
    if (self != nil)
    {
        _trips = [[NSMutableArray alloc]init];
        
    }
    return self;


}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender

{
    if ([segue.identifier isEqualToString:@"AddTrip"])
    {
        AddTripViewController *addTripViewController = [segue destinationViewController];
        addTripViewController.delegate = self;
    }
    
}





- (IBAction)setMap:(id)sender{
  
    {
        switch ([sender selectedSegmentIndex]) {
            case 0:
            {
                _tableView.hidden = NO;
                _imageView.hidden = NO;
                _mapView.hidden = YES;
                _userName.hidden = NO;
                _detail.hidden = NO;
                break;
            }
            case 1:
            {
                _tableView.hidden = YES;
                _imageView.hidden = YES;
                _mapView.hidden = NO;
                _userName.hidden = YES;
                _detail.hidden = YES;
                break;
            }
            default:
            {
                _tableView.hidden = NO;
                _imageView.hidden = NO;
                _mapView.hidden = YES;
                _userName.hidden = NO;
                _detail.hidden = NO;
                break;
            }
                
        }
    }

    
}




#pragma mark - Share with Twitter and Dropbox

- (IBAction)share:(id)sender{
    TWTweetComposeViewController *tweet = [[TWTweetComposeViewController alloc]init];
    [tweet setInitialText:@""];
    
    [self presentModalViewController:tweet animated:YES];
}


/*
- (IBAction)dropbox:(id)sender{
DBSession* dbSession =
[[DBSession alloc]
  initWithAppKey:@"o6hr55bk90mtq30"
  appSecret:@"niyi04y0owkrxqb"
  root:kDBRootAppFolder];
[DBSession setSharedSession:dbSession];
}
*/

#pragma mark - Sign In

- (IBAction)signIn:(id)sender
{
    UIAlertView *alertview = [[UIAlertView alloc] initWithTitle:@"Log In" message:@"" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
    [alertview setAlertViewStyle:UIAlertViewStyleLoginAndPasswordInput];

    [[alertview textFieldAtIndex:0] setKeyboardType:UIKeyboardTypeAlphabet];
    [[alertview textFieldAtIndex:0] setPlaceholder:@"Username"];


    [alertview show];

}

- (void) alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex != 0)  // 0 == the cancel button
    {
        
        NSLog(@"Username %@",[[alertView textFieldAtIndex:0]text]);
        NSLog(@"Password %@",[[alertView textFieldAtIndex:1]text]);

    }
}

#pragma mark - Trip Information


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_trips count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath

{
    
    UITableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:@"Cell"];

    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier: @"Cell"];
        
         
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 15, 150, 25)];
        [label setBackgroundColor:[UIColor grayColor]];
        
        label.text=[[_trips objectAtIndex:indexPath.row] tripEndDate];
        label.font = [UIFont boldSystemFontOfSize:18];
        [cell.contentView addSubview:label];
        
        
    }
    
    cell.textLabel.text = [[_trips objectAtIndex:indexPath.row] tripLocation];
    cell.detailTextLabel.text =  [[_trips objectAtIndex:indexPath.row] tripComments];



    return cell;
    
}


- (CLLocationCoordinate2D) geoCodeUsingAddress:(NSString *)address
{
    double latitude = 0, longitude = 0;
    NSString *esc_addr =  [address stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSString *req = [NSString stringWithFormat:@"http://dev.virtualearth.net/REST/v1/Locations/%@""?o=xml&key=AhBU7mo0UMtx8iEZSS4LvE_J4_Ms6HLDC_T6Rj0NzSX-9qvW54pT15E1Gg9Tk5za", esc_addr];
    
    

    NSString *result = [NSString stringWithContentsOfURL:[NSURL URLWithString:req] encoding:NSUTF8StringEncoding error:NULL];
    if (result) {
        NSScanner *scanner = [NSScanner scannerWithString:result];
        if ([scanner scanUpToString:@"<location> <lat>" intoString:nil] && [scanner scanString:@"<location> <lat>" intoString:nil]) {
            [scanner scanDouble:&latitude];
            if ([scanner scanUpToString:@"<lng>" intoString:nil] && [scanner scanString:@"<lng>" intoString:nil]) {
                [scanner scanDouble:&longitude];
            }
        }
    }
    CLLocationCoordinate2D center;
    center.latitude = latitude;
    center.longitude = longitude;
    return center;
}



#pragma mark - View Load and Unload

- (void)viewDidLoad
{
    
    NSArray *tripTitles = [[NSArray alloc]initWithObjects:@"Peru",@"Australia",@"Italy", nil];
    NSArray *tripSubTitles = [[NSArray alloc]initWithObjects:@"Details about this trip.",@"This was fun.",@"Can't wait for this.", nil];
    for (int i=0; i<[tripTitles count]; i++){
        WMTrip *trip = [[WMTrip alloc]init];
        trip.tripLocation = [tripTitles objectAtIndex:i];
        trip.tripComments = [tripSubTitles objectAtIndex:i];

        [_trips addObject:trip];
        
        double latitude = 0;
        double longitude = 0;
        NSString *esc_addr =  [trip.tripLocation stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        NSString *req = [NSString stringWithFormat:@"http://maps.google.com/maps/api/geocode/xml?sensor=false&address=%@", esc_addr];

        NSString *result = [NSString stringWithContentsOfURL:[NSURL URLWithString:req] encoding:NSUTF8StringEncoding error:NULL];
        NSLog(@"%@", result);
        if (result) {
            NSScanner *scanner = [NSScanner scannerWithString:result];
            if ([scanner scanUpToString:@"<lat>" intoString:nil] && [scanner scanString:@"<lat>" intoString:nil])
            {
                [scanner scanDouble:&latitude];
                if ([scanner scanUpToString:@"<lng>" intoString:nil] && [scanner scanString:@"<lng>" intoString:nil]) {
                    [scanner scanDouble:&longitude];
                }
            }
            
            
            
        }
        CLLocationCoordinate2D center;
        center.latitude = latitude;
        center.longitude = longitude;
        NSLog(@"%f", latitude);
        NSLog(@"%f", longitude);


        MapViewAnnotation *newAnnotation = [[MapViewAnnotation alloc] initWithTitle:trip.tripLocation andCoordinate:center];
        [self.mapView addAnnotation:newAnnotation];
        
    }
    
    MKCoordinateRegion region = MKCoordinateRegionMake(_mapView.centerCoordinate, MKCoordinateSpanMake(180, 360));
    [_mapView setRegion:region animated:YES];
    [self.tableView reloadData];
    [super viewDidLoad];
}

- (void)viewDidUnload
{
    [self.tableView reloadData];
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (void) viewController: (AddTripViewController *) viewController
             didAddTrip: (WMTrip *) trip
{
    [_trips addObject:trip];
    double latitude = 0;
    double longitude = 0;
    NSString *esc_addr =  [trip.tripLocation stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSString *req = [NSString stringWithFormat:@"http://maps.google.com/maps/api/geocode/xml?sensor=false&address=%@", esc_addr];
    
    NSString *result = [NSString stringWithContentsOfURL:[NSURL URLWithString:req] encoding:NSUTF8StringEncoding error:NULL];
    NSLog(@"%@", result);
    if (result) {
        NSScanner *scanner = [NSScanner scannerWithString:result];
        if ([scanner scanUpToString:@"<lat>" intoString:nil] && [scanner scanString:@"<lat>" intoString:nil])
        {
            [scanner scanDouble:&latitude];
            if ([scanner scanUpToString:@"<lng>" intoString:nil] && [scanner scanString:@"<lng>" intoString:nil]) {
                [scanner scanDouble:&longitude];
            }
        }
        
        
        
    }
    CLLocationCoordinate2D center;
    center.latitude = latitude;
    center.longitude = longitude;
    NSLog(@"%f", latitude);
    NSLog(@"%f", longitude);
    
    
    MapViewAnnotation *newAnnotation = [[MapViewAnnotation alloc] initWithTitle:trip.tripLocation andCoordinate:center];
    [self.mapView addAnnotation:newAnnotation];

    [self.tableView reloadData];
    [self dismissModalViewControllerAnimated:YES];

}

- (void)mapView:(MKMapView *)mv didAddAnnotationViews:(NSArray *)views
{
	MKAnnotationView *annotationView = [views objectAtIndex:0];
	id <MKAnnotation> mp = [annotationView annotation];
	MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance([mp coordinate], 1500, 1500);
	[mv setRegion:region animated:YES];
	[mv selectAnnotation:mp animated:YES];
}





@end
