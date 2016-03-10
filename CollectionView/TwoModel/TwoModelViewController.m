//
//  TwoModelViewController.m
//  CollectionView
//
//  Created by tang on 16/3/7.
//  Copyright © 2016年 tang. All rights reserved.
//

#import "TwoModelViewController.h"
#import "TabelViewController.h"
#import "TWCollectionViewController.h"
#import "CollectionDefine.h"

@interface TwoModelViewController ()
{
    //判断View展示方式
    BOOL _isShowListLayout;
}

@property (nonatomic, retain) UIButton *rigthBtn;
@property (nonatomic, retain)TabelViewController *tableViewController;
@property (nonatomic, retain)TWCollectionViewController *collectionController;

@end

@implementation TwoModelViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"测试两种模式切换";
    self.navigationController.toolbarHidden = YES;
    _isShowListLayout = NO;
    self.view.backgroundColor = [UIColor whiteColor];
    _rigthBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 30, 44)];
    if(_isShowListLayout){
        [_rigthBtn setImage:[UIImage imageNamed:@"product_list_grid_btn"] forState:UIControlStateNormal];
        
    }else{
        [self.rigthBtn setImage:[UIImage imageNamed:@"product_list_list_btn"] forState:UIControlStateNormal];
    }
    [_rigthBtn addTarget:self action:@selector(onRightClick) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithCustomView:_rigthBtn];
    self.navigationItem.rightBarButtonItem = item;
    
    [self initAndLoadTable];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)onRightClick
{
    _isShowListLayout = !_isShowListLayout;
    if(_isShowListLayout){
        [_rigthBtn setImage:[UIImage imageNamed:@"product_list_grid_btn"] forState:UIControlStateNormal];
        [self initAndLoadCollection];
    }else{
        [self.rigthBtn setImage:[UIImage imageNamed:@"product_list_list_btn"] forState:UIControlStateNormal];
        [self initAndLoadTable];
    }
}

- (void)initAndLoadCollection
{
    self.tableViewController.hidden = YES;
    if(_collectionController){
        [_collectionController removeFromSuperview];
    }
    _collectionController = [[TWCollectionViewController alloc]initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT)];
    _collectionController.hidden = NO;
    [self.view addSubview:_collectionController];
}

- (void)initAndLoadTable
{
    self.collectionController.hidden = YES;
    if(_tableViewController){
        [_tableViewController removeFromSuperview];
    }
    _tableViewController = [[TabelViewController alloc]initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT)];
    _tableViewController.hidden = NO;
    [self.view addSubview:_tableViewController];
}

@end
