//
//  Square.h
//  2048
//
//  Created by Christopher Fu on 2/2/17.
//  Copyright © 2017 Christopher Fu. All rights reserved.
//

//#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Square : UIView {
    
}

//@property (nonatomic, strong) IBOutlet UIView *contents;

-(void)initValue;
-(int)getValue;
-(void)setVal:(int)inVal;
-(bool)getInit;


@end
