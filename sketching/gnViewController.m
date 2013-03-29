//
//  gnViewController.m
//  sketching
//
//  Created by Smita on 05/03/13.
//  Copyright (c) 2013 Smita. All rights reserved.
//

#import "gnViewController.h"
#import "gnBrain.h"
@interface gnViewController ()
@property (nonatomic) BOOL userInMiddle;
@property (nonatomic, strong) gnBrain *brain;
@end

@implementation gnViewController
@synthesize display = _display;
@synthesize userInMiddle = _userInMiddle;
@synthesize brain = _brain;

- (gnBrain *)brain
{
    if(!_brain) _brain = [gnBrain alloc].init;
    return _brain;
}
- (IBAction)digitPressed:(UIButton *)sender
{
    NSString *digit = [sender currentTitle];
    if(self.userInMiddle)
    {
    //NSLog(@"digit pressed is %@",digit);
   // UILabel *myDisplay = [self display];
    //NSString *curText = [myDisplay text];
    //NSString *newText = [curText stringByAppendingString:digit];
    //[myDisplay setText:newText];
    self.display.text = [self.display.text stringByAppendingString:digit];
    }else
    {
        self.display.text = digit;
        self.userInMiddle = YES;
    }
}
- (IBAction)operationPressed:(UIButton *)sender
{
    if(self.userInMiddle) [self enterPressed];
    double result = [self.brain performOperation:[sender currentTitle]];
    NSString *resultString = [NSString stringWithFormat:@"%g",result];
    self.display.text = resultString;
}
- (IBAction)enterPressed{
    [self.brain pushOperand:[self.display.text doubleValue]];
    self.userInMiddle = NO;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
