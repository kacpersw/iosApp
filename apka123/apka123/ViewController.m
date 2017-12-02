//
//  ViewController.m
//  apka123
//
//  Created by qwerty123456 on 12/2/17.
//  Copyright © 2017 qwerty123456. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

CLLocationManager *locationManager;
CLLocationManager *locationManager;
CLGeocoder *geocoder;
CLPlacemark *placemark;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    locationManager = [[CLLocationManager alloc] init];
    geocoder = [[CLGeocoder alloc] init];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(BOOL)canBecomeFirstResponder
{
    return YES;
}
-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self becomeFirstResponder];
}
-(void)viewWillDisappear:(BOOL)animated
{
    [self resignFirstResponder];
    [super viewWillDisappear:animated];
}

-(void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent*)event
{
    if(motion ==UIEventSubtypeMotionShake)
    {
       
    }
}

-(IBAction)swipeGesture:(UISwipeGestureRecognizer*)sender {
    _gestureLabel.text = @"Wykonano gest machniecia reka";
}

-(IBAction)longPressGesture:(UILongPressGestureRecognizer*)sender {
    _gestureLabel.text = @"Wykonano gest long press";
}

-(IBAction)pinchGesture:(UIPinchGestureRecognizer*)sender {
    _gestureLabel.text = @"Wykonano gest pinch";
}

-(IBAction)tapGesture:(UITapGestureRecognizer*)sender {
    _gestureLabel.text = @"Wykonano gest tap";
}

- (IBAction)getCurrentLocation:(id)sender {
    locationManager.delegate = self;
    if([locationManager
        respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
        [locationManager requestWhenInUseAuthorization];
    }
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    
    [locationManager startUpdatingLocation];
}
- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError
                                                                       *)error
{
    NSLog(@"didFailWithError: %@", error);
    UIAlertView *errorAlert = [[UIAlertView alloc]
                               initWithTitle:@"Error" message:@"Failed to Get Your Location" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                               [errorAlert show];
                               }
                               - (void)locationManager:(CLLocationManager *)manager
                               didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation*)oldLocation
    {
        NSLog(@"didUpdateToLocation: %@", newLocation);
        CLLocation *currentLocation = newLocation;
        
        if (currentLocation != nil) {
            _longitudeLabel.text = [NSString stringWithFormat:@"%.8f", currentLocation.coordinate.longitude];
            _latitudeLabel.text = [NSString stringWithFormat:@"%.8f", currentLocation.coordinate.latitude];
        }
        
        // geocoding
        NSLog(@"Resolving the Address");
        [geocoder reverseGeocodeLocation:currentLocation completionHandler:^(NSArray *placemarks, NSError *error) {
            NSLog(@"Found placemarks: %@, error: %@", placemarks, error);
            if (error == nil && [placemarks count] > 0) {
                placemark = [placemarks lastObject];
                _addressLabel.text = [NSString
                                      stringWithFormat:@"%@ %@\n%@ %@\n%@\n%@",
                                      placemark.subThoroughfare,
                                      placemark.thoroughfare,
                                      placemark.postalCode, placemark.locality,
                                      placemark.administrativeArea,
                                      placemark.country];
            } else {
                NSLog(@"%@", error.debugDescription);
            }
        } ];
    }
                               
        @end
