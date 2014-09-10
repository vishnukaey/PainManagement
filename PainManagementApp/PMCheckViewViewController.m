//
//  PMCheckViewViewController.m
//  PainManagementApp
//
//  Created by Vishnu on 10/09/14.
//  Copyright (c) 2014 DenovoNow. All rights reserved.
//

#import "PMCheckViewViewController.h"
#import "ConfirmView.h"

@interface PMCheckViewViewController ()

@end

@implementation PMCheckViewViewController

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
    NSArray *views = [[NSBundle mainBundle] loadNibNamed:@"ConfirmView" owner:self options:nil];
    self.viewFromNib = [views objectAtIndex:0];
	[self.view addSubview:self.viewFromNib];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
