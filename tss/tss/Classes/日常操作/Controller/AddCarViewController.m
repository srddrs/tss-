//
//  AddCarViewController.m
//  tss
//
//  Created by admin on 17/2/17.
//  Copyright © 2017年 com.yunlaila. All rights reserved.
//

#import "AddCarViewController.h"

@interface AddCarViewController ()<UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate>
{
    
}
@property (nonatomic ,strong) UITableView *tableView;

@property (nonatomic, strong) UITextField *chepaihaoText;  //车牌号
@property (nonatomic, strong) UITextField *cheliangpinpaiText;  //车辆品牌
@property (nonatomic, strong) UITextField *chezhuText;  //车主
@property (nonatomic, strong) UITextField *chezhudianhuaText;  //车主电话
@property (nonatomic, strong) UITextField *changduText;  //长度
@property (nonatomic, strong) UITextField *kuanduText;  //宽度
@property (nonatomic, strong) UITextField *sijixingmingText;  //司机姓名
@property (nonatomic, strong) UITextField *sijidianhuaText;  //司机电话
@property (nonatomic, strong) UITextField *kaihuhangText;  //开户行
@property (nonatomic, strong) UITextField *yinhangkahaoText;  //银行卡号
@end

@implementation AddCarViewController
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
    self.title = @"添加车辆信息";
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
    }
    return _chepaihaoText;
}

- (UITextField *)cheliangpinpaiText
{
    if (!_cheliangpinpaiText)
    {
        
        _cheliangpinpaiText = [[UITextField alloc] init];
        _cheliangpinpaiText.backgroundColor = [UIColor whiteColor];
        _cheliangpinpaiText.clearButtonMode = UITextFieldViewModeWhileEditing;
        _cheliangpinpaiText.borderStyle = UITextBorderStyleNone;
        _cheliangpinpaiText.delegate = self;
        _cheliangpinpaiText.placeholder = @"输入品牌";
        _cheliangpinpaiText.returnKeyType = UIReturnKeyDone;
        _cheliangpinpaiText.keyboardType = UIKeyboardTypeDefault;
        _cheliangpinpaiText.font = viewFont3;
        _cheliangpinpaiText.textColor = lvColor;
    }
    return _cheliangpinpaiText;
}

- (UITextField *)chezhuText
{
    if (!_chezhuText)
    {
        
        _chezhuText = [[UITextField alloc] init];
        _chezhuText.backgroundColor = [UIColor whiteColor];
        _chezhuText.clearButtonMode = UITextFieldViewModeWhileEditing;
        _chezhuText.borderStyle = UITextBorderStyleNone;
        _chezhuText.delegate = self;
        _chezhuText.placeholder = @"请输入姓名";
        _chezhuText.returnKeyType = UIReturnKeyDone;
        _chezhuText.keyboardType = UIKeyboardTypeDefault;
        _chezhuText.font = viewFont3;
        _chezhuText.textColor = lvColor;
    }
    return _chezhuText;
}

- (UITextField *)chezhudianhuaText
{
    if (!_chezhudianhuaText)
    {
        
        _chezhudianhuaText = [[UITextField alloc] init];
        _chezhudianhuaText.backgroundColor = [UIColor whiteColor];
        _chezhudianhuaText.clearButtonMode = UITextFieldViewModeWhileEditing;
        _chezhudianhuaText.borderStyle = UITextBorderStyleNone;
        _chezhudianhuaText.delegate = self;
        _chezhudianhuaText.placeholder = @"请输入电话";
        _chezhudianhuaText.returnKeyType = UIReturnKeyDone;
        _chezhudianhuaText.keyboardType = UIKeyboardTypeDefault;
        _chezhudianhuaText.font = viewFont3;
        _chezhudianhuaText.textColor = lvColor;
    }
    return _chezhudianhuaText;
}

- (UITextField *)changduText
{
    if (!_changduText)
    {
        
        _changduText = [[UITextField alloc] init];
        _changduText.backgroundColor = [UIColor whiteColor];
        _changduText.clearButtonMode = UITextFieldViewModeWhileEditing;
        _changduText.borderStyle = UITextBorderStyleNone;
        _changduText.delegate = self;
        _changduText.placeholder = @"请输入长度";
        _changduText.returnKeyType = UIReturnKeyDone;
        _changduText.keyboardType = UIKeyboardTypeDefault;
        _changduText.font = viewFont3;
        _changduText.textColor = lvColor;
    }
    return _changduText;
}

- (UITextField *)kuanduText
{
    if (!_kuanduText)
    {
        
        _kuanduText = [[UITextField alloc] init];
        _kuanduText.backgroundColor = [UIColor whiteColor];
        _kuanduText.clearButtonMode = UITextFieldViewModeWhileEditing;
        _kuanduText.borderStyle = UITextBorderStyleNone;
        _kuanduText.delegate = self;
        _kuanduText.placeholder = @"请输入宽度";
        _kuanduText.returnKeyType = UIReturnKeyDone;
        _kuanduText.keyboardType = UIKeyboardTypeDefault;
        _kuanduText.font = viewFont3;
        _kuanduText.textColor = lvColor;
    }
    return _kuanduText;
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
        _sijixingmingText.placeholder = @"请输入司机姓名";
        _sijixingmingText.returnKeyType = UIReturnKeyDone;
        _sijixingmingText.keyboardType = UIKeyboardTypeDefault;
        _sijixingmingText.font = viewFont3;
        _sijixingmingText.textColor = lvColor;
    }
    return _sijixingmingText;
}


- (UITextField *)sijidianhuaText
{
    if (!_sijidianhuaText)
    {
        
        _sijidianhuaText = [[UITextField alloc] init];
        _sijidianhuaText.backgroundColor = [UIColor whiteColor];
        _sijidianhuaText.clearButtonMode = UITextFieldViewModeWhileEditing;
        _sijidianhuaText.borderStyle = UITextBorderStyleNone;
        _sijidianhuaText.delegate = self;
        _sijidianhuaText.placeholder = @"请输入司机电话";
        _sijidianhuaText.returnKeyType = UIReturnKeyDone;
        _sijidianhuaText.keyboardType = UIKeyboardTypeDefault;
        _sijidianhuaText.font = viewFont3;
        _sijidianhuaText.textColor = lvColor;
    }
    return _sijidianhuaText;
}



- (UITextField *)kaihuhangText
{
    if (!_kaihuhangText)
    {
        
        _kaihuhangText = [[UITextField alloc] init];
        _kaihuhangText.backgroundColor = [UIColor whiteColor];
        _kaihuhangText.clearButtonMode = UITextFieldViewModeWhileEditing;
        _kaihuhangText.borderStyle = UITextBorderStyleNone;
        _kaihuhangText.delegate = self;
        _kaihuhangText.placeholder = @"请输入开户行";
        _kaihuhangText.returnKeyType = UIReturnKeyDone;
        _kaihuhangText.keyboardType = UIKeyboardTypeDefault;
        _kaihuhangText.font = viewFont3;
        _kaihuhangText.textColor = lvColor;
    }
    return _kaihuhangText;
}


- (UITextField *)yinhangkahaoText
{
    if (!_yinhangkahaoText)
    {
        
        _yinhangkahaoText = [[UITextField alloc] init];
        _yinhangkahaoText.backgroundColor = [UIColor whiteColor];
        _yinhangkahaoText.clearButtonMode = UITextFieldViewModeWhileEditing;
        _yinhangkahaoText.borderStyle = UITextBorderStyleNone;
        _yinhangkahaoText.delegate = self;
        _yinhangkahaoText.placeholder = @"请输入银行卡号";
        _yinhangkahaoText.returnKeyType = UIReturnKeyDone;
        _yinhangkahaoText.keyboardType = UIKeyboardTypeDefault;
        _yinhangkahaoText.font = viewFont3;
        _yinhangkahaoText.textColor = lvColor;
    }
    return _yinhangkahaoText;
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
    if(indexPath.row==1)
    {
        UILabel *titleLable = [[UILabel alloc] init];
        titleLable.numberOfLines = 0;
        titleLable.textAlignment = NSTextAlignmentLeft;
        titleLable.font = viewFont3;
        titleLable.textColor = fontColor;
        [cell.contentView addSubview:titleLable];
        titleLable.text = @"车辆品牌";
        
        [titleLable makeConstraints:^(MASConstraintMaker *make)
         {
             make.left.equalTo(cell.contentView).with.offset(15*APP_DELEGATE().autoSizeScaleX);
             make.size.equalTo(CGSizeMake(55*APP_DELEGATE().autoSizeScaleX,46*APP_DELEGATE().autoSizeScaleY));
         }];
        
        
        [cell.contentView addSubview:self.cheliangpinpaiText];
        [self.cheliangpinpaiText makeConstraints:^(MASConstraintMaker *make)
         {
             make.left.equalTo(titleLable.mas_right).with.offset(5*APP_DELEGATE().autoSizeScaleX);
             make.centerY.equalTo(cell.contentView.mas_centerY);
             make.size.equalTo(CGSizeMake(215*APP_DELEGATE().autoSizeScaleX,40*APP_DELEGATE().autoSizeScaleY));
         }];
    }
    if(indexPath.row==2)
    {
        UILabel *titleLable = [[UILabel alloc] init];
        titleLable.numberOfLines = 0;
        titleLable.textAlignment = NSTextAlignmentLeft;
        titleLable.font = viewFont3;
        titleLable.textColor = fontColor;
        [cell.contentView addSubview:titleLable];
        titleLable.text = @"车主";
        
        [titleLable makeConstraints:^(MASConstraintMaker *make)
         {
             make.left.equalTo(cell.contentView).with.offset(15*APP_DELEGATE().autoSizeScaleX);
             make.size.equalTo(CGSizeMake(55*APP_DELEGATE().autoSizeScaleX,46*APP_DELEGATE().autoSizeScaleY));
         }];
        
        
        [cell.contentView addSubview:self.chezhuText];
        [self.chezhuText makeConstraints:^(MASConstraintMaker *make)
         {
             make.left.equalTo(titleLable.mas_right).with.offset(5*APP_DELEGATE().autoSizeScaleX);
             make.centerY.equalTo(cell.contentView.mas_centerY);
             make.size.equalTo(CGSizeMake(215*APP_DELEGATE().autoSizeScaleX,40*APP_DELEGATE().autoSizeScaleY));
         }];
    }
    if(indexPath.row==3)
    {
        UILabel *titleLable = [[UILabel alloc] init];
        titleLable.numberOfLines = 0;
        titleLable.textAlignment = NSTextAlignmentLeft;
        titleLable.font = viewFont3;
        titleLable.textColor = fontColor;
        [cell.contentView addSubview:titleLable];
        titleLable.text = @"车主电话";
        
        [titleLable makeConstraints:^(MASConstraintMaker *make)
         {
             make.left.equalTo(cell.contentView).with.offset(15*APP_DELEGATE().autoSizeScaleX);
             make.size.equalTo(CGSizeMake(55*APP_DELEGATE().autoSizeScaleX,46*APP_DELEGATE().autoSizeScaleY));
         }];
        
        
        [cell.contentView addSubview:self.chezhudianhuaText];
        [self.chezhudianhuaText makeConstraints:^(MASConstraintMaker *make)
         {
             make.left.equalTo(titleLable.mas_right).with.offset(5*APP_DELEGATE().autoSizeScaleX);
             make.centerY.equalTo(cell.contentView.mas_centerY);
             make.size.equalTo(CGSizeMake(215*APP_DELEGATE().autoSizeScaleX,40*APP_DELEGATE().autoSizeScaleY));
         }];
    }
    if(indexPath.row==4)
    {
        UILabel *titleLable = [[UILabel alloc] init];
        titleLable.numberOfLines = 0;
        titleLable.textAlignment = NSTextAlignmentLeft;
        titleLable.font = viewFont3;
        titleLable.textColor = fontColor;
        [cell.contentView addSubview:titleLable];
        titleLable.text = @"长度";
        
        [titleLable makeConstraints:^(MASConstraintMaker *make)
         {
             make.left.equalTo(cell.contentView).with.offset(15*APP_DELEGATE().autoSizeScaleX);
             make.size.equalTo(CGSizeMake(55*APP_DELEGATE().autoSizeScaleX,46*APP_DELEGATE().autoSizeScaleY));
         }];
        
        
        [cell.contentView addSubview:self.changduText];
        [self.changduText makeConstraints:^(MASConstraintMaker *make)
         {
             make.left.equalTo(titleLable.mas_right).with.offset(5*APP_DELEGATE().autoSizeScaleX);
             make.centerY.equalTo(cell.contentView.mas_centerY);
             make.size.equalTo(CGSizeMake(215*APP_DELEGATE().autoSizeScaleX,40*APP_DELEGATE().autoSizeScaleY));
         }];
    }
    if(indexPath.row==5)
    {
        UILabel *titleLable = [[UILabel alloc] init];
        titleLable.numberOfLines = 0;
        titleLable.textAlignment = NSTextAlignmentLeft;
        titleLable.font = viewFont3;
        titleLable.textColor = fontColor;
        [cell.contentView addSubview:titleLable];
        titleLable.text = @"宽度";
        
        [titleLable makeConstraints:^(MASConstraintMaker *make)
         {
             make.left.equalTo(cell.contentView).with.offset(15*APP_DELEGATE().autoSizeScaleX);
             make.size.equalTo(CGSizeMake(55*APP_DELEGATE().autoSizeScaleX,46*APP_DELEGATE().autoSizeScaleY));
         }];
        
        
        [cell.contentView addSubview:self.kuanduText];
        [self.kuanduText makeConstraints:^(MASConstraintMaker *make)
         {
             make.left.equalTo(titleLable.mas_right).with.offset(5*APP_DELEGATE().autoSizeScaleX);
             make.centerY.equalTo(cell.contentView.mas_centerY);
             make.size.equalTo(CGSizeMake(215*APP_DELEGATE().autoSizeScaleX,40*APP_DELEGATE().autoSizeScaleY));
         }];
    }
    if(indexPath.row==6)
    {
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
    if(indexPath.row==7)
    {
        UILabel *titleLable = [[UILabel alloc] init];
        titleLable.numberOfLines = 0;
        titleLable.textAlignment = NSTextAlignmentLeft;
        titleLable.font = viewFont3;
        titleLable.textColor = fontColor;
        [cell.contentView addSubview:titleLable];
        titleLable.text = @"司机电话";
        
        [titleLable makeConstraints:^(MASConstraintMaker *make)
         {
             make.left.equalTo(cell.contentView).with.offset(15*APP_DELEGATE().autoSizeScaleX);
             make.size.equalTo(CGSizeMake(55*APP_DELEGATE().autoSizeScaleX,46*APP_DELEGATE().autoSizeScaleY));
         }];
        
        
        [cell.contentView addSubview:self.sijidianhuaText];
        [self.sijidianhuaText makeConstraints:^(MASConstraintMaker *make)
         {
             make.left.equalTo(titleLable.mas_right).with.offset(5*APP_DELEGATE().autoSizeScaleX);
             make.centerY.equalTo(cell.contentView.mas_centerY);
             make.size.equalTo(CGSizeMake(215*APP_DELEGATE().autoSizeScaleX,40*APP_DELEGATE().autoSizeScaleY));
         }];
    }
    if(indexPath.row==8)
    {
        UILabel *titleLable = [[UILabel alloc] init];
        titleLable.numberOfLines = 0;
        titleLable.textAlignment = NSTextAlignmentLeft;
        titleLable.font = viewFont3;
        titleLable.textColor = fontColor;
        [cell.contentView addSubview:titleLable];
        titleLable.text = @"开户行";
        
        [titleLable makeConstraints:^(MASConstraintMaker *make)
         {
             make.left.equalTo(cell.contentView).with.offset(15*APP_DELEGATE().autoSizeScaleX);
             make.size.equalTo(CGSizeMake(55*APP_DELEGATE().autoSizeScaleX,46*APP_DELEGATE().autoSizeScaleY));
         }];
        
        
        [cell.contentView addSubview:self.kaihuhangText];
        [self.kaihuhangText makeConstraints:^(MASConstraintMaker *make)
         {
             make.left.equalTo(titleLable.mas_right).with.offset(5*APP_DELEGATE().autoSizeScaleX);
             make.centerY.equalTo(cell.contentView.mas_centerY);
             make.size.equalTo(CGSizeMake(215*APP_DELEGATE().autoSizeScaleX,40*APP_DELEGATE().autoSizeScaleY));
         }];
    }
    if(indexPath.row==9)
    {
        UILabel *titleLable = [[UILabel alloc] init];
        titleLable.numberOfLines = 0;
        titleLable.textAlignment = NSTextAlignmentLeft;
        titleLable.font = viewFont3;
        titleLable.textColor = fontColor;
        [cell.contentView addSubview:titleLable];
        titleLable.text = @"银行卡号";
        
        [titleLable makeConstraints:^(MASConstraintMaker *make)
         {
             make.left.equalTo(cell.contentView).with.offset(15*APP_DELEGATE().autoSizeScaleX);
             make.size.equalTo(CGSizeMake(55*APP_DELEGATE().autoSizeScaleX,46*APP_DELEGATE().autoSizeScaleY));
         }];
        
        
        [cell.contentView addSubview:self.yinhangkahaoText];
        [self.yinhangkahaoText makeConstraints:^(MASConstraintMaker *make)
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

- (void)submitBtnClick:(UIButton *)sender
{
    NSLog(@"保存");
}
@end
