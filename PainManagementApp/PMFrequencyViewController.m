//
//  PMFrequencyViewController.m
//  PainManagementApp
//
//  Created by Vishnu on 03/09/14.
//  Copyright (c) 2014 DenovoNow. All rights reserved.
//

#import "PMFrequencyViewController.h"
#import "PMReminderPickerViewController.h"

@interface PMFrequencyViewController (){
    NSMutableArray *frequency;
    NSArray *reccur;
    NSMutableDictionary *medicationMutable;
}

@end

@implementation PMFrequencyViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (void)viewDidLoad{
    medicationMutable =[[NSMutableDictionary alloc] initWithDictionary:self.medication];
    [super viewDidLoad];
    frequency = [[NSMutableArray alloc]init];
    for (int i=0;i<10;i++)
        [frequency  setObject:@(i+1) atIndexedSubscript:i];
    reccur=[[NSArray alloc]initWithObjects:@"Daily",@"Weekly",@"Monthly",nil];
}


- (IBAction)nextViewController:(id)sender {
    [medicationMutable setObject:self.reccurenceLabel.text forKey:@"reccurence"];
    [medicationMutable setValue:self.frequencyLabel.text forKey:@"frequency"];
    self.medication=medicationMutable;
    [self performSegueWithIdentifier:@"time" sender:self];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
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
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"time"]){
        PMReminderPickerViewController *pickTime = [segue destinationViewController];
        pickTime.medication=medicationMutable;
    }
}
@end