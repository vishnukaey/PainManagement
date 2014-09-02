//
//  PMMedicationReminderViewController.m
//  PainManagementApp
//
//  Created by Vishnu on 02/09/14.
//  Copyright (c) 2014 DenovoNow. All rights reserved.
//

#import "PMMedicationReminderViewController.h"

@interface PMMedicationReminderViewController ()

@end

@implementation PMMedicationReminderViewController

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
    NSLog(@"%@",[self.medication valueForKey:@"medicationName"]);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
