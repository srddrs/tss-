//
//  ReimbursementFlowViewController.m
//  tss
//
//  Created by admin on 17/2/21.
//  Copyright © 2017年 com.yunlaila. All rights reserved.
//

#import "ReimbursementFlowViewController.h"

@interface ReimbursementFlowViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    
}

@property (nonatomic ,strong) UITableView *tableView;
@end

@implementation ReimbursementFlowViewController
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
    self.title = @"查看流程";
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithIcon:@"fanhuijian_xiache-拷贝-2" highIcon:@"fanhuijian_xiache-拷贝-2" target:self action:@selector(pop:)];
}

- (void)pop:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
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
        make.top.equalTo(self.view).with.offset(0*APP_DELEGATE().autoSizeScaleY);
        make.left.equalTo(self.view).with.offset(0);
        make.bottom.equalTo(self.view).with.offset(0*APP_DELEGATE().autoSizeScaleY);
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
    if (section==0)
    {
        return 1;
    }
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section==0)
    {
        return 10*APP_DELEGATE().autoSizeScaleY;
    }
    return 0;
    
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
     if (section==0)
     {
         UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(0*APP_DELEGATE().autoSizeScaleX, 0, 320*APP_DELEGATE().autoSizeScaleX, 10*APP_DELEGATE().autoSizeScaleY)];
         bgView.backgroundColor = bgViewColor;
         return bgView;
     }
    return nil;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0)
    {
        return 118*APP_DELEGATE().autoSizeScaleY;
    }
    else
    {
        return 80*APP_DELEGATE().autoSizeScaleY;
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
        cell.backgroundColor = [UIColor colorWithRed:249/255.0 green:249/255.0 blue:249/255.0 alpha:1];
    }
    
    for (UIView *view in cell.contentView.subviews)
    {
        [view removeFromSuperview];
    }
    if (indexPath.section==0)
    {
        UIView *bgViewTop = [[UIView alloc] init];
        bgViewTop.backgroundColor = [UIColor whiteColor];
        [cell.contentView addSubview:bgViewTop];
        [bgViewTop makeConstraints:^(MASConstraintMaker *make)
         {
             make.top.equalTo(cell.contentView).with.offset(0);
             make.size.equalTo(CGSizeMake(320*APP_DELEGATE().autoSizeScaleX,30*APP_DELEGATE().autoSizeScaleY));
         }];
        
        UIView *fgx1 = [[UIView alloc] init];
        fgx1.backgroundColor = bgViewColor;
        [bgViewTop addSubview:fgx1];
        
        [fgx1 makeConstraints:^(MASConstraintMaker *make)
         {
             //         make.left.equalTo(cell.contentView.mas_left).with.offset(10);
             //            make.right.equalTo(cell.contentView.mas_right).with.offset(-10);
             make.bottom.equalTo(bgViewTop).with.offset(0);
             make.size.equalTo(CGSizeMake(320*APP_DELEGATE().autoSizeScaleX, 1));
             make.height.equalTo(1);
         }];
        
        
        UIImageView *icon1 = [[UIImageView alloc] init];
        icon1.image = [UIImage imageNamed:@"bx_liucheng"];
        [bgViewTop addSubview:icon1];
        [icon1 makeConstraints:^(MASConstraintMaker *make)
         {
             make.centerY.equalTo(bgViewTop.mas_centerY);
             make.left.equalTo(bgViewTop).with.offset(15);
             make.size.equalTo(CGSizeMake(16*APP_DELEGATE().autoSizeScaleY,16*APP_DELEGATE().autoSizeScaleY));
         }];
        
        UILabel *titleLable1 = [[UILabel alloc] init];
        titleLable1.numberOfLines = 0;
        titleLable1.textAlignment = NSTextAlignmentLeft;
        titleLable1.font = viewFont3;
        titleLable1.textColor = fontColor;
        [bgViewTop addSubview:titleLable1];
        titleLable1.text = @"阆中营业点某某";
        
        [titleLable1 makeConstraints:^(MASConstraintMaker *make)
         {
             make.left.equalTo(icon1.mas_right).with.offset(10);
             make.centerY.equalTo(bgViewTop.mas_centerY);
             make.size.equalTo(CGSizeMake(180*APP_DELEGATE().autoSizeScaleX,28*APP_DELEGATE().autoSizeScaleY));
         }];
        
        UILabel *titleLable2 = [[UILabel alloc] init];
        titleLable2.numberOfLines = 0;
        titleLable2.textAlignment = NSTextAlignmentRight;
        titleLable2.font = viewFont3;
        titleLable2.textColor = lvColor;
        [bgViewTop addSubview:titleLable2];
        titleLable2.text = @"等待审核";
        
        [titleLable2 makeConstraints:^(MASConstraintMaker *make)
         {
             make.right.equalTo(bgViewTop.mas_right).with.offset(-10);
             make.centerY.equalTo(bgViewTop.mas_centerY);
             make.size.equalTo(CGSizeMake(180*APP_DELEGATE().autoSizeScaleX,28*APP_DELEGATE().autoSizeScaleY));
         }];
        
        UILabel *titleLable3 = [[UILabel alloc] init];
        titleLable3.numberOfLines = 0;
        titleLable3.textAlignment = NSTextAlignmentLeft;
        titleLable3.font = viewFont3;
        titleLable3.textColor = fontHuiColor;
        [cell.contentView addSubview:titleLable3];
        titleLable3.text = @"审批事件:通讯费";
        
        [titleLable3 makeConstraints:^(MASConstraintMaker *make)
         {
             make.left.equalTo(cell.contentView).with.offset(15*APP_DELEGATE().autoSizeScaleX);
             make.top.equalTo(cell.contentView).with.offset(32*APP_DELEGATE().autoSizeScaleY);
             make.size.equalTo(CGSizeMake(290*APP_DELEGATE().autoSizeScaleX,21*APP_DELEGATE().autoSizeScaleY));
         }];
        
        UILabel *titleLable4 = [[UILabel alloc] init];
        titleLable4.numberOfLines = 0;
        titleLable4.textAlignment = NSTextAlignmentLeft;
        titleLable4.font = viewFont3;
        titleLable4.textColor = fontHuiColor;
        [cell.contentView addSubview:titleLable4];
        titleLable4.text = @"报销金额:500";
        
        [titleLable4 makeConstraints:^(MASConstraintMaker *make)
         {
             make.left.equalTo(cell.contentView).with.offset(15*APP_DELEGATE().autoSizeScaleX);
             make.top.equalTo(cell.contentView).with.offset(52*APP_DELEGATE().autoSizeScaleY);
             make.size.equalTo(CGSizeMake(290*APP_DELEGATE().autoSizeScaleX,21*APP_DELEGATE().autoSizeScaleY));
         }];
        
        UILabel *titleLable5 = [[UILabel alloc] init];
        titleLable5.numberOfLines = 0;
        titleLable5.textAlignment = NSTextAlignmentLeft;
        titleLable5.font = viewFont3;
        titleLable5.textColor = fontHuiColor;
        [cell.contentView addSubview:titleLable5];
        titleLable5.text = @"开始时间:2011-11-11";
        
        [titleLable5 makeConstraints:^(MASConstraintMaker *make)
         {
             make.left.equalTo(cell.contentView).with.offset(15*APP_DELEGATE().autoSizeScaleX);
             make.top.equalTo(cell.contentView).with.offset(73*APP_DELEGATE().autoSizeScaleY);
             make.size.equalTo(CGSizeMake(290*APP_DELEGATE().autoSizeScaleX,21*APP_DELEGATE().autoSizeScaleY));
         }];
        
        UILabel *titleLable6 = [[UILabel alloc] init];
        titleLable6.numberOfLines = 0;
        titleLable6.textAlignment = NSTextAlignmentLeft;
        titleLable6.font = viewFont3;
        titleLable6.textColor = fontHuiColor;
        [cell.contentView addSubview:titleLable6];
        titleLable6.text = @"备注:请尽快审批批准";
        
        [titleLable6 makeConstraints:^(MASConstraintMaker *make)
         {
             make.left.equalTo(cell.contentView).with.offset(15*APP_DELEGATE().autoSizeScaleX);
             make.top.equalTo(cell.contentView).with.offset(94*APP_DELEGATE().autoSizeScaleY);
             make.size.equalTo(CGSizeMake(290*APP_DELEGATE().autoSizeScaleX,21*APP_DELEGATE().autoSizeScaleY));
         }];
    }
    else
    {
        cell.contentView.backgroundColor = bgViewColor;
        
        UIView *fgx2 = [[UIView alloc] init];
        fgx2.backgroundColor = [UIColor colorWithRed:212/255.0 green:212/255.0 blue:212/255.0 alpha:1];
        [cell.contentView addSubview:fgx2];
        
        [fgx2 makeConstraints:^(MASConstraintMaker *make)
         {
             make.top.equalTo(cell.contentView).with.offset(0);
             make.left.equalTo(cell.contentView).with.offset(23*APP_DELEGATE().autoSizeScaleX);
             make.size.equalTo(CGSizeMake(1, 80*APP_DELEGATE().autoSizeScaleY));
         }];

        
        UIImageView *icon1 = [[UIImageView alloc] init];
        icon1.image = [UIImage imageNamed:@"bx_wancheng"];  //bx_shenhezhong
        [cell.contentView addSubview:icon1];
        [icon1 makeConstraints:^(MASConstraintMaker *make)
         {
             make.top.equalTo(cell.contentView).with.offset(25*APP_DELEGATE().autoSizeScaleY);;
             make.left.equalTo(cell.contentView).with.offset(15*APP_DELEGATE().autoSizeScaleX);
             make.size.equalTo(CGSizeMake(16*APP_DELEGATE().autoSizeScaleY,16*APP_DELEGATE().autoSizeScaleY));
         }];
        
        
        
        UIView *bgView = [[UIView alloc] init];
        bgView.backgroundColor = [UIColor whiteColor];
        [cell.contentView addSubview:bgView];
        [bgView makeConstraints:^(MASConstraintMaker *make)
         {
             make.left.equalTo(cell.contentView).with.offset(45*APP_DELEGATE().autoSizeScaleX);
             make.top.equalTo(cell.contentView).with.offset(10*APP_DELEGATE().autoSizeScaleY);
             make.size.equalTo(CGSizeMake(260*APP_DELEGATE().autoSizeScaleX,70*APP_DELEGATE().autoSizeScaleY));
         }];
         LRViewBorderRadius(bgView, 5, 1, [UIColor clearColor]);
    
        UILabel *titleLable1 = [[UILabel alloc] init];
        titleLable1.numberOfLines = 0;
        titleLable1.textAlignment = NSTextAlignmentLeft;
        titleLable1.font = viewFont3;
        titleLable1.textColor = fontColor;
        [bgView addSubview:titleLable1];
        titleLable1.text = @"XXX";
        
        [titleLable1 makeConstraints:^(MASConstraintMaker *make)
         {
             make.left.equalTo(bgView).with.offset(10*APP_DELEGATE().autoSizeScaleX);
             make.top.equalTo(bgView).with.offset(10*APP_DELEGATE().autoSizeScaleY);
             make.size.equalTo(CGSizeMake(130*APP_DELEGATE().autoSizeScaleX,28*APP_DELEGATE().autoSizeScaleY));
         }];
        
        UILabel *titleLable2 = [[UILabel alloc] init];
        titleLable2.numberOfLines = 0;
        titleLable2.textAlignment = NSTextAlignmentRight;
        titleLable2.font = viewFont3;
        titleLable2.textColor = fontHuiColor;
        [bgView addSubview:titleLable2];
        titleLable2.text = @"2018-11-11 11:11";
        
        [titleLable2 makeConstraints:^(MASConstraintMaker *make)
         {
             make.left.equalTo(titleLable1.mas_right).with.offset(0);
             make.top.equalTo(bgView).with.offset(10*APP_DELEGATE().autoSizeScaleX);
             make.size.equalTo(CGSizeMake(110*APP_DELEGATE().autoSizeScaleX,28*APP_DELEGATE().autoSizeScaleY));
         }];


        UILabel *titleLable3 = [[UILabel alloc] init];
        titleLable3.numberOfLines = 0;
        titleLable3.textAlignment = NSTextAlignmentLeft;
        titleLable3.font = viewFont3;
        titleLable3.textColor = lvColor;
        [bgView addSubview:titleLable3];
        titleLable3.text = @"发起申请";
        
        [titleLable3 makeConstraints:^(MASConstraintMaker *make)
         {
             make.left.equalTo(bgView).with.offset(10*APP_DELEGATE().autoSizeScaleX);
             make.top.equalTo(bgView).with.offset(34*APP_DELEGATE().autoSizeScaleY);
             make.size.equalTo(CGSizeMake(130*APP_DELEGATE().autoSizeScaleX,28*APP_DELEGATE().autoSizeScaleY));
         }];

    }
    
     return cell;
}

@end
