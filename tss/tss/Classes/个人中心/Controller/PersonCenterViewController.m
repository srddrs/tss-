//
//  PersonCenterViewController.m
//  tss
//
//  Created by admin on 17/2/15.
//  Copyright © 2017年 com.yunlaila. All rights reserved.
//

#import "PersonCenterViewController.h"
#import "PointWalletViewController.h"
#import "ChangePasswordViewController.h"
@interface PersonCenterViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    
}

@property (nonatomic ,strong) UITableView *tableView;
@end

@implementation PersonCenterViewController
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
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0)
    {
        return 1;
    }
    else if (section == 1)
    {
        return 3;
    }
    else
    {
        return 2;
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
        return 85*APP_DELEGATE().autoSizeScaleY;
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

    #pragma mark - 头像资料
    if (indexPath.section==0)
    {
        UIImageView *icon1 = [[UIImageView alloc] init];
        icon1.image = [UIImage imageNamed:@"grzx_touxiang"];
        [cell.contentView addSubview:icon1];
        [icon1 makeConstraints:^(MASConstraintMaker *make)
         {
             make.centerY.equalTo(cell.contentView.mas_centerY);
             make.left.equalTo(cell.contentView).with.offset(15);
             make.size.equalTo(CGSizeMake(50*APP_DELEGATE().autoSizeScaleY,50*APP_DELEGATE().autoSizeScaleY));
         }];

        UILabel *titleLable1 = [[UILabel alloc] init];
        titleLable1.numberOfLines = 0;
        titleLable1.textAlignment = NSTextAlignmentLeft;
        titleLable1.font = viewFont3;
        titleLable1.textColor = fontColor;
        titleLable1.backgroundColor = [UIColor whiteColor];
        [cell.contentView addSubview:titleLable1];
        titleLable1.text = @"操作员";
        
         CGSize size = [titleLable1 boundingRectWithSize:CGSizeMake(180*APP_DELEGATE().autoSizeScaleX, 20*APP_DELEGATE().autoSizeScaleY)];
        
        [titleLable1 makeConstraints:^(MASConstraintMaker *make)
         {
             make.left.equalTo(icon1.mas_right).with.offset(10);
             make.top.equalTo(cell.contentView.mas_centerY).with.offset(-20);
             make.size.equalTo(CGSizeMake(size.width,20*APP_DELEGATE().autoSizeScaleY));
         }];
        
        UILabel *titleLable2 = [[UILabel alloc] init];
        titleLable2.numberOfLines = 0;
        titleLable2.textAlignment = NSTextAlignmentLeft;
        titleLable2.font = viewFont4;
        titleLable2.textColor = fontHuiColor;
        titleLable2.backgroundColor = [UIColor whiteColor];
        [cell.contentView addSubview:titleLable2];
        titleLable2.text = @"(阆中网店营业员)";
        
        [titleLable2 makeConstraints:^(MASConstraintMaker *make)
         {
             make.left.equalTo(titleLable1.mas_right).with.offset(10);
             make.top.equalTo(cell.contentView.mas_centerY).with.offset(-20);
             make.size.equalTo(CGSizeMake(180*APP_DELEGATE().autoSizeScaleX,20*APP_DELEGATE().autoSizeScaleY));
         }];
        
        
        UILabel *titleLable3 = [[UILabel alloc] init];
        titleLable3.numberOfLines = 0;
        titleLable3.textAlignment = NSTextAlignmentLeft;
        titleLable3.font = viewFont3;
        titleLable3.textColor = fontColor;
        titleLable3.backgroundColor = [UIColor whiteColor];
        [cell.contentView addSubview:titleLable3];
        titleLable3.text = @"15882175186";
        
        [titleLable3 makeConstraints:^(MASConstraintMaker *make)
         {
             make.left.equalTo(icon1.mas_right).with.offset(10);
             make.top.equalTo(cell.contentView.mas_centerY).with.offset(0);
             make.size.equalTo(CGSizeMake(180*APP_DELEGATE().autoSizeScaleX,20*APP_DELEGATE().autoSizeScaleY));
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
             make.size.equalTo(CGSizeMake(140*APP_DELEGATE().autoSizeScaleX,46*APP_DELEGATE().autoSizeScaleY));
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
            icon1.image = [UIImage imageNamed:@"grzz_qianbao"];
            titleLable1.text = @"网点钱包";
        }
        else  if(indexPath.section==1&&indexPath.row==1)
        {
            icon1.image = [UIImage imageNamed:@"grzx_denglumima"];
            titleLable1.text = @"修改登录密码";
        }
        else  if(indexPath.section==1&&indexPath.row==2)
        {
            icon1.image = [UIImage imageNamed:@"grzx_zhifumima"];
            titleLable1.text = @"修改支付密码";
            [fgx1 removeFromSuperview];
        }
        else  if(indexPath.section==2&&indexPath.row==0)
        {
            icon1.image = [UIImage imageNamed:@"grzx_guanyuwomen"];
            titleLable1.text = @"关于我们";
        }
        else  if(indexPath.section==2&&indexPath.row==1)
        {
            icon1.image = [UIImage imageNamed:@"grzx_qingchuhuancun"];
            titleLable1.text = @"清除缓存";
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
        PointWalletViewController *vc = [[PointWalletViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
    else if(indexPath.section==1&&indexPath.row==1)
    {
        ChangePasswordViewController *vc = [[ChangePasswordViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
}

@end
