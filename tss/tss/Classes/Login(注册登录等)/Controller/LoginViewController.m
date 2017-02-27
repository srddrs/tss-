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
#import "CustomIOSAlertView.h"
@interface LoginViewController ()<UITextFieldDelegate>
{
    BOOL isShowIMG;
    UIImageView *codeView;
    UITextField *imageText;   //图形验证码
}
@property (nonatomic, strong) UITextField *shoujihaomaText;  //手机号码
@property (nonatomic, strong) UITextField *mimaText;  //密码
@property (nonatomic, strong) UIButton *gouBtn;  //是否
@end

@implementation LoginViewController
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
         isShowIMG=NO;
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
        _shoujihaomaText.text = @"13982261762";
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


- (UIButton *)gouBtn
{
    if (!_gouBtn)
    {
        _gouBtn = [[UIButton alloc] init];
        [_gouBtn setImage:[UIImage imageNamed:@"zhyf_weixuan"] forState:UIControlStateNormal];
        [_gouBtn setImage:[UIImage imageNamed:@"bx_wancheng"]  forState:UIControlStateSelected];
        [_gouBtn addTarget:self
                   action:@selector(guoBtnClick:)
         forControlEvents:UIControlEventTouchUpInside];
        _gouBtn.selected = NO;
        
    }

    return _gouBtn;
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
    
    
    [self.view addSubview:self.gouBtn];
    [self.gouBtn makeConstraints:^(MASConstraintMaker *make)
     {
         make.top.equalTo(self.mimaText).with.offset(60*APP_DELEGATE().autoSizeScaleY);
          make.left.equalTo(self.view).with.offset(40*APP_DELEGATE().autoSizeScaleX);
         make.size.equalTo(CGSizeMake(13*APP_DELEGATE().autoSizeScaleY, 13*APP_DELEGATE().autoSizeScaleY));
     }];

    UILabel *titleLable = [[UILabel alloc] init];
    titleLable.numberOfLines = 0;
    titleLable.textAlignment = NSTextAlignmentLeft;
    titleLable.font = viewFont3;
    titleLable.textColor = lvColor;
    [self.view addSubview:titleLable];
    titleLable.text = @"平台账号";
    
    UITapGestureRecognizer *tapGr2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(openTap:)];
    tapGr2.cancelsTouchesInView = YES;
    [titleLable addGestureRecognizer:tapGr2];
    titleLable.userInteractionEnabled = YES;

    [titleLable makeConstraints:^(MASConstraintMaker *make)
     {
          make.top.equalTo(self.mimaText).with.offset(57*APP_DELEGATE().autoSizeScaleY);
         make.left.equalTo(self.gouBtn.mas_right).with.offset(5);
         make.size.equalTo(CGSizeMake(80*APP_DELEGATE().autoSizeScaleX,20*APP_DELEGATE().autoSizeScaleY));
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
        make.top.equalTo(self.mimaText).with.offset(95*APP_DELEGATE().autoSizeScaleY);
        make.size.equalTo(CGSizeMake(240*APP_DELEGATE().autoSizeScaleX, 40*APP_DELEGATE().autoSizeScaleY));
    }];
    LRViewBorderRadius(submitBtn, 5, 1, lvColor);

    UIImage *image = [UIImage imageNamed:@"dl_wangjimima"];
    NSString *title =@"忘记密码";

    
    ImageTextButton *shouhuoButton = [[ImageTextButton alloc] initWithFrame:CGRectMake(40*APP_DELEGATE().autoSizeScaleX, 360*APP_DELEGATE().autoSizeScaleY, 70*APP_DELEGATE().autoSizeScaleX, 20*APP_DELEGATE().autoSizeScaleY)
                                                                      image:image
                                                                      title:title];
    [shouhuoButton setTitleColor:lvColor forState:UIControlStateNormal];
    shouhuoButton.buttonTitleWithImageAlignment = UIButtonTitleWithImageAlignmentLeft;
    [shouhuoButton addTarget:self action:@selector(anniuClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:shouhuoButton];
    shouhuoButton.backgroundColor = [UIColor colorWithRed:247/255.0 green:247/255.0 blue:247/255.0 alpha:1];

}

- (void)guoBtnClick:(id)sender
{
    self.gouBtn.selected = !self.gouBtn.selected;
}

- (void)openTap:(UITapGestureRecognizer*)tapGr
{
    NSLog(@"收费标准");
    self.gouBtn.selected = !self.gouBtn.selected;
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
    if ([AppTool validateMobile:self.shoujihaomaText.text]==NO)
    {
        [MBProgressHUD showError:@"请填写正确的手机号" toView:self.view];
        return;
    }
    
    if(self.mimaText.text.length==0)
    {
        [MBProgressHUD showError:@"请填写密码" toView:self.view];
        return;
    }
    
    if (isShowIMG==YES)
    {
        //            [UIAlertView showAlert:@"弹出验证码" cancelButton:@"好"];
        
        [self showCodeView];
        return;
    }
    
    NSMutableDictionary *paramDic = [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                                     self.shoujihaomaText.text,@"user_name",
                                     self.mimaText.text,@"user_pwd",
                                     @"3",@"login_type",
                                     nil];
    
    if (self.gouBtn.selected==YES)
    {
        [paramDic setObject:@"1" forKey:@"user_type"];   //平台账号
    }
    else
    {
         [paramDic setObject:@"2" forKey:@"user_type"];   //加盟商用户
    }
    
    NHNetworkHelper *helper = [NHNetworkHelper shareInstance];
    [MBProgressHUD showMessag:@"" toView:self.view];
    
    [helper Post:loginByPwdURL Parameters:paramDic Success:^(id responseObject)
     {
         [MBProgressHUD hideHUDForView:self.view animated:YES];
         ResponseObject *obj =[ResponseObject yy_modelWithDictionary:responseObject];
         
         if (((response *)obj.responses[0]).flag.intValue==1)
         {
             
             
             NSData *cookiesdata = [[NSUserDefaults standardUserDefaults] objectForKey:kUserDefaultsCookie];
             if([cookiesdata length])
             {
                 NSArray *cookies = [NSKeyedUnarchiver unarchiveObjectWithData:cookiesdata];
                 NSHTTPCookie *cookie;
                 for (cookie in cookies)
                 {
                     [[NSHTTPCookieStorage sharedHTTPCookieStorage] setCookie:cookie];
                 }
             }
             NSDictionary *item = ((response *)obj.responses[0]).items[0];
             [[NSUserDefaults standardUserDefaults] setObject:item forKey:kLoginUser];
             [[NSUserDefaults standardUserDefaults] synchronize];
             
             
             
             
             [self.navigationController dismissViewControllerAnimated:YES completion:^{
                 //                     APP_DELEGATE().tabBarVc.selectedIndex = 3;
             }];
             
         }
         else
         {
             
              [MBProgressHUD showError:((response *)obj.responses[0]).message toView:self.view];
         }
     }
         Failure:^(NSError *error)
     {
          [MBProgressHUD hideHUDForView:self.view animated:YES];
         if (error.code==-40005)
         {
             isShowIMG = NO;
             [self showCodeView];
         }
         else
         {
               [MBProgressHUD showAutoMessage:error.domain];
         }
         NSLog(@"%@",error);
       
     }];
    

}

- (void)codeViewTap:(UITapGestureRecognizer*)tapGr
{
    NSLog(@"刷新验证码");
    NSString *urlString =  [NSString stringWithFormat:@"%@/tss/mobile/image_code.do?user_name=%@",TSSServerUrl,self.shoujihaomaText.text];
    NSURL *url = [NSURL URLWithString: urlString];
    UIImage *imagea = [UIImage imageWithData: [NSData dataWithContentsOfURL:url]];
    codeView.image=imagea;
    
}

- (void)showCodeView
{
    CustomIOSAlertView *alertView = [[CustomIOSAlertView alloc] init];
    
    UIView *alertBGView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 280, 160)];
    //    bgview.backgroundColor = [UIColor redColor];
    UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(0, 20, 280, 25)];
    label1.backgroundColor = [UIColor clearColor];
    label1.textColor = fontColor;
    label1.textAlignment = NSTextAlignmentCenter;
    label1.lineBreakMode = NSLineBreakByWordWrapping;
    label1.numberOfLines = 0;
    label1.font = viewFont1;
    label1.text = @"请输入图片中的内容";
    [alertBGView addSubview:label1];
    
    UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectMake(0, 45, 280, 25)];
    label2.backgroundColor = [UIColor clearColor];
    label2.textColor = fontColor;
    label2.textAlignment = NSTextAlignmentCenter;
    label2.lineBreakMode = NSLineBreakByWordWrapping;
    label2.numberOfLines = 0;
    label2.font = viewFont2;
    label2.text = @"安全验证,点击图片换一张";
    [alertBGView addSubview:label2];
    
    codeView = [[UIImageView alloc] initWithFrame:CGRectMake(90, 75, 100, 35)];
    NSString *urlString = [NSString stringWithFormat:@"%@/tss/mobile/image_code.do?user_name=%@",TSSServerUrl,self.shoujihaomaText.text];
    NSURL *url = [NSURL URLWithString: urlString];
    UIImage *imagea = [UIImage imageWithData: [NSData dataWithContentsOfURL:url]];
    codeView.image=imagea;
    [alertBGView addSubview:codeView];
    
    UITapGestureRecognizer *tapGr2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(codeViewTap:)];
    tapGr2.cancelsTouchesInView = YES;
    [codeView addGestureRecognizer:tapGr2];
    codeView.userInteractionEnabled = YES;
    alertBGView.userInteractionEnabled = YES;
    
    if (!imageText)
    {
        imageText = [[UITextField alloc] init];
        imageText.backgroundColor = [UIColor whiteColor];
        imageText.clearButtonMode = UITextFieldViewModeWhileEditing;
        imageText.borderStyle = UITextBorderStyleNone;
        imageText.frame = CGRectMake(15, 120, 250, 25);
        imageText.delegate = self;
        imageText.placeholder = @"请输入4位验证码";
        imageText.returnKeyType = UIReturnKeyDone;
        imageText.keyboardType = UIKeyboardTypeDefault;
        imageText.font = viewFont1;
        
    }
    [alertBGView addSubview:imageText];
    
    
    [alertView setContainerView:alertBGView];
    [alertView setButtonTitles:[NSMutableArray arrayWithObjects:@"取消", @"确定", nil]];
    //    [alertView setDelegate:self];
    [alertView setUseMotionEffects:true];
    [alertView setOnButtonTouchUpInside:^(CustomIOSAlertView *alertView, int buttonIndex) {
        NSLog(@"Block: Button at position %d is clicked on alertView %d.", buttonIndex, (int)[alertView tag]);
        if (buttonIndex==1)
        {
            NSMutableDictionary *paramDic = [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                                             self.shoujihaomaText.text,@"user_name",
                                             self.mimaText.text,@"user_pwd",
                                             imageText.text,@"valid_code",
                                             @"3",@"login_type",
                                             nil];
            
            if (self.gouBtn.selected==YES)
            {
                [paramDic setObject:@"1" forKey:@"user_type"];   //平台账号
            }
            else
            {
                [paramDic setObject:@"2" forKey:@"user_type"];   //加盟商用户
            }

            
            NHNetworkHelper *helper = [NHNetworkHelper shareInstance];
            
            
            [helper Post:loginByPwdURL Parameters:paramDic Success:^(id responseObject)
             {
                  [MBProgressHUD hideHUDForView:self.view animated:YES];
                 ResponseObject *obj =[ResponseObject yy_modelWithDictionary:responseObject];
                 
                 if (((response *)obj.responses[0]).flag.intValue==1)
                 {
                     
                     
                     NSData *cookiesdata = [[NSUserDefaults standardUserDefaults] objectForKey:kUserDefaultsCookie];
                     if([cookiesdata length]) {
                         NSArray *cookies = [NSKeyedUnarchiver unarchiveObjectWithData:cookiesdata];
                         NSHTTPCookie *cookie;
                         for (cookie in cookies) {
                             [[NSHTTPCookieStorage sharedHTTPCookieStorage] setCookie:cookie];
                         }
                     }
                     NSDictionary *item = ((response *)obj.responses[0]).items[0];
                     [[NSUserDefaults standardUserDefaults] setObject:item forKey:kLoginUser];
                     [[NSUserDefaults standardUserDefaults] synchronize];
                     [MBProgressHUD showAutoMessage:@"登录成功"];
                     
                     [self.navigationController dismissViewControllerAnimated:YES completion:^{
                         //                     APP_DELEGATE().tabBarVc.selectedIndex = 3;
                     }];
                     
                 }
                 else
                 {
                     [MBProgressHUD showError:((response *)obj.responses[0]).message toView:self.view];
                 }
                 NSLog(@"%@",responseObject);
             }
                 Failure:^(NSError *error)
             {
  
                  [MBProgressHUD hideHUDForView:self.view animated:YES];
                 if (error.code==-40005)
                 {
                     isShowIMG = NO;
                     [self showCodeView];
                 }
                 else
                 {
                     [MBProgressHUD showAutoMessage:error.domain];
                 }

             }];
            
        }
        [alertView close];
    }];
    // And launch the dialog
    [alertView show];
    
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}
@end
