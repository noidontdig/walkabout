//
//  MySegueClass1.m
//  FinalProject
//
//  Created by Alexandra Qin on 5/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MySegueClass1.h"

@implementation MySegueClass1

- (void)perform{
    [[self sourceViewController] presentModalViewController:[self destinationViewController] animated:NO];
}

@end
