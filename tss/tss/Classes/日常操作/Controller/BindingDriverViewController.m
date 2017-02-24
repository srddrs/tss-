//
//  BindingDriverViewController.m
//  tss
//
//  Created by admin on 17/2/20.
//  Copyright © 2017年 com.yunlaila. All rights reserved.
//

#import "BindingDriverViewController.h"
#import "AddDriverViewController.h"
@interface BindingDriverViewController ()
<UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate>
{
    
}
@property (nonatomic ,strong) UITableView *tableView;
@property (nonatomic, strong) UITextField *chepaihaoText;  //车牌号
@property (nonatomic, strong) UITextField *sijixingmingText;  //司机姓名
@end

@implementation BindingDriverViewController
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
    self.title = @"绑定司机";
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithIcon:@"fanhuijian_xiache-拷贝-2" highIcon:@"fanhuijian_xiache-拷贝-2" target:self action:@selector(pop:)];
    
    UIBarButtonItem *changyongItem = [[UIBarButtonItem alloc] initWithTitle:@"添加司机" style:UIBarButtonItemStyleDone target:self action:@selector(changyong)];
    self.navigationItem.rightBarButtonItem = changyongItem;
    [self.navigationItem.rightBarButtonItem setTintColor:lvColor];
    [self.navigationItem.rightBarButtonItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:15],NSFontAttributeName, nil] forState:UIControlStateNormal];
}

- (void)pop:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)changyong
{
    NSLog(@"添加司机");
    AddDriverViewController *vc = [[AddDriverViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
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

- (UITextField *)chepaihaoText
{
    if (!_chepaihaoText)
    {
        
        _chepaihaoText = [[UITextField alloc] init];
        _chepaihaoText.backgroundColor = [UIColor whiteColor];
        _chepaihaoText.clearButtonMode = UITextFieldViewModeWhileEditing;
        _chepaihaoText.borderStyle = UITextBorderStyleNone;
        _chepaihaoText.delegate = self;
        _chepaihaoText.placeholder = @"请输入车牌号";
        _chepaihaoText.returnKeyType = UIReturnKeyDone;
        _chepaihaoText.keyboardType = UIKeyboardTypeDefault;
        _chepaihaoText.font = viewFont3;
        _chepaihaoText.textColor = lvColor;
//        _chepaihaoText.enabled = NO;
    }
    return _chepaihaoText;
}

- (UITextField *)sijixingmingText
{
    if (!_sijixingmingText)
    {
        
        _sijixingmingText = [[UITextField alloc] init];
        _sijixingmingText.backgroundColor = [UIColor whiteColor];
        _sijixingmingText.clearButtonMode = UITextFieldViewModeWhileEditing;
        _sijixingmingText.borderStyle = UITextBorderStyleNone;
        _sijixingmingText.delegate = self;
        _sijixingmingText.placeholder = @"选择司机";
        _sijixingmingText.returnKeyType = UIReturnKeyDone;
        _sijixingmingText.keyboardType = UIKeyboardTypeDefault;
        _sijixingmingText.font = viewFont3;
        _sijixingmingText.textColor = lvColor;
        _sijixingmingText.enabled = NO;
    }
    return _sijixingmingText;
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
        cell.accessoryType = UITableViewCellAccessoryNone;
        UILabel *titleLable = [[UILabel alloc] init];
        titleLable.numberOfLines = 0;
        titleLable.textAlignment = NSTextAlignmentLeft;
        titleLable.font = viewFont3;
        titleLable.textColor = fontColor;
        [cell.contentView addSubview:titleLable];
        titleLable.text = @"车牌号";
        
        [titleLable makeConstraints:^(MASConstraintMaker *make)
         {
             make.left.equalTo(cell.contentView).with.offset(15*APP_DELEGATE().autoSizeScaleX);
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
    else  if(indexPath.row==1)
    {
        [fgx1 removeFromSuperview];
        UILabel *titleLable = [[UILabel alloc] init];
        titleLable.numberOfLines = 0;
        titleLable.textAlignment = NSTextAlignmentLeft;
        titleLable.font = viewFont3;
        titleLable.textColor = fontColor;
        [cell.contentView addSubview:titleLable];
        titleLable.text = @"司机姓名";
        
        [titleLable makeConstraints:^(MASConstraintMaker *make)
         {
             make.left.equalTo(cell.contentView).with.offset(15*APP_DELEGATE().autoSizeScaleX);
             make.size.equalTo(CGSizeMake(55*APP_DELEGATE().autoSizeScaleX,46*APP_DELEGATE().autoSizeScaleY));
         }];
        
        
        [cell.contentView addSubview:self.sijixingmingText];
        [self.sijixingmingText makeConstraints:^(MASConstraintMaker *make)
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

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}


- (void)submitBtnClick:(UIButton *)sender
{
    NSLog(@"保存");
}
@end
