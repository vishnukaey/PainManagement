//
//  PMConfirmMedicationViewController.m
//  PainManagementApp
//
//  Created by Vishnu on 02/09/14.
//  Copyright (c) 2014 DenovoNow. All rights reserved.
//

/*
 This ViewController shows a particular medication which is selected along with an image for the user to confirm it or cancel it
 */

#import "PMConfirmMedicationViewController.h"

@interface PMConfirmMedicationViewController ()

@end

@implementation PMConfirmMedicationViewController

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
    self.medicationName.text = self.medication.medicationName;
    self.medicationImage.image = self.medication.medicationImage;
}



- (IBAction)confirmMedication:(id)sender {
    [self.delegate pushToReminderViewController];
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (IBAction)cancel:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
