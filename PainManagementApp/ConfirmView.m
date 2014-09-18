//
//  ConfirmView.m
//  PainManagementApp
//
//  Created by Vishnu on 10/09/14.
//  Copyright (c) 2014 DenovoNow. All rights reserved.
//

#import "ConfirmView.h"
#import "PMConfirmCollectionViewCell.h"

@interface ConfirmView () <UICollectionViewDataSource,UICollectionViewDelegate>

@end

@implementation ConfirmView

+ (id)initFromNib
{
    ConfirmView *view =  nil;
    NSArray *nibs = [[NSBundle mainBundle] loadNibNamed:@"ConfirmView" owner:nil options:nil];
    for (int i = 0; i < nibs.count; i++) {
        id object = [nibs objectAtIndex:i];
        if ([object isKindOfClass:[ConfirmView class]]) {
            view = object;
            break;
        }
    }
    
    [view initialise];
    return view;
}

- (void)initialise
{
    [self.collectionView registerClass:[PMConfirmCollectionViewCell class] forCellWithReuseIdentifier:@"PMConfirmCollectionViewCell"];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
}

- (id)initWithFrame:(CGRect)frame
{
    [self doesNotRecognizeSelector:_cmd];
    return nil;
}

- (void) awakeFromNib {
    [super awakeFromNib];
}


- (IBAction)confirmMedication:(id)sender {
    [self removeFromSuperview];
    [self.delegate pushToReminderViewController];
}

#pragma mark-  Collection View Delegates

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return self.imagesArray.count;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    PMConfirmCollectionViewCell *cell = (PMConfirmCollectionViewCell*)[collectionView dequeueReusableCellWithReuseIdentifier:@"PMConfirmCollectionViewCell" forIndexPath:indexPath];
    if(!cell.imageView){
        cell.imageView= nil;
    }
    dispatch_queue_t q = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0ul);
    dispatch_async(q, ^{
        NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:[self.imagesArray objectAtIndex:indexPath.row]]];
        UIImage *img = [[UIImage alloc] initWithData:data];
        dispatch_async(dispatch_get_main_queue(), ^{
            [cell.imageView setImage:img];
        });
    });
    int pages = floor(_collectionView.contentSize.width / _collectionView.frame.size.width);
    [_pageController setNumberOfPages:pages];
    return cell;
}


- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout*)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(self.collectionView.frame.size.width, self.collectionView.frame.size.height);
}

#pragma mark - UIScrollVewDelegate for UIPageControl

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    CGFloat pageWidth = _collectionView.frame.size.width;
    float currentPage = _collectionView.contentOffset.x / pageWidth;
    if (0.0f != fmodf(currentPage, 1.0f)) {
        _pageController.currentPage = currentPage + 1;
    } else {
        _pageController.currentPage = currentPage;
    }
}



@end
