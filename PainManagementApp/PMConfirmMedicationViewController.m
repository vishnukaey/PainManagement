//
//  PMConfirmMedicationViewController.m
//  PainManagementApp
//
//  Created by Vishnu on 02/09/14.
//  Copyright (c) 2014 DenovoNow. All rights reserved.
//

/*
 This ViewController shows a particular medication which is selected along with an image for the user to confirm it or cancel it
 */

#import "PMConfirmMedicationViewController.h"

@interface PMConfirmMedicationViewController (){
    NSArray *imagesInArray;
}

@end

@implementation PMConfirmMedicationViewController

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
    self.medicationName.text = self.medication.medicationName;
//    imagesInArray = [[NSArray alloc]init];
//	imagesInArray = [NSArray arrayWithObjects:
//                     @"ball-orange.png",@"ball-orange.png", @"ball-orange.png",@"ball-orange.png", nil];
    self.image.image = self.medication.medicationImage;
}

//#pragma mark-  Collection View Delegates
//
//- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
//    return 1;
//}
//
//
//
//- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
//    static NSString *identifier = @"collection";
//    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
//    UIImageView *recipeImageView = (UIImageView *)[cell viewWithTag:20];
//    recipeImageView.image = [UIImage imageNamed:[imagesInArray objectAtIndex:indexPath.row]];
//    return cell;
//}


- (IBAction)confirmMedication:(id)sender {
    [self.delegate pushToReminderViewController];
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (IBAction)cancel:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
