//
//  ViewController.m
//  2048
//
//  Created by Christopher Fu on 1/24/17.
//  Copyright © 2017 Christopher Fu. All rights reserved.
//

#import "ViewController.h"
#import <SpriteKit/SpriteKit.h>

@interface ViewController ()
@end


@implementation ViewController
@synthesize textLabel;

- (void)viewDidLoad
{
    [super viewDidLoad];
    SKView *spriteView = (SKView *) self.view;
    spriteView.showsDrawCount = YES;
    spriteView.showsNodeCount = YES;
    spriteView.showsFPS = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    HelloScene* hello = [[HelloScene alloc] initWithSize:CGSizeMake(768,1024)];
    SKView *spriteView = (SKView *) self.view;
    [spriteView presentScene: hello];
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
