//
//  MARLoginViewController.m
//  iOSTemplate
//
//  Created by miguelicious on 8/24/14.
//  Copyright (c) 2014 Roman Efimov. All rights reserved.
//

#import "MARLoginViewController.h"
#import "UIAlertView+Additions.h"
#import <Parse/Parse.h>

@interface MARLoginViewController ()

@end

@implementation MARLoginViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)loginWithUsersOnScreen {
    /* * * * * * * * * * * * * * * * *
     * Logging In with Demo User to
     * Parse
     * * * * * * * * * * * * * * * * */
    [PFUser logInWithUsernameInBackground:@"myname" password:@"mypass"
                                    block:^(PFUser *user, NSError *error) {
                                        if (user) {
                                            [self dismissViewControllerAnimated:YES completion:nil];
                                        } else {
                                            // The login failed. Check error to see why.
                                        }
                                    }];

}

- (IBAction)loginWithEmail:(id)sender {
    if (self.textUsername.text.length == 0 || self.textPassword.text.length == 0) {
        [UIAlertView presentWithTitle:@"Oooops"
                              message:@"You need to fill your email & password, before logging in."
                              buttons:@[@"Ok"]
                        buttonHandler:nil];

    }
    [PFUser logInWithUsernameInBackground:self.textUsername.text password:self.textPassword.text
                                    block:^(PFUser *user, NSError *error) {
                                        if (user) {
                                            [self dismissViewControllerAnimated:YES completion:nil];
                                        } else {
                                            if (self.textUsername.text.length > 0 && self.textPassword.text.length > 0) {
                                                [UIAlertView presentWithTitle:@"Oooops"
                                                                      message:@"It seems like you are not registered with this email, do you want to Sign Up with this email?"
                                                                      buttons:@[@"Cancel", @"Ok"]
                                                                buttonHandler:^(NSUInteger index){
                                                                    NSLog(@"Not old user: %d", index);
                                                                    if (index == 1) {
                                                                        [self signUpWithCurrentEmailAndPassword];
                                                                    }
                                                                }];
                                            } else {
                                                
                                            }
                                        }
                                    }];
}

- (void)signUpWithCurrentEmailAndPassword {
    PFUser *user = [PFUser user];
    user.username = self.textUsername.text;
    user.password = self.textPassword.text;
    user.email = self.textUsername.text;
    
    [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (!error) {
            
        } else {
            // Show the errorString somewhere and let the user try again.
        }
    }];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if ((self.textUsername.text.length > 0 && self.textPassword.text.length > 0) && buttonIndex == 1) {
        PFUser *user = [PFUser user];
        user.username = self.textUsername.text;
        user.password = self.textPassword.text;
        user.email = self.textUsername.text;
        
        [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
            if (!error) {
                
            } else {
                // Show the errorString somewhere and let the user try again.
            }
        }];
    }
}

/* * * * * * * * * * * * * * * * *
 * Dismiss Keyboard
 * * * * * * * * * * * * * * * * */
- (IBAction)dismissKeyboard:(id)sender {
    [self.textUsername resignFirstResponder];
    [self.textPassword resignFirstResponder];
}

@end
