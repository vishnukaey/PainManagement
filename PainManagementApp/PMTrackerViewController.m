//
//  PMTrackerViewController.m
//  PainManagementApp
//
//  Created by Vishnu on 19/09/14.
//  Copyright (c) 2014 DenovoNow. All rights reserved.
//

#import "PMTrackerViewController.h"

@interface PMTrackerViewController ()

@end

@implementation PMTrackerViewController

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
	// Do any additional setup after loading the view.
}
- (IBAction)redeemCoupon:(id)sender {
}
- (IBAction)doneAndSave:(id)sender {
    [self.navigationController popToViewController:[self.navigationController.childViewControllers objectAtIndex:0] animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
