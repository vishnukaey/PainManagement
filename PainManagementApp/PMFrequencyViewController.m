//
//  PMFrequencyViewController.m
//  PainManagementApp
//
//  Created by Vishnu on 03/09/14.
//  Copyright (c) 2014 DenovoNow. All rights reserved.
//

#import "PMFrequencyViewController.h"
#import "PMReminderPickerViewController.h"

/* 
 
 Sets the frequency of intake of medication
 
 */


@interface PMFrequencyViewController ()  {
    NSMutableArray *frequency;
    NSArray *reccur;
    UIView *oldView;
}

@end

@implementation PMFrequencyViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad{
    [super viewDidLoad];
    frequency = [[NSMutableArray alloc]init];
    for (int i=0;i<5;i++)
        [frequency  setObject:@(i+1) atIndexedSubscript:i];
    reccur=[[NSArray alloc]initWithObjects:@"Daily",@"Weekly",@"Monthly",nil];
}

- (IBAction)doneAddingFrequency:(id)sender {
    self.medication.reminderReccurence = self.reccurenceLabel.text;
    self.medication.reminderFrequency = self.frequencyLabel.text ;
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma -mark PickerView delegates

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 2;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    if(component == 0)
        return [frequency count];
    else
        return [reccur count];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if(component == 0)
        return [NSString stringWithFormat:@"%@",[frequency objectAtIndex:row]];
    else
        return [reccur objectAtIndex:row];
}


- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if(component == 0)
        self.frequencyLabel.text=[NSString stringWithFormat:@"%@",[frequency objectAtIndex:row]];
    else
        self.reccurenceLabel.text=[reccur objectAtIndex:row];
    if (oldView != nil)
        oldView.backgroundColor = [UIColor clearColor];
    
    UIView * selectedView = [[UIView alloc] init];
    selectedView = [pickerView viewForRow:row forComponent:component];
    selectedView.backgroundColor = [UIColor redColor];
    [selectedView setNeedsDisplay];
    oldView = selectedView;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
