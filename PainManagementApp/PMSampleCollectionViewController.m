//
//  PMSampleCollectionViewController.m
//  PainManagementApp
//
//  Created by Vishnu on 10/09/14.
//  Copyright (c) 2014 DenovoNow. All rights reserved.
//

#import "PMSampleCollectionViewController.h"

@interface PMSampleCollectionViewController (){
    NSArray *imagesInArray;
    NSInteger *page;
}

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
    imagesInArray = [[NSArray alloc]init];
	imagesInArray = [NSArray arrayWithObjects:
                     @"Plaquenil.jpg",@"ball-orange.png", @"Plaquenil.jpg",@"ball-orange.png", nil];
}

#pragma mark-  Collection View Delegates

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 4;
}



- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"collection";
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    UIImageView *recipeImageView = (UIImageView *)[cell viewWithTag:20];
    recipeImageView.image = [UIImage imageNamed:[imagesInArray objectAtIndex:indexPath.row]];
    
    return cell;
}

#pragma mark - UIScrollVewDelegate for UIPageControl

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    self.pageController.currentPage = self.pageController.currentPage+1;
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
