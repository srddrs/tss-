//
//  AddSendCarViewController.m
//  tss
//
//  Created by admin on 17/2/17.
//  Copyright © 2017年 com.yunlaila. All rights reserved.
//

#import "AddSendCarViewController.h"

@interface AddSendCarViewController ()<UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate>
{
    
}
@property (nonatomic ,strong) UITableView *tableView;
@property (nonatomic, strong) UIButton *shifaButton;  //始发站
@property (nonatomic, strong) UIButton *mudiButton;  //目的站

@property (nonatomic, strong) UITextField *wangdianText;  //网点
@property (nonatomic, strong) UITextField *chepaiText;  //车牌号
@property (nonatomic, strong) UITextField *sijiText;  //司机
@property (nonatomic, strong) UITextField *dianhuaText;  //电话
@property (nonatomic, strong) UITextField *yunfeiText;  //运费
@property (nonatomic, strong) UITextField *zongbaojiaText;  //总报价
@property (nonatomic, strong) UITextField *hetongText;  //合同打印
@property (nonatomic, strong) UITextField *zhuangzaiwangdianText;  //装载网点
@property (nonatomic, strong) UITextField *zhuangzairenyuanText;  //装在人员
@end

@implementation AddSendCarViewController
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
    self.title = @"登记派车";
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

- (UIButton *)shifaButton
{
    if(!_shifaButton)
    {
        _shifaButton = [[UIButton alloc] init];
        [_shifaButton setTitle:@"请选择始发站" forState:UIControlStateNormal];
        [_shifaButton setTitle:@"请选择始发站" forState:UIControlStateHighlighted];
        [_shifaButton setTitleColor:fontHuiColor forState:UIControlStateNormal];
        [_shifaButton setTitleColor:fontHuiColor forState:UIControlStateHighlighted];
        [_shifaButton addTarget:self
                         action:@selector(shifaButtonClick:)
               forControlEvents:UIControlEventTouchUpInside];
        _shifaButton.titleLabel.font = viewFont3;
    }
    return _shifaButton;
}

- (UIButton *)mudiButton
{
    if(!_mudiButton)
    {
        _mudiButton = [[UIButton alloc] init];
        [_mudiButton setTitle:@"请选择目的站" forState:UIControlStateNormal];
        [_mudiButton setTitle:@"请选择目的站" forState:UIControlStateHighlighted];
        [_mudiButton setTitleColor:fontHuiColor forState:UIControlStateNormal];
        [_mudiButton setTitleColor:fontHuiColor forState:UIControlStateHighlighted];
        [_mudiButton addTarget:self
                         action:@selector(mudiButtonClick:)
               forControlEvents:UIControlEventTouchUpInside];
        _mudiButton.titleLabel.font = viewFont3;

    }
    return _mudiButton;
}

- (UITextField *)wangdianText
{
    if (!_wangdianText)
    {
        
        _wangdianText = [[UITextField alloc] init];
        _wangdianText.backgroundColor = [UIColor whiteColor];
        _wangdianText.clearButtonMode = UITextFieldViewModeWhileEditing;
        _wangdianText.borderStyle = UITextBorderStyleNone;
        _wangdianText.delegate = self;
        _wangdianText.placeholder = @"选择网点";
        _wangdianText.returnKeyType = UIReturnKeyDone;
        _wangdianText.keyboardType = UIKeyboardTypeDefault;
        _wangdianText.font = viewFont3;
        _wangdianText.textColor = lvColor;
        _wangdianText.enabled = NO;
    }
    return _wangdianText;
}

- (UITextField *)chepaiText
{
    if (!_chepaiText)
    {
        
        _chepaiText = [[UITextField alloc] init];
        _chepaiText.backgroundColor = [UIColor whiteColor];
        _chepaiText.clearButtonMode = UITextFieldViewModeWhileEditing;
        _chepaiText.borderStyle = UITextBorderStyleNone;
        _chepaiText.delegate = self;
        _chepaiText.placeholder = @"请选择";
        _chepaiText.returnKeyType = UIReturnKeyDone;
        _chepaiText.keyboardType = UIKeyboardTypeDefault;
        _chepaiText.font = viewFont3;
        _chepaiText.textColor = lvColor;
        _chepaiText.enabled = NO;
    }
    return _chepaiText;
}

- (UITextField *)sijiText
{
    if (!_sijiText)
    {
        _sijiText = [[UITextField alloc] init];
        _sijiText.backgroundColor = [UIColor whiteColor];
        _sijiText.clearButtonMode = UITextFieldViewModeWhileEditing;
        _sijiText.borderStyle = UITextBorderStyleNone;
        _sijiText.delegate = self;
        _sijiText.placeholder = @"请选择";
        _sijiText.returnKeyType = UIReturnKeyDone;
        _sijiText.keyboardType = UIKeyboardTypeDefault;
        _sijiText.font = viewFont3;
        _sijiText.textColor = lvColor;
        _sijiText.enabled = NO;
    }
    return _sijiText;
}

- (UITextField *)dianhuaText
{
    if (!_dianhuaText)
    {
        _dianhuaText = [[UITextField alloc] init];
        _dianhuaText.backgroundColor = [UIColor whiteColor];
        _dianhuaText.clearButtonMode = UITextFieldViewModeWhileEditing;
        _dianhuaText.borderStyle = UITextBorderStyleNone;
        _dianhuaText.delegate = self;
        _dianhuaText.placeholder = @"请输入电话";
        _dianhuaText.returnKeyType = UIReturnKeyDone;
        _dianhuaText.keyboardType = UIKeyboardTypeDefault;
        _dianhuaText.font = viewFont3;
        _dianhuaText.textColor = lvColor;
//        _dianhuaText.enabled = NO;
    }
    return _dianhuaText;
}

- (UITextField *)yunfeiText
{
    if (!_yunfeiText)
    {
        _yunfeiText = [[UITextField alloc] init];
        _yunfeiText.backgroundColor = [UIColor whiteColor];
        _yunfeiText.clearButtonMode = UITextFieldViewModeWhileEditing;
        _yunfeiText.borderStyle = UITextBorderStyleNone;
        _yunfeiText.delegate = self;
        _yunfeiText.placeholder = @"请输入运费";
        _yunfeiText.returnKeyType = UIReturnKeyDone;
        _yunfeiText.keyboardType = UIKeyboardTypeDefault;
        _yunfeiText.font = viewFont3;
        _yunfeiText.textColor = lvColor;
//        _yunfeiText.enabled = NO;
    }
    return _yunfeiText;
}

- (UITextField *)zongbaojiaText
{
    if (!_zongbaojiaText)
    {
        _zongbaojiaText = [[UITextField alloc] init];
        _zongbaojiaText.backgroundColor = [UIColor whiteColor];
        _zongbaojiaText.clearButtonMode = UITextFieldViewModeWhileEditing;
        _zongbaojiaText.borderStyle = UITextBorderStyleNone;
        _zongbaojiaText.delegate = self;
        _zongbaojiaText.placeholder = @"请输入保价";
        _zongbaojiaText.returnKeyType = UIReturnKeyDone;
        _zongbaojiaText.keyboardType = UIKeyboardTypeDefault;
        _zongbaojiaText.font = viewFont3;
        _zongbaojiaText.textColor = lvColor;
//        _zongbaojiaText.enabled = NO;
    }
    return _zongbaojiaText;
}

- (UITextField *)hetongText
{
    if (!_hetongText)
    {
        _hetongText = [[UITextField alloc] init];
        _hetongText.backgroundColor = [UIColor whiteColor];
        _hetongText.clearButtonMode = UITextFieldViewModeWhileEditing;
        _hetongText.borderStyle = UITextBorderStyleNone;
        _hetongText.delegate = self;
        _hetongText.placeholder = @"请输入打印次数";
        _hetongText.returnKeyType = UIReturnKeyDone;
        _hetongText.keyboardType = UIKeyboardTypeDefault;
        _hetongText.font = viewFont3;
        _hetongText.textColor = lvColor;
//        _hetongText.enabled = NO;
    }
    return _hetongText;
}

- (UITextField *)zhuangzaiwangdianText
{
    if (!_zhuangzaiwangdianText)
    {
        _zhuangzaiwangdianText = [[UITextField alloc] init];
        _zhuangzaiwangdianText.backgroundColor = [UIColor whiteColor];
        _zhuangzaiwangdianText.clearButtonMode = UITextFieldViewModeWhileEditing;
        _zhuangzaiwangdianText.borderStyle = UITextBorderStyleNone;
        _zhuangzaiwangdianText.delegate = self;
        _zhuangzaiwangdianText.placeholder = @"选择装载网点";
        _zhuangzaiwangdianText.returnKeyType = UIReturnKeyDone;
        _zhuangzaiwangdianText.keyboardType = UIKeyboardTypeDefault;
        _zhuangzaiwangdianText.font = viewFont3;
        _zhuangzaiwangdianText.textColor = lvColor;
        _zhuangzaiwangdianText.enabled = NO;
    }
    return _zhuangzaiwangdianText;
}

- (UITextField *)zhuangzairenyuanText
{
    if (!_zhuangzairenyuanText)
    {
        _zhuangzairenyuanText = [[UITextField alloc] init];
        _zhuangzairenyuanText.backgroundColor = [UIColor whiteColor];
        _zhuangzairenyuanText.clearButtonMode = UITextFieldViewModeWhileEditing;
        _zhuangzairenyuanText.borderStyle = UITextBorderStyleNone;
        _zhuangzairenyuanText.delegate = self;
        _zhuangzairenyuanText.placeholder = @"选择装载人员";
        _zhuangzairenyuanText.returnKeyType = UIReturnKeyDone;
        _zhuangzairenyuanText.keyboardType = UIKeyboardTypeDefault;
        _zhuangzairenyuanText.font = viewFont3;
        _zhuangzairenyuanText.textColor = lvColor;
        _zhuangzairenyuanText.enabled = NO;
    }
    return _zhuangzairenyuanText;
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
    if(indexPath.row==0)
    {
        return 60*APP_DELEGATE().autoSizeScaleY;
    }
    else if(indexPath.row==10)
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
    if (indexPath.row==0)
    {
        cell.accessoryType = UITableViewCellAccessoryNone;
        
        UIImageView *icon1 = [[UIImageView alloc] init];
        icon1.image = [UIImage imageNamed:@"djpc_luxian"];
        [cell.contentView addSubview:icon1];
        [icon1 makeConstraints:^(MASConstraintMaker *make)
         {
             make.centerX.equalTo(cell.contentView.mas_centerX);
             make.centerY.equalTo(cell.contentView.mas_centerY);
             make.size.equalTo(CGSizeMake(30*APP_DELEGATE().autoSizeScaleY,30*APP_DELEGATE().autoSizeScaleY));
         }];
        
        UILabel *titleLable1 = [[UILabel alloc] init];
        titleLable1.numberOfLines = 0;
        titleLable1.textAlignment = NSTextAlignmentCenter;
        titleLable1.font = viewFont3;
        titleLable1.textColor = fontColor;
        [cell.contentView addSubview:titleLable1];
        titleLable1.text = @"始发站";
        
        [titleLable1 makeConstraints:^(MASConstraintMaker *make)
         {
             make.left.equalTo(cell.contentView).with.offset(0*APP_DELEGATE().autoSizeScaleX);
             make.top.equalTo(cell.contentView.mas_centerY).with.offset(-20);
             make.size.equalTo(CGSizeMake(145*APP_DELEGATE().autoSizeScaleX,21*APP_DELEGATE().autoSizeScaleY));
         }];
        
        [cell.contentView addSubview:self.shifaButton];
        [self.shifaButton makeConstraints:^(MASConstraintMaker *make)
         {
             make.left.equalTo(cell.contentView).with.offset(0*APP_DELEGATE().autoSizeScaleX);
            make.top.equalTo(cell.contentView.mas_centerY).with.offset(0);
             make.size.equalTo(CGSizeMake(145*APP_DELEGATE().autoSizeScaleX,21*APP_DELEGATE().autoSizeScaleY));
         }];
        
        UILabel *titleLable2 = [[UILabel alloc] init];
        titleLable2.numberOfLines = 0;
        titleLable2.textAlignment = NSTextAlignmentCenter;
        titleLable2.font = viewFont3;
        titleLable2.textColor = fontColor;
        [cell.contentView addSubview:titleLable2];
        titleLable2.text = @"目的站";
        
        [titleLable2 makeConstraints:^(MASConstraintMaker *make)
         {
             make.left.equalTo(cell.contentView).with.offset(175*APP_DELEGATE().autoSizeScaleX);
            make.top.equalTo(cell.contentView.mas_centerY).with.offset(-20);
             make.size.equalTo(CGSizeMake(145*APP_DELEGATE().autoSizeScaleX,21*APP_DELEGATE().autoSizeScaleY));
         }];
        
        [cell.contentView addSubview:self.mudiButton];
        [self.mudiButton makeConstraints:^(MASConstraintMaker *make)
         {
             make.left.equalTo(cell.contentView).with.offset(175*APP_DELEGATE().autoSizeScaleX);
             make.top.equalTo(cell.contentView.mas_centerY).with.offset(0);
             make.size.equalTo(CGSizeMake(145*APP_DELEGATE().autoSizeScaleX,21*APP_DELEGATE().autoSizeScaleY));
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
        titleLable.text = @"网点";
        
        [titleLable makeConstraints:^(MASConstraintMaker *make)
         {
             make.left.equalTo(cell.contentView).with.offset(15*APP_DELEGATE().autoSizeScaleX);
             make.size.equalTo(CGSizeMake(55*APP_DELEGATE().autoSizeScaleX,46*APP_DELEGATE().autoSizeScaleY));
         }];

        
        [cell.contentView addSubview:self.wangdianText];
        [self.wangdianText makeConstraints:^(MASConstraintMaker *make)
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
        titleLable.text = @"车牌号";
        
        [titleLable makeConstraints:^(MASConstraintMaker *make)
         {
             make.left.equalTo(cell.contentView).with.offset(15*APP_DELEGATE().autoSizeScaleX);
             make.size.equalTo(CGSizeMake(55*APP_DELEGATE().autoSizeScaleX,46*APP_DELEGATE().autoSizeScaleY));
         }];
        
        
        [cell.contentView addSubview:self.chepaiText];
        [self.chepaiText makeConstraints:^(MASConstraintMaker *make)
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
        titleLable.text = @"司机";
        
        [titleLable makeConstraints:^(MASConstraintMaker *make)
         {
             make.left.equalTo(cell.contentView).with.offset(15*APP_DELEGATE().autoSizeScaleX);
             make.size.equalTo(CGSizeMake(55*APP_DELEGATE().autoSizeScaleX,46*APP_DELEGATE().autoSizeScaleY));
         }];
        
        
        [cell.contentView addSubview:self.sijiText];
        [self.sijiText makeConstraints:^(MASConstraintMaker *make)
         {
             make.left.equalTo(titleLable.mas_right).with.offset(5*APP_DELEGATE().autoSizeScaleX);
             make.centerY.equalTo(cell.contentView.mas_centerY);
             make.size.equalTo(CGSizeMake(215*APP_DELEGATE().autoSizeScaleX,40*APP_DELEGATE().autoSizeScaleY));
         }];
        
    }
    else if(indexPath.row==4)
    {
          cell.accessoryType = UITableViewCellAccessoryNone;
        UILabel *titleLable = [[UILabel alloc] init];
        titleLable.numberOfLines = 0;
        titleLable.textAlignment = NSTextAlignmentLeft;
        titleLable.font = viewFont3;
        titleLable.textColor = fontColor;
        [cell.contentView addSubview:titleLable];
        titleLable.text = @"电话";
        
        [titleLable makeConstraints:^(MASConstraintMaker *make)
         {
             make.left.equalTo(cell.contentView).with.offset(15*APP_DELEGATE().autoSizeScaleX);
             make.size.equalTo(CGSizeMake(55*APP_DELEGATE().autoSizeScaleX,46*APP_DELEGATE().autoSizeScaleY));
         }];
        
        
        [cell.contentView addSubview:self.dianhuaText];
        [self.dianhuaText makeConstraints:^(MASConstraintMaker *make)
         {
             make.left.equalTo(titleLable.mas_right).with.offset(5*APP_DELEGATE().autoSizeScaleX);
             make.centerY.equalTo(cell.contentView.mas_centerY);
             make.size.equalTo(CGSizeMake(215*APP_DELEGATE().autoSizeScaleX,40*APP_DELEGATE().autoSizeScaleY));
         }];
    }
    else if(indexPath.row==5)
    {
          cell.accessoryType = UITableViewCellAccessoryNone;
        UILabel *titleLable = [[UILabel alloc] init];
        titleLable.numberOfLines = 0;
        titleLable.textAlignment = NSTextAlignmentLeft;
        titleLable.font = viewFont3;
        titleLable.textColor = fontColor;
        [cell.contentView addSubview:titleLable];
        titleLable.text = @"运费";
        
        [titleLable makeConstraints:^(MASConstraintMaker *make)
         {
             make.left.equalTo(cell.contentView).with.offset(15*APP_DELEGATE().autoSizeScaleX);
             make.size.equalTo(CGSizeMake(55*APP_DELEGATE().autoSizeScaleX,46*APP_DELEGATE().autoSizeScaleY));
         }];
        
        
        [cell.contentView addSubview:self.yunfeiText];
        [self.yunfeiText makeConstraints:^(MASConstraintMaker *make)
         {
             make.left.equalTo(titleLable.mas_right).with.offset(5*APP_DELEGATE().autoSizeScaleX);
             make.centerY.equalTo(cell.contentView.mas_centerY);
             make.size.equalTo(CGSizeMake(215*APP_DELEGATE().autoSizeScaleX,40*APP_DELEGATE().autoSizeScaleY));
         }];
    }
    else if(indexPath.row==6)
    {
          cell.accessoryType = UITableViewCellAccessoryNone;
        UILabel *titleLable = [[UILabel alloc] init];
        titleLable.numberOfLines = 0;
        titleLable.textAlignment = NSTextAlignmentLeft;
        titleLable.font = viewFont3;
        titleLable.textColor = fontColor;
        [cell.contentView addSubview:titleLable];
        titleLable.text = @"总保价";
        
        [titleLable makeConstraints:^(MASConstraintMaker *make)
         {
             make.left.equalTo(cell.contentView).with.offset(15*APP_DELEGATE().autoSizeScaleX);
             make.size.equalTo(CGSizeMake(55*APP_DELEGATE().autoSizeScaleX,46*APP_DELEGATE().autoSizeScaleY));
         }];
        
        
        [cell.contentView addSubview:self.zongbaojiaText];
        [self.zongbaojiaText makeConstraints:^(MASConstraintMaker *make)
         {
             make.left.equalTo(titleLable.mas_right).with.offset(5*APP_DELEGATE().autoSizeScaleX);
             make.centerY.equalTo(cell.contentView.mas_centerY);
             make.size.equalTo(CGSizeMake(215*APP_DELEGATE().autoSizeScaleX,40*APP_DELEGATE().autoSizeScaleY));
         }];
    }
    else if(indexPath.row==7)
    {
          cell.accessoryType = UITableViewCellAccessoryNone;
        UILabel *titleLable = [[UILabel alloc] init];
        titleLable.numberOfLines = 0;
        titleLable.textAlignment = NSTextAlignmentLeft;
        titleLable.font = viewFont3;
        titleLable.textColor = fontColor;
        [cell.contentView addSubview:titleLable];
        titleLable.text = @"合同打印";
        
        [titleLable makeConstraints:^(MASConstraintMaker *make)
         {
             make.left.equalTo(cell.contentView).with.offset(15*APP_DELEGATE().autoSizeScaleX);
             make.size.equalTo(CGSizeMake(55*APP_DELEGATE().autoSizeScaleX,46*APP_DELEGATE().autoSizeScaleY));
         }];
        
        
        [cell.contentView addSubview:self.hetongText];
        [self.hetongText makeConstraints:^(MASConstraintMaker *make)
         {
             make.left.equalTo(titleLable.mas_right).with.offset(5*APP_DELEGATE().autoSizeScaleX);
             make.centerY.equalTo(cell.contentView.mas_centerY);
             make.size.equalTo(CGSizeMake(215*APP_DELEGATE().autoSizeScaleX,40*APP_DELEGATE().autoSizeScaleY));
         }];
    }
    else if(indexPath.row==8)
    {
        UILabel *titleLable = [[UILabel alloc] init];
        titleLable.numberOfLines = 0;
        titleLable.textAlignment = NSTextAlignmentLeft;
        titleLable.font = viewFont3;
        titleLable.textColor = fontColor;
        [cell.contentView addSubview:titleLable];
        titleLable.text = @"装载网点";
        
        [titleLable makeConstraints:^(MASConstraintMaker *make)
         {
             make.left.equalTo(cell.contentView).with.offset(15*APP_DELEGATE().autoSizeScaleX);
             make.size.equalTo(CGSizeMake(55*APP_DELEGATE().autoSizeScaleX,46*APP_DELEGATE().autoSizeScaleY));
         }];
        
        
        [cell.contentView addSubview:self.zhuangzaiwangdianText];
        [self.zhuangzaiwangdianText makeConstraints:^(MASConstraintMaker *make)
         {
             make.left.equalTo(titleLable.mas_right).with.offset(5*APP_DELEGATE().autoSizeScaleX);
             make.centerY.equalTo(cell.contentView.mas_centerY);
             make.size.equalTo(CGSizeMake(215*APP_DELEGATE().autoSizeScaleX,40*APP_DELEGATE().autoSizeScaleY));
         }];
    }
    else if(indexPath.row==9)
    {
        UILabel *titleLable = [[UILabel alloc] init];
        titleLable.numberOfLines = 0;
        titleLable.textAlignment = NSTextAlignmentLeft;
        titleLable.font = viewFont3;
        titleLable.textColor = fontColor;
        [cell.contentView addSubview:titleLable];
        titleLable.text = @"装载人员";
        
        [titleLable makeConstraints:^(MASConstraintMaker *make)
         {
             make.left.equalTo(cell.contentView).with.offset(15*APP_DELEGATE().autoSizeScaleX);
             make.size.equalTo(CGSizeMake(55*APP_DELEGATE().autoSizeScaleX,46*APP_DELEGATE().autoSizeScaleY));
         }];
        
        
        [cell.contentView addSubview:self.zhuangzairenyuanText];
        [self.zhuangzairenyuanText makeConstraints:^(MASConstraintMaker *make)
         {
             make.left.equalTo(titleLable.mas_right).with.offset(5*APP_DELEGATE().autoSizeScaleX);
             make.centerY.equalTo(cell.contentView.mas_centerY);
             make.size.equalTo(CGSizeMake(215*APP_DELEGATE().autoSizeScaleX,40*APP_DELEGATE().autoSizeScaleY));
         }];
    }
    else if(indexPath.row==10)
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

- (void)shifaButtonClick:(UIButton *)sender
{
    NSLog(@"始发站");
}

- (void)mudiButtonClick:(UIButton *)sender
{
    NSLog(@"目的站");
}

- (void)submitBtnClick:(UIButton *)sender
{
    NSLog(@"保存");
}
@end
