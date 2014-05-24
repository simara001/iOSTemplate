//
//  NSObject+PerformBlockAfterDelay.m
//  iOSTemplate
//
//  Created by migue ramirez on 5/23/14.
//  Copyright (c) 2014 Roman Efimov. All rights reserved.
//

#import "NSObject+PerformBlockAfterDelay.h"

@implementation NSObject (PerformBlockAfterDelay)

- (void)performBlock:(void (^)(void))block afterDelay:(NSTimeInterval)delay {
    int64_t delta = (int64_t)(1.0e9 * delay);
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, delta), dispatch_get_main_queue(), block);
}

@end
