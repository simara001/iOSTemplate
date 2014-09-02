//
//  MARLoginViewController.h
//  iOSTemplate
//
//  Created by miguelicious on 8/24/14.
//  Copyright (c) 2014 Roman Efimov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MARLoginViewController : UIViewController <UIAlertViewDelegate, UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *textUsername;
@property (weak, nonatomic) IBOutlet UITextField *textPassword;

- (IBAction)loginWithFacebook:(id)sender;
- (IBAction)loginWithCurrentEmailAndPassword:(id)sender;
- (IBAction)dismissKeyboard:(id)sender;
- (IBAction)createNewUser:(id)sender;


@end
