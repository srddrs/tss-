//
//  WorkbenchViewController.m
//  tss
//
//  Created by admin on 17/2/14.
//  Copyright © 2017年 com.yunlaila. All rights reserved.
//

#import "WorkbenchViewController.h"
#import "SDCycleScrollView.h"
#import "TodayWorkViewController.h"
#import "LoginViewController.h"
@interface WorkbenchViewController ()<UITableViewDataSource,UITableViewDelegate,SDCycleScrollViewDelegate>
{
    NSMutableArray *daibans;
    NSMutableArray *imagesURLStrings; //滚动视图数据 (暂未使用)
}
@property (nonatomic ,strong) UITableView *tableView;
@property (nonatomic ,strong) SDCycleScrollView *cycleScrollView;
@end

@implementation WorkbenchViewController
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
         imagesURLStrings = [[NSMutableArray alloc] init];
        [imagesURLStrings addObject:[UIImage imageNamed:@"zhuye_banner1"]];
        daibans = [[NSMutableArray alloc] init];
       
        
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

    NSDictionary *user =  [[NSUserDefaults standardUserDefaults] objectForKey:kLoginUser];
    if (user==nil)
    {
        [AppTool presentDengLu:self];
    }
    else
    {
         [self getBanner];
    }
    
    
}

- (void)getBanner
{
    NHNetworkHelper *helper = [NHNetworkHelper shareInstance];
    
    //    [MBProgressHUD showMessag:@"" toView:self.view];
    NSMutableDictionary *paramDic = [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                                     @"hex_personal_queryAppBannerFunction",@"funcId",
                                     @"1",@"banner_type",
                                     nil];
    
    [helper Soap:commonURL Parameters:paramDic Success:^(id responseObject)
     {
         //         [MBProgressHUD hideHUDForView:self.view animated:YES];
         ResponseObject *obj =[ResponseObject yy_modelWithDictionary:responseObject];
         if (((response *)obj.responses[0]).flag.intValue==1)
         {
             if(((response *)obj.responses[0]).items.count>0)
             {
                 //                 [items addObjectsFromArray: ((response *)obj.responses[0]).items];
                 NSMutableArray *array = [[NSMutableArray alloc] init];
                 
                 for (int i=0; i < ((response *)obj.responses[0]).items.count; i++)
                 {
                     NSDictionary *info = [((response *)obj.responses[0]).items objectAtIndex:i];
                     [array addObject:[info objectForKey:@"banner_url"]];
                 }
                 
                 self.cycleScrollView.imageURLStringsGroup = array;
                 
             }
         }
         else
         {
        
             self.cycleScrollView.localizationImagesGroup = imagesURLStrings;
             
         }
         NSLog(@"%@",responseObject);
         
     } Failure:^(NSError *error)
     {
         NSLog(@"%@",error);
         self.cycleScrollView.localizationImagesGroup = imagesURLStrings;
         
     }];
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
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithIcon:@"sy_zuijinboda" highIcon:@"sy_zuijinboda" target:self action:@selector(scanBtnClick:)];
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

- (SDCycleScrollView *)cycleScrollView
{
    if (!_cycleScrollView)
    {
//        _cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, 320*APP_DELEGATE().autoSizeScaleX, 125*APP_DELEGATE().autoSizeScaleY) imageURLStringsGroup:nil]; // 模拟网络延时情景
        _cycleScrollView = [[SDCycleScrollView alloc] init];
        _cycleScrollView.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;
        _cycleScrollView.delegate = self;
        //            cycleScrollView2.titlesGroup = titles;
        _cycleScrollView.dotColor = titleViewColor; // 自定义分页控件小圆标颜色
        _cycleScrollView.showPageControl = NO;
        _cycleScrollView.placeholderImage = [UIImage imageNamed:@"zhuye_banner2"];
        
            [imagesURLStrings addObject:[UIImage imageNamed:@"zhuye_banner2"]];
            [imagesURLStrings addObject:[UIImage imageNamed:@"zhuye_banner1"]];
            [imagesURLStrings addObject:[UIImage imageNamed:@"zhuye_banner3"]];
        _cycleScrollView.localizationImagesGroup = imagesURLStrings;
        _cycleScrollView.autoScrollTimeInterval = 4;

    }
    return _cycleScrollView;
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
        if (daibans.count==0)
        {
            return 1;
        }
        else if (daibans.count>=2)
        {
            return 2;
        }
        else
        {
            return 1;
        }
        
        
    }
    else
    {
        return 3;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section==0)
    {
        return 0;
    }
    return 40*APP_DELEGATE().autoSizeScaleY;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section==0)
    {
        return nil;
    }
    UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(0*APP_DELEGATE().autoSizeScaleX, 0, 320*APP_DELEGATE().autoSizeScaleX, 40*APP_DELEGATE().autoSizeScaleY)];
    bgView.backgroundColor = bgViewColor;
    
    UIView *headView = [[UIView alloc] init];
    headView.backgroundColor = [UIColor colorWithRed:249/255.0 green:249/255.0 blue:249/255.0 alpha:1];
    [bgView addSubview:headView];
 
    [headView makeConstraints:^(MASConstraintMaker *make)
     {
         make.top.equalTo(bgView).with.offset(10);
         make.left.equalTo(bgView).with.offset(10);
         make.bottom.equalTo(bgView).with.offset(0);
         make.right.equalTo(bgView).with.offset(-10);
     }];
    
    UILabel *titleLable1 = [[UILabel alloc] init];
    titleLable1.numberOfLines = 0;
    titleLable1.textAlignment = NSTextAlignmentLeft;
    titleLable1.font = viewFont3;
    titleLable1.textColor = fontColor;
//    titleLable1.backgroundColor = [UIColor redColor];
    [headView addSubview:titleLable1];
    
    UILabel *titleLable2 = [[UILabel alloc] init];
    titleLable2.numberOfLines = 0;
    titleLable2.textAlignment = NSTextAlignmentCenter;
    titleLable2.font = viewFont3;
    titleLable2.textColor = [UIColor whiteColor];
    titleLable2.backgroundColor = lvColor;
    [headView addSubview:titleLable2];
    LRViewBorderRadius(titleLable2, 10*APP_DELEGATE().autoSizeScaleY, 1, [UIColor clearColor]);
    
    [titleLable1 makeConstraints:^(MASConstraintMaker *make)
    {
        make.centerY.equalTo(headView.mas_centerY);
        make.left.equalTo(headView.mas_left).with.offset(10);
        make.right.equalTo(titleLable2.mas_left).with.offset(-10);
        make.height.equalTo(headView.mas_height);
        make.width.equalTo(50*APP_DELEGATE().autoSizeScaleX);
    }];
    
    [titleLable2 makeConstraints:^(MASConstraintMaker *make)
     {
         make.centerY.equalTo(headView.mas_centerY);
         make.right.equalTo(headView.mas_right).with.offset(-5);
         make.size.equalTo(CGSizeMake(20*APP_DELEGATE().autoSizeScaleY, 20*APP_DELEGATE().autoSizeScaleY));
    }];
    
    if(section==1)
    {
        titleLable1.text = @"待办事宜";
        titleLable2.text = @"2";
    }
    else if(section==2)
    {
        titleLable1.text = @"公告";
        titleLable2.text = @"1";
    }
    
    
    return bgView;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (section==0)
    {
        return 0;
    }
    return 30*APP_DELEGATE().autoSizeScaleY;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    if (section==0)
    {
        return nil;
    }
    UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(0*APP_DELEGATE().autoSizeScaleX, 0, 320*APP_DELEGATE().autoSizeScaleX, 30*APP_DELEGATE().autoSizeScaleY)];
    bgView.backgroundColor = bgViewColor;
    
    UIView *headView = [[UIView alloc] init];
    headView.backgroundColor = [UIColor whiteColor];
    [bgView addSubview:headView];
    
    [headView makeConstraints:^(MASConstraintMaker *make)
     {
         make.top.equalTo(bgView).with.offset(0);
         make.left.equalTo(bgView).with.offset(10);
         make.bottom.equalTo(bgView).with.offset(0);
         make.right.equalTo(bgView).with.offset(-10);
     }];
    
    UILabel *titleLable1 = [[UILabel alloc] init];
    titleLable1.numberOfLines = 0;
    titleLable1.textAlignment = NSTextAlignmentCenter;
    titleLable1.font = viewFont3;
    titleLable1.textColor = lvColor;
    [headView addSubview:titleLable1];
    
    [titleLable1 makeConstraints:^(MASConstraintMaker *make)
     {
         make.centerY.equalTo(headView.mas_centerY);
         make.width.equalTo(headView.mas_width);
     }];
    
    if(section==1)
    {
        titleLable1.text = @"查看全部代办事宜";
    }
    else if(section==2)
    {
        titleLable1.text = @"查看全部公告";
    }
    bgView.tag = section;
    bgView.userInteractionEnabled = YES;
    UITapGestureRecognizer *tapGr = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(footTap:)];
    tapGr.cancelsTouchesInView = YES;
    [bgView addGestureRecognizer:tapGr];
    return bgView;
    
}



- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0)
    {
        return 135*APP_DELEGATE().autoSizeScaleY;
    }
    return 50*APP_DELEGATE().autoSizeScaleY;
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
        cell.backgroundColor = bgViewColor;
    }
    
    for (UIView *view in cell.contentView.subviews)
    {
        [view removeFromSuperview];
    }
#pragma mark - 滚动图
    if (indexPath.section==0)
    {
        [cell.contentView addSubview:self.cycleScrollView];
        [self.cycleScrollView makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(cell.contentView);
            make.size.equalTo(cell.contentView);
        }];
    }
    #pragma mark - 待办事宜
    else if(indexPath.section == 1)
    {
        UIView *bgView = [[UIView alloc] init];
        bgView.backgroundColor = [UIColor whiteColor];
        [cell.contentView addSubview:bgView];
        
        [bgView makeConstraints:^(MASConstraintMaker *make)
         {
              make.top.equalTo(cell.contentView).with.offset(0);
              make.left.equalTo(cell.contentView).with.offset(10);
              make.bottom.equalTo(cell.contentView).with.offset(0);
              make.right.equalTo(cell.contentView).with.offset(-10);
         }];
        
        UIImageView *icon = [[UIImageView alloc] init];
        icon.image = [UIImage imageNamed:@"sy_shenqing"];
        [bgView addSubview:icon];
        [icon makeConstraints:^(MASConstraintMaker *make)
         {
             make.left.equalTo(bgView).with.offset(15);
             make.centerY.equalTo(bgView.centerY);
             make.size.equalTo(CGSizeMake(14*APP_DELEGATE().autoSizeScaleY,16*APP_DELEGATE().autoSizeScaleY));
         }];
        
        

        if (daibans.count==0)
        {
            icon.image = [UIImage imageNamed:@"sy_shenqing"];
            UILabel *titleLable1 = [[UILabel alloc] init];
            titleLable1.numberOfLines = 0;
            titleLable1.textAlignment = NSTextAlignmentLeft;
            titleLable1.font = viewFont3;
            titleLable1.textColor = fontColor;
            titleLable1.backgroundColor = [UIColor whiteColor];
            [bgView addSubview:titleLable1];
            
            [titleLable1 makeConstraints:^(MASConstraintMaker *make)
             {
                 make.left.equalTo(icon.mas_right).with.offset(5);
                 make.centerY.equalTo(bgView.centerY);
                 make.size.equalTo(CGSizeMake(180*APP_DELEGATE().autoSizeScaleX,50*APP_DELEGATE().autoSizeScaleY));
             }];
            
            titleLable1.text = @"你完成了今天所有的代办事逸";

        }

        else
        {
            UILabel *titleLable1 = [[UILabel alloc] init];
            titleLable1.numberOfLines = 0;
            titleLable1.textAlignment = NSTextAlignmentLeft;
            titleLable1.font = viewFont3;
            titleLable1.textColor = fontColor;
            titleLable1.backgroundColor = [UIColor whiteColor];
            [bgView addSubview:titleLable1];
            
            [titleLable1 makeConstraints:^(MASConstraintMaker *make)
             {
                 make.left.equalTo(icon.mas_right).with.offset(5);
                 make.centerY.equalTo(bgView.centerY);
                 make.size.equalTo(CGSizeMake(180*APP_DELEGATE().autoSizeScaleX,50*APP_DELEGATE().autoSizeScaleY));
             }];
            
            titleLable1.text = @"[申请放款]待处理";
            
            UILabel *titleLable2 = [[UILabel alloc] init];
            titleLable2.numberOfLines = 0;
            titleLable2.textAlignment = NSTextAlignmentRight;
            titleLable2.font = viewFont3;
            titleLable2.textColor = fontColor;
            titleLable2.backgroundColor = [UIColor whiteColor];
            [bgView addSubview:titleLable2];
            
            [titleLable2 makeConstraints:^(MASConstraintMaker *make)
             {
                 make.right.equalTo(bgView.mas_right).with.offset(-10);
                 make.centerY.equalTo(bgView.mas_centerY);
                 make.size.equalTo(CGSizeMake(80*APP_DELEGATE().autoSizeScaleX,50*APP_DELEGATE().autoSizeScaleY));
             }];
            
            titleLable2.text = @"14：24";
        }
        
        
      
        
        
        UIView *fgx1 = [[UIView alloc] init];
        fgx1.backgroundColor = bgViewColor;
        [bgView addSubview:fgx1];
        
        [fgx1 makeConstraints:^(MASConstraintMaker *make)
         {
             make.left.equalTo(bgView.mas_left).with.offset(10);
             make.bottom.equalTo(bgView).with.offset(-1);
             make.right.equalTo(bgView.mas_right).with.offset(-10);
             
             make.height.equalTo(@1);
         }];
    }
    #pragma mark - 公告
    else if(indexPath.section == 2)
    {
        UIView *bgView = [[UIView alloc] init];
        bgView.backgroundColor = [UIColor whiteColor];
        [cell.contentView addSubview:bgView];
        
        [bgView makeConstraints:^(MASConstraintMaker *make)
         {
             make.top.equalTo(cell.contentView).with.offset(0);
             make.left.equalTo(cell.contentView).with.offset(10);
             make.bottom.equalTo(cell.contentView).with.offset(0);
             make.right.equalTo(cell.contentView).with.offset(-10);
         }];
        
        UIImageView *icon = [[UIImageView alloc] init];
        icon.image = [UIImage imageNamed:@"sy_gonggao"];
        [bgView addSubview:icon];
        [icon makeConstraints:^(MASConstraintMaker *make)
         {
             make.left.equalTo(bgView).with.offset(15);
             make.centerY.equalTo(bgView.mas_centerY);
             make.size.equalTo(CGSizeMake(14*APP_DELEGATE().autoSizeScaleY,11*APP_DELEGATE().autoSizeScaleY));
         }];
        
        UILabel *titleLable1 = [[UILabel alloc] init];
        titleLable1.numberOfLines = 0;
        titleLable1.textAlignment = NSTextAlignmentLeft;
        titleLable1.font = viewFont3;
        titleLable1.textColor = fontColor;
        titleLable1.backgroundColor = [UIColor whiteColor];
        [bgView addSubview:titleLable1];
        
        [titleLable1 makeConstraints:^(MASConstraintMaker *make)
         {
             make.left.equalTo(icon.mas_right).with.offset(5);
             make.centerY.equalTo(bgView.mas_centerY);
             make.size.equalTo(CGSizeMake(190*APP_DELEGATE().autoSizeScaleX,50*APP_DELEGATE().autoSizeScaleY));
         }];

        
        titleLable1.text = @"新系统代收款业务将在明天升级";
        
        UILabel *titleLable2 = [[UILabel alloc] init];
        titleLable2.numberOfLines = 0;
        titleLable2.textAlignment = NSTextAlignmentRight;
        titleLable2.font = viewFont3;
        titleLable2.textColor = fontColor;
        titleLable2.backgroundColor = [UIColor whiteColor];
        [bgView addSubview:titleLable2];
        
        [titleLable2 makeConstraints:^(MASConstraintMaker *make)
         {
             make.right.equalTo(bgView.mas_right).with.offset(-10);
             make.centerY.equalTo(bgView.mas_centerY);
             make.size.equalTo(CGSizeMake(80*APP_DELEGATE().autoSizeScaleX,50*APP_DELEGATE().autoSizeScaleY));
         }];

        
        titleLable2.text = @"2017-01-22";
        
        UIView *fgx1 = [[UIView alloc] init];
        fgx1.backgroundColor = bgViewColor;
        [bgView addSubview:fgx1];
        
        [fgx1 makeConstraints:^(MASConstraintMaker *make)
         {
             make.left.equalTo(bgView.mas_left).with.offset(10);
             make.bottom.equalTo(bgView).with.offset(-1);
             make.right.equalTo(bgView.mas_right).with.offset(-10);
             
             make.height.equalTo(@1);
         }];


    }
    return cell;
}
- (void)scanBtnClick:(id)sender
{
    NSLog(@"日历");
    LoginViewController *vc = [[LoginViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index
{
    
}

- (void)footTap:(UITapGestureRecognizer*)tapGr
{
    if (tapGr.view.tag==1)
    {
        NSLog(@"查看全部代办");
        TodayWorkViewController *vc = [[TodayWorkViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
    else if(tapGr.view.tag==2)
    {
        NSLog(@"查看全部公告");
    }
    
    
}
@end
