//
//  ViewController.h
//  2048
//
//  Created by Christopher Fu on 1/24/17.
//  Copyright © 2017 Christopher Fu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController{
    IBOutlet UILabel *textLabel;
    IBOutlet UILabel *Label1, *Label2, *Label3, *Label4,
                    *Label5, *Label6, *Label7, *Label8,
                    *Label9, *Label10, *Label11, *Label12,
                    *Label13, *Label14, *Label15, *Label16;
}
@property (strong, nonatomic) IBOutlet UILabel *textLabel;
@property (strong, nonatomic) IBOutlet UILabel *Label1;
@property (strong, nonatomic) IBOutlet UILabel *Label2;
@property (strong, nonatomic) IBOutlet UILabel *Label3;
@property (strong, nonatomic) IBOutlet UILabel *Label4;
@property (strong, nonatomic) IBOutlet UILabel *Label5;
@property (strong, nonatomic) IBOutlet UILabel *Label6;
@property (strong, nonatomic) IBOutlet UILabel *Label7;
@property (strong, nonatomic) IBOutlet UILabel *Label8;
@property (strong, nonatomic) IBOutlet UILabel *Label9;
@property (strong, nonatomic) IBOutlet UILabel *Label10;
@property (strong, nonatomic) IBOutlet UILabel *Label11;
@property (strong, nonatomic) IBOutlet UILabel *Label12;
@property (strong, nonatomic) IBOutlet UILabel *Label13;
@property (strong, nonatomic) IBOutlet UILabel *Label14;
@property (strong, nonatomic) IBOutlet UILabel *Label15;
@property (strong, nonatomic) IBOutlet UILabel *Label16;

@property (strong, nonatomic) IBOutlet UISwipeGestureRecognizer *SwipeGestureLeft;
@property (strong, nonatomic) IBOutlet UISwipeGestureRecognizer *SwipeGestureRight;
@property (strong, nonatomic) IBOutlet UISwipeGestureRecognizer *SwipeGestureDown;
@property (strong, nonatomic) IBOutlet UISwipeGestureRecognizer *SwipeGestureUp;

- (IBAction)swipeDetectedRight:(id)sender;
- (IBAction)swipeDetectedLeft:(id)sender;
- (IBAction)swipeDetectedDown:(id)sender;
- (IBAction)swipeDetectedUp:(id)sender;

@end

