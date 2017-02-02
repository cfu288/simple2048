//
//  ViewController.m
//  2048
//
//  Created by Christopher Fu on 1/24/17.
//  Copyright © 2017 Christopher Fu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@end

@implementation ViewController
@synthesize textLabel;

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)swipeDetectedUp:(id)sender {
    textLabel.text = @"Up";
    printf("Up");
}

- (IBAction)swipeDetectedLeft:(id)sender {
    textLabel.text = @"Left";
}

- (IBAction)swipeDetectedRight:(id)sender {
    textLabel.text = @"Right";
}

- (IBAction)swipeDetectedDown:(id)sender {
    textLabel.text = @"Down";
    printf("Down");

}


@end
