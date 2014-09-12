//
//  PMGetNewPasswordViewController.m
//  PainManagementApp
//
//  Created by Vishnu on 12/09/14.
//  Copyright (c) 2014 DenovoNow. All rights reserved.
//

#import "PMGetNewPasswordViewController.h"

@interface PMGetNewPasswordViewController ()

@end

@implementation PMGetNewPasswordViewController

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


- (IBAction)nextToAddEmail:(id)sender {
    if(self.passwordTextField.text.length>5)
        [self performSegueWithIdentifier:@"getNewEmailId" sender:self];
    else
        [Utilities showAlert:@"Password too short" withTitle:@"Weak password"];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
