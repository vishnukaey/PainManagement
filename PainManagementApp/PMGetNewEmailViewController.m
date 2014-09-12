//
//  PMGetNewEmailViewController.m
//  PainManagementApp
//
//  Created by Vishnu on 12/09/14.
//  Copyright (c) 2014 DenovoNow. All rights reserved.
//

#import "PMGetNewEmailViewController.h"

@interface PMGetNewEmailViewController ()

@end

@implementation PMGetNewEmailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	self.navigationItem.hidesBackButton =YES;
}


- (IBAction)completeSignUp:(id)sender {
    if([self isValidEmail:self.emailTextField.text]){
        [Utilities showAlert:@"SignUp Successful" withTitle:@"Success"];
        [self.navigationController dismissViewControllerAnimated:YES completion:Nil];
    }
    else
        [Utilities showAlert:@"Email is not vaild" withTitle:@"Invalid Email ID"];
}

-(BOOL) isValidEmail:(NSString*) emailId{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest =[NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    BOOL myStringMatchesRegEx=[emailTest evaluateWithObject:emailId];
    return myStringMatchesRegEx;
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
