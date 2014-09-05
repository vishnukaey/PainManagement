//
//  PMScheduleViewController.m
//  PainManagementApp
//
//  Created by Vishnu on 05/09/14.
//  Copyright (c) 2014 DenovoNow. All rights reserved.
//

#import "PMScheduleViewController.h"

@interface PMScheduleViewController ()

@end

@implementation PMScheduleViewController

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


- (IBAction)saveMedication:(id)sender {
    [Utilities showAlert:@"You can save here" withTitle:@"Success"];
    [self.navigationController popToRootViewControllerAnimated:YES];
}


- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
}


@end
