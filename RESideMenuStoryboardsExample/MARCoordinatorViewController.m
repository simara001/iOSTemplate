//
//  DEMOViewController.m
//  RESideMenuStoryboards
//
//  Created by Roman Efimov on 10/9/13.
//  Copyright (c) 2013 Roman Efimov. All rights reserved.
//

#import "MARCoordinatorViewController.h"
#import "MARMenuViewController.h"

@interface MARCoordinatorViewController ()

@end

@implementation MARCoordinatorViewController

- (void)awakeFromNib
{
    self.contentViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"contentController"];
    self.menuViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"menuController"];
    self.backgroundImage = [UIImage imageNamed:@"Stars"];
    self.delegate = (MARMenuViewController *)self.menuViewController;
}

@end
