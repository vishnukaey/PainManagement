//
//  PMGetNewUsernameViewController.m
//  PainManagementApp
//
//  Created by Vishnu on 12/09/14.
//  Copyright (c) 2014 DenovoNow. All rights reserved.
//

#import "PMGetNewUsernameViewController.h"

@interface PMGetNewUsernameViewController ()

@end

@implementation PMGetNewUsernameViewController

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
}

- (IBAction)nextToAddPassword:(id)sender {
    if(self.usernameTextField.text.length != 0) {
        if([self ifUserNameAvailable:self.usernameTextField.text])
            [self performSegueWithIdentifier:@"getNewPassword" sender:self];
        else
            [Utilities showAlert:@"Username Not Available" withTitle:@"Username Error"];
    }
    else{
        [Utilities showAlert:@"Enter Username" withTitle:@"Missing Username"];
    }
}

-(bool) ifUserNameAvailable:(NSString*) username{
    if(![username isEqualToString:@"kaey"])
    return YES;
    else
        return NO;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
