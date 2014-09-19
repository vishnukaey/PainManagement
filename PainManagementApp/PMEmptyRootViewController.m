//
//  PMEmptyRootViewController.m
//  PainManagementApp
//
//  Created by Vishnu on 02/09/14.
//  Copyright (c) 2014 DenovoNow. All rights reserved.
//

#import "PMEmptyRootViewController.h"
#import "PMFrontPainLocationViewController.h"
#import "PMStep2PainManagerViewController.h"

@interface PMEmptyRootViewController ()<PMFrontPainLocationViewControllerDelegate,Step2VCDelegate>

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
    if(![[NSUserDefaults standardUserDefaults] boolForKey:@"logInStatus"])
        [self performSegueWithIdentifier:@"PMStep2PainManagerViewController" sender:self];
    else
        [self performSegueWithIdentifier:LOCATE_PAIN sender:self];
}


-(void) goTopainRecorder{
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
    else if([segue.identifier isEqualToString:@"PMStep2PainManagerViewController"]){
        PMStep2PainManagerViewController *help = [segue destinationViewController];
        help.delegate = self;
    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
