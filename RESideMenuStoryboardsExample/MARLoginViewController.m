//
//  MARLoginViewController.m
//  iOSTemplate
//
//  Created by miguelicious on 8/24/14.
//  Copyright (c) 2014 Roman Efimov. All rights reserved.
//

#import "MARLoginViewController.h"
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
    [PFUser logInWithUsernameInBackground:self.textUsername.text password:self.textPassword.text
                                    block:^(PFUser *user, NSError *error) {
                                        if (user) {
                                            [self dismissViewControllerAnimated:YES completion:nil];
                                        } else {
                                            NSString *alertMessage = @"";
                                            if (self.textUsername.text.length > 0 && self.textPassword.text.length > 0) {
                                                alertMessage = @"It seems like you haven't registered with this email, do you want to Sign Up with this email?";
                                            } else {
                                                alertMessage = @"You need to fill your email & password";
                                            }
                                            
                                            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oooops"
                                                                                            message:alertMessage
                                                                                           delegate:self
                                                                                  cancelButtonTitle:@"Cancel"
                                                                                  otherButtonTitles:@"Ok", nil];
                                            [alert show];
                                        }
                                    }];
}
@end
