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
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad{
    [super viewDidLoad];
    NSArray *forms = [[NSArray alloc]initWithObjects:@"Injection",@"Tablet", nil];
    NSArray *days=@[@"Sunday",@"Monday",@"Tuesday",@"Wednesday",@"Thursday",@"Friday",@"Saturday"];
    NSMutableArray *alldays = [[NSMutableArray alloc]init];
    for (int i=0;i<30;i++)
        [alldays  setObject:@(i+1) atIndexedSubscript:i];
    if([self.toSelect isEqualToString:@"Form"])
        self.pickerViewDataSource = forms;
    else if([self.toSelect isEqualToString:@"Day"])
        self.pickerViewDataSource = days;
    else if([self.toSelect isEqualToString:@"Week"])
        self.pickerViewDataSource = alldays;
    [self.PickerView reloadAllComponents];
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
    if([self.toSelect isEqualToString:@"Form"]){
        self.medication.medicationForm = self.label.text;
    }
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
