//
//  DEMOFirstViewController.m
//  RESideMenuStoryboards
//
//  Created by Roman Efimov on 10/9/13.
//  Copyright (c) 2013 Roman Efimov. All rights reserved.
//

#import "MARHomeViewController.h"
#import "UIColor+CoolColors.h"

@interface MARHomeViewController ()

@end

@implementation MARHomeViewController

- (IBAction)showMenu
{
    [self.sideMenuViewController presentMenuViewController];
}

-(void)viewDidLoad {
    /* * * * * * * * * * * * * * * * *
     * Customizing the Nav Bar
     * * * * * * * * * * * * * * * * */
    [self.navigationController.navigationBar setBarTintColor:[UIColor coolPurple]];
    [self.navigationController.navigationBar setBarStyle:UIBarStyleBlackTranslucent];
    
}

@end
