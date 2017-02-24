//
//  ChangePasswordViewController.m
//  tss
//
//  Created by admin on 17/2/16.
//  Copyright © 2017年 com.yunlaila. All rights reserved.
//

#import "ChangePasswordViewController.h"

@interface ChangePasswordViewController ()<UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate>
{
    
}
@property (nonatomic ,strong) UITableView *tableView;
@property (nonatomic, strong) UITextField *passWordText;  //密码
@property (nonatomic, strong) UITextField *nPassWordText;  //新密码
@property (nonatomic, strong) UITextField *rNPassWordText;  //重复新密码
@end

@implementation ChangePasswordViewController
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
    self.title = @"修改密码";
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

- (UITextField *)passWordText
{
    if (!_passWordText)
    {
        
        _passWordText = [[UITextField alloc] init];
        _passWordText.backgroundColor = [UIColor whiteColor];
        _passWordText.clearButtonMode = UITextFieldViewModeWhileEditing;
        _passWordText.borderStyle = UITextBorderStyleNone;
        _passWordText.delegate = self;
        _passWordText.placeholder = @"请输入以前的密码";
        _passWordText.returnKeyType = UIReturnKeyDone;
        _passWordText.keyboardType = UIKeyboardTypeDefault;
        _passWordText.font = viewFont3;
        _passWordText.textColor = lvColor;
        _passWordText.secureTextEntry = YES;
//        [_passWordText setValue:lvColor forKeyPath:@"_placeholderLabel.textColor"];
//        [_passWordText setValue:viewFont3 forKeyPath:@"_placeholderLabel.font"];
    }
    return _passWordText;
}

- (UITextField *)nPassWordText
{
    if (!_nPassWordText)
    {
        
        _nPassWordText = [[UITextField alloc] init];
        _nPassWordText.backgroundColor = [UIColor whiteColor];
        _nPassWordText.clearButtonMode = UITextFieldViewModeWhileEditing;
        _nPassWordText.borderStyle = UITextBorderStyleNone;
        _nPassWordText.delegate = self;
        _nPassWordText.placeholder = @"请输入新的密码";
        _nPassWordText.returnKeyType = UIReturnKeyDone;
        _nPassWordText.keyboardType = UIKeyboardTypeDefault;
        _nPassWordText.font = viewFont3;
        _nPassWordText.textColor = lvColor;
        _nPassWordText.secureTextEntry = YES;
//        [_nPassWordText setValue:lvColor forKeyPath:@"_placeholderLabel.textColor"];
//        [_nPassWordText setValue:viewFont3 forKeyPath:@"_placeholderLabel.font"];
    }
    return _nPassWordText;
}

- (UITextField *)rNPassWordText
{
    if (!_rNPassWordText)
    {
        _rNPassWordText = [[UITextField alloc] init];
        _rNPassWordText.backgroundColor = [UIColor whiteColor];
        _rNPassWordText.clearButtonMode = UITextFieldViewModeWhileEditing;
        _rNPassWordText.borderStyle = UITextBorderStyleNone;
        _rNPassWordText.delegate = self;
        _rNPassWordText.placeholder = @"请输入新的密码";
        _rNPassWordText.returnKeyType = UIReturnKeyDone;
        _rNPassWordText.keyboardType = UIKeyboardTypeDefault;
        _rNPassWordText.font = viewFont3;
        _rNPassWordText.textColor = lvColor;
        _rNPassWordText.secureTextEntry = YES;
//        [_rNPassWordText setValue:lvColor forKeyPath:@"_placeholderLabel.textColor"];
//        [_rNPassWordText setValue:viewFont3 forKeyPath:@"_placeholderLabel.font"];
    }
    return _rNPassWordText;
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
    if(section==0)
    {
        return 3;
    }
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
        return 46*APP_DELEGATE().autoSizeScaleY;
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
    
#pragma mark - 密码
    if (indexPath.section==0&&indexPath.row==0)//
    {
        UIImageView *icon1 = [[UIImageView alloc] init];
        icon1.image = [UIImage imageNamed:@"xgmm_jiumima"];
        [cell.contentView addSubview:icon1];
        [icon1 makeConstraints:^(MASConstraintMaker *make)
         {
             make.centerY.equalTo(cell.contentView.mas_centerY);
             make.left.equalTo(cell.contentView).with.offset(15);
             make.size.equalTo(CGSizeMake(15*APP_DELEGATE().autoSizeScaleY,15*APP_DELEGATE().autoSizeScaleY));
         }];
        
        UILabel *titleLable1 = [[UILabel alloc] init];
        titleLable1.numberOfLines = 0;
        titleLable1.textAlignment = NSTextAlignmentLeft;
        titleLable1.font = viewFont3;
        titleLable1.textColor = fontColor;
        titleLable1.backgroundColor = [UIColor whiteColor];
        [cell.contentView addSubview:titleLable1];
        titleLable1.text = @"旧密码";
        [titleLable1 makeConstraints:^(MASConstraintMaker *make)
         {
             make.left.equalTo(icon1.mas_right).with.offset(5);
             make.centerY.equalTo(cell.contentView.mas_centerY);
             make.size.equalTo(CGSizeMake(60*APP_DELEGATE().autoSizeScaleX,46*APP_DELEGATE().autoSizeScaleY));
         }];
        
        [cell.contentView addSubview:self.passWordText];
        [self.passWordText makeConstraints:^(MASConstraintMaker *make)
         {
             make.left.equalTo(titleLable1.mas_right).with.offset(5);
             make.centerY.equalTo(cell.contentView.mas_centerY);
             make.size.equalTo(CGSizeMake(220*APP_DELEGATE().autoSizeScaleX,46*APP_DELEGATE().autoSizeScaleY));
         }];
        
        UIView *fgx1 = [[UIView alloc] init];
        fgx1.backgroundColor = bgViewColor;
        [cell.contentView addSubview:fgx1];
        
        [fgx1 makeConstraints:^(MASConstraintMaker *make)
         {
             make.left.equalTo(cell.contentView.mas_left).with.offset(10);
             make.bottom.equalTo(cell.contentView).with.offset(-1);
             make.right.equalTo(cell.contentView.mas_right).with.offset(-10);
             make.height.equalTo(1);
         }];

    }
#pragma mark - 新密码
    else if (indexPath.section==0&&indexPath.row==1)//
    {
        UIImageView *icon1 = [[UIImageView alloc] init];
        icon1.image = [UIImage imageNamed:@"xgmm_xinmima"];
        [cell.contentView addSubview:icon1];
        [icon1 makeConstraints:^(MASConstraintMaker *make)
         {
             make.centerY.equalTo(cell.contentView.mas_centerY);
             make.left.equalTo(cell.contentView).with.offset(15);
             make.size.equalTo(CGSizeMake(15*APP_DELEGATE().autoSizeScaleY,15*APP_DELEGATE().autoSizeScaleY));
         }];
        
        UILabel *titleLable1 = [[UILabel alloc] init];
        titleLable1.numberOfLines = 0;
        titleLable1.textAlignment = NSTextAlignmentLeft;
        titleLable1.font = viewFont3;
        titleLable1.textColor = fontColor;
        titleLable1.backgroundColor = [UIColor whiteColor];
        [cell.contentView addSubview:titleLable1];
        titleLable1.text = @"新密码";
        [titleLable1 makeConstraints:^(MASConstraintMaker *make)
         {
             make.left.equalTo(icon1.mas_right).with.offset(5);
             make.centerY.equalTo(cell.contentView.mas_centerY);
             make.size.equalTo(CGSizeMake(60*APP_DELEGATE().autoSizeScaleX,46*APP_DELEGATE().autoSizeScaleY));
         }];
        
        [cell.contentView addSubview:self.nPassWordText];
        [self.nPassWordText makeConstraints:^(MASConstraintMaker *make)
         {
             make.left.equalTo(titleLable1.mas_right).with.offset(5);
             make.centerY.equalTo(cell.contentView.mas_centerY);
             make.size.equalTo(CGSizeMake(220*APP_DELEGATE().autoSizeScaleX,46*APP_DELEGATE().autoSizeScaleY));
         }];
        
        UIView *fgx1 = [[UIView alloc] init];
        fgx1.backgroundColor = bgViewColor;
        [cell.contentView addSubview:fgx1];
        
        [fgx1 makeConstraints:^(MASConstraintMaker *make)
         {
             make.left.equalTo(cell.contentView.mas_left).with.offset(10);
             make.bottom.equalTo(cell.contentView).with.offset(-1);
             make.right.equalTo(cell.contentView.mas_right).with.offset(-10);
             make.height.equalTo(1);
         }];
        
    }
#pragma mark - 确认密码
    if (indexPath.section==0&&indexPath.row==2)//
    {
        UIImageView *icon1 = [[UIImageView alloc] init];
        icon1.image = [UIImage imageNamed:@"xgmm_queren"];
        [cell.contentView addSubview:icon1];
        [icon1 makeConstraints:^(MASConstraintMaker *make)
         {
             make.centerY.equalTo(cell.contentView.mas_centerY);
             make.left.equalTo(cell.contentView).with.offset(15);
             make.size.equalTo(CGSizeMake(15*APP_DELEGATE().autoSizeScaleY,15*APP_DELEGATE().autoSizeScaleY));
         }];
        
        UILabel *titleLable1 = [[UILabel alloc] init];
        titleLable1.numberOfLines = 0;
        titleLable1.textAlignment = NSTextAlignmentLeft;
        titleLable1.font = viewFont3;
        titleLable1.textColor = fontColor;
        titleLable1.backgroundColor = [UIColor whiteColor];
        [cell.contentView addSubview:titleLable1];
        titleLable1.text = @"确认密码";
        [titleLable1 makeConstraints:^(MASConstraintMaker *make)
         {
             make.left.equalTo(icon1.mas_right).with.offset(5);
             make.centerY.equalTo(cell.contentView.mas_centerY);
             make.size.equalTo(CGSizeMake(60*APP_DELEGATE().autoSizeScaleX,46*APP_DELEGATE().autoSizeScaleY));
         }];
        
        [cell.contentView addSubview:self.rNPassWordText];
        [self.rNPassWordText makeConstraints:^(MASConstraintMaker *make)
         {
             make.left.equalTo(titleLable1.mas_right).with.offset(5);
             make.centerY.equalTo(cell.contentView.mas_centerY);
             make.size.equalTo(CGSizeMake(220*APP_DELEGATE().autoSizeScaleX,46*APP_DELEGATE().autoSizeScaleY));
         }];
        
    }
    else if(indexPath.section==1)
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
