//
//  LookCargo1ViewController.m
//  tss
//
//  Created by admin on 17/2/20.
//  Copyright © 2017年 com.yunlaila. All rights reserved.
//

#import "LookCargo1ViewController.h"
#import "IQActionSheetPickerView.h"
#import "LookCargo2ViewController.h"
@interface LookCargo1ViewController ()<UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate,IQActionSheetPickerViewDelegate>
{
    
}
@property (nonatomic ,strong) UITableView *tableView;
@property (nonatomic, strong) UITextField *kaishishijianText;  //开始时间
@property (nonatomic, strong) UITextField *jieshushijianText;  //结束时间
@property (nonatomic, strong) UITextField *shifazhanText;  //始发站
@property (nonatomic, strong) UITextField *zhongdianzhanText;  //终点站
@end

@implementation LookCargo1ViewController
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
    self.title = @"查看货量";
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

- (UITextField *)kaishishijianText
{
    if (!_kaishishijianText)
    {
        
        _kaishishijianText = [[UITextField alloc] init];
        _kaishishijianText.backgroundColor = [UIColor whiteColor];
        _kaishishijianText.clearButtonMode = UITextFieldViewModeWhileEditing;
        _kaishishijianText.borderStyle = UITextBorderStyleNone;
        _kaishishijianText.delegate = self;
        _kaishishijianText.placeholder = @"必选";
        _kaishishijianText.returnKeyType = UIReturnKeyDone;
        _kaishishijianText.keyboardType = UIKeyboardTypeDefault;
        _kaishishijianText.font = viewFont3;
        _kaishishijianText.textColor = lvColor;
        _kaishishijianText.enabled = NO;
    }
    return _kaishishijianText;
}

- (UITextField *)jieshushijianText
{
    if (!_jieshushijianText)
    {
        
        _jieshushijianText = [[UITextField alloc] init];
        _jieshushijianText.backgroundColor = [UIColor whiteColor];
        _jieshushijianText.clearButtonMode = UITextFieldViewModeWhileEditing;
        _jieshushijianText.borderStyle = UITextBorderStyleNone;
        _jieshushijianText.delegate = self;
        _jieshushijianText.placeholder = @"必选";
        _jieshushijianText.returnKeyType = UIReturnKeyDone;
        _jieshushijianText.keyboardType = UIKeyboardTypeDefault;
        _jieshushijianText.font = viewFont3;
        _jieshushijianText.textColor = lvColor;
        _jieshushijianText.enabled = NO;
    }
    return _jieshushijianText;
}

- (UITextField *)shifazhanText
{
    if (!_shifazhanText)
    {
        
        _shifazhanText = [[UITextField alloc] init];
        _shifazhanText.backgroundColor = [UIColor whiteColor];
        _shifazhanText.clearButtonMode = UITextFieldViewModeWhileEditing;
        _shifazhanText.borderStyle = UITextBorderStyleNone;
        _shifazhanText.delegate = self;
        _shifazhanText.placeholder = @"可选";
        _shifazhanText.returnKeyType = UIReturnKeyDone;
        _shifazhanText.keyboardType = UIKeyboardTypeDefault;
        _shifazhanText.font = viewFont3;
        _shifazhanText.textColor = lvColor;
        _shifazhanText.enabled = NO;
    }
    return _shifazhanText;
}

- (UITextField *)zhongdianzhanText
{
    if (!_zhongdianzhanText)
    {
        
        _zhongdianzhanText = [[UITextField alloc] init];
        _zhongdianzhanText.backgroundColor = [UIColor whiteColor];
        _zhongdianzhanText.clearButtonMode = UITextFieldViewModeWhileEditing;
        _zhongdianzhanText.borderStyle = UITextBorderStyleNone;
        _zhongdianzhanText.delegate = self;
        _zhongdianzhanText.placeholder = @"可选";
        _zhongdianzhanText.returnKeyType = UIReturnKeyDone;
        _zhongdianzhanText.keyboardType = UIKeyboardTypeDefault;
        _zhongdianzhanText.font = viewFont3;
        _zhongdianzhanText.textColor = lvColor;
        _zhongdianzhanText.enabled = NO;
    }
    return _zhongdianzhanText;
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
    return 5;
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
    if(indexPath.row==4)
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
        titleLable.text = @"开始日期";
        
        [titleLable makeConstraints:^(MASConstraintMaker *make)
         {
             make.left.equalTo(icon1.mas_right).with.offset(15);
             make.size.equalTo(CGSizeMake(55*APP_DELEGATE().autoSizeScaleX,46*APP_DELEGATE().autoSizeScaleY));
         }];
        
        
        [cell.contentView addSubview:self.kaishishijianText];
        [self.kaishishijianText makeConstraints:^(MASConstraintMaker *make)
         {
             make.left.equalTo(titleLable.mas_right).with.offset(5*APP_DELEGATE().autoSizeScaleX);
             make.centerY.equalTo(cell.contentView.mas_centerY);
             make.size.equalTo(CGSizeMake(215*APP_DELEGATE().autoSizeScaleX,40*APP_DELEGATE().autoSizeScaleY));
         }];
    }
    else if(indexPath.row==1)
    {
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
        titleLable.text = @"结束日期";
        
        [titleLable makeConstraints:^(MASConstraintMaker *make)
         {
             make.left.equalTo(icon1.mas_right).with.offset(15);
             make.size.equalTo(CGSizeMake(55*APP_DELEGATE().autoSizeScaleX,46*APP_DELEGATE().autoSizeScaleY));
         }];
        
        
        [cell.contentView addSubview:self.jieshushijianText];
        [self.jieshushijianText makeConstraints:^(MASConstraintMaker *make)
         {
             make.left.equalTo(titleLable.mas_right).with.offset(5*APP_DELEGATE().autoSizeScaleX);
             make.centerY.equalTo(cell.contentView.mas_centerY);
             make.size.equalTo(CGSizeMake(215*APP_DELEGATE().autoSizeScaleX,40*APP_DELEGATE().autoSizeScaleY));
         }];
        
    }
    else if(indexPath.row==2)
    {
        
        
        UIImageView *icon1 = [[UIImageView alloc] init];
        icon1.image = [UIImage imageNamed:@"ckhl_qifazhan"];
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
        titleLable.text = @"始发站";
        
        [titleLable makeConstraints:^(MASConstraintMaker *make)
         {
             make.left.equalTo(icon1.mas_right).with.offset(15);
             make.size.equalTo(CGSizeMake(55*APP_DELEGATE().autoSizeScaleX,46*APP_DELEGATE().autoSizeScaleY));
         }];
        
        
        [cell.contentView addSubview:self.shifazhanText];
        [self.shifazhanText makeConstraints:^(MASConstraintMaker *make)
         {
             make.left.equalTo(titleLable.mas_right).with.offset(5*APP_DELEGATE().autoSizeScaleX);
             make.centerY.equalTo(cell.contentView.mas_centerY);
             make.size.equalTo(CGSizeMake(215*APP_DELEGATE().autoSizeScaleX,40*APP_DELEGATE().autoSizeScaleY));
         }];
        
    }
    else if(indexPath.row==3)
    {
        fgx1.hidden = YES;
        
        UIImageView *icon1 = [[UIImageView alloc] init];
        icon1.image = [UIImage imageNamed:@"ckhl_zhogndianzhan"];
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
        titleLable.text = @"终点站";
        
        [titleLable makeConstraints:^(MASConstraintMaker *make)
         {
             make.left.equalTo(icon1.mas_right).with.offset(15);
             make.size.equalTo(CGSizeMake(55*APP_DELEGATE().autoSizeScaleX,46*APP_DELEGATE().autoSizeScaleY));
         }];
        
        
        [cell.contentView addSubview:self.zhongdianzhanText];
        [self.zhongdianzhanText makeConstraints:^(MASConstraintMaker *make)
         {
             make.left.equalTo(titleLable.mas_right).with.offset(5*APP_DELEGATE().autoSizeScaleX);
             make.centerY.equalTo(cell.contentView.mas_centerY);
             make.size.equalTo(CGSizeMake(215*APP_DELEGATE().autoSizeScaleX,40*APP_DELEGATE().autoSizeScaleY));
         }];
        
    }
    else if(indexPath.row==4)
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
    else if(indexPath.row==1)
    {
        IQActionSheetPickerView *picker =  [[IQActionSheetPickerView alloc] initWithTitle:@"选择结束时间" delegate:self];
        [picker setTag:2];
        [picker setActionSheetPickerStyle:IQActionSheetPickerStyleDatePicker];
        [picker show];
    }
    else if(indexPath.row==2)
    {
        IQActionSheetPickerView *picker =  [[IQActionSheetPickerView alloc] initWithTitle:@"选择路线" delegate:self];
        [picker setTag:3];
        [picker setActionSheetPickerStyle:IQActionSheetPickerStyleTablePicker];
        
        NSMutableArray *anniuDatas = [[NSMutableArray alloc] init];
        NSDictionary *threedict1 = @{
                                     @"orderId" :[NSString stringWithFormat:@"%d",1] ,
                                     @"name" :@"货量查询" ,
                                     @"image" : @"cz_huoliangchaxun",
                                     };
        NSDictionary *threedict2 = @{
                                     @"orderId" :[NSString stringWithFormat:@"%d",2] ,
                                     @"name" :@"运输款上缴" ,
                                     @"image" : @"cz_yunshukuanshangjiao",
                                     };
        NSDictionary *threedict3 = @{
                                     @"orderId" :[NSString stringWithFormat:@"%d",3] ,
                                     @"name" :@"代收款上缴" ,
                                     @"image" : @"cz_daishoukuanshangjiao",
                                     };

        [anniuDatas addObject:threedict1];
        [anniuDatas addObject:threedict2];
        [anniuDatas addObject:threedict3];
        
        
        [picker setBanks:anniuDatas];
        [picker show];
        [picker setButtonColor:fontColor];
    }
    else
    {
        IQActionSheetPickerView *picker =  [[IQActionSheetPickerView alloc] initWithTitle:@"选择路线" delegate:self];
        [picker setTag:4];
        [picker setActionSheetPickerStyle:IQActionSheetPickerStyleTablePicker];
        
        NSMutableArray *anniuDatas = [[NSMutableArray alloc] init];
        NSDictionary *threedict1 = @{
                                     @"orderId" :[NSString stringWithFormat:@"%d",1] ,
                                     @"name" :@"货量查询" ,
                                     @"image" : @"cz_huoliangchaxun",
                                     };
        NSDictionary *threedict2 = @{
                                     @"orderId" :[NSString stringWithFormat:@"%d",2] ,
                                     @"name" :@"运输款上缴" ,
                                     @"image" : @"cz_yunshukuanshangjiao",
                                     };
        NSDictionary *threedict3 = @{
                                     @"orderId" :[NSString stringWithFormat:@"%d",3] ,
                                     @"name" :@"代收款上缴" ,
                                     @"image" : @"cz_daishoukuanshangjiao",
                                     };
        
        [anniuDatas addObject:threedict1];
        [anniuDatas addObject:threedict2];
        [anniuDatas addObject:threedict3];
        
        
        [picker setBanks:anniuDatas];
        [picker show];
        [picker setButtonColor:fontColor];
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
        self.kaishishijianText.text = destDateString;
    }
    else if(pickerView.tag==2)
    {
        self.jieshushijianText.text = destDateString;
    }
}

- (void)actionSheetPickerView:(IQActionSheetPickerView *)pickerView didSelectTable:(NSDictionary *)bank
{
    if(pickerView.tag==3)
    {
        self.shifazhanText.text = [NSString stringWithFormat:@"%@",[bank objectForKey:@"name"]];
    }
    else if(pickerView.tag==4)
    {
        self.zhongdianzhanText.text =  [NSString stringWithFormat:@"%@",[bank objectForKey:@"name"]];
    }
}
- (void)submitBtnClick:(UIButton *)sender
{
    NSLog(@"保存");
    LookCargo2ViewController *vc = [[LookCargo2ViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}
@end
