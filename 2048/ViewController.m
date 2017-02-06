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
@synthesize textLabel, resetLabel, scoreLabel;
@synthesize Label1,Label2,Label3,Label4,Label5,Label6,Label7,Label8,Label9,Label10,Label11,Label12,Label13,Label14,Label15,Label16;

NSMutableArray *array;
NSMutableArray *viewArr;
int score;


- (void)updateView {
    int x = 0;
    for(int i = 0; i<4; i++){
        for (int j = 0; j < 4; j++){
            if( [array[i][j] getValue] != -1) [viewArr[x] setText:[NSString stringWithFormat:@"%d" ,[array[i][j] getValue] ] ];
            else [viewArr[x] setText:@""];
            x++;
        }
    }
    scoreLabel.text = [NSString stringWithFormat:@"Score: %d", score];
    printf("Score: %d\n", score);
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    viewArr = [[NSMutableArray alloc] initWithObjects: Label1,Label2,Label3,Label4,Label5,Label6,Label7,Label8,Label9,Label10,Label11,Label12,Label13,Label14,Label15,Label16, nil ];
    [self newGame];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)resetGame:(id)sender{
    [self newGame];
}

-(void)newGame{
    array = [self get4x4Array];
    for(int i = 0; i<2; i++){ // init arr with 2 sq
        [self addNewSquare];
    }
    [self printArray];
    [self updateView];
    score = 0;
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
            int x = [array[i][j] getValue];
            if (x == -1) printf("*\t");
            else printf("%i\t", x );
        }
        printf("\n");
    }
    printf("\n");
}

-(void)addNewSquare{
    int x = arc4random() % 4;
    int y = arc4random() % 4;
    int count = 0;//temorary check to make sure all sq are not full
    while(count<1000 && [array[x][y] getValue] != -1){
        x = arc4random() % 4;
        y = arc4random() % 4;
        count++;
    }
    if(count <1000) [array[x][y] initValue];
    else printf("Game Over/Unable to find free space \n");
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
                        score += storedVal;
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
    textLabel.text = @"Left";
    [self addNewSquare];
    [self printArray];
    [self updateView];
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
                        score += storedVal;
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
    [self updateView];
}


- (IBAction)swipeDetectedRight:(id)sender { //TODO
    for(int y = 3; y >= 0; y--){
        for (int x = 3; x >= 0; x--){
            if([array[y][x] getValue] != -1){
                int storedVal = [array[y][x] getValue];
                int tmpx = x;
                if( x+1 <= 3 ){
                    while(tmpx < 3 && [array[y][tmpx+1] getValue] == -1){//move down y axis until end/non empty block
                        ++tmpx;
                        
                    }
                    if(tmpx < 3 && [array[y][tmpx+1] getValue] == storedVal){//check if next block is the same as current.
                        storedVal *= 2;
                        score += storedVal;
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
    [self addNewSquare];
    [self printArray];
    [self updateView];
}

- (IBAction)swipeDetectedDown:(id)sender {
    for(int y = 3; y >= 0; y--){
        for (int x = 3; x >= 0; x--){
            if([array[y][x] getValue] != -1){
                int storedVal = [array[y][x] getValue];
                int tmpy = y;
                if( y+1 <= 3 ){
                    while(tmpy < 3 && [array[tmpy+1][x] getValue] == -1){//move down y axis until end/non empty block
                        ++tmpy;
                    }
                    if(tmpy < 3 && [array[tmpy+1][x] getValue] == storedVal){//check if next block is the same as current.
                        storedVal *= 2;
                        score += storedVal;
                        ++tmpy;
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
    textLabel.text = @"Down";
    [self addNewSquare];
    [self printArray];
    [self updateView];
}


@end
