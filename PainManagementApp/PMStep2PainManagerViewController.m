//
//  PMStep2PainManagerViewController.m
//  PainManagementApp
//
//  Created by Vishnu on 19/09/14.
//  Copyright (c) 2014 DenovoNow. All rights reserved.
//

#import "PMStep2PainManagerViewController.h"

@interface PMStep2PainManagerViewController ()

@end

@implementation PMStep2PainManagerViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.imageView.layer.cornerRadius = self.imageView.frame.size.height /2;
    self.imageView.clipsToBounds = YES;
}


- (IBAction)goToPainRecorder:(id)sender {
    [self dismissViewControllerAnimated:NO completion:^{
        [self.delegate goTopainRecorder];
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
