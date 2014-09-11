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

- (void)viewDidLoad
{
    [super viewDidLoad];
}

-(void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self performSegueWithIdentifier:LOCATE_PAIN sender:self];
}

-(void) manageOverallPain{
    [self performSegueWithIdentifier:OVERALL sender:self];
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:LOCATE_PAIN]){
        PMFrontPainLocationViewController *front = [segue destinationViewController];
        front.delegate = self;
    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
