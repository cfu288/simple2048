//
//  ViewController.m
//  2048
//
//  Created by Christopher Fu on 1/24/17.
//  Copyright © 2017 Christopher Fu. All rights reserved.
//

#import "ViewController.h"
#import "Square.h"

@interface ViewController ()
@end

@implementation ViewController
@synthesize textLabel;

NSMutableArray *array;

- (void)viewDidLoad
{
    [super viewDidLoad];
    array = [self get4x4Array];
    //array.addObject("Eezy")
    //array.addObject("Tutorials")
    //print(array)
    [self printArray1];
    for(int i = 0; i<2; i++){ // init arr with 2 sq
        [self addNewSquare];
    }
    [self printArray];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSMutableArray*)get4x4Array {
    NSMutableArray* arr = [NSMutableArray array];
    for (int i = 0; i < 4; i++) {
        NSMutableArray* subarr = [NSMutableArray array];
        for (int j = 0; j < 4; j++)
            [subarr addObject:[[Square alloc] init]];
        [arr addObject:subarr];
    }
    return arr;
}

-(void)printArray {
    for(int i = 0; i<4; i++){
        for (int j = 0; j < 4; j++){
            printf("%i\t", [array[i][j] getValue] );
        }
        printf("\n");
    }
    printf("\n");
}


-(void)printArray1 {
    int i = 0;
    for(int y = 0; y<4; y++){
        for (int x = 0; x < 4; x++){
            printf("x:%i,y:%i\t", x,y);
            //printf("i: %i\t", i);
            i++;
        }
        printf("\n");
    }
    printf("\n");
}

-(void)addNewSquare{
    int x = arc4random() % 4;
    int y = arc4random() % 4;
    int count = 0;//temorary check to make sure all sq are not gull
    while(count<1000 && [array[x][y] getValue] != -1){
        x = arc4random() % 4;
        y = arc4random() % 4;
        count++;
    }
    if(count <1000) [array[x][y] initValue];
    else printf("Game Over/Unable to find free space \n");
}

- (IBAction)swipeDetectedUp:(id)sender {
    for(int y = 0; y < 4; y++){
        for (int x = 0; x < 4; x++){
            if([array[y][x] getValue] != -1){
                int storedVal = [array[y][x] getValue];
                int tmpy = y;
                if( y-1 >= 0 ){
                    while(tmpy > 0 && [array[tmpy-1][x] getValue] == -1){//move down y axis until end/non empty block
                        --tmpy;

                    }
                    if(tmpy > 0 && [array[tmpy-1][x] getValue] == storedVal){//check if next block is the same as current.
                        storedVal *= 2;
                        --tmpy;
                        [array[tmpy][x] setVal:-1];
                    }
                    [array[tmpy][x] setVal:storedVal];
                }
                if( tmpy != y ){
                    [array[y][x] setVal:-1];
                }
            }
        }
    }
    textLabel.text = @"Up";
    [self addNewSquare];
    [self printArray];
}

- (IBAction)swipeDetectedLeft:(id)sender {
    for(int y = 0; y < 4; y++){
        for (int x = 0; x < 4; x++){
            if([array[y][x] getValue] != -1){
                int storedVal = [array[y][x] getValue];
                int tmpx = x;
                if( x-1 >= 0 ){
                    while(tmpx > 0 && [array[y][tmpx-1] getValue] == -1){//move down y axis until end/non empty block
                        --tmpx;
                        
                    }
                    if(tmpx > 0 && [array[y][tmpx-1] getValue] == storedVal){//check if next block is the same as current.
                        storedVal *= 2;
                        --tmpx;
                        [array[y][tmpx] setVal:-1];
                    }
                    [array[y][tmpx] setVal:storedVal];
                }
                if( tmpx != x ){
                    [array[y][x] setVal:-1];
                }
            }
        }
    }
    textLabel.text = @"Up";
    [self addNewSquare];
    [self printArray];
}

- (IBAction)swipeDetectedRight:(id)sender { //TODO
    for(int y = 3; y > 0; y--){
        for (int x = 3; x > 0; x--){
            if([array[y][x] getValue] != -1){
                int storedVal = [array[y][x] getValue];
                int tmpx = x;
                if( x+1 <= 3 ){
                    while(tmpx < 3 && [array[y][tmpx+1] getValue] == -1){//move down y axis until end/non empty block
                        ++tmpx;
                        
                    }
                    if(tmpx < 3 && [array[y][tmpx+1] getValue] == storedVal){//check if next block is the same as current.
                        storedVal *= 2;
                        ++tmpx;
                        [array[y][tmpx] setVal:-1];
                    }
                    [array[y][tmpx] setVal:storedVal];
                }
                if( tmpx != x ){
                    [array[y][x] setVal:-1];
                }
            }
        }
    }
    textLabel.text = @"Right";
    //[self addNewSquare];
    [self printArray];

}

- (IBAction)swipeDetectedDown:(id)sender {
    textLabel.text = @"Down";
}


@end
