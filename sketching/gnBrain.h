//
//  gnBrain.h
//  sketching
//
//  Created by Smita on 07/03/13.
//  Copyright (c) 2013 Smita. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface gnBrain : NSObject
- (void)pushOperand : (double)operand;
- (double)performOperation : (NSString *)operation;
@end
