//
//  PMEmptyRootViewController.m
//  PainManagementApp
//
//  Created by Vishnu on 02/09/14.
//  Copyright (c) 2014 DenovoNow. All rights reserved.
//

#import "PMEmptyRootViewController.h"
#import "PMFrontPainLocationViewController.h"

@interface PMEmptyRootViewController ()<PMFrontPainLocationViewControllerDelegate>

@end

@implementation PMEmptyRootViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


-(void) viewWillAppear:(BOOL)animated{
    [self performSegueWithIdentifier:@"locatePain" sender:self];
}

-(void) manageOverallPain{
    [self performSegueWithIdentifier:@"overall" sender:self];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"locatePain"]){
        PMFrontPainLocationViewController *front = [segue destinationViewController];
        front.delegate = self;
    }
}

@end
