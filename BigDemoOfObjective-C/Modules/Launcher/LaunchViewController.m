//
//  LaunchViewController.m
//  BigDemoOfObjective-C
//
//  Created by 王亮 on 2020/5/25.
//  Copyright © 2020 DevWangLiang. All rights reserved.
//

#import "LaunchViewController.h"
#import "LaunchCell.h"

@interface LaunchViewController ()<LaunchCellDelegate,UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UICollectionViewFlowLayout *layout;

@property (nonatomic, strong) NSMutableArray *dataSource;

@end

@implementation LaunchViewController

static NSString * const reuseIdentifier = @"LaunchCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    [self setupData];
    
    // Register cell classes
//    [self.collectionView registerClass:[LaunchCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    [self.collectionView registerNib:[UINib nibWithNibName:@"LaunchCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:reuseIdentifier];
    // Do any additional setup after loading the view.
}

- (void)viewWillLayoutSubviews{
    self.layout.minimumLineSpacing = 0;
    self.layout.minimumInteritemSpacing = 0;
    self.layout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
    CGSize boundsSize = [UIScreen mainScreen].bounds.size;
    self.layout.estimatedItemSize = boundsSize;
    self.layout.itemSize = boundsSize;
    
}

- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    
}

#pragma mark - - - - -
#pragma mark setup data

- (void)setupData{
    NSArray *data = @[
        @{
            @"title" : @"去年今日此山中",
            @"num" : @"1",
            @"type" : @(1)
        },
        @{
            @"title" : @"人面桃花相映红",
            @"num" : @"2",
            @"type" : @(1)
        },
        @{
            @"title" : @"人面不知何处去",
            @"num" : @"3",
            @"type" : @(1)
        },
        @{
            @"title" : @"桃花依旧笑春风",
            @"num" : @"4",
            @"type" : @(1)
        },
        @{
            @"title" : @"不念过往,不畏将来",
            @"num" : @"5",
            @"type" : @(1)
        }
    ];
    for (int i = 0; i < data.count; i++) {
        LaunchModel *model = [LaunchModel modelWithDictionary:data[i]];
        [self.dataSource addObject:model];
    }
}

#pragma mark - - - - -
#pragma mark cell delegate

- (void)didClickButton:(UIButton *)btn inCell:(LaunchCell *)cell{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"SwitchRootController" object:nil];
    [[NSUserDefaults standardUserDefaults] setBool:true forKey:@"IsFirst1"];
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.dataSource count];
}

#pragma mark - - - - -
#pragma mark cell
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    LaunchCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    cell.model = self.dataSource[indexPath.item];
    cell.delegate = self;
    return cell;
}

#pragma mark - - - - -
#pragma mark properties
- (NSMutableArray *)dataSource{
    if (_dataSource == nil) {
        _dataSource = [NSMutableArray array];
    }
    return _dataSource;
}

#pragma mark <UICollectionViewDelegate>

#pragma mark - - - - -
#pragma mark scrollView delegate

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    int index = scrollView.contentOffset.x / kScreenWidth;
    if (index == self.dataSource.count - 1) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:index inSection:0];
        LaunchCell *cell = (LaunchCell *)[self.collectionView cellForItemAtIndexPath:indexPath];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [cell showBottmButton];
        });
    }
}

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
