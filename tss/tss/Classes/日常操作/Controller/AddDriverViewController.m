//
//  AddDriverViewController.m
//  tss
//
//  Created by admin on 17/2/20.
//  Copyright © 2017年 com.yunlaila. All rights reserved.
//

#import "AddDriverViewController.h"

@interface AddDriverViewController ()<UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate>
{
    
}
@property (nonatomic ,strong) UITableView *tableView;

@property (nonatomic, strong) UITextField *shoujiText;  //手机
@property (nonatomic, strong) UITextField *xingmingText;  //姓名
@property (nonatomic, strong) UITextField *shenfenzhengText;  //身份证
@property (nonatomic, strong) UITextField *kaihuhangText;  //开户行
@property (nonatomic, strong) UITextField *yinhangkaText;  //银行卡
@property (nonatomic, strong) UITextField *beizhuText;  //备注
@end

@implementation AddDriverViewController
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
    self.title = @"添加司机信息";
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

- (UITextField *)shoujiText
{
    if (!_shoujiText)
    {
        
        _shoujiText = [[UITextField alloc] init];
        _shoujiText.backgroundColor = [UIColor whiteColor];
        _shoujiText.clearButtonMode = UITextFieldViewModeWhileEditing;
        _shoujiText.borderStyle = UITextBorderStyleNone;
        _shoujiText.delegate = self;
        _shoujiText.placeholder = @"输入手机号";
        _shoujiText.returnKeyType = UIReturnKeyDone;
        _shoujiText.keyboardType = UIKeyboardTypeDefault;
        _shoujiText.font = viewFont3;
        _shoujiText.textColor = lvColor;
    }
    return _shoujiText;
}

- (UITextField *)xingmingText
{
    if (!_xingmingText)
    {
        
        _xingmingText = [[UITextField alloc] init];
        _xingmingText.backgroundColor = [UIColor whiteColor];
        _xingmingText.clearButtonMode = UITextFieldViewModeWhileEditing;
        _xingmingText.borderStyle = UITextBorderStyleNone;
        _xingmingText.delegate = self;
        _xingmingText.placeholder = @"输入姓名";
        _xingmingText.returnKeyType = UIReturnKeyDone;
        _xingmingText.keyboardType = UIKeyboardTypeDefault;
        _xingmingText.font = viewFont3;
        _xingmingText.textColor = lvColor;
    }
    return _xingmingText;
}

- (UITextField *)shenfenzhengText
{
    if (!_shenfenzhengText)
    {
        
        _shenfenzhengText = [[UITextField alloc] init];
        _shenfenzhengText.backgroundColor = [UIColor whiteColor];
        _shenfenzhengText.clearButtonMode = UITextFieldViewModeWhileEditing;
        _shenfenzhengText.borderStyle = UITextBorderStyleNone;
        _shenfenzhengText.delegate = self;
        _shenfenzhengText.placeholder = @"输入身份证";
        _shenfenzhengText.returnKeyType = UIReturnKeyDone;
        _shenfenzhengText.keyboardType = UIKeyboardTypeDefault;
        _shenfenzhengText.font = viewFont3;
        _shenfenzhengText.textColor = lvColor;
    }
    return _shenfenzhengText;
}

- (UITextField *)kaihuhangText
{
    if (!_kaihuhangText)
    {
        
        _kaihuhangText = [[UITextField alloc] init];
        _kaihuhangText.backgroundColor = [UIColor whiteColor];
        _kaihuhangText.clearButtonMode = UITextFieldViewModeWhileEditing;
        _kaihuhangText.borderStyle = UITextBorderStyleNone;
        _kaihuhangText.delegate = self;
        _kaihuhangText.placeholder = @"输入开户行";
        _kaihuhangText.returnKeyType = UIReturnKeyDone;
        _kaihuhangText.keyboardType = UIKeyboardTypeDefault;
        _kaihuhangText.font = viewFont3;
        _kaihuhangText.textColor = lvColor;
    }
    return _kaihuhangText;
}

- (UITextField *)yinhangkaText
{
    if (!_yinhangkaText)
    {
        
        _yinhangkaText = [[UITextField alloc] init];
        _yinhangkaText.backgroundColor = [UIColor whiteColor];
        _yinhangkaText.clearButtonMode = UITextFieldViewModeWhileEditing;
        _yinhangkaText.borderStyle = UITextBorderStyleNone;
        _yinhangkaText.delegate = self;
        _yinhangkaText.placeholder = @"输入银行卡";
        _yinhangkaText.returnKeyType = UIReturnKeyDone;
        _yinhangkaText.keyboardType = UIKeyboardTypeDefault;
        _yinhangkaText.font = viewFont3;
        _yinhangkaText.textColor = lvColor;
    }
    return _yinhangkaText;
}

- (UITextField *)beizhuText
{
    if (!_beizhuText)
    {
        
        _beizhuText = [[UITextField alloc] init];
        _beizhuText.backgroundColor = [UIColor whiteColor];
        _beizhuText.clearButtonMode = UITextFieldViewModeWhileEditing;
        _beizhuText.borderStyle = UITextBorderStyleNone;
        _beizhuText.delegate = self;
        _beizhuText.placeholder = @"输入备注";
        _beizhuText.returnKeyType = UIReturnKeyDone;
        _beizhuText.keyboardType = UIKeyboardTypeDefault;
        _beizhuText.font = viewFont3;
        _beizhuText.textColor = lvColor;
    }
    return _beizhuText;
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
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 7;
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
    if(indexPath.row==10)
    {
        return 100*APP_DELEGATE().autoSizeScaleY;
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

    if(indexPath.row==0)
    {
        UILabel *titleLable = [[UILabel alloc] init];
        titleLable.numberOfLines = 0;
        titleLable.textAlignment = NSTextAlignmentLeft;
        titleLable.font = viewFont3;
        titleLable.textColor = fontColor;
        [cell.contentView addSubview:titleLable];
        titleLable.text = @"手机";
        
        [titleLable makeConstraints:^(MASConstraintMaker *make)
         {
             make.left.equalTo(cell.contentView).with.offset(15*APP_DELEGATE().autoSizeScaleX);
             make.size.equalTo(CGSizeMake(55*APP_DELEGATE().autoSizeScaleX,46*APP_DELEGATE().autoSizeScaleY));
         }];
        
        
        [cell.contentView addSubview:self.shoujiText];
        [self.shoujiText makeConstraints:^(MASConstraintMaker *make)
         {
             make.left.equalTo(titleLable.mas_right).with.offset(5*APP_DELEGATE().autoSizeScaleX);
             make.centerY.equalTo(cell.contentView.mas_centerY);
             make.size.equalTo(CGSizeMake(215*APP_DELEGATE().autoSizeScaleX,40*APP_DELEGATE().autoSizeScaleY));
         }];
    }
    else if(indexPath.row==1)
    {
        UILabel *titleLable = [[UILabel alloc] init];
        titleLable.numberOfLines = 0;
        titleLable.textAlignment = NSTextAlignmentLeft;
        titleLable.font = viewFont3;
        titleLable.textColor = fontColor;
        [cell.contentView addSubview:titleLable];
        titleLable.text = @"姓名";
        
        [titleLable makeConstraints:^(MASConstraintMaker *make)
         {
             make.left.equalTo(cell.contentView).with.offset(15*APP_DELEGATE().autoSizeScaleX);
             make.size.equalTo(CGSizeMake(55*APP_DELEGATE().autoSizeScaleX,46*APP_DELEGATE().autoSizeScaleY));
         }];
        
        
        [cell.contentView addSubview:self.xingmingText];
        [self.xingmingText makeConstraints:^(MASConstraintMaker *make)
         {
             make.left.equalTo(titleLable.mas_right).with.offset(5*APP_DELEGATE().autoSizeScaleX);
             make.centerY.equalTo(cell.contentView.mas_centerY);
             make.size.equalTo(CGSizeMake(215*APP_DELEGATE().autoSizeScaleX,40*APP_DELEGATE().autoSizeScaleY));
         }];
    }
    else if(indexPath.row==2)
    {
        UILabel *titleLable = [[UILabel alloc] init];
        titleLable.numberOfLines = 0;
        titleLable.textAlignment = NSTextAlignmentLeft;
        titleLable.font = viewFont3;
        titleLable.textColor = fontColor;
        [cell.contentView addSubview:titleLable];
        titleLable.text = @"身份证";
        
        [titleLable makeConstraints:^(MASConstraintMaker *make)
         {
             make.left.equalTo(cell.contentView).with.offset(15*APP_DELEGATE().autoSizeScaleX);
             make.size.equalTo(CGSizeMake(55*APP_DELEGATE().autoSizeScaleX,46*APP_DELEGATE().autoSizeScaleY));
         }];
        
        
        [cell.contentView addSubview:self.shenfenzhengText];
        [self.shenfenzhengText makeConstraints:^(MASConstraintMaker *make)
         {
             make.left.equalTo(titleLable.mas_right).with.offset(5*APP_DELEGATE().autoSizeScaleX);
             make.centerY.equalTo(cell.contentView.mas_centerY);
             make.size.equalTo(CGSizeMake(215*APP_DELEGATE().autoSizeScaleX,40*APP_DELEGATE().autoSizeScaleY));
         }];
    }
    else if(indexPath.row==3)
    {
        UILabel *titleLable = [[UILabel alloc] init];
        titleLable.numberOfLines = 0;
        titleLable.textAlignment = NSTextAlignmentLeft;
        titleLable.font = viewFont3;
        titleLable.textColor = fontColor;
        [cell.contentView addSubview:titleLable];
        titleLable.text = @"开户行";
        
        [titleLable makeConstraints:^(MASConstraintMaker *make)
         {
             make.left.equalTo(cell.contentView).with.offset(15*APP_DELEGATE().autoSizeScaleX);
             make.size.equalTo(CGSizeMake(55*APP_DELEGATE().autoSizeScaleX,46*APP_DELEGATE().autoSizeScaleY));
         }];
        
        
        [cell.contentView addSubview:self.kaihuhangText];
        [self.kaihuhangText makeConstraints:^(MASConstraintMaker *make)
         {
             make.left.equalTo(titleLable.mas_right).with.offset(5*APP_DELEGATE().autoSizeScaleX);
             make.centerY.equalTo(cell.contentView.mas_centerY);
             make.size.equalTo(CGSizeMake(215*APP_DELEGATE().autoSizeScaleX,40*APP_DELEGATE().autoSizeScaleY));
         }];
    }
    else if(indexPath.row==4)
    {
        UILabel *titleLable = [[UILabel alloc] init];
        titleLable.numberOfLines = 0;
        titleLable.textAlignment = NSTextAlignmentLeft;
        titleLable.font = viewFont3;
        titleLable.textColor = fontColor;
        [cell.contentView addSubview:titleLable];
        titleLable.text = @"银行卡";
        
        [titleLable makeConstraints:^(MASConstraintMaker *make)
         {
             make.left.equalTo(cell.contentView).with.offset(15*APP_DELEGATE().autoSizeScaleX);
             make.size.equalTo(CGSizeMake(55*APP_DELEGATE().autoSizeScaleX,46*APP_DELEGATE().autoSizeScaleY));
         }];
        
        
        [cell.contentView addSubview:self.yinhangkaText];
        [self.yinhangkaText makeConstraints:^(MASConstraintMaker *make)
         {
             make.left.equalTo(titleLable.mas_right).with.offset(5*APP_DELEGATE().autoSizeScaleX);
             make.centerY.equalTo(cell.contentView.mas_centerY);
             make.size.equalTo(CGSizeMake(215*APP_DELEGATE().autoSizeScaleX,40*APP_DELEGATE().autoSizeScaleY));
         }];
    }
    else if(indexPath.row==5)
    {
        fgx1.hidden = YES;
        
        UILabel *titleLable = [[UILabel alloc] init];
        titleLable.numberOfLines = 0;
        titleLable.textAlignment = NSTextAlignmentLeft;
        titleLable.font = viewFont3;
        titleLable.textColor = fontColor;
        [cell.contentView addSubview:titleLable];
        titleLable.text = @"备注";
        
        [titleLable makeConstraints:^(MASConstraintMaker *make)
         {
             make.left.equalTo(cell.contentView).with.offset(15*APP_DELEGATE().autoSizeScaleX);
             make.size.equalTo(CGSizeMake(55*APP_DELEGATE().autoSizeScaleX,46*APP_DELEGATE().autoSizeScaleY));
         }];
        
        
        [cell.contentView addSubview:self.beizhuText];
        [self.beizhuText makeConstraints:^(MASConstraintMaker *make)
         {
             make.left.equalTo(titleLable.mas_right).with.offset(5*APP_DELEGATE().autoSizeScaleX);
             make.centerY.equalTo(cell.contentView.mas_centerY);
             make.size.equalTo(CGSizeMake(215*APP_DELEGATE().autoSizeScaleX,40*APP_DELEGATE().autoSizeScaleY));
         }];
    }
    else if(indexPath.row==6)
    {
        cell.accessoryType = UITableViewCellAccessoryNone;
        cell.contentView.backgroundColor = bgViewColor;
        UIButton *submitBtn = [[UIButton alloc] init];
        [submitBtn setTitle:@"保存" forState:UIControlStateNormal];
        [submitBtn setTitle:@"保存" forState:UIControlStateHighlighted];
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
    NSLog(@"保存");
}
@end
