
//
//  YLLWebViewController.m
//  yunlailaC
//
//  Created by admin on 16/7/25.
//  Copyright © 2016年 com.yunlaila. All rights reserved.
//

#import "YLLWebViewController.h"

@interface YLLWebViewController ()<UIWebViewDelegate>
{
    UIWebView *webView;
}
@end

@implementation YLLWebViewController
@synthesize webURL,webTitle;

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.title = webTitle;
    
    [[NSURLCache sharedURLCache] removeAllCachedResponses];
    
    NSDictionary *item = [[NSUserDefaults standardUserDefaults] objectForKey:kLoginUser];
    NSString *tokenValue = [item objectForKey:@"token"];
    
    NSRange range = [webURL rangeOfString:@"?"];
    NSURL* url;
    if (range.location !=NSNotFound)
    {
        url = [NSURL URLWithString:[NSString stringWithFormat:@"%@&token=%@",webURL,tokenValue]];//创建URL
    }
    else
    {
        url = [NSURL URLWithString:[NSString stringWithFormat:@"%@?token=%@",webURL,tokenValue]];//创建URL
    }

    NSURLRequest* request = [NSURLRequest requestWithURL:url];//创建NSURLRequest
    [webView loadRequest:request];//加载
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpNav];
    webView = [[UIWebView alloc] initWithFrame:CGRectMake(0,0,self.view.frame.size.width,self.view.frame.size.height-TabbarHeight-statusViewHeight)];
    webView.delegate = self;
    
    [self.view addSubview:webView];
//    [APP_DELEGATE() storyBoradAutoLay:self.view];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setUpNav
{
    self.title = webTitle;
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithIcon:@"zhuye_fanhui_baise" highIcon:@"zhuye_fanhui_baise" target:self action:@selector(pop:)];
}


- (void)pop:(id)sender
{
    if ([webView canGoBack]) {
        [webView goBack];
    }
    else
    {
        [self.navigationController  dismissViewControllerAnimated:YES completion:^{
            
        }];
        
    }
    
    
}
- (void)webViewDidStartLoad:(UIWebView *)webView
{
//    [MBProgressHUD showMessag:@"" toView:self.view];
}
- (void)webViewDidFinishLoad:(UIWebView *)webView1
{
//    [MBProgressHUD hideHUDForView:self.view animated:YES];
//     NSString *str = @"document.getElementsByTagName('body')[0].style.webkitTextSizeAdjust= '80%'";
//    [webView stringByEvaluatingJavaScriptFromString:str];
    
//    webView.scalesPageToFit = YES;
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    
//    [MBProgressHUD hideHUDForView:self.view animated:YES];
    [MBProgressHUD showError:error.domain toView:self.view];

}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    NSString *requestString = [[request URL] absoluteString];
//    http://testcustomer.yunlaila.com.cn/customer/weixin1.2/contractClause.html
    
    
    
    
    NSRange range = [requestString rangeOfString:@"contractClause.html"];//判断字符串是否包含
    if (range.length >0)//包含
    {
        self.title = @"托运邦运单契约条款";
    }
    return YES;
}

@end
