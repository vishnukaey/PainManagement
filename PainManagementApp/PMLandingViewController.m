//
//  PMLandingViewController.m
//  PainManagementApp
//
//  Created by Vishnu on 09/09/14.
//  Copyright (c) 2014 DenovoNow. All rights reserved.
//

#import "PMLandingViewController.h"

@interface PMLandingViewController ()

@end

@implementation PMLandingViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
}


- (IBAction)pushToLogInScreen:(id)sender {
    [self.delegate performSegueToLoginViewController];
    [self dismissViewControllerAnimated:NO completion:Nil];
}


- (IBAction)GotoStep1Medication:(id)sender {
    [self dismissViewControllerAnimated:NO completion:^{
        [self.delegate performSegueToMedicationViewController];
    } ];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}

@end
