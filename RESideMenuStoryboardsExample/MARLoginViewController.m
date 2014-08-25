//
//  MARLoginViewController.m
//  iOSTemplate
//
//  Created by miguelicious on 8/24/14.
//  Copyright (c) 2014 Roman Efimov. All rights reserved.
//

#import "MARSignUpViewController.h"
#import "MARLoginViewController.h"
#import "UIAlertView+Additions.h"
#import "UIColor+CoolColors.h"
#import "CSAnimationView.h"
#import "SVProgressHUD.h"
#import <Parse/Parse.h>

@interface MARLoginViewController ()
@end

@implementation MARLoginViewController {
    __strong CSAnimationView *signUpView;
    __strong UITextField *signUpEmail;
    __strong UITextField *signUpPassword;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self configureHUD];
    [self configureSignUpView];
}

- (void) configureSignUpView {
    /* * * * * * * * * * * * * * * * *
     * Starting CSAnimationView
     * * * * * * * * * * * * * * * * */
    signUpView = [[CSAnimationView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 300)];
    signUpView.type = @"bounceDown";
    signUpView.delay = 0.2;
    signUpView.duration = 0.5;
    signUpView.backgroundColor = [UIColor coolPurple];
    
    /* * * * * * * * * * * * * * * * *
     * Starting Email
     * * * * * * * * * * * * * * * * */
    signUpEmail = [[UITextField alloc] initWithFrame:CGRectMake(20, 50, signUpView.frame.size.width - 40, 40)];
    [signUpEmail setFont:[UIFont fontWithName:@"Avenir-Light" size:15]];
    [signUpEmail setTextColor:[UIColor whiteColor]];
    [signUpEmail setDelegate:self];
    signUpEmail.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Email" attributes:@{NSForegroundColorAttributeName: [UIColor whiteColor]}];
    
    /* * * * * * * * * * * * * * * * *
     * Starting Password
     * * * * * * * * * * * * * * * * */
    signUpPassword = [[UITextField alloc] initWithFrame:CGRectMake(20, 100, signUpView.frame.size.width - 40, 40)];
    [signUpPassword setFont:[UIFont fontWithName:@"Avenir-Light" size:15]];
    [signUpPassword setTextColor:[UIColor whiteColor]];
    [signUpPassword setDelegate:self];
    signUpPassword.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Password" attributes:@{NSForegroundColorAttributeName: [UIColor whiteColor]}];
    
    /* * * * * * * * * * * * * * * * *
     * Starting the Cancel button
     * * * * * * * * * * * * * * * * */
    UIButton *cancelSignUp = [[UIButton alloc] initWithFrame:CGRectMake(20, 150, (signUpView.frame.size.width - 40)/2, 50)];
    [cancelSignUp setTitle:@"Cancel" forState:UIControlStateNormal];
    [cancelSignUp addTarget:self action:@selector(cancelCreateNewUser) forControlEvents:UIControlEventTouchUpInside];
    
    /* * * * * * * * * * * * * * * * *
     * Starting Sign Up button
     * * * * * * * * * * * * * * * * */
    UIButton *goSignUp = [[UIButton alloc] initWithFrame:CGRectMake(20 + (signUpView.frame.size.width - 40)/2, 150, (signUpView.frame.size.width - 40)/2, 50)];
    [goSignUp setTitle:@"Sign Up" forState:UIControlStateNormal];
    [goSignUp addTarget:self action:@selector(signUpWithCurrentEmailAndPassword) forControlEvents:UIControlEventTouchUpInside];
    
    /* * * * * * * * * * * * * * * * *
     * Adding Views to SignUpView
     * * * * * * * * * * * * * * * * */
    [signUpView addSubview:signUpEmail];
    [signUpView addSubview:signUpPassword];
    [signUpView addSubview:cancelSignUp];
    [signUpView addSubview:goSignUp];
    

}

- (void)configureHUD {
    [SVProgressHUD setBackgroundColor:[UIColor coolDarkBlue]];
    [SVProgressHUD setForegroundColor:[UIColor whiteColor]];
    [SVProgressHUD setRingThickness:1];
    [SVProgressHUD setFont:[UIFont fontWithName:@"Avenir-Light" size:17]];
}

- (IBAction)loginWithCurrentEmailAndPassword:(id)sender {
    
    [SVProgressHUD showWithStatus:@"Logging in"];
    
    /* * * * * * * * * * * * * * * * *
     * Checking parameters not blank
     * * * * * * * * * * * * * * * * */
    if (self.textUsername.text.length == 0 || self.textPassword.text.length == 0) {
        [SVProgressHUD showErrorWithStatus:@"Email or Password cannot be blank"];
        return;
    }
    /* * * * * * * * * * * * * * * * *
     * Calling login
     * * * * * * * * * * * * * * * * */
    [PFUser logInWithUsernameInBackground:@"myname" password:@"mypass"
                                    block:^(PFUser *user, NSError *error) {
                                        if (user) {
                                            [SVProgressHUD showSuccessWithStatus:@"Success"];
                                            [self dismissViewControllerAnimated:YES completion:nil];
                                        } else {
                                            [SVProgressHUD showErrorWithStatus:@"Incorrect Credentials"];
                                        }
                                    }];
     
}

- (void)signUpWithCurrentEmailAndPassword {
    
    [SVProgressHUD showWithStatus:@"Signing Up"];
    
    if (signUpEmail.text.length == 0 || signUpPassword.text.length == 0) {
        [SVProgressHUD showErrorWithStatus:@"Email and Password cannot be empty"];
        return;
    }
    
    PFUser *user = [PFUser user];
    user.username = self.textUsername.text;
    user.password = self.textPassword.text;
    user.email = self.textUsername.text;
    
    [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (!error) {
            [SVProgressHUD showSuccessWithStatus:@"Success!"];
        } else {
            [SVProgressHUD showErrorWithStatus:@"Please try again with a different email."];
        }
    }];
}

- (IBAction)dismissKeyboard:(id)sender {
    [self.textUsername resignFirstResponder];
    [self.textPassword resignFirstResponder];
}


- (IBAction)createNewUser:(id)sender {
    /* * * * * * * * * * * * * * * * *
     * Adding subviews
     * * * * * * * * * * * * * * * * */
    [signUpView setFrame:CGRectMake(0, 0, signUpView.frame.size.width, signUpView.frame.size.height)];
    [signUpView setType:@"bounceDown"];
    [self.view addSubview:signUpView];
    [signUpView startCanvasAnimation];
    [signUpEmail becomeFirstResponder];
}

- (void)cancelCreateNewUser {
    [signUpView setFrame:CGRectMake(0, -signUpView.frame.size.height, signUpView.frame.size.width, signUpView.frame.size.height)];
    [signUpView setType:@"bounceUp"];
    [signUpEmail resignFirstResponder];
    [signUpPassword resignFirstResponder];
    [signUpView startCanvasAnimation];
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (textField ==  self.textUsername) {
        [self.textPassword becomeFirstResponder];
    } else if (textField == self.textPassword) {
        [self loginWithCurrentEmailAndPassword:self];
    } else if (textField == signUpEmail) {
        [signUpPassword becomeFirstResponder];
    } else if (textField == signUpPassword) {
        [self signUpWithCurrentEmailAndPassword];
    }
    
    return YES;
}

@end
