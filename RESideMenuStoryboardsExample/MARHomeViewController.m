//
//  DEMOFirstViewController.m
//  RESideMenuStoryboards
//
//  Created by Roman Efimov on 10/9/13.
//  Copyright (c) 2013 Roman Efimov. All rights reserved.
//

#import "MARHomeViewController.h"

@interface MARHomeViewController ()

@end

@implementation MARHomeViewController

- (IBAction)showMenu
{
    [self.sideMenuViewController presentMenuViewController];
    NSLog(@"Home");
}

@end
