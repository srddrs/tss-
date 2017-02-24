//
//  FlowViewController.m
//  tss
//
//  Created by admin on 17/2/21.
//  Copyright © 2017年 com.yunlaila. All rights reserved.
//

#import "FlowViewController.h"

@interface FlowViewController ()<UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate>
{
    NSMutableArray *photos;
}
@property (nonatomic ,strong) UITableView *tableView;

@property (nonatomic, strong) UITextField *baoxiaokemuText;  //报销科目
@property (nonatomic, strong) UITextField *dangqianliuchenText;  //当前流程
@property (nonatomic, strong) UITextField *xiayibuText;  //下一步
@property (nonatomic, strong) UITextField *baoxiaofeiyongText;  //报销费用
@property (nonatomic, strong) UITextField *baoxiaoshenqingrenText;  //报销申请人
@property (nonatomic, strong) UITextField *jiamengshangmingchenText;  //加盟商名称
@property (nonatomic, strong) UITextField *wangdianmingchengText;  //网点名称
@property (nonatomic, strong) UITextField *bangdingyundanbianhaoText;  //绑定运单编号
@property (nonatomic, strong) UITextField *beizhuText;  //备注

@end

@implementation FlowViewController
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        photos = [[NSMutableArray alloc] init];
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
    self.title = @"报销";
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

- (UITextField *)baoxiaokemuText
{
    if (!_baoxiaokemuText)
    {
        
        _baoxiaokemuText = [[UITextField alloc] init];
        _baoxiaokemuText.backgroundColor = [UIColor whiteColor];
        _baoxiaokemuText.clearButtonMode = UITextFieldViewModeWhileEditing;
        _baoxiaokemuText.borderStyle = UITextBorderStyleNone;
        _baoxiaokemuText.delegate = self;
        _baoxiaokemuText.placeholder = @"请选择";
        _baoxiaokemuText.returnKeyType = UIReturnKeyDone;
        _baoxiaokemuText.keyboardType = UIKeyboardTypeDefault;
        _baoxiaokemuText.font = viewFont3;
        _baoxiaokemuText.textColor = lvColor;
        _baoxiaokemuText.enabled = NO;
    }
    return _baoxiaokemuText;
}

- (UITextField *)dangqianliuchenText
{
    if (!_dangqianliuchenText)
    {
        
        _dangqianliuchenText = [[UITextField alloc] init];
        _dangqianliuchenText.backgroundColor = [UIColor whiteColor];
        _dangqianliuchenText.clearButtonMode = UITextFieldViewModeWhileEditing;
        _dangqianliuchenText.borderStyle = UITextBorderStyleNone;
        _dangqianliuchenText.delegate = self;
        _dangqianliuchenText.placeholder = @"平台会计审核";
        _dangqianliuchenText.returnKeyType = UIReturnKeyDone;
        _dangqianliuchenText.keyboardType = UIKeyboardTypeDefault;
        _dangqianliuchenText.font = viewFont3;
        _dangqianliuchenText.textColor = lvColor;
        _dangqianliuchenText.enabled = NO;
    }
    return _dangqianliuchenText;
}

- (UITextField *)xiayibuText
{
    if (!_xiayibuText)
    {
        
        _xiayibuText = [[UITextField alloc] init];
        _xiayibuText.backgroundColor = [UIColor whiteColor];
        _xiayibuText.clearButtonMode = UITextFieldViewModeWhileEditing;
        _xiayibuText.borderStyle = UITextBorderStyleNone;
        _xiayibuText.delegate = self;
        _xiayibuText.placeholder = @"平台出纳审核";
        _xiayibuText.returnKeyType = UIReturnKeyDone;
        _xiayibuText.keyboardType = UIKeyboardTypeDefault;
        _xiayibuText.font = viewFont3;
        _xiayibuText.textColor = lvColor;
        _xiayibuText.enabled = NO;
    }
    return _xiayibuText;
}

- (UITextField *)baoxiaofeiyongText
{
    if (!_baoxiaofeiyongText)
    {
        
        _baoxiaofeiyongText = [[UITextField alloc] init];
        _baoxiaofeiyongText.backgroundColor = [UIColor whiteColor];
        _baoxiaofeiyongText.clearButtonMode = UITextFieldViewModeWhileEditing;
        _baoxiaofeiyongText.borderStyle = UITextBorderStyleNone;
        _baoxiaofeiyongText.delegate = self;
        _baoxiaofeiyongText.placeholder = @"输入报销费用";
        _baoxiaofeiyongText.returnKeyType = UIReturnKeyDone;
        _baoxiaofeiyongText.keyboardType = UIKeyboardTypeDefault;
        _baoxiaofeiyongText.font = viewFont3;
        _baoxiaofeiyongText.textColor = lvColor;
//        _baoxiaofeiyongText.enabled = NO;
    }
    return _baoxiaofeiyongText;
}

- (UITextField *)baoxiaoshenqingrenText
{
    if (!_baoxiaoshenqingrenText)
    {
        
        _baoxiaoshenqingrenText = [[UITextField alloc] init];
        _baoxiaoshenqingrenText.backgroundColor = [UIColor whiteColor];
        _baoxiaoshenqingrenText.clearButtonMode = UITextFieldViewModeWhileEditing;
        _baoxiaoshenqingrenText.borderStyle = UITextBorderStyleNone;
        _baoxiaoshenqingrenText.delegate = self;
        _baoxiaoshenqingrenText.placeholder = @"申请人姓名";
        _baoxiaoshenqingrenText.returnKeyType = UIReturnKeyDone;
        _baoxiaoshenqingrenText.keyboardType = UIKeyboardTypeDefault;
        _baoxiaoshenqingrenText.font = viewFont3;
        _baoxiaoshenqingrenText.textColor = lvColor;
        _baoxiaoshenqingrenText.enabled = NO;
    }
    return _baoxiaoshenqingrenText;
}

- (UITextField *)jiamengshangmingchenText
{
    if (!_baoxiaoshenqingrenText)
    {
        
        _baoxiaoshenqingrenText = [[UITextField alloc] init];
        _baoxiaoshenqingrenText.backgroundColor = [UIColor whiteColor];
        _baoxiaoshenqingrenText.clearButtonMode = UITextFieldViewModeWhileEditing;
        _baoxiaoshenqingrenText.borderStyle = UITextBorderStyleNone;
        _baoxiaoshenqingrenText.delegate = self;
        _baoxiaoshenqingrenText.placeholder = @"加盟商名称";
        _baoxiaoshenqingrenText.returnKeyType = UIReturnKeyDone;
        _baoxiaoshenqingrenText.keyboardType = UIKeyboardTypeDefault;
        _baoxiaoshenqingrenText.font = viewFont3;
        _baoxiaoshenqingrenText.textColor = lvColor;
        _baoxiaoshenqingrenText.enabled = NO;
    }
    return _baoxiaoshenqingrenText;
}

- (UITextField *)wangdianmingchengText
{
    if (!_wangdianmingchengText)
    {
        
        _wangdianmingchengText = [[UITextField alloc] init];
        _wangdianmingchengText.backgroundColor = [UIColor whiteColor];
        _wangdianmingchengText.clearButtonMode = UITextFieldViewModeWhileEditing;
        _wangdianmingchengText.borderStyle = UITextBorderStyleNone;
        _wangdianmingchengText.delegate = self;
        _wangdianmingchengText.placeholder = @"网点名称";
        _wangdianmingchengText.returnKeyType = UIReturnKeyDone;
        _wangdianmingchengText.keyboardType = UIKeyboardTypeDefault;
        _wangdianmingchengText.font = viewFont3;
        _wangdianmingchengText.textColor = lvColor;
        _wangdianmingchengText.enabled = NO;
    }
    return _wangdianmingchengText;
}

- (UITextField *)bangdingyundanbianhaoText
{
    if (!_bangdingyundanbianhaoText)
    {
        
        _bangdingyundanbianhaoText = [[UITextField alloc] init];
        _bangdingyundanbianhaoText.backgroundColor = [UIColor whiteColor];
        _bangdingyundanbianhaoText.clearButtonMode = UITextFieldViewModeWhileEditing;
        _bangdingyundanbianhaoText.borderStyle = UITextBorderStyleNone;
        _bangdingyundanbianhaoText.delegate = self;
        _bangdingyundanbianhaoText.placeholder = @"绑定运单编号";
        _bangdingyundanbianhaoText.returnKeyType = UIReturnKeyDone;
        _bangdingyundanbianhaoText.keyboardType = UIKeyboardTypeDefault;
        _bangdingyundanbianhaoText.font = viewFont3;
        _bangdingyundanbianhaoText.textColor = lvColor;
        _bangdingyundanbianhaoText.enabled = NO;
    }
    return _bangdingyundanbianhaoText;
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
        _beizhuText.placeholder = @"备注";
        _beizhuText.returnKeyType = UIReturnKeyDone;
        _beizhuText.keyboardType = UIKeyboardTypeDefault;
        _beizhuText.font = viewFont3;
        _beizhuText.textColor = lvColor;
//        beizhuText.enabled = NO;
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
    return 11;
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
    else if(indexPath.row==9)
    {
        return 92*APP_DELEGATE().autoSizeScaleY;
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
        titleLable.text = @"报销科目";
        
        [titleLable makeConstraints:^(MASConstraintMaker *make)
         {
             make.left.equalTo(cell.contentView).with.offset(15*APP_DELEGATE().autoSizeScaleX);
             make.size.equalTo(CGSizeMake(75*APP_DELEGATE().autoSizeScaleX,46*APP_DELEGATE().autoSizeScaleY));
         }];
        
        
        [cell.contentView addSubview:self.baoxiaokemuText];
        [self.baoxiaokemuText makeConstraints:^(MASConstraintMaker *make)
         {
             make.left.equalTo(titleLable.mas_right).with.offset(5*APP_DELEGATE().autoSizeScaleX);
             make.centerY.equalTo(cell.contentView.mas_centerY);
             make.size.equalTo(CGSizeMake(215*APP_DELEGATE().autoSizeScaleX,40*APP_DELEGATE().autoSizeScaleY));
         }];
    }
    else  if(indexPath.row==1)
    {
        UILabel *titleLable = [[UILabel alloc] init];
        titleLable.numberOfLines = 0;
        titleLable.textAlignment = NSTextAlignmentLeft;
        titleLable.font = viewFont3;
        titleLable.textColor = fontColor;
        [cell.contentView addSubview:titleLable];
        titleLable.text = @"当前流程";
        
        [titleLable makeConstraints:^(MASConstraintMaker *make)
         {
             make.left.equalTo(cell.contentView).with.offset(15*APP_DELEGATE().autoSizeScaleX);
             make.size.equalTo(CGSizeMake(75*APP_DELEGATE().autoSizeScaleX,46*APP_DELEGATE().autoSizeScaleY));
         }];
        
        
        [cell.contentView addSubview:self.dangqianliuchenText];
        [self.dangqianliuchenText makeConstraints:^(MASConstraintMaker *make)
         {
             make.left.equalTo(titleLable.mas_right).with.offset(5*APP_DELEGATE().autoSizeScaleX);
             make.centerY.equalTo(cell.contentView.mas_centerY);
             make.size.equalTo(CGSizeMake(215*APP_DELEGATE().autoSizeScaleX,40*APP_DELEGATE().autoSizeScaleY));
         }];
    }
    else  if(indexPath.row==2)
    {
        UILabel *titleLable = [[UILabel alloc] init];
        titleLable.numberOfLines = 0;
        titleLable.textAlignment = NSTextAlignmentLeft;
        titleLable.font = viewFont3;
        titleLable.textColor = fontColor;
        [cell.contentView addSubview:titleLable];
        titleLable.text = @"下一步";
        
        [titleLable makeConstraints:^(MASConstraintMaker *make)
         {
             make.left.equalTo(cell.contentView).with.offset(15*APP_DELEGATE().autoSizeScaleX);
             make.size.equalTo(CGSizeMake(75*APP_DELEGATE().autoSizeScaleX,46*APP_DELEGATE().autoSizeScaleY));
         }];
        
        
        [cell.contentView addSubview:self.xiayibuText];
        [self.xiayibuText makeConstraints:^(MASConstraintMaker *make)
         {
             make.left.equalTo(titleLable.mas_right).with.offset(5*APP_DELEGATE().autoSizeScaleX);
             make.centerY.equalTo(cell.contentView.mas_centerY);
             make.size.equalTo(CGSizeMake(215*APP_DELEGATE().autoSizeScaleX,40*APP_DELEGATE().autoSizeScaleY));
         }];
    }
    else  if(indexPath.row==3)
    {
        UILabel *titleLable = [[UILabel alloc] init];
        titleLable.numberOfLines = 0;
        titleLable.textAlignment = NSTextAlignmentLeft;
        titleLable.font = viewFont3;
        titleLable.textColor = fontColor;
        [cell.contentView addSubview:titleLable];
        titleLable.text = @"报销费用";
        
        [titleLable makeConstraints:^(MASConstraintMaker *make)
         {
             make.left.equalTo(cell.contentView).with.offset(15*APP_DELEGATE().autoSizeScaleX);
             make.size.equalTo(CGSizeMake(75*APP_DELEGATE().autoSizeScaleX,46*APP_DELEGATE().autoSizeScaleY));
         }];
        
        
        [cell.contentView addSubview:self.baoxiaofeiyongText];
        [self.baoxiaofeiyongText makeConstraints:^(MASConstraintMaker *make)
         {
             make.left.equalTo(titleLable.mas_right).with.offset(5*APP_DELEGATE().autoSizeScaleX);
             make.centerY.equalTo(cell.contentView.mas_centerY);
             make.size.equalTo(CGSizeMake(215*APP_DELEGATE().autoSizeScaleX,40*APP_DELEGATE().autoSizeScaleY));
         }];
    }
    else  if(indexPath.row==4)
    {
        UILabel *titleLable = [[UILabel alloc] init];
        titleLable.numberOfLines = 0;
        titleLable.textAlignment = NSTextAlignmentLeft;
        titleLable.font = viewFont3;
        titleLable.textColor = fontColor;
        [cell.contentView addSubview:titleLable];
        titleLable.text = @"报销申请人";
        
        [titleLable makeConstraints:^(MASConstraintMaker *make)
         {
             make.left.equalTo(cell.contentView).with.offset(15*APP_DELEGATE().autoSizeScaleX);
             make.size.equalTo(CGSizeMake(75*APP_DELEGATE().autoSizeScaleX,46*APP_DELEGATE().autoSizeScaleY));
         }];
        
        
        [cell.contentView addSubview:self.baoxiaoshenqingrenText];
        [self.baoxiaoshenqingrenText makeConstraints:^(MASConstraintMaker *make)
         {
             make.left.equalTo(titleLable.mas_right).with.offset(5*APP_DELEGATE().autoSizeScaleX);
             make.centerY.equalTo(cell.contentView.mas_centerY);
             make.size.equalTo(CGSizeMake(215*APP_DELEGATE().autoSizeScaleX,40*APP_DELEGATE().autoSizeScaleY));
         }];
    }
    else  if(indexPath.row==5)
    {
        UILabel *titleLable = [[UILabel alloc] init];
        titleLable.numberOfLines = 0;
        titleLable.textAlignment = NSTextAlignmentLeft;
        titleLable.font = viewFont3;
        titleLable.textColor = fontColor;
        [cell.contentView addSubview:titleLable];
        titleLable.text = @"加盟商名称";
        
        [titleLable makeConstraints:^(MASConstraintMaker *make)
         {
             make.left.equalTo(cell.contentView).with.offset(15*APP_DELEGATE().autoSizeScaleX);
             make.size.equalTo(CGSizeMake(75*APP_DELEGATE().autoSizeScaleX,46*APP_DELEGATE().autoSizeScaleY));
         }];
        
        
        [cell.contentView addSubview:self.jiamengshangmingchenText];
        [self.jiamengshangmingchenText makeConstraints:^(MASConstraintMaker *make)
         {
             make.left.equalTo(titleLable.mas_right).with.offset(5*APP_DELEGATE().autoSizeScaleX);
             make.centerY.equalTo(cell.contentView.mas_centerY);
             make.size.equalTo(CGSizeMake(215*APP_DELEGATE().autoSizeScaleX,40*APP_DELEGATE().autoSizeScaleY));
         }];
    }
    else  if(indexPath.row==6)
    {
        UILabel *titleLable = [[UILabel alloc] init];
        titleLable.numberOfLines = 0;
        titleLable.textAlignment = NSTextAlignmentLeft;
        titleLable.font = viewFont3;
        titleLable.textColor = fontColor;
        [cell.contentView addSubview:titleLable];
        titleLable.text = @"网点名称";
        
        [titleLable makeConstraints:^(MASConstraintMaker *make)
         {
             make.left.equalTo(cell.contentView).with.offset(15*APP_DELEGATE().autoSizeScaleX);
             make.size.equalTo(CGSizeMake(75*APP_DELEGATE().autoSizeScaleX,46*APP_DELEGATE().autoSizeScaleY));
         }];
        
        
        [cell.contentView addSubview:self.wangdianmingchengText];
        [self.wangdianmingchengText makeConstraints:^(MASConstraintMaker *make)
         {
             make.left.equalTo(titleLable.mas_right).with.offset(5*APP_DELEGATE().autoSizeScaleX);
             make.centerY.equalTo(cell.contentView.mas_centerY);
             make.size.equalTo(CGSizeMake(215*APP_DELEGATE().autoSizeScaleX,40*APP_DELEGATE().autoSizeScaleY));
         }];
    }
    else  if(indexPath.row==7)
    {
        UILabel *titleLable = [[UILabel alloc] init];
        titleLable.numberOfLines = 0;
        titleLable.textAlignment = NSTextAlignmentLeft;
        titleLable.font = viewFont3;
        titleLable.textColor = fontColor;
        [cell.contentView addSubview:titleLable];
        titleLable.text = @"绑定运单编号";
        
        [titleLable makeConstraints:^(MASConstraintMaker *make)
         {
             make.left.equalTo(cell.contentView).with.offset(15*APP_DELEGATE().autoSizeScaleX);
             make.size.equalTo(CGSizeMake(75*APP_DELEGATE().autoSizeScaleX,46*APP_DELEGATE().autoSizeScaleY));
         }];
        
        
        [cell.contentView addSubview:self.bangdingyundanbianhaoText];
        [self.bangdingyundanbianhaoText makeConstraints:^(MASConstraintMaker *make)
         {
             make.left.equalTo(titleLable.mas_right).with.offset(5*APP_DELEGATE().autoSizeScaleX);
             make.centerY.equalTo(cell.contentView.mas_centerY);
             make.size.equalTo(CGSizeMake(215*APP_DELEGATE().autoSizeScaleX,40*APP_DELEGATE().autoSizeScaleY));
         }];
    }
    else  if(indexPath.row==8)
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
             make.size.equalTo(CGSizeMake(75*APP_DELEGATE().autoSizeScaleX,46*APP_DELEGATE().autoSizeScaleY));
         }];
        
        
        [cell.contentView addSubview:self.beizhuText];
        [self.beizhuText makeConstraints:^(MASConstraintMaker *make)
         {
             make.left.equalTo(titleLable.mas_right).with.offset(5*APP_DELEGATE().autoSizeScaleX);
             make.centerY.equalTo(cell.contentView.mas_centerY);
             make.size.equalTo(CGSizeMake(215*APP_DELEGATE().autoSizeScaleX,40*APP_DELEGATE().autoSizeScaleY));
         }];
    }
    else  if(indexPath.row==9)
    {
        UILabel *titleLable = [[UILabel alloc] init];
        titleLable.numberOfLines = 0;
        titleLable.textAlignment = NSTextAlignmentLeft;
        titleLable.font = viewFont3;
        titleLable.textColor = fontColor;
        [cell.contentView addSubview:titleLable];
        titleLable.text = @"图片凭证";
        
        [titleLable makeConstraints:^(MASConstraintMaker *make)
         {
             make.left.equalTo(cell.contentView).with.offset(15*APP_DELEGATE().autoSizeScaleX);
             make.size.equalTo(CGSizeMake(75*APP_DELEGATE().autoSizeScaleX,46*APP_DELEGATE().autoSizeScaleY));
         }];
        
        UIImageView *tupianView = [[UIImageView alloc] init];
        tupianView.image = [UIImage imageNamed:@"zhuye_banner1"];
        
        [cell.contentView addSubview:tupianView];
        
        [tupianView makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(titleLable.mas_right).with.offset(5*APP_DELEGATE().autoSizeScaleX);
            make.centerY.equalTo(cell.contentView.mas_centerY);
            make.size.equalTo(CGSizeMake(40*APP_DELEGATE().autoSizeScaleX,40*APP_DELEGATE().autoSizeScaleY));
        }];

    }
    else if(indexPath.row==10)
    {
        cell.accessoryType = UITableViewCellAccessoryNone;
        cell.contentView.backgroundColor = bgViewColor;
        UIButton *noBtn = [[UIButton alloc] init];
        [noBtn setTitle:@"未通过" forState:UIControlStateNormal];
        [noBtn setTitle:@"未通过" forState:UIControlStateHighlighted];
        [noBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        //        [submitBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        [noBtn setBackgroundImage:[UIImage imageWithColor:fontOrangeColor] forState:UIControlStateNormal];
        //        [submitBtn setBackgroundImage:[UIImage imageWithColor:lvColor] forState:UIControlStateHighlighted];
        [noBtn addTarget:self
                      action:@selector(noBtnClick:)
            forControlEvents:UIControlEventTouchUpInside];
        noBtn.titleLabel.font = viewFont1;
        [cell.contentView addSubview:noBtn];
        
        [noBtn makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(cell.contentView.mas_centerY);
            make.left.equalTo(cell.contentView).with.offset(10*APP_DELEGATE().autoSizeScaleX);
            make.size.equalTo(CGSizeMake(145*APP_DELEGATE().autoSizeScaleX, 40*APP_DELEGATE().autoSizeScaleY));
        }];
        LRViewBorderRadius(noBtn, 5, 1, fontOrangeColor);
        
        cell.accessoryType = UITableViewCellAccessoryNone;
        cell.contentView.backgroundColor = bgViewColor;
        UIButton *submitBtn = [[UIButton alloc] init];
        [submitBtn setTitle:@"提交" forState:UIControlStateNormal];
        [submitBtn setTitle:@"提交" forState:UIControlStateHighlighted];
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
            make.left.equalTo(noBtn.mas_right).with.offset(5*APP_DELEGATE().autoSizeScaleX);
            make.size.equalTo(CGSizeMake(145*APP_DELEGATE().autoSizeScaleX, 40*APP_DELEGATE().autoSizeScaleY));
        }];
        LRViewBorderRadius(submitBtn, 5, 1, lvColor);
        
    }
    return cell;
    
}

- (void)noBtnClick:(UIButton *)sender
{
    NSLog(@"没通过");
}

- (void)submitBtnClick:(UIButton *)sender
{
    NSLog(@"通过");
}
@end
