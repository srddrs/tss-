//
//  PassWord1ViewController.m
//  tss
//
//  Created by admin on 17/2/23.
//  Copyright © 2017年 com.yunlaila. All rights reserved.
//

#import "PassWord1ViewController.h"
#import "PassWord2ViewController.h"
@interface PassWord1ViewController ()
<UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate>
{
    SSNCountdownButton *verificationBtn;
}
@property (nonatomic ,strong) UITableView *tableView;
@property (nonatomic, strong) UITextField *shoujihaoText;  //手机号
@property (nonatomic, strong) UITextField *yanzhengmaText;  //验证码
@end

@implementation PassWord1ViewController
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
    self.title = @"忘记密码";
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

- (UITextField *)shoujihaoText
{
    if (!_shoujihaoText)
    {
        
        _shoujihaoText = [[UITextField alloc] init];
        _shoujihaoText.backgroundColor = [UIColor whiteColor];
        _shoujihaoText.clearButtonMode = UITextFieldViewModeWhileEditing;
        _shoujihaoText.borderStyle = UITextBorderStyleNone;
        _shoujihaoText.delegate = self;
        _shoujihaoText.placeholder = @"请输入手机号";
        _shoujihaoText.returnKeyType = UIReturnKeyDone;
        _shoujihaoText.keyboardType = UIKeyboardTypeDefault;
        _shoujihaoText.font = viewFont3;
        _shoujihaoText.textColor = lvColor;
        //        _chepaihaoText.enabled = NO;
    }
    return _shoujihaoText;
}

- (UITextField *)yanzhengmaText
{
    if (!_yanzhengmaText)
    {
        
        _yanzhengmaText = [[UITextField alloc] init];
        _yanzhengmaText.backgroundColor = [UIColor whiteColor];
        _yanzhengmaText.clearButtonMode = UITextFieldViewModeWhileEditing;
        _yanzhengmaText.borderStyle = UITextBorderStyleNone;
        _yanzhengmaText.delegate = self;
        _yanzhengmaText.placeholder = @"请输入验证码";
        _yanzhengmaText.returnKeyType = UIReturnKeyDone;
        _yanzhengmaText.keyboardType = UIKeyboardTypeDefault;
        _yanzhengmaText.font = viewFont3;
        _yanzhengmaText.textColor = lvColor;
//        _sijixingmingText.enabled = NO;
    }
    return _yanzhengmaText;
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
    

    
//    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
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
    
//    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    if(indexPath.row==0)
    {
        UIImageView *icon1 = [[UIImageView alloc] init];
        icon1.image = [UIImage imageNamed:@"wjmm_shouji"];
        [cell.contentView addSubview:icon1];
        [icon1 makeConstraints:^(MASConstraintMaker *make)
         {
             make.centerY.equalTo(cell.contentView.mas_centerY);
             make.left.equalTo(cell.contentView).with.offset(15);
             make.size.equalTo(CGSizeMake(14*APP_DELEGATE().autoSizeScaleY,18*APP_DELEGATE().autoSizeScaleY));
         }];
        
        
        UILabel *titleLable = [[UILabel alloc] init];
        titleLable.numberOfLines = 0;
        titleLable.textAlignment = NSTextAlignmentLeft;
        titleLable.font = viewFont3;
        titleLable.textColor = fontColor;
        [cell.contentView addSubview:titleLable];
        titleLable.text = @"手机号";
        
        [titleLable makeConstraints:^(MASConstraintMaker *make)
         {
             make.left.equalTo(icon1.mas_right).with.offset(15);
             make.size.equalTo(CGSizeMake(55*APP_DELEGATE().autoSizeScaleX,46*APP_DELEGATE().autoSizeScaleY));
         }];
        
        
        [cell.contentView addSubview:self.shoujihaoText];
        [self.shoujihaoText makeConstraints:^(MASConstraintMaker *make)
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
        icon1.image = [UIImage imageNamed:@"grzx_denglumima"];
        [cell.contentView addSubview:icon1];
        [icon1 makeConstraints:^(MASConstraintMaker *make)
         {
             make.centerY.equalTo(cell.contentView.mas_centerY);
             make.left.equalTo(cell.contentView).with.offset(15);
             make.size.equalTo(CGSizeMake(16*APP_DELEGATE().autoSizeScaleY,19*APP_DELEGATE().autoSizeScaleY));
         }];
        
        
        UILabel *titleLable = [[UILabel alloc] init];
        titleLable.numberOfLines = 0;
        titleLable.textAlignment = NSTextAlignmentLeft;
        titleLable.font = viewFont3;
        titleLable.textColor = fontColor;
        [cell.contentView addSubview:titleLable];
        titleLable.text = @"验证码";
        
        [titleLable makeConstraints:^(MASConstraintMaker *make)
         {
             make.left.equalTo(icon1.mas_right).with.offset(15);
             make.size.equalTo(CGSizeMake(55*APP_DELEGATE().autoSizeScaleX,46*APP_DELEGATE().autoSizeScaleY));
         }];
        
        
        [cell.contentView addSubview:self.yanzhengmaText];
        [self.yanzhengmaText makeConstraints:^(MASConstraintMaker *make)
         {
             make.left.equalTo(titleLable.mas_right).with.offset(5*APP_DELEGATE().autoSizeScaleX);
             make.centerY.equalTo(cell.contentView.mas_centerY);
             make.size.equalTo(CGSizeMake(135*APP_DELEGATE().autoSizeScaleX,40*APP_DELEGATE().autoSizeScaleY));
         }];
        
        
        verificationBtn = [[SSNCountdownButton alloc] initWithFrame: CGRectMake(230*APP_DELEGATE().autoSizeScaleX, 10*APP_DELEGATE().autoSizeScaleY, 80*APP_DELEGATE().autoSizeScaleX, 26*APP_DELEGATE().autoSizeScaleY)];
        [verificationBtn setTitle:@"发送验证码" forState:UIControlStateNormal];
        [verificationBtn setTitle:@"发送验证码" forState:UIControlStateHighlighted];
        [verificationBtn setTitleColor:lvColor forState:UIControlStateNormal];
        [verificationBtn setTitleColor:lvColor forState:UIControlStateHighlighted];
        [verificationBtn setBackgroundImage:[UIImage imageWithColor:[UIColor whiteColor]] forState:UIControlStateNormal];
        [verificationBtn setBackgroundImage:[UIImage imageWithColor:[UIColor whiteColor]] forState:UIControlStateHighlighted];
        [verificationBtn addTarget:self
                            action:@selector(verificationBtnClick:)
                  forControlEvents:UIControlEventTouchUpInside];
        verificationBtn.titleLabel.font = viewFont3;
        [cell.contentView addSubview:verificationBtn];
        LRViewBorderRadius(verificationBtn, 5, 1, lvColor);
        
    }
    else if(indexPath.row==2)
    {
        fgx1.hidden = YES;
        cell.accessoryType = UITableViewCellAccessoryNone;
        cell.contentView.backgroundColor = bgViewColor;
        UIButton *submitBtn = [[UIButton alloc] init];
        [submitBtn setTitle:@"下一步" forState:UIControlStateNormal];
        [submitBtn setTitle:@"下一步" forState:UIControlStateHighlighted];
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

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (void)verificationBtnClick:(id)sender
{
     [(SSNCountdownButton *)sender beginCountdownWithTime:60 normalTitle:@"获取验证码" timeUnit:@"s" normalColor:[UIColor colorWithRed:106/255 green:144/255 blue:245/255 alpha:1] inColor:[UIColor whiteColor] animated:YES];
}

- (void)submitBtnClick:(UIButton *)sender
{
    NSLog(@"保存");
    PassWord2ViewController *vc = [[PassWord2ViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}
@end
