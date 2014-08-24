//
//  UIAlertView+Additions.h
//  iOSTemplate
//
//  Created by miguelicious on 8/24/14.
//  Copyright (c) 2014 Roman Efimov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIAlertView (Additions)

+ (void)presentWithTitle:(NSString *)title
                 message:(NSString *)message
                 buttons:(NSArray *)buttons
           buttonHandler:(void(^)(NSUInteger index))handler;

@end
