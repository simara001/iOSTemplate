//
//  MARLoginViewController.h
//  iOSTemplate
//
//  Created by miguelicious on 8/24/14.
//  Copyright (c) 2014 Roman Efimov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MARLoginViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *textUsername;
@property (weak, nonatomic) IBOutlet UITextField *textPassword;

- (IBAction)loginWithEmail:(id)sender;

@end
