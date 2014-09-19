//
//  PMStep1MedicationViewController.m
//  PainManagementApp
//
//  Created by Vishnu on 19/09/14.
//  Copyright (c) 2014 DenovoNow. All rights reserved.
//

#import "PMStep1MedicationViewController.h"

@interface PMStep1MedicationViewController ()

@end

@implementation PMStep1MedicationViewController

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
	self.medicationImage.layer.cornerRadius = self.medicationImage.frame.size.height /2;
    self.medicationImage.clipsToBounds = YES;
}


- (IBAction)continueToMedication:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
