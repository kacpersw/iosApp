//
//  ViewController.h
//  apka123
//
//  Created by qwerty123456 on 12/2/17.
//  Copyright © 2017 qwerty123456. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <CoreLocation/CoreLocation.h>

@interface ViewController : UIViewController <CLLocationManagerDelegate>
@property(weak, nonatomic) IBOutlet UILabel *gestureLabel;
-(IBAction) tapGesture: (UITapGestureRecognizer *) sender;
-(IBAction) pinchGesture: (UIPinchGestureRecognizer *) sender;
-(IBAction) swipeGesture: (UISwipeGestureRecognizer *) sender;
-(IBAction) longPressGesture: (UILongPressGestureRecognizer *) sender;


@property (weak, nonatomic) IBOutlet UILabel *latitudeLabel;
@property (weak, nonatomic) IBOutlet UILabel *longitudeLabel;
@property (weak, nonatomic) IBOutlet UILabel *addressLabel;
- (IBAction)getCurrentLocation:(id)sender;
@end

