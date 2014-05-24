//
//  DEMOSecondViewController.m
//  RESideMenuStoryboards
//
//  Created by Roman Efimov on 10/9/13.
//  Copyright (c) 2013 Roman Efimov. All rights reserved.
//

#import "MARProfileViewController.h"
#import <CSAnimationView.h>
#import "UIColor+CoolColors.h"
#import "NSObject+PerformBlockAfterDelay.h"

@interface MARProfileViewController ()

@end

@implementation MARProfileViewController {
    __strong CSAnimationView *animatedView;
}

#pragma mark - Default methods

-(void)viewDidLoad {
    
    /* * * * * * * * * * * * * * * * *
     * Starting CSAnimationView
     * * * * * * * * * * * * * * * * */
    animatedView = [[CSAnimationView alloc] initWithFrame:CGRectMake(self.view.frame.size.width/8, 25, self.view.frame.size.width/2, self.view.frame.size.height/2)];
    animatedView.type = @"bounceLeft";
    animatedView.delay = 0.2;
    animatedView.duration = 0.5;
    animatedView.backgroundColor = [UIColor clearColor];
    
    /* * * * * * * * * * * * * * * * *
     * Starting UILabel
     * * * * * * * * * * * * * * * * */
    UILabel *showingLabel = [[UILabel alloc] initWithFrame:animatedView.frame];
    showingLabel.text = @"This is an example of how to create animated labels programatically using Canvas";
    showingLabel.numberOfLines = 5;
    showingLabel.textAlignment = NSTextAlignmentCenter;
    [showingLabel setFont:[UIFont fontWithName:@"Avenir-Light" size:18]];
    
    /* * * * * * * * * * * * * * * * *
     * Adding subviews
     * * * * * * * * * * * * * * * * */
    [animatedView addSubview:showingLabel];
    [self.view addSubview:animatedView];
    [animatedView startCanvasAnimation];
}

#pragma mark - Custom methods

- (IBAction)showMenu
{
    [self.sideMenuViewController presentMenuViewController];
}

- (IBAction)animateText:(id)sender {
    [animatedView startCanvasAnimation];
}



@end
