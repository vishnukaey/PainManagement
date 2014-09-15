//
//  PMSampleCollectionViewController.m
//  PainManagementApp
//
//  Created by Vishnu on 10/09/14.
//  Copyright (c) 2014 DenovoNow. All rights reserved.
//

#import "PMSampleCollectionViewController.h"
#import "PMConfirmCollectionViewCell.h"
#import "PMFrequencyPickerView.h"

@interface PMSampleCollectionViewController ()


@end

@implementation PMSampleCollectionViewController

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
    PMFrequencyPickerView *view11= [[PMFrequencyPickerView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];
    NSArray *views = [[NSBundle mainBundle] loadNibNamed:@"PMFrequencyPickerView" owner:self options:nil];
    view11 = [views objectAtIndex:0];
    [self.view addSubview:view11];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
