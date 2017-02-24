//
//  LoginViewController.m
//  tss
//
//  Created by admin on 17/2/23.
//  Copyright © 2017年 com.yunlaila. All rights reserved.
//

#import "LoginViewController.h"
#import "ImageTextButton.h"
#import "PassWord1ViewController.h"
@interface LoginViewController ()<UITextFieldDelegate>

@property (nonatomic, strong) UITextField *shoujihaomaText;  //手机号码
@property (nonatomic, strong) UITextField *mimaText;  //密码
@end

@implementation LoginViewController
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:YES
                                             animated:NO];


}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO
                                             animated:NO];
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
//    self.title = @"提现";
//    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithIcon:@"fanhuijian_xiache-拷贝-2" highIcon:@"fanhuijian_xiache-拷贝-2" target:self action:@selector(pop:)];
}

- (void)pop:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (UITextField *)shoujihaomaText
{
    if (!_shoujihaomaText)
    {
        
        _shoujihaomaText = [[UITextField alloc] init];
        _shoujihaomaText.backgroundColor = [UIColor clearColor];
        _shoujihaomaText.clearButtonMode = UITextFieldViewModeWhileEditing;
        _shoujihaomaText.borderStyle = UITextBorderStyleNone;
        _shoujihaomaText.delegate = self;
        _shoujihaomaText.placeholder = @"请输入手机号码";
        _shoujihaomaText.returnKeyType = UIReturnKeyDone;
        _shoujihaomaText.keyboardType = UIKeyboardTypeDefault;
        _shoujihaomaText.font = viewFont2;
        _shoujihaomaText.textColor = lvColor;
         UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 30*APP_DELEGATE().autoSizeScaleY, 42*APP_DELEGATE().autoSizeScaleY)];
        
        UIImageView *imageViewPwd=[[UIImageView alloc]initWithFrame:CGRectMake(0*APP_DELEGATE().autoSizeScaleX, 12*APP_DELEGATE().autoSizeScaleY, 14*APP_DELEGATE().autoSizeScaleY, 18*APP_DELEGATE().autoSizeScaleY)];
        imageViewPwd.image=[UIImage imageNamed:@"dl_shouji"];
        [view addSubview:imageViewPwd];
        
        _shoujihaomaText.leftView=view;
        _shoujihaomaText.leftViewMode=UITextFieldViewModeAlways; //此处用来设置leftview现实时机
        _shoujihaomaText.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
//        [_shoujihaomaText setValue:lvColor forKeyPath:@"_placeholderLabel.textColor"];
//        [_shoujihaomaText setValue:viewFont2 forKeyPath:@"_placeholderLabel.font"];
        
        
    }
    return _shoujihaomaText;
}

- (UITextField *)mimaText
{
    if (!_mimaText)
    {
        
        _mimaText = [[UITextField alloc] init];
        _mimaText.backgroundColor = [UIColor clearColor];
        _mimaText.clearButtonMode = UITextFieldViewModeWhileEditing;
        _mimaText.borderStyle = UITextBorderStyleNone;
        _mimaText.delegate = self;
        _mimaText.placeholder = @"请输入密码";
        _mimaText.returnKeyType = UIReturnKeyDone;
        _mimaText.keyboardType = UIKeyboardTypeDefault;
        _mimaText.font = viewFont2;
        _mimaText.textColor = lvColor;
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 30*APP_DELEGATE().autoSizeScaleY, 42*APP_DELEGATE().autoSizeScaleY)];
        
        UIImageView *imageViewPwd=[[UIImageView alloc]initWithFrame:CGRectMake(0*APP_DELEGATE().autoSizeScaleX, 14*APP_DELEGATE().autoSizeScaleY, 14*APP_DELEGATE().autoSizeScaleY, 14*APP_DELEGATE().autoSizeScaleY)];
        imageViewPwd.image=[UIImage imageNamed:@"dl_mima"];
        [view addSubview:imageViewPwd];
        
        _mimaText.leftView=view;
        _mimaText.leftViewMode=UITextFieldViewModeAlways; //此处用来设置leftview现实时机
        _mimaText.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        //        [_shoujihaomaText setValue:lvColor forKeyPath:@"_placeholderLabel.textColor"];
        //        [_shoujihaomaText setValue:viewFont2 forKeyPath:@"_placeholderLabel.font"];
    }
    return _mimaText;
}

- (void)initView
{
    self.view.backgroundColor = [UIColor colorWithRed:247/255.0 green:247/255.0 blue:247/255.0 alpha:1];
    UIImageView *icon1 = [[UIImageView alloc] init];
    icon1.image = [UIImage imageNamed:@"dl_biaoti@2x"];
    [self.view addSubview:icon1];
    [icon1 makeConstraints:^(MASConstraintMaker *make)
     {
         make.top.equalTo(self.view).with.offset(85*APP_DELEGATE().autoSizeScaleY);;
         make.left.equalTo(self.view).with.offset(40*APP_DELEGATE().autoSizeScaleX);
         make.size.equalTo(CGSizeMake(240*APP_DELEGATE().autoSizeScaleY,42*APP_DELEGATE().autoSizeScaleY));
     }];
    
    [self.view addSubview:self.shoujihaomaText];
    [self.shoujihaomaText makeConstraints:^(MASConstraintMaker *make)
     {
         make.top.equalTo(icon1).with.offset(80*APP_DELEGATE().autoSizeScaleY);;
         make.left.equalTo(self.view).with.offset(40*APP_DELEGATE().autoSizeScaleX);
         make.size.equalTo(CGSizeMake(240*APP_DELEGATE().autoSizeScaleY,42*APP_DELEGATE().autoSizeScaleY));
     }];
    
    UIView *fgx1 = [[UIView alloc] init];
    fgx1.backgroundColor = [UIColor colorWithRed:234/255.0 green:234/255.0 blue:234/255.0 alpha:1];;
    [self.view addSubview:fgx1];
    
    [fgx1 makeConstraints:^(MASConstraintMaker *make)
     {
         make.centerX.equalTo(self.view.mas_centerX);
         make.bottom.equalTo(self.shoujihaomaText).with.offset(1);
         make.size.equalTo(CGSizeMake(240*APP_DELEGATE().autoSizeScaleX, 1));
         make.height.equalTo(1);
     }];

    
    [self.view addSubview:self.mimaText];
    [self.mimaText makeConstraints:^(MASConstraintMaker *make)
     {
         make.top.equalTo(self.shoujihaomaText).with.offset(45*APP_DELEGATE().autoSizeScaleY);;
         make.left.equalTo(self.view).with.offset(40*APP_DELEGATE().autoSizeScaleX);
         make.size.equalTo(CGSizeMake(240*APP_DELEGATE().autoSizeScaleY,42*APP_DELEGATE().autoSizeScaleY));
     }];
    
    UIView *fgx2 = [[UIView alloc] init];
    fgx2.backgroundColor = [UIColor colorWithRed:234/255.0 green:234/255.0 blue:234/255.0 alpha:1];
    [self.view addSubview:fgx2];
    
    [fgx2 makeConstraints:^(MASConstraintMaker *make)
     {
         make.centerX.equalTo(self.view.mas_centerX);
        make.bottom.equalTo(self.mimaText).with.offset(1);
         make.size.equalTo(CGSizeMake(240*APP_DELEGATE().autoSizeScaleX, 1));
         make.height.equalTo(1);
     }];
    
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
    [self.view addSubview:submitBtn];
    
    [submitBtn makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX);
        make.top.equalTo(self.mimaText).with.offset(80*APP_DELEGATE().autoSizeScaleY);
        make.size.equalTo(CGSizeMake(240*APP_DELEGATE().autoSizeScaleX, 40*APP_DELEGATE().autoSizeScaleY));
    }];
    LRViewBorderRadius(submitBtn, 5, 1, lvColor);

    UIImage *image = [UIImage imageNamed:@"dl_wangjimima"];
    NSString *title =@"忘记密码";

    
    ImageTextButton *shouhuoButton = [[ImageTextButton alloc] initWithFrame:CGRectMake(40*APP_DELEGATE().autoSizeScaleX, 345*APP_DELEGATE().autoSizeScaleY, 70*APP_DELEGATE().autoSizeScaleX, 20*APP_DELEGATE().autoSizeScaleY)
                                                                      image:image
                                                                      title:title];
    
    shouhuoButton.buttonTitleWithImageAlignment = UIButtonTitleWithImageAlignmentLeft;
    [shouhuoButton addTarget:self action:@selector(anniuClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:shouhuoButton];
    shouhuoButton.backgroundColor = [UIColor colorWithRed:247/255.0 green:247/255.0 blue:247/255.0 alpha:1];

}

- (void)anniuClick:(UIButton *) sender
{
    NSLog(@"忘记密码");
    PassWord1ViewController *vc = [[PassWord1ViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
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
