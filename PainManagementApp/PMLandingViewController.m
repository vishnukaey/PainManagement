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


- (IBAction)pushToMedication:(id)sender {
    [self.delegate performSegueToMedicationViewController];
    [self dismissViewControllerAnimated:YES completion:Nil];
}


- (IBAction)pustToAppoinment:(id)sender {
    [self.delegate performSegueToAppoinmentsViewController];
    [self dismissViewControllerAnimated:YES completion:Nil];
}


- (IBAction)pushToPainManagement:(id)sender {
    [self.delegate performSegueToPainManagementViewController];
    [self dismissViewControllerAnimated:YES completion:Nil];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}

@end
