//
//  PMGetDayViewController.m
//  PainManagementApp
//
//  Created by Vishnu on 09/09/14.
//  Copyright (c) 2014 DenovoNow. All rights reserved.
//

#import "PMGetDayViewController.h"

@interface PMGetDayViewController (){
    NSString *selectedData;
}

@end

@implementation PMGetDayViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad{
    [super viewDidLoad];
    NSArray *forms = [[NSArray alloc]initWithObjects:@"Injection",@"Tablet", nil];
        self.pickerViewDataSource = forms;
    self.label.text =  [self.pickerViewDataSource objectAtIndex:0];
}


#pragma -mark PickerView delegates

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
        return [self.pickerViewDataSource count];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [self.pickerViewDataSource objectAtIndex:row];
}

- (IBAction)done:(id)sender {
        self.medication.medicationForm = self.label.text;
        [self.navigationController popViewControllerAnimated:YES];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    self.label.text = [self.pickerViewDataSource objectAtIndex:row];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
