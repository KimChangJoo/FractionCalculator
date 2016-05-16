//
//  ViewController.h
//  FractionCalculator
//
//  Created by MF839-004 on 2016. 5. 16..
//  Copyright © 2016년 architecture. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *display;
- (IBAction)clickDigit :(id)sender;
- (IBAction)clickOver:(id)sender;
- (IBAction)clickClear:(id)sender;
- (IBAction)clickEquals:(id)sender;

- (IBAction)clickSum:(id)sender;
- (IBAction)clickMul:(id)sender;
- (IBAction)clickDiv:(id)sender;
- (IBAction)clickSub:(id)sender;

- (void)processDigit :(int)digit;
- (void)processOp:(char) theOp;
- (void)storeFracPart;

@end

