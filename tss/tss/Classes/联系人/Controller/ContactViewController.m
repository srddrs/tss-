//
//  ContactViewController.m
//  tss
//
//  Created by admin on 17/2/15.
//  Copyright © 2017年 com.yunlaila. All rights reserved.
//

#import "ContactViewController.h"
#import "ContactView2ViewController.h"
@interface ContactViewController ()<UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate>
{
    NSMutableArray *organizationDatas;
    NSMutableArray *contactDatas;
    BOOL isOpen;
}
@property (nonatomic ,strong) UITableView *tableView;
@property (nonatomic, strong) UITextField *searchText;  //搜索栏
@end

@implementation ContactViewController
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        isOpen = NO;
        organizationDatas = [[NSMutableArray alloc] init];
        NSDictionary *zuzi1 = @{
                                     @"orderId" :[NSString stringWithFormat:@"%d",1] ,
                                     @"name" :@"成都绍平物流有限公司" ,
                                     @"image" : @"lxr_goujia",
                                     };
        NSDictionary *zuzi2 = @{
                                     @"orderId" :[NSString stringWithFormat:@"%d",2] ,
                                     @"name" :@"运来啦网络科技" ,
                                     @"image" : @"lxr_fen",
                                     };
        NSDictionary *zuzi3 = @{
                                     @"orderId" :[NSString stringWithFormat:@"%d",3] ,
                                     @"name" :@"加盟商门店" ,
                                     @"image" : @"lxr_fen",
                                     };
        [organizationDatas addObject:zuzi1];
        [organizationDatas addObject:zuzi2];
        [organizationDatas addObject:zuzi3];
        
        
        
        contactDatas = [[NSMutableArray alloc] init];
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
        NSDictionary *threedict4 = @{
                                     @"orderId" :[NSString stringWithFormat:@"%d",4] ,
                                     @"name" :@"代收款收款" ,
                                     @"image" : @"cz_daishoukuanshoukuan",
                                     };
        NSDictionary *threedict5 = @{
                                     @"orderId" :[NSString stringWithFormat:@"%d",5] ,
                                     @"name" :@"登记派车" ,
                                     @"image" : @"cz_dengjipaiche",
                                     };
        NSDictionary *threedict6 = @{
                                     @"orderId" :[NSString stringWithFormat:@"%d",6] ,
                                     @"name" :@"报销" ,
                                     @"image" : @"cz_baoxiao",
                                     };
        
        
        [contactDatas addObject:threedict1];
        [contactDatas addObject:threedict2];
        [contactDatas addObject:threedict3];
        [contactDatas addObject:threedict4];
        [contactDatas addObject:threedict5];
        [contactDatas addObject:threedict6];
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
//    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithIcon:@"sy_zuijinboda" highIcon:@"sy_zuijinboda" target:self action:@selector(scanBtnClick:)];
}

- (UITextField *)searchText
{
    if (!_searchText)
    {
        UIImageView *iconView1 = [[UIImageView alloc]initWithImage:[UIImage imageWithName:@"sy_shousuo"]];
        iconView1.contentMode = UIViewContentModeCenter;

        _searchText = [[UITextField alloc] init];
        _searchText.leftView = iconView1;
        _searchText.leftViewMode = UITextFieldViewModeAlways;
        _searchText.leftView.frame = CGRectMake(0, 0, 30*APP_DELEGATE().autoSizeScaleY, 30*APP_DELEGATE().autoSizeScaleY);
        _searchText.backgroundColor = bgViewColor;
        _searchText.clearButtonMode = UITextFieldViewModeWhileEditing;
        _searchText.borderStyle = UITextBorderStyleNone;
        _searchText.delegate = self;
        _searchText.placeholder = @"找人";
        _searchText.returnKeyType = UIReturnKeySearch;
        _searchText.keyboardType = UIKeyboardTypeDefault;
        _searchText.font = viewFont2;
        _searchText.textColor = fontColor;
        [_searchText setValue:fontColor forKeyPath:@"_placeholderLabel.textColor"];
        [_searchText setValue:viewFont2 forKeyPath:@"_placeholderLabel.font"];
    }
    return _searchText;
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
    if (section == 0)
    {
        return 1;
    }
    else if (section == 1)
    {
        if (isOpen==YES)
        {
            return organizationDatas.count;
        }
        else
        {
            return 1;
        }
        
    }
    else
    {
        return contactDatas.count;
    }
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
         return 36*APP_DELEGATE().autoSizeScaleY;
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
    
    #pragma mark - 搜索
    if (indexPath.section==0)
    {
        [cell.contentView addSubview:self.searchText];
        [self.searchText makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(cell.contentView);
            make.size.equalTo(CGSizeMake(300*APP_DELEGATE().autoSizeScaleX, 28*APP_DELEGATE().autoSizeScaleY));
        }];
        LRViewBorderRadius(self.searchText, 8*APP_DELEGATE().autoSizeScaleY, 1, [UIColor clearColor]);
    }
    #pragma mark - 公司组织
    else if(indexPath.section==1)
    {
        NSDictionary *info = [organizationDatas objectAtIndex:indexPath.row];
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",[info objectForKey:@"image"]]];
        NSString *title = [NSString stringWithFormat:@"%@",[info objectForKey:@"name"]];
        
        UIImageView *icon = [[UIImageView alloc] init];
        icon.image = image;
        [cell.contentView addSubview:icon];
        [icon makeConstraints:^(MASConstraintMaker *make)
         {
             make.centerY.equalTo(cell.contentView.mas_centerY);
             if (indexPath.row==0)
             {
                 make.left.equalTo(cell.contentView).with.offset(15);
                 make.size.equalTo(CGSizeMake(28*APP_DELEGATE().autoSizeScaleY,28*APP_DELEGATE().autoSizeScaleY));
             }
             else
             {
                 make.left.equalTo(cell.contentView).with.offset(25);
                 make.size.equalTo(CGSizeMake(10*APP_DELEGATE().autoSizeScaleY,10*APP_DELEGATE().autoSizeScaleY));
             }
             
         }];

        UILabel *titleLable1 = [[UILabel alloc] init];
        titleLable1.numberOfLines = 0;
        titleLable1.textAlignment = NSTextAlignmentLeft;
        titleLable1.font = viewFont3;
        titleLable1.textColor = fontColor;
        titleLable1.backgroundColor = [UIColor whiteColor];
        [cell.contentView addSubview:titleLable1];
        titleLable1.text = title;
        
        [titleLable1 makeConstraints:^(MASConstraintMaker *make)
         {
             make.left.equalTo(icon.mas_right).with.offset(5);
             make.centerY.equalTo(cell.contentView.mas_centerY);
             make.size.equalTo(CGSizeMake(180*APP_DELEGATE().autoSizeScaleX,46*APP_DELEGATE().autoSizeScaleY));
         }];
        
        if (indexPath.row==0)
        {
            UIImageView *arrowImage = [[UIImageView alloc] init];
            if (isOpen==YES)
            {
                arrowImage.image = [UIImage imageNamed:@"lxr_wangxia"];
            }
            else
            {
                arrowImage.image = [UIImage imageNamed:@"lxr_wangyou"];
            }
            
            [cell.contentView addSubview:arrowImage];
            [arrowImage makeConstraints:^(MASConstraintMaker *make)
             {
                 make.right.equalTo(cell.contentView).with.offset(-15);
                 make.centerY.equalTo(cell.contentView.mas_centerY);
                 if (isOpen==YES)
                 {
                     make.size.equalTo(CGSizeMake(13*APP_DELEGATE().autoSizeScaleY,7*APP_DELEGATE().autoSizeScaleY));
                 }
                 else
                 {
                     make.size.equalTo(CGSizeMake(7*APP_DELEGATE().autoSizeScaleY,13*APP_DELEGATE().autoSizeScaleY));
                 }
                 
             }];

        }
       
        
        if (indexPath.row != organizationDatas.count-1&&isOpen==YES)
        {
            UIView *fgx1 = [[UIView alloc] init];
            fgx1.backgroundColor = bgViewColor;
            [cell.contentView addSubview:fgx1];
            
            [fgx1 makeConstraints:^(MASConstraintMaker *make)
             {
                 make.left.equalTo(cell.contentView.mas_left).with.offset(10);
                 make.bottom.equalTo(cell.contentView).with.offset(-1);
                 make.right.equalTo(cell.contentView.mas_right).with.offset(-10);
                 make.height.equalTo(1);
             }];

        }
       

    }
    #pragma mark - 人员
    else if(indexPath.section==2)
    {
        NSDictionary *info = [contactDatas objectAtIndex:indexPath.row];
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",[info objectForKey:@"image"]]];
        NSString *title = [NSString stringWithFormat:@"%@",[info objectForKey:@"name"]];
        
        UIImageView *icon = [[UIImageView alloc] init];
        icon.image = image;
        [cell.contentView addSubview:icon];
        [icon makeConstraints:^(MASConstraintMaker *make)
         {
             make.centerY.equalTo(cell.contentView.mas_centerY);
             make.left.equalTo(cell.contentView).with.offset(15);
             make.size.equalTo(CGSizeMake(30*APP_DELEGATE().autoSizeScaleY,30*APP_DELEGATE().autoSizeScaleY));
         }];
        
        UILabel *titleLable1 = [[UILabel alloc] init];
        titleLable1.numberOfLines = 0;
        titleLable1.textAlignment = NSTextAlignmentLeft;
        titleLable1.font = viewFont3;
        titleLable1.textColor = fontColor;
        titleLable1.backgroundColor = [UIColor whiteColor];
        [cell.contentView addSubview:titleLable1];
        titleLable1.text = title;
        
        [titleLable1 makeConstraints:^(MASConstraintMaker *make)
         {
             make.left.equalTo(icon.mas_right).with.offset(5);
             make.centerY.equalTo(cell.contentView.mas_centerY);
             make.size.equalTo(CGSizeMake(180*APP_DELEGATE().autoSizeScaleX,46*APP_DELEGATE().autoSizeScaleY));
         }];
        
        UIButton *phoneBtn = [[UIButton alloc] init];
        phoneBtn.tag = indexPath.row;
        [phoneBtn setImage:[UIImage imageNamed:@"lxr_dianhua"] forState:UIControlStateNormal];
        [phoneBtn setImage:[UIImage imageNamed:@"lxr_dianhua"] forState:UIControlStateHighlighted];
        [phoneBtn addTarget:self
                     action:@selector(phoneBtnClick:)
           forControlEvents:UIControlEventTouchUpInside];
        [cell.contentView addSubview: phoneBtn];
        
        [phoneBtn makeConstraints:^(MASConstraintMaker *make)
         {
             make.right.equalTo(cell.contentView).with.offset(-15);
             make.centerY.equalTo(cell.contentView.mas_centerY);
             make.size.equalTo(CGSizeMake(28*APP_DELEGATE().autoSizeScaleY,28*APP_DELEGATE().autoSizeScaleY));
         }];

       
        
        
        
        if (indexPath.row != contactDatas.count-1)
        {
            UIView *fgx1 = [[UIView alloc] init];
            fgx1.backgroundColor = bgViewColor;
            [cell.contentView addSubview:fgx1];
            
            [fgx1 makeConstraints:^(MASConstraintMaker *make)
             {
                 make.left.equalTo(cell.contentView.mas_left).with.offset(10);
                 make.bottom.equalTo(cell.contentView).with.offset(-1);
                 make.right.equalTo(cell.contentView.mas_right).with.offset(-10);
                 make.height.equalTo(1);
             }];
            
        }

    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section==1&&indexPath.row==0)
    {
        isOpen = !isOpen;
        NSIndexSet *indexSet = [NSIndexSet indexSetWithIndex:1];
        [self.tableView reloadSections:indexSet withRowAnimation:UITableViewRowAnimationAutomatic];
    }
    else if(indexPath.section==1&&indexPath.row!=0)
    {
         NSDictionary *info = [organizationDatas objectAtIndex:indexPath.row];
        
        ContactView2ViewController *vc = [[ContactView2ViewController alloc] init];
        vc.titleString = [NSString stringWithFormat:@"%@",[info objectForKey:@"name"]];
        [self.navigationController pushViewController:vc animated:YES];
    }
}

- (void)phoneBtnClick:(UIButton *) sender
{
    NSDictionary *info = [contactDatas objectAtIndex:sender.tag];
    NSLog(@"AAA:%@",info);
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if (textField.text.length==0)
    {
        [MBProgressHUD showAutoMessage:@"请输入姓名或者电话号码"];
    }
    else
    {
       
        
        
    }
    [textField resignFirstResponder];
    return YES;
}


@end
