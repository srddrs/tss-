//
//  PayViewController.m
//  tss
//
//  Created by admin on 17/2/16.
//  Copyright © 2017年 com.yunlaila. All rights reserved.
//

#import "PayViewController.h"

@interface PayViewController ()<UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate>
{
    
}
@property (nonatomic ,strong) UITableView *tableView;
@property (nonatomic, strong) UITextField *moneyText;  //金额
@end

@implementation PayViewController
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
    self.title = @"充值";
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
        return 180*APP_DELEGATE().autoSizeScaleY;
    }
    else if(indexPath.section==1)
    {
        return 85*APP_DELEGATE().autoSizeScaleY;
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


    UILabel *titleLable1 = [[UILabel alloc] init];
    titleLable1.numberOfLines = 0;
    titleLable1.textAlignment = NSTextAlignmentLeft;
    titleLable1.font = viewFont3;
    titleLable1.textColor = fontColor;
    [cell.contentView addSubview:titleLable1];
    
    [titleLable1 makeConstraints:^(MASConstraintMaker *make)
     {
         make.left.equalTo(cell.contentView).with.offset(15);
         make.top.equalTo(cell.contentView).with.offset(10);
         make.size.equalTo(CGSizeMake(320,20*APP_DELEGATE().autoSizeScaleY));
     }];

    //    20  80
    int leftValue = 20*APP_DELEGATE().autoSizeScaleX;
    int topValue = 40*APP_DELEGATE().autoSizeScaleY;
    
    int width = 80*APP_DELEGATE().autoSizeScaleX;
    int heigh = 55*APP_DELEGATE().autoSizeScaleY;
    
    if (indexPath.section==0)
    {
        titleLable1.text = @"立即充值";
        
        
        for(int i = 1; i < 7 ;i++)
        {
            UIButton *moneyButton = [[UIButton alloc] init];
            [moneyButton setTitle:[NSString stringWithFormat:@"%d元",i*100] forState:UIControlStateNormal];
            [moneyButton setTitle:[NSString stringWithFormat:@"%d元",i*100] forState:UIControlStateHighlighted];
            [moneyButton setTitle:[NSString stringWithFormat:@"%d元",i*100] forState:UIControlStateSelected];
            [moneyButton setTitleColor:lvColor forState:UIControlStateNormal];
            [moneyButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
            [moneyButton setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
            
            
            [moneyButton setBackgroundImage:[UIImage imageWithColor:[UIColor whiteColor]] forState:UIControlStateNormal];
            [moneyButton setBackgroundImage:[UIImage imageWithColor:lvColor] forState:UIControlStateHighlighted];
            [moneyButton setBackgroundImage:[UIImage imageWithColor:lvColor] forState:UIControlStateSelected];
            [moneyButton addTarget:self
                         action:@selector(moneyButtonClick:)
               forControlEvents:UIControlEventTouchUpInside];
            moneyButton.titleLabel.font = viewFont2;
            moneyButton.tag = i*100;
            moneyButton.layer.borderWidth = 1;
            moneyButton.layer.borderColor = [lvColor CGColor];
            LRViewBorderRadius(moneyButton, 10, 1, lvColor);
            [cell.contentView addSubview:moneyButton];
            
            [moneyButton makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(cell.contentView).with.offset(leftValue);
                make.top.equalTo(cell.contentView).with.offset(topValue);
                make.size.equalTo(CGSizeMake(width, heigh));
            }];
            
            leftValue = leftValue + 100*APP_DELEGATE().autoSizeScaleX;
            if (leftValue > 230*APP_DELEGATE().autoSizeScaleX)
            {
                leftValue = 20*APP_DELEGATE().autoSizeScaleX;
                topValue = topValue + 70*APP_DELEGATE().autoSizeScaleY;
            }
        }
    }
    else if (indexPath.section==1)
    {
        titleLable1.text = @"自定义金额";
        
        
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

- (void)moneyButtonClick:(UIButton *) sender
{
    UIView *view = sender.superview;
    for(UIView *buttonView in view.subviews)
    {
        if ([buttonView isKindOfClass:[UIButton class]])
        {
            UIButton *button = (UIButton *)buttonView;
            if (button.tag==sender.tag)
            {
                button.selected = YES;
            }
            else
            {
                button.selected = NO;
            }
        }
       
    }
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
