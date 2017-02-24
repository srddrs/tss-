//
//  Rotate1ViewController.m
//  tss
//
//  Created by admin on 17/2/22.
//  Copyright © 2017年 com.yunlaila. All rights reserved.
//

#import "Rotate1ViewController.h"
#import "IQActionSheetPickerView.h"
#import "Rotate2ViewController.h"
@interface Rotate1ViewController ()<UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate,IQActionSheetPickerViewDelegate>
{
    
}
@property (nonatomic ,strong) UITableView *tableView;
@property (nonatomic, strong) UITextField *riqiText;  //日期
@property (nonatomic, strong) UITextField *chepaihaoText;  //车牌号
@end

@implementation Rotate1ViewController
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
    self.title = @"转货运费确认";
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

- (UITextField *)riqiText
{
    if (!_riqiText)
    {
        
        _riqiText = [[UITextField alloc] init];
        _riqiText.backgroundColor = [UIColor whiteColor];
        _riqiText.clearButtonMode = UITextFieldViewModeWhileEditing;
        _riqiText.borderStyle = UITextBorderStyleNone;
        _riqiText.delegate = self;
        _riqiText.placeholder = @"选择日期";
        _riqiText.returnKeyType = UIReturnKeyDone;
        _riqiText.keyboardType = UIKeyboardTypeDefault;
        _riqiText.font = viewFont3;
        _riqiText.textColor = lvColor;
        _riqiText.enabled = NO;
    }
    return _riqiText;
}

- (UITextField *)chepaihaoText
{
    if (!_chepaihaoText)
    {
        
        _chepaihaoText = [[UITextField alloc] init];
        _chepaihaoText.backgroundColor = [UIColor whiteColor];
        _chepaihaoText.clearButtonMode = UITextFieldViewModeWhileEditing;
        _chepaihaoText.borderStyle = UITextBorderStyleNone;
        _chepaihaoText.delegate = self;
        _chepaihaoText.placeholder = @"输入车牌号";
        _chepaihaoText.returnKeyType = UIReturnKeyDone;
        _chepaihaoText.keyboardType = UIKeyboardTypeDefault;
        _chepaihaoText.font = viewFont3;
        _chepaihaoText.textColor = lvColor;
        _chepaihaoText.enabled = NO;
    }
    return _chepaihaoText;
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
    return 3;
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
    if(indexPath.row==2)
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
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    if(indexPath.row==0)
    {
        UIImageView *icon1 = [[UIImageView alloc] init];
        icon1.image = [UIImage imageNamed:@"ckhl_kaishi"];
        [cell.contentView addSubview:icon1];
        [icon1 makeConstraints:^(MASConstraintMaker *make)
         {
             make.centerY.equalTo(cell.contentView.mas_centerY);
             make.left.equalTo(cell.contentView).with.offset(15);
             make.size.equalTo(CGSizeMake(18*APP_DELEGATE().autoSizeScaleY,18*APP_DELEGATE().autoSizeScaleY));
         }];
        
        
        UILabel *titleLable = [[UILabel alloc] init];
        titleLable.numberOfLines = 0;
        titleLable.textAlignment = NSTextAlignmentLeft;
        titleLable.font = viewFont3;
        titleLable.textColor = fontColor;
        [cell.contentView addSubview:titleLable];
        titleLable.text = @"日期";
        
        [titleLable makeConstraints:^(MASConstraintMaker *make)
         {
             make.left.equalTo(icon1.mas_right).with.offset(15);
             make.size.equalTo(CGSizeMake(55*APP_DELEGATE().autoSizeScaleX,46*APP_DELEGATE().autoSizeScaleY));
         }];
        
        
        [cell.contentView addSubview:self.riqiText];
        [self.riqiText makeConstraints:^(MASConstraintMaker *make)
         {
             make.left.equalTo(titleLable.mas_right).with.offset(5*APP_DELEGATE().autoSizeScaleX);
             make.centerY.equalTo(cell.contentView.mas_centerY);
             make.size.equalTo(CGSizeMake(215*APP_DELEGATE().autoSizeScaleX,40*APP_DELEGATE().autoSizeScaleY));
         }];
    }
    else if(indexPath.row==1)
    {
        fgx1.hidden = YES;
        
        UIImageView *icon1 = [[UIImageView alloc] init];
        icon1.image = [UIImage imageNamed:@"ckhl_jiesu"];
        [cell.contentView addSubview:icon1];
        [icon1 makeConstraints:^(MASConstraintMaker *make)
         {
             make.centerY.equalTo(cell.contentView.mas_centerY);
             make.left.equalTo(cell.contentView).with.offset(15);
             make.size.equalTo(CGSizeMake(18*APP_DELEGATE().autoSizeScaleY,18*APP_DELEGATE().autoSizeScaleY));
         }];
        
        
        UILabel *titleLable = [[UILabel alloc] init];
        titleLable.numberOfLines = 0;
        titleLable.textAlignment = NSTextAlignmentLeft;
        titleLable.font = viewFont3;
        titleLable.textColor = fontColor;
        [cell.contentView addSubview:titleLable];
        titleLable.text = @"车牌号";
        
        [titleLable makeConstraints:^(MASConstraintMaker *make)
         {
             make.left.equalTo(icon1.mas_right).with.offset(15);
             make.size.equalTo(CGSizeMake(55*APP_DELEGATE().autoSizeScaleX,46*APP_DELEGATE().autoSizeScaleY));
         }];
        
        
        [cell.contentView addSubview:self.chepaihaoText];
        [self.chepaihaoText makeConstraints:^(MASConstraintMaker *make)
         {
             make.left.equalTo(titleLable.mas_right).with.offset(5*APP_DELEGATE().autoSizeScaleX);
             make.centerY.equalTo(cell.contentView.mas_centerY);
             make.size.equalTo(CGSizeMake(215*APP_DELEGATE().autoSizeScaleX,40*APP_DELEGATE().autoSizeScaleY));
         }];
        
    }
    else if(indexPath.row==2)
    {
        cell.accessoryType = UITableViewCellAccessoryNone;
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

- (void)actionSheetPickerView:(IQActionSheetPickerView *)pickerView didSelectDate:(NSDate*)date
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSString *destDateString = [dateFormatter stringFromDate:date];
    
    if(pickerView.tag==1)
    {
        self.riqiText.text = destDateString;
    }
}


- (void)submitBtnClick:(UIButton *)sender
{
    NSLog(@"保存");
    Rotate2ViewController *vc = [[Rotate2ViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}
@end
