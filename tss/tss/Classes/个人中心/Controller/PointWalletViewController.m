//
//  PointWalletViewController.m
//  tss
//
//  Created by admin on 17/2/16.
//  Copyright © 2017年 com.yunlaila. All rights reserved.
//

#import "PointWalletViewController.h"
#import "PayViewController.h"
#import "WithdrawDepositsViewController.h"
@interface PointWalletViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    
}
@property (nonatomic ,strong) UITableView *tableView;
@end

@implementation PointWalletViewController
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initTitle];
    [self initView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initTitle
{
    self.title = @"网点钱包";
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithIcon:@"fanhuijian_xiache-拷贝-2" highIcon:@"fanhuijian_xiache-拷贝-2" target:self action:@selector(pop:)];
    
    UIBarButtonItem *changyongItem = [[UIBarButtonItem alloc] initWithTitle:@"详情" style:UIBarButtonItemStyleDone target:self action:@selector(changyong)];
    self.navigationItem.rightBarButtonItem = changyongItem;
    [self.navigationItem.rightBarButtonItem setTintColor:lvColor];
    [self.navigationItem.rightBarButtonItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:15],NSFontAttributeName, nil] forState:UIControlStateNormal];
}

- (void)pop:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}


- (void)changyong
{
    NSLog(@"详情");
}

- (UITableView *)tableView
{
    if(!_tableView)
    {
        _tableView = [[UITableView alloc] init];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.backgroundColor = bgViewColor;
        _tableView.separatorStyle = UITableViewCellSelectionStyleNone;
        if (IsIOS7)
        {
            _tableView.separatorInset = UIEdgeInsetsZero;
        }
    }
    return _tableView;
}

- (void)initView
{
    [self.view addSubview:self.tableView];
    
    [_tableView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).with.offset(0);
        make.left.equalTo(self.view).with.offset(0);
        make.bottom.equalTo(self.view).with.offset(0);
        make.right.equalTo(self.view).with.offset(0);
    }];
    
    [_tableView reloadData];
}

#pragma mark - tableView代理
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0)
    {
        return 1;
    }
    else
    {
        return 3;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10*APP_DELEGATE().autoSizeScaleY;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(0*APP_DELEGATE().autoSizeScaleX, 0, 320*APP_DELEGATE().autoSizeScaleX, 10*APP_DELEGATE().autoSizeScaleY)];
    bgView.backgroundColor = bgViewColor;
    return bgView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section==0)
    {
        return 160*APP_DELEGATE().autoSizeScaleY;
    }
    else
    {
        return 46*APP_DELEGATE().autoSizeScaleY;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString* CellIdentifier3 = @"CellIdentifier3";
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier3];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:CellIdentifier3];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.backgroundColor = [UIColor whiteColor];
    }
    
    for (UIView *view in cell.contentView.subviews)
    {
        [view removeFromSuperview];
    }
    
#pragma mark - 金额
    if (indexPath.section==0)
    {
        cell.backgroundColor = lvColor;
        
        UILabel *titleLable1 = [[UILabel alloc] init];
        titleLable1.numberOfLines = 0;
        titleLable1.textAlignment = NSTextAlignmentLeft;
        titleLable1.font = viewFont3;
        titleLable1.textColor = [UIColor whiteColor];
        [cell.contentView addSubview:titleLable1];
        titleLable1.text = @"金额(元)";
        
        [titleLable1 makeConstraints:^(MASConstraintMaker *make)
         {
             make.left.equalTo(cell.contentView).with.offset(15);
             make.top.equalTo(cell.contentView.mas_centerY).with.offset(-40);
             make.size.equalTo(CGSizeMake(320,20*APP_DELEGATE().autoSizeScaleY));
         }];
        
        UILabel *titleLable2 = [[UILabel alloc] init];
        titleLable2.numberOfLines = 0;
        titleLable2.textAlignment = NSTextAlignmentLeft;
        titleLable2.font =  [UIFont systemFontOfSize:sizeValue(35)];
        titleLable2.textColor = [UIColor whiteColor];
        [cell.contentView addSubview:titleLable2];
        titleLable2.text = @"15882175186";
        
        [titleLable2 makeConstraints:^(MASConstraintMaker *make)
         {
             make.left.equalTo(cell.contentView).with.offset(15);
             make.top.equalTo(cell.contentView.mas_centerY).with.offset(-20);
             make.size.equalTo(CGSizeMake(320*APP_DELEGATE().autoSizeScaleX,50*APP_DELEGATE().autoSizeScaleY));
         }];
        
        
    }
    else
    {
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        UIImageView *icon1 = [[UIImageView alloc] init];
        [cell.contentView addSubview:icon1];
        [icon1 makeConstraints:^(MASConstraintMaker *make)
         {
             make.centerY.equalTo(cell.contentView.mas_centerY);
             make.left.equalTo(cell.contentView).with.offset(15);
             make.size.equalTo(CGSizeMake(18*APP_DELEGATE().autoSizeScaleY,18*APP_DELEGATE().autoSizeScaleY));
         }];
        
        UILabel *titleLable1 = [[UILabel alloc] init];
        titleLable1.numberOfLines = 0;
        titleLable1.textAlignment = NSTextAlignmentLeft;
        titleLable1.font = viewFont3;
        titleLable1.textColor = fontColor;
        titleLable1.backgroundColor = [UIColor whiteColor];
        [cell.contentView addSubview:titleLable1];
        
        [titleLable1 makeConstraints:^(MASConstraintMaker *make)
         {
             make.left.equalTo(icon1.mas_right).with.offset(15);
             make.centerY.equalTo(cell.contentView.mas_centerY);
             make.size.equalTo(CGSizeMake(180*APP_DELEGATE().autoSizeScaleX,46*APP_DELEGATE().autoSizeScaleY));
         }];
        
        UIView *fgx1 = [[UIView alloc] init];
        fgx1.backgroundColor = bgViewColor;
        [cell.contentView addSubview:fgx1];
        
        [fgx1 makeConstraints:^(MASConstraintMaker *make)
         {
             make.left.equalTo(cell.contentView.mas_left).with.offset(10);
             //            make.right.equalTo(cell.contentView.mas_right).with.offset(-10);
             make.bottom.equalTo(cell.contentView).with.offset(-1);
             make.size.equalTo(CGSizeMake(300*APP_DELEGATE().autoSizeScaleX, 1));
             //             make.height.equalTo(1);
         }];        
#pragma mark - 网点钱包
        if(indexPath.section==1&&indexPath.row==0)
        {
            icon1.image = [UIImage imageNamed:@"wdqb_chognzhi"];
            titleLable1.text = @"充值";
        }
        else  if(indexPath.section==1&&indexPath.row==1)
        {
            icon1.image = [UIImage imageNamed:@"wdqb_tixian"];
            titleLable1.text = @"提现";
        }
        else  if(indexPath.section==1&&indexPath.row==2)
        {
            icon1.image = [UIImage imageNamed:@"wdqb_yinhangka"];
            titleLable1.text = @"我的银行卡";
            [fgx1 removeFromSuperview];
        }
     }
#pragma mark - 关于
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section==1&&indexPath.row==0)
    {
        PayViewController *vc = [[PayViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
    else if(indexPath.section==1&&indexPath.row==1)
    {
        WithdrawDepositsViewController *vc = [[WithdrawDepositsViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
}

@end
