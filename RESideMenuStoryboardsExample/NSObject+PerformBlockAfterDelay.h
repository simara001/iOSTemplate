//
//  NSObject+PerformBlockAfterDelay.h
//  iOSTemplate
//
//  Created by migue ramirez on 5/23/14.
//  Copyright (c) 2014 Roman Efimov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (PerformBlockAfterDelay)

- (void)performBlock:(void (^)(void))block afterDelay:(NSTimeInterval)delay;

@end
