
//
//  ReceiptViewController.m
//  tss
//
//  Created by admin on 17/2/21.
//  Copyright © 2017年 com.yunlaila. All rights reserved.
//

#import "ReceiptViewController.h"
#import "IQActionSheetPickerView.h"
@interface ReceiptViewController ()<UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate,IQActionSheetPickerViewDelegate>
{
    
}
@property (nonatomic ,strong) UITableView *tableView;

@property (nonatomic, strong) UITextField *shoukuanriqiText;  //收款日期
@property (nonatomic, strong) UITextField *kaidandaishoukuanText;  //开单代收款
@property (nonatomic, strong) UITextField *shishoudaishoukuanText;  //实收代收款
@property (nonatomic, strong) UITextField *shaokuanyuanyinText;  //少款原因
@property (nonatomic, strong) UITextField *beizhuText;  //备注
@end

@implementation ReceiptViewController
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

- (UITextField *)shoukuanriqiText
{
    if (!_shoukuanriqiText)
    {
        
        _shoukuanriqiText = [[UITextField alloc] init];
        _shoukuanriqiText.backgroundColor = [UIColor whiteColor];
        _shoukuanriqiText.clearButtonMode = UITextFieldViewModeWhileEditing;
        _shoukuanriqiText.borderStyle = UITextBorderStyleNone;
        _shoukuanriqiText.delegate = self;
        _shoukuanriqiText.placeholder = @"选择收款日期";
        _shoukuanriqiText.returnKeyType = UIReturnKeyDone;
        _shoukuanriqiText.keyboardType = UIKeyboardTypeDefault;
        _shoukuanriqiText.font = viewFont3;
        _shoukuanriqiText.textColor = lvColor;
        _shoukuanriqiText.enabled = NO;
    }
    return _shoukuanriqiText;
}

- (UITextField *)kaidandaishoukuanText
{
    if (!_kaidandaishoukuanText)
    {
        
        _kaidandaishoukuanText = [[UITextField alloc] init];
        _kaidandaishoukuanText.backgroundColor = [UIColor whiteColor];
        _kaidandaishoukuanText.clearButtonMode = UITextFieldViewModeWhileEditing;
        _kaidandaishoukuanText.borderStyle = UITextBorderStyleNone;
        _kaidandaishoukuanText.delegate = self;
        _kaidandaishoukuanText.placeholder = @"输入开单代收款";
        _kaidandaishoukuanText.returnKeyType = UIReturnKeyDone;
        _kaidandaishoukuanText.keyboardType = UIKeyboardTypeDefault;
        _kaidandaishoukuanText.font = viewFont3;
        _kaidandaishoukuanText.textColor = lvColor;
    }
    return _kaidandaishoukuanText;
}

- (UITextField *)shishoudaishoukuanText
{
    if (!_shishoudaishoukuanText)
    {
        
        _shishoudaishoukuanText = [[UITextField alloc] init];
        _shishoudaishoukuanText.backgroundColor = [UIColor whiteColor];
        _shishoudaishoukuanText.clearButtonMode = UITextFieldViewModeWhileEditing;
        _shishoudaishoukuanText.borderStyle = UITextBorderStyleNone;
        _shishoudaishoukuanText.delegate = self;
        _shishoudaishoukuanText.placeholder = @"实收代收款";
        _shishoudaishoukuanText.returnKeyType = UIReturnKeyDone;
        _shishoudaishoukuanText.keyboardType = UIKeyboardTypeDefault;
        _shishoudaishoukuanText.font = viewFont3;
        _shishoudaishoukuanText.textColor = lvColor;
    }
    return _shishoudaishoukuanText;
}

- (UITextField *)shaokuanyuanyinText
{
    if (!_shaokuanyuanyinText)
    {
        
        _shaokuanyuanyinText = [[UITextField alloc] init];
        _shaokuanyuanyinText.backgroundColor = [UIColor whiteColor];
        _shaokuanyuanyinText.clearButtonMode = UITextFieldViewModeWhileEditing;
        _shaokuanyuanyinText.borderStyle = UITextBorderStyleNone;
        _shaokuanyuanyinText.delegate = self;
        _shaokuanyuanyinText.placeholder = @"少款原因";
        _shaokuanyuanyinText.returnKeyType = UIReturnKeyDone;
        _shaokuanyuanyinText.keyboardType = UIKeyboardTypeDefault;
        _shaokuanyuanyinText.font = viewFont3;
        _shaokuanyuanyinText.textColor = lvColor;
    }
    return _shaokuanyuanyinText;
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
    return 6;
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
    if(indexPath.row==5)
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
        titleLable.text = @"收款日期";
        
        [titleLable makeConstraints:^(MASConstraintMaker *make)
         {
             make.left.equalTo(cell.contentView).with.offset(15*APP_DELEGATE().autoSizeScaleX);
             make.size.equalTo(CGSizeMake(65*APP_DELEGATE().autoSizeScaleX,46*APP_DELEGATE().autoSizeScaleY));
         }];
        
        
        [cell.contentView addSubview:self.shoukuanriqiText];
        [self.shoukuanriqiText makeConstraints:^(MASConstraintMaker *make)
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
        titleLable.text = @"开单代收款";
        
        [titleLable makeConstraints:^(MASConstraintMaker *make)
         {
             make.left.equalTo(cell.contentView).with.offset(15*APP_DELEGATE().autoSizeScaleX);
             make.size.equalTo(CGSizeMake(65*APP_DELEGATE().autoSizeScaleX,46*APP_DELEGATE().autoSizeScaleY));
         }];
        
        
        [cell.contentView addSubview:self.kaidandaishoukuanText];
        [self.kaidandaishoukuanText makeConstraints:^(MASConstraintMaker *make)
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
        titleLable.text = @"实收代收款";
        
        [titleLable makeConstraints:^(MASConstraintMaker *make)
         {
             make.left.equalTo(cell.contentView).with.offset(15*APP_DELEGATE().autoSizeScaleX);
             make.size.equalTo(CGSizeMake(65*APP_DELEGATE().autoSizeScaleX,46*APP_DELEGATE().autoSizeScaleY));
         }];
        
        
        [cell.contentView addSubview:self.shishoudaishoukuanText];
        [self.shishoudaishoukuanText makeConstraints:^(MASConstraintMaker *make)
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
        titleLable.text = @"少款原因";
        
        [titleLable makeConstraints:^(MASConstraintMaker *make)
         {
             make.left.equalTo(cell.contentView).with.offset(15*APP_DELEGATE().autoSizeScaleX);
             make.size.equalTo(CGSizeMake(65*APP_DELEGATE().autoSizeScaleX,46*APP_DELEGATE().autoSizeScaleY));
         }];
        
        
        [cell.contentView addSubview:self.shaokuanyuanyinText];
        [self.shaokuanyuanyinText makeConstraints:^(MASConstraintMaker *make)
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
        titleLable.text = @"备注";
        
        [titleLable makeConstraints:^(MASConstraintMaker *make)
         {
             make.left.equalTo(cell.contentView).with.offset(15*APP_DELEGATE().autoSizeScaleX);
             make.size.equalTo(CGSizeMake(65*APP_DELEGATE().autoSizeScaleX,46*APP_DELEGATE().autoSizeScaleY));
         }];
        
        
        [cell.contentView addSubview:self.beizhuText];
        [self.beizhuText makeConstraints:^(MASConstraintMaker *make)
         {
             make.left.equalTo(titleLable.mas_right).with.offset(5*APP_DELEGATE().autoSizeScaleX);
             make.centerY.equalTo(cell.contentView.mas_centerY);
             make.size.equalTo(CGSizeMake(215*APP_DELEGATE().autoSizeScaleX,40*APP_DELEGATE().autoSizeScaleY));
         }];
    }
    else if(indexPath.row==5)
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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if(indexPath.row==0)
    {
        IQActionSheetPickerView *picker =  [[IQActionSheetPickerView alloc] initWithTitle:@"选择开始时间" delegate:self];
        [picker setTag:1];
        [picker setActionSheetPickerStyle:IQActionSheetPickerStyleDatePicker];
        [picker show];
    }
}
- (void)submitBtnClick:(UIButton *)sender
{
    NSLog(@"保存");
}

- (void)actionSheetPickerView:(IQActionSheetPickerView *)pickerView didSelectDate:(NSDate*)date
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSString *destDateString = [dateFormatter stringFromDate:date];
    
    if(pickerView.tag==1)
    {
        self.shoukuanriqiText.text = destDateString;
    }
    
}

@end
