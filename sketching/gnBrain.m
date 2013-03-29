//
//  gnBrain.m
//  sketching
//
//  Created by Smita on 07/03/13.
//  Copyright (c) 2013 Smita. All rights reserved.
//

#import "gnBrain.h"
@interface gnBrain()
@property (nonatomic, strong) NSMutableArray *operandStack;
@end

@implementation gnBrain
@synthesize operandStack = _operandStack;
- (NSMutableArray *) operandStack
{
    if(_operandStack == nil) _operandStack = [NSMutableArray alloc].init;
    return _operandStack;
}
- (void)setOperandStack:(NSMutableArray *)operandStack
{
    _operandStack = operandStack;
}
- (void)pushOperand : (double)operand
{
    [self.operandStack addObject:[NSNumber numberWithDouble:operand]];
}
- (double)popOperand
{
    NSNumber *operandObject = [self.operandStack lastObject];
    if(operandObject) self.operandStack.removeLastObject;
    return operandObject.doubleValue;
}
- (double)performOperation : (NSString *)operation
{
    double result = 0.0;
    //perform operation
    if([operation isEqualToString:@"+"])
    {
        result = [self popOperand] + [self popOperand];
    }else if ([@"*" isEqualToString:operation])
    {
        result = [self popOperand] * [self popOperand];
    }else if ([@"/" isEqualToString:operation])
    {
        double devisor = self.popOperand;
        if(devisor)
        {
            result = [self popOperand]/devisor;
        }else{
            result = 0;
        }
        //result = [self popOperand] / [self popOperand];
    }else if ([@"-" isEqualToString:operation])
    {
        result = [self popOperand] - [self popOperand];
    }
    [self pushOperand:result];
    return result;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"stack is %@",self.operandStack];
}

@end
