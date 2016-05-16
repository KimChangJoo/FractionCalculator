//
//  ViewController.m
//  FractionCalculator
//
//  Created by MF839-004 on 2016. 5. 16..
//  Copyright © 2016년 architecture. All rights reserved.
//

#import "ViewController.h"
#import "Calculator.h"

@interface ViewController ()

@end

@implementation ViewController{
    char op;
    int currentNumber;
    BOOL firstOperand, isNumerator;
    Calculator *myCalculator;
    NSMutableString *displayString;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    firstOperand = YES;
    isNumerator = YES;
    myCalculator = [[Calculator alloc] init];
    displayString = [NSMutableString stringWithCapacity:40]; //class method
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)clickDigit :(id)sender{
    int digit = (int)[sender tag];
    [self processOp:digit];
}

- (IBAction)clickOver:(id)sender {
    [self storeFracPart];
    isNumerator = NO;
    [displayString appendString:@"/"];
    _display.text=displayString;
}

- (IBAction)clickClear:(id)sender {
    isNumerator = YES;
    firstOperand = YES;
    currentNumber=0;
    [myCalculator clear];
    [displayString setString:@""];
    _display.text=displayString;
}

- (IBAction)clickEquals:(id)sender {
    if (firstOperand == NO) {
        [self storeFracPart];
        [myCalculator performOperation:op];
        
        [displayString appendString:@" = "];
        [displayString appendString: [myCalculator.accumulator convertToString]];
        _display.text = displayString;
        
        currentNumber = 0;
        isNumerator = YES;
        firstOperand = YES;
        [displayString setString:@""];
    }
}

- (IBAction)clickSum:(id)sender {
    [self processOp:'+'];
}

- (IBAction)clickMul:(id)sender {
    [self processOp:'*'];
}

- (IBAction)clickDiv:(id)sender {
    [self processOp:'/'];
}

- (IBAction)clickSub:(id)sender {
    [self processOp:'-'];
}

- (void)processDigit :(int)digit{
    currentNumber = currentNumber * 10 + digit;
    [displayString appendString:[NSString stringWithFormat:@"%i",digit]];
    _display.text = displayString;
}

- (void)processOp:(char) theOp{
    NSString *opStr;
    op = theOp;
    switch (theOp) {
        case '+':
            opStr = @" + ";
            break;
        case '-':
            opStr = @" - ";
            break;
        case '*':
            opStr = @" * ";
            break;
        case '/':
            opStr = @" / ";
            break;
            
        default:
            break;
    }
    [self storeFracPart];
    firstOperand = NO;
    isNumerator = YES;
    [displayString appendString:opStr];
    _display.text = displayString;
}

- (void)storeFracPart{
    if (firstOperand) {
        if (isNumerator) {
            myCalculator.operand1.numerator=currentNumber;
            myCalculator.operand1.denominator=1;
        }else{
            myCalculator.operand2.denominator = currentNumber;
        }
    }else if (isNumerator){
        myCalculator.operand2.numerator = currentNumber;
        myCalculator.operand2.denominator = 1;
    }else {
        myCalculator.operand2.denominator = currentNumber;
        firstOperand =YES;
    }
    currentNumber = 0;
}

@end
