//
//  WithdrawDepositsViewController.m
//  tss
//
//  Created by admin on 17/2/16.
//  Copyright © 2017年 com.yunlaila. All rights reserved.
//

#import "WithdrawDepositsViewController.h"

@interface WithdrawDepositsViewController ()<UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate>
{
    
}
@property (nonatomic ,strong) UITableView *tableView;
@property (nonatomic, strong) UILabel *bankLabel;  //银行
@property (nonatomic, strong) UILabel *cardLabel;  //卡号
@property (nonatomic, strong) UITextField *moneyText;  //金额
@property (nonatomic, strong) UILabel *moneyLabel;  //金额
@end

@implementation WithdrawDepositsViewController
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
    self.title = @"提现";
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

- (UILabel *)bankLabel
{
    if(!_bankLabel)
    {
        _bankLabel = [[UILabel alloc] init];
        _bankLabel.numberOfLines = 0;
        _bankLabel.textAlignment = NSTextAlignmentLeft;
        _bankLabel.font = viewFont3;
        _bankLabel.textColor = fontColor;
    }
    
    return _bankLabel;
}

- (UILabel *)cardLabel
{
    if(!_cardLabel)
    {
        _cardLabel = [[UILabel alloc] init];
        _cardLabel.numberOfLines = 0;
        _cardLabel.textAlignment = NSTextAlignmentLeft;
        _cardLabel.font = viewFont4;
        _cardLabel.textColor = fontColor;
    }
    
    return _cardLabel;
}

- (UITextField *)moneyText
{
    if (!_moneyText)
    {
        
        _moneyText = [[UITextField alloc] init];
        _moneyText.backgroundColor = [UIColor whiteColor];
        _moneyText.clearButtonMode = UITextFieldViewModeWhileEditing;
        _moneyText.borderStyle = UITextBorderStyleNone;
        _moneyText.delegate = self;
        _moneyText.placeholder = @"";
        _moneyText.returnKeyType = UIReturnKeyDone;
        _moneyText.keyboardType = UIKeyboardTypeDefault;
        _moneyText.font = titleFont1;
        _moneyText.textColor = lvColor;
        [_moneyText setValue:lvColor forKeyPath:@"_placeholderLabel.textColor"];
        [_moneyText setValue:viewFont2 forKeyPath:@"_placeholderLabel.font"];
    }
    return _moneyText;
}

- (UILabel *)moneyLabel
{
    if(!_moneyLabel)
    {
        _moneyLabel = [[UILabel alloc] init];
        _moneyLabel.numberOfLines = 0;
        _moneyLabel.textAlignment = NSTextAlignmentLeft;
        _moneyLabel.font = viewFont3;
        _moneyLabel.textColor = fontColor;
    }
    
    return _moneyLabel;
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
    if(indexPath.section==0)
    {
        return 50*APP_DELEGATE().autoSizeScaleY;
    }
    else if(indexPath.section==1)
    {
        return 125*APP_DELEGATE().autoSizeScaleY;
    }
    else
    {
        return 100*APP_DELEGATE().autoSizeScaleY;
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
    
#pragma mark - 银行卡
    if (indexPath.section==0)
    {
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
        UIImageView *icon1 = [[UIImageView alloc] init];
        icon1.image = [UIImage imageNamed:@"grzx_touxiang"];
        [cell.contentView addSubview:icon1];
        [icon1 makeConstraints:^(MASConstraintMaker *make)
         {
             make.centerY.equalTo(cell.contentView.mas_centerY);
             make.left.equalTo(cell.contentView).with.offset(15);
             make.size.equalTo(CGSizeMake(25*APP_DELEGATE().autoSizeScaleY,25*APP_DELEGATE().autoSizeScaleY));
         }];

        [cell.contentView addSubview:self.bankLabel];
        self.bankLabel.text = @"中国银行";
        
        [self.bankLabel makeConstraints:^(MASConstraintMaker *make)
         {
             make.left.equalTo(icon1.mas_right).with.offset(10);
             make.top.equalTo(cell.contentView.mas_centerY).with.offset(-20);
             make.size.equalTo(CGSizeMake(200*APP_DELEGATE().autoSizeScaleX,20*APP_DELEGATE().autoSizeScaleY));
         }];
        
        [cell.contentView addSubview:self.cardLabel];
        self.cardLabel.text = @"尾号1234";
        
        [self.cardLabel makeConstraints:^(MASConstraintMaker *make)
         {
             make.left.equalTo(icon1.mas_right).with.offset(10);
             make.top.equalTo(cell.contentView.mas_centerY).with.offset(0);
             make.size.equalTo(CGSizeMake(180*APP_DELEGATE().autoSizeScaleX,20*APP_DELEGATE().autoSizeScaleY));
         }];
    }
    else if(indexPath.section==1)
    {
        UILabel *titleLable1 = [[UILabel alloc] init];
        titleLable1.numberOfLines = 0;
        titleLable1.textAlignment = NSTextAlignmentLeft;
        titleLable1.font = viewFont3;
        titleLable1.textColor = fontColor;
        [cell.contentView addSubview:titleLable1];
        titleLable1.text = @"提现金额";
        [titleLable1 makeConstraints:^(MASConstraintMaker *make)
         {
             make.left.equalTo(cell.contentView).with.offset(15);
             make.top.equalTo(cell.contentView).with.offset(10);
             make.size.equalTo(CGSizeMake(320,20*APP_DELEGATE().autoSizeScaleY));
         }];
        
        UILabel *moneyLable = [[UILabel alloc] init];
        moneyLable.numberOfLines = 0;
        moneyLable.textAlignment = NSTextAlignmentLeft;
        moneyLable.font = [UIFont systemFontOfSize:sizeValue(30)];
        moneyLable.textColor = fontColor;
        moneyLable.text = @"￥";
        [cell.contentView addSubview:moneyLable];
        
        [moneyLable makeConstraints:^(MASConstraintMaker *make)
         {
             make.left.equalTo(cell.contentView).with.offset(15);
             make.top.equalTo(cell.contentView).with.offset(40);
             make.size.equalTo(CGSizeMake(40*APP_DELEGATE().autoSizeScaleX,40*APP_DELEGATE().autoSizeScaleY));
         }];
        
        
        [cell.contentView addSubview:self.moneyText];
        [self.moneyText makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(moneyLable.mas_right).with.offset(1);
            make.top.equalTo(cell.contentView).with.offset(40);
            make.size.equalTo(CGSizeMake(260*APP_DELEGATE().autoSizeScaleX, 40*APP_DELEGATE().autoSizeScaleY));
        }];
        
        self.moneyLabel.text = @"可用金额5320";
        [cell.contentView addSubview:self.moneyLabel];
        [self.moneyLabel makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(cell.contentView).with.offset(15);
            make.top.equalTo(cell.contentView).with.offset(80);
            make.size.equalTo(CGSizeMake(260*APP_DELEGATE().autoSizeScaleX, 40*APP_DELEGATE().autoSizeScaleY));
        }];
        
        
//        UIView *fgx1 = [[UIView alloc] init];
//        fgx1.backgroundColor = bgViewColor;
//        [cell.contentView addSubview:fgx1];
//        
//        [fgx1 makeConstraints:^(MASConstraintMaker *make)
//         {
//             make.left.equalTo(cell.contentView.mas_left).with.offset(10);
//             //            make.right.equalTo(cell.contentView.mas_right).with.offset(-10);
//             make.bottom.equalTo(cell.contentView).with.offset(-1);
//             make.size.equalTo(CGSizeMake(300*APP_DELEGATE().autoSizeScaleX, 1));
//             //             make.height.equalTo(1);
//         }];
//        
        
        UIButton *withdrawBtn = [[UIButton alloc] init];
        [withdrawBtn setTitle:@"全部提现" forState:UIControlStateNormal];
        [withdrawBtn setTitle:@"全部提现" forState:UIControlStateHighlighted];
        [withdrawBtn setTitleColor:lvColor forState:UIControlStateNormal];
        [withdrawBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
//        [withdrawBtn setBackgroundImage:[UIImage imageWithColor:lvColor] forState:UIControlStateNormal];
//        [withdrawBtn setBackgroundImage:[UIImage imageWithColor:lvColor] forState:UIControlStateHighlighted];
        [withdrawBtn addTarget:self
                      action:@selector(withdrawBtnClick:)
            forControlEvents:UIControlEventTouchUpInside];
        withdrawBtn.titleLabel.font = viewFont3;
        [cell.contentView addSubview:withdrawBtn];
        
        [withdrawBtn makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(cell.contentView.mas_right).offset(-10*APP_DELEGATE().autoSizeScaleX);
            make.top.equalTo(cell.contentView).with.offset(80);
            make.size.equalTo(CGSizeMake(70*APP_DELEGATE().autoSizeScaleX, 40*APP_DELEGATE().autoSizeScaleY));
        }];

    }
    else if(indexPath.section==2)
    {
        cell.contentView.backgroundColor = bgViewColor;
        UIButton *submitBtn = [[UIButton alloc] init];
        [submitBtn setTitle:@"确定" forState:UIControlStateNormal];
        [submitBtn setTitle:@"确定" forState:UIControlStateHighlighted];
        [submitBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        //        [submitBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        [submitBtn setBackgroundImage:[UIImage imageWithColor:lvColor] forState:UIControlStateNormal];
        //        [submitBtn setBackgroundImage:[UIImage imageWithColor:lvColor] forState:UIControlStateHighlighted];
        [submitBtn addTarget:self
                      action:@selector(submitBtnClick:)
            forControlEvents:UIControlEventTouchUpInside];
        submitBtn.titleLabel.font = viewFont1;
        [cell.contentView addSubview:submitBtn];
        
        [submitBtn makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(cell.contentView.mas_centerY);
            make.centerX.equalTo(cell.contentView.mas_centerX);
            make.size.equalTo(CGSizeMake(300*APP_DELEGATE().autoSizeScaleX, 40*APP_DELEGATE().autoSizeScaleY));
        }];
        LRViewBorderRadius(submitBtn, 5, 1, lvColor);
        
    }

    
    return cell;
}

- (void)withdrawBtnClick:(UIButton *)sender
{
    NSLog(@"全部提现");
}

- (void)submitBtnClick:(UIButton *)sender
{
    NSLog(@"确定");
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}
@end
