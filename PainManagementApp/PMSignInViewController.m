//
//  PMSignInViewController.m
//  PainManagementApp
//
//  Created by Vishnu on 11/09/14.
//  Copyright (c) 2014 DenovoNow. All rights reserved.
//

#import "PMSignInViewController.h"

@interface PMSignInViewController ()

@end

@implementation PMSignInViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}


- (void)viewDidLoad{
    [super viewDidLoad];
}


- (IBAction)logIn:(id)sender {
        if([self.username.text isEqualToString:@"kaey"] && [self.password.text isEqualToString:@"kaey"]){
            NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
            [defaults setBool:YES forKey:@"logInStatus"];
            [defaults setValue:self.username.text forKey:@"username"];
            [defaults synchronize];
            [self.delegate saveMyMedications];
            [self.navigationController dismissViewControllerAnimated:YES completion:Nil];
    }
    else
        [Utilities showAlert:@"Wrong Entry" withTitle:@"Error"];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if(textField == self.username )
       [self.password becomeFirstResponder];
    else
        [self logIn:self];
    return YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
