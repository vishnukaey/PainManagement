//
//  PMAddAppointmentViewController.m
//  PainManagementApp
//
//  Created by Vishnu on 09/09/14.
//  Copyright (c) 2014 DenovoNow. All rights reserved.
//

#import "PMAddAppointmentViewController.h"

@interface PMAddAppointmentViewController ()

@end

@implementation PMAddAppointmentViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad{
    [super viewDidLoad];
}

- (IBAction)addAppointment:(id)sender {
    [self performSegueWithIdentifier:@"saveAppointment" sender:self];
}

- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
}

@end
