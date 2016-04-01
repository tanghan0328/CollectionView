//
//  TWCollectionViewController.m
//  CollectionView
//
//  Created by tang on 16/3/7.
//  Copyright © 2016年 tang. All rights reserved.
//

#import "TWCollectionViewController.h"
#import "TWCollectionViewCell.h"

#define StaticCell  @"CollectionCell"

@interface TWCollectionViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
@property (retain, nonatomic) UICollectionView *collectionView;

@end

@implementation TWCollectionViewController

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createCollectionView];
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)createCollectionView
{
    if(_collectionView == nil){
        UICollectionViewFlowLayout *flowLayout =[[UICollectionViewFlowLayout alloc]init];
        _collectionView = [[UICollectionView alloc]initWithFrame:self.bounds collectionViewLayout:flowLayout];
        [_collectionView registerClass:[TWCollectionViewCell class] forCellWithReuseIdentifier:@"TWCollectionViewCell"];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.backgroundColor = [UIColor clearColor];
        [self addSubview:_collectionView];
    }
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 30;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"TWCollectionViewCell";
//    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
//    [cell.contentView removeFromSuperview];
//    cell.backgroundColor = [UIColor whiteColor];
//    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 120, 100)];
//    imageView.image = [UIImage imageNamed:@"123_02"];
//    [cell.contentView addSubview:imageView];
//    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 100, 120, 20)];
//    label.text = [NSString stringWithFormat:@"顺序 %ld", (long)indexPath.row ];
//   // label.text = @"测试使用";
//    [cell.contentView addSubview:label];
    TWCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    cell.label.text = [NSString stringWithFormat:@"顺序为：%d",indexPath.row];
    return cell;
    
//    在UITableView中遇到过，原因是Cell的重用机制以及在自定义的Cell中将新建控件和为控件赋值写在了一起，然后不断的addSubview，最终导致Cell中的内容重叠。解决方法有两个。
//    1、在自定义的Cell中把UI部分和为UI控件赋值的部分分开写。在TableView中为Cell某些控件赋值的时候调用Cell中赋值的方法，这样就不会重复的addsubview，也就不会出现Cell重合的问题了。
//    2、如果一定要把赋值和创建UI控件写在一起，那么添加的时候添加到cell的contentView上。在tableView中，当取到一个重用Cell的时候就将cell中的值清空一下，也就是下面的那段代码。
//    for (UIView *subView in cell.contentView.subviews) {
//        [subView removeFromSuperview];
//    }
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
     return UIEdgeInsetsMake(15, 15, 5, 15);//分别为上、左、下、右
}
//选择一个
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
    [cell setBackgroundColor:[UIColor greenColor]];
}

//取消选择了某个cell
- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
    [cell setBackgroundColor:[UIColor redColor]];
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(120, 120);
}

@end
