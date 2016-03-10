//
//  TabelViewController.m
//  CollectionView
//
//  Created by tang on 16/3/7.
//  Copyright © 2016年 tang. All rights reserved.
//

#import "TabelViewController.h"
#import "CollectionDefine.h"

@interface TabelViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (retain, nonatomic) UITableView *tableView;

@end

@implementation TabelViewController

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createTableView];
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)createTableView
{
    if(_tableView == nil){
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor= [UIColor clearColor];
        [self addSubview:_tableView];
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"tablecellAA";
    UITableViewCell *cell= [tableView dequeueReusableCellWithIdentifier:identifier];
    if(cell == nil){
//        NSArray *nibContents = [[NSBundle mainBundle]loadNibNamed:@"TableViewCell" owner:nil options:nil];
//        cell = [nibContents firstObject];
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifier];
        cell.imageView.image = [UIImage imageNamed:@"123_02"];
        cell.textLabel.text = @"测试数据";
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 120.0f;
}

@end
