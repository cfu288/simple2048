//
//  ViewController.h
//  2048
//
//  Created by Christopher Fu on 1/24/17.
//  Copyright © 2017 Christopher Fu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HelloScene.h"

@interface ViewController : UIViewController{
    IBOutlet UILabel *textLabel;
}
@property (strong, nonatomic) IBOutlet UILabel *textLabel;

@property (strong, nonatomic) IBOutlet UISwipeGestureRecognizer *SwipeGestureLeft;
@property (strong, nonatomic) IBOutlet UISwipeGestureRecognizer *SwipeGestureRight;
@property (strong, nonatomic) IBOutlet UISwipeGestureRecognizer *SwipeGestureDown;
@property (strong, nonatomic) IBOutlet UISwipeGestureRecognizer *SwipeGestureUp;

- (IBAction)swipeDetectedRight:(id)sender;
- (IBAction)swipeDetectedLeft:(id)sender;
- (IBAction)swipeDetectedDown:(id)sender;
- (IBAction)swipeDetectedUp:(id)sender;

@end

