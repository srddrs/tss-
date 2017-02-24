//
//  StevedoreManageViewController.m
//  tss
//
//  Created by admin on 17/2/21.
//  Copyright © 2017年 com.yunlaila. All rights reserved.
//

#import "StevedoreManageViewController.h"
#import "AddStevedoreViewController.h"
#import "UpdateStevedoreViewController.h"
@interface StevedoreManageViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    
}

@property (nonatomic ,strong) UITableView *tableView;
@end

@implementation StevedoreManageViewController

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
    self.title = @"装卸工管理";
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
        make.bottom.equalTo(self.view).with.offset(-40*APP_DELEGATE().autoSizeScaleY);
        make.right.equalTo(self.view).with.offset(0);
    }];
    
    [_tableView reloadData];
    
    UIButton *withdrawBtn = [[UIButton alloc] init];
    [withdrawBtn setTitle:@"添加装卸工" forState:UIControlStateNormal];
    [withdrawBtn setTitle:@"添加装卸工" forState:UIControlStateHighlighted];
    [withdrawBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [withdrawBtn setTitleColor:lvColor forState:UIControlStateHighlighted];
    [withdrawBtn setBackgroundImage:[UIImage imageWithColor:lvColor] forState:UIControlStateNormal];
    //    [withdrawBtn setBackgroundImage:[UIImage imageWithColor:lvColor] forState:UIControlStateHighlighted];
    [withdrawBtn addTarget:self
                    action:@selector(withdrawBtnClick:)
          forControlEvents:UIControlEventTouchUpInside];
    withdrawBtn.titleLabel.font = viewFont1;
    [self.view addSubview:withdrawBtn];
    
    [withdrawBtn makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_tableView.bottom).with.offset(1);
        make.size.equalTo(CGSizeMake(320*APP_DELEGATE().autoSizeScaleX, 40*APP_DELEGATE().autoSizeScaleY));
    }];
    
}

#pragma mark - tableView代理
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 10;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
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
    return 135*APP_DELEGATE().autoSizeScaleY;
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
    
    
    UIView *bgViewDown = [[UIView alloc] init];
    bgViewDown.backgroundColor = [UIColor whiteColor];
    [cell.contentView addSubview:bgViewDown];
    [bgViewDown makeConstraints:^(MASConstraintMaker *make)
     {
         make.bottom.equalTo(cell.contentView).with.offset(0);
         make.size.equalTo(CGSizeMake(320*APP_DELEGATE().autoSizeScaleX,40*APP_DELEGATE().autoSizeScaleY));
     }];
    
    UIView *fgx2 = [[UIView alloc] init];
    fgx2.backgroundColor = bgViewColor;
    [bgViewDown addSubview:fgx2];
    
    [fgx2 makeConstraints:^(MASConstraintMaker *make)
     {
         //         make.left.equalTo(cell.contentView.mas_left).with.offset(10);
         //            make.right.equalTo(cell.contentView.mas_right).with.offset(-10);
         make.top.equalTo(bgViewDown).with.offset(0);
         make.size.equalTo(CGSizeMake(320*APP_DELEGATE().autoSizeScaleX, 1));
         make.height.equalTo(1);
     }];
    
    UIImageView *icon1 = [[UIImageView alloc] init];
    icon1.image = [UIImage imageNamed:@"zxsj_renyuan"];
    [bgViewTop addSubview:icon1];
    [icon1 makeConstraints:^(MASConstraintMaker *make)
     {
         make.centerY.equalTo(bgViewTop.mas_centerY);
         make.left.equalTo(bgViewTop).with.offset(15);
         make.size.equalTo(CGSizeMake(12*APP_DELEGATE().autoSizeScaleY,15*APP_DELEGATE().autoSizeScaleY));
     }];
    
    UILabel *titleLable1 = [[UILabel alloc] init];
    titleLable1.numberOfLines = 0;
    titleLable1.textAlignment = NSTextAlignmentLeft;
    titleLable1.font = viewFont3;
    titleLable1.textColor = fontColor;
    [bgViewTop addSubview:titleLable1];
    titleLable1.text = @"文勇";
    
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
    titleLable2.text = @"正常状态";
    
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
    titleLable3.text = @"账号:15882175186";
    
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
    titleLable4.text = @"性别:男";
    
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
    titleLable5.text = @"添加时间:2016-12-12";
    
    [titleLable5 makeConstraints:^(MASConstraintMaker *make)
     {
         make.left.equalTo(cell.contentView).with.offset(15*APP_DELEGATE().autoSizeScaleX);
         make.top.equalTo(cell.contentView).with.offset(73*APP_DELEGATE().autoSizeScaleY);
         make.size.equalTo(CGSizeMake(290*APP_DELEGATE().autoSizeScaleX,21*APP_DELEGATE().autoSizeScaleY));
     }];
    
    
    //修改
    UIButton *xiugaiBtn = [[UIButton alloc] init];
    [xiugaiBtn setTitle:@"修改" forState:UIControlStateNormal];
    [xiugaiBtn setTitle:@"修改" forState:UIControlStateHighlighted];
    [xiugaiBtn setTitleColor:fontColor forState:UIControlStateNormal];
    [xiugaiBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    [xiugaiBtn setBackgroundImage:[UIImage imageWithColor:[UIColor whiteColor] ] forState:UIControlStateNormal];
    [xiugaiBtn setBackgroundImage:[UIImage imageWithColor:lvColor] forState:UIControlStateHighlighted];
    [xiugaiBtn addTarget:self
                  action:@selector(xiugaiBtnClick:)
        forControlEvents:UIControlEventTouchUpInside];
    xiugaiBtn.titleLabel.font = viewFont3;
    [cell.contentView addSubview:xiugaiBtn];
    
    [xiugaiBtn makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(bgViewDown.mas_centerY);
        make.left.equalTo(bgViewDown).with.offset(245*APP_DELEGATE().autoSizeScaleX);
        make.size.equalTo(CGSizeMake(65*APP_DELEGATE().autoSizeScaleX, 21*APP_DELEGATE().autoSizeScaleY));
    }];
    LRViewBorderRadius(xiugaiBtn, 3, 1,  [UIColor colorWithRed:167/255.0 green:167/255.0 blue:167/255.0 alpha:1]);
    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}



- (void)xiugaiBtnClick:(UIButton *)sender
{
    NSLog(@"修改");
    UpdateStevedoreViewController *vc = [[UpdateStevedoreViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)withdrawBtnClick:(UIButton *)sender
{
    NSLog(@"添加装卸工");
    AddStevedoreViewController *vc = [[AddStevedoreViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
