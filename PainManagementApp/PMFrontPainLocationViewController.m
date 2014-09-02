//
//  PMFrontPainLocationViewController.m
//  PainManagementApp
//
//  Created by Vishnu on 02/09/14.
//  Copyright (c) 2014 DenovoNow. All rights reserved.
//


#import "PMFrontPainLocationViewController.h"
#import "PMBackPainLocationViewController.h"

@interface PMFrontPainLocationViewController ()

@end

@implementation PMFrontPainLocationViewController

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
- (IBAction)dismissToOverallPainVC:(id)sender {
    [self.delegate manageOverallPain];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)flipToBackViewController:(id)sender {
    [self performSegueWithIdentifier:@"back" sender:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
