//
//  AgencyViewController.m
//  tss
//
//  Created by admin on 17/2/21.
//  Copyright © 2017年 com.yunlaila. All rights reserved.
//

#import "AgencyViewController.h"
#import "ReceiptViewController.h"
@interface AgencyViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    
}

@property (nonatomic ,strong) UITableView *tableView;
@property (nonatomic ,strong) HMSegmentedControl *segmentedControl;
@end

@implementation AgencyViewController
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
    self.title = @"代收款收款";
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

- (HMSegmentedControl *)segmentedControl
{
    if(!_segmentedControl)
    {
        _segmentedControl = [[HMSegmentedControl alloc] initWithSectionTitles:@[@"未收代收款", @"已收款"]];
        _segmentedControl.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleWidth;
        //        _segmentedControl.segmentEdgeInset = UIEdgeInsetsMake(0, 10, 0, 10);
        _segmentedControl.selectionStyle = HMSegmentedControlSelectionStyleTextWidthStripe;
        _segmentedControl.selectionIndicatorLocation = HMSegmentedControlSelectionIndicatorLocationDown;
        
        
        _segmentedControl.selectionIndicatorHeight = 1;
        [_segmentedControl setTitleFormatter:^NSAttributedString *(HMSegmentedControl *segmentedControl, NSString *title, NSUInteger index, BOOL selected) {
            NSAttributedString *attString;
            if (selected==YES)
            {
                attString = [[NSAttributedString alloc] initWithString:title attributes:@{NSForegroundColorAttributeName : lvColor}];
            }
            else
            {
                attString = [[NSAttributedString alloc] initWithString:title attributes:@{NSForegroundColorAttributeName : fontColor}];
            }
            
            return attString;
        }];
        [_segmentedControl addTarget:self action:@selector(segmentedControlChangedValue:) forControlEvents:UIControlEventValueChanged];
    }
    return _segmentedControl;
}

- (void)initView
{
    [self.view addSubview:self.segmentedControl];
    [self.view addSubview:self.tableView];
    
    [self.segmentedControl makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).with.offset(10*APP_DELEGATE().autoSizeScaleY);
        make.size.equalTo(CGSizeMake(320*APP_DELEGATE().autoSizeScaleX, 30*APP_DELEGATE().autoSizeScaleY));
    }];
    
    [_tableView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).with.offset(40*APP_DELEGATE().autoSizeScaleY);
        make.left.equalTo(self.view).with.offset(0);
        make.bottom.equalTo(self.view).with.offset(0*APP_DELEGATE().autoSizeScaleY);
        make.right.equalTo(self.view).with.offset(0);
    }];
    
    [_tableView reloadData];
}


#pragma mark - tableView代理
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 10;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
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
    return 265*APP_DELEGATE().autoSizeScaleY;
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
        cell.backgroundColor = [UIColor colorWithRed:249/255.0 green:249/255.0 blue:249/255.0 alpha:1];
    }
    
    for (UIView *view in cell.contentView.subviews)
    {
        [view removeFromSuperview];
    }
    
    UIView *bgViewTop = [[UIView alloc] init];
    bgViewTop.backgroundColor = [UIColor whiteColor];
    [cell.contentView addSubview:bgViewTop];
    [bgViewTop makeConstraints:^(MASConstraintMaker *make)
     {
         make.top.equalTo(cell.contentView).with.offset(0);
         make.size.equalTo(CGSizeMake(320*APP_DELEGATE().autoSizeScaleX,30*APP_DELEGATE().autoSizeScaleY));
     }];
    
    UIView *fgx1 = [[UIView alloc] init];
    fgx1.backgroundColor = bgViewColor;
    [bgViewTop addSubview:fgx1];
    
    [fgx1 makeConstraints:^(MASConstraintMaker *make)
     {
         //         make.left.equalTo(cell.contentView.mas_left).with.offset(10);
         //            make.right.equalTo(cell.contentView.mas_right).with.offset(-10);
         make.bottom.equalTo(bgViewTop).with.offset(0);
         make.size.equalTo(CGSizeMake(320*APP_DELEGATE().autoSizeScaleX, 1));
         make.height.equalTo(1);
     }];
    
    
    UIView *bgViewDown = [[UIView alloc] init];
    bgViewDown.backgroundColor = [UIColor whiteColor];
    [cell.contentView addSubview:bgViewDown];
    [bgViewDown makeConstraints:^(MASConstraintMaker *make)
     {
         make.bottom.equalTo(cell.contentView).with.offset(0);
         make.size.equalTo(CGSizeMake(320*APP_DELEGATE().autoSizeScaleX,40*APP_DELEGATE().autoSizeScaleY));
     }];
    
    UIView *fgx2 = [[UIView alloc] init];
    fgx2.backgroundColor = bgViewColor;
    [bgViewDown addSubview:fgx2];
    
    [fgx2 makeConstraints:^(MASConstraintMaker *make)
     {
         //         make.left.equalTo(cell.contentView.mas_left).with.offset(10);
         //            make.right.equalTo(cell.contentView.mas_right).with.offset(-10);
         make.top.equalTo(bgViewDown).with.offset(0);
         make.size.equalTo(CGSizeMake(320*APP_DELEGATE().autoSizeScaleX, 1));
         make.height.equalTo(1);
     }];
    
    UIImageView *icon1 = [[UIImageView alloc] init];
    icon1.image = [UIImage imageNamed:@"dsksk_shoukuan"];
    [bgViewTop addSubview:icon1];
    [icon1 makeConstraints:^(MASConstraintMaker *make)
     {
         make.centerY.equalTo(bgViewTop.mas_centerY);
         make.left.equalTo(bgViewTop).with.offset(15);
         make.size.equalTo(CGSizeMake(13*APP_DELEGATE().autoSizeScaleY,12*APP_DELEGATE().autoSizeScaleY));
     }];
    
    UILabel *titleLable1 = [[UILabel alloc] init];
    titleLable1.numberOfLines = 0;
    titleLable1.textAlignment = NSTextAlignmentLeft;
    titleLable1.font = viewFont3;
    titleLable1.textColor = fontColor;
    [bgViewTop addSubview:titleLable1];
    titleLable1.text = @"成都 -- 阆中";
    
    [titleLable1 makeConstraints:^(MASConstraintMaker *make)
     {
         make.left.equalTo(icon1.mas_right).with.offset(10);
         make.centerY.equalTo(bgViewTop.mas_centerY);
         make.size.equalTo(CGSizeMake(180*APP_DELEGATE().autoSizeScaleX,28*APP_DELEGATE().autoSizeScaleY));
     }];
    
//    UILabel *titleLable2 = [[UILabel alloc] init];
//    titleLable2.numberOfLines = 0;
//    titleLable2.textAlignment = NSTextAlignmentRight;
//    titleLable2.font = viewFont3;
//    titleLable2.textColor = lvColor;
//    [bgViewTop addSubview:titleLable2];
//    titleLable2.text = @"正在进行";
//    
//    [titleLable2 makeConstraints:^(MASConstraintMaker *make)
//     {
//         make.right.equalTo(bgViewTop.mas_right).with.offset(-10);
//         make.centerY.equalTo(bgViewTop.mas_centerY);
//         make.size.equalTo(CGSizeMake(180*APP_DELEGATE().autoSizeScaleX,28*APP_DELEGATE().autoSizeScaleY));
//     }];
    
    UILabel *titleLable3 = [[UILabel alloc] init];
    titleLable3.numberOfLines = 0;
    titleLable3.textAlignment = NSTextAlignmentLeft;
    titleLable3.font = viewFont3;
    titleLable3.textColor = fontHuiColor;
    [cell.contentView addSubview:titleLable3];
    titleLable3.text = @"托运时间:2017-02-22";
    
    [titleLable3 makeConstraints:^(MASConstraintMaker *make)
     {
         make.left.equalTo(cell.contentView).with.offset(15*APP_DELEGATE().autoSizeScaleX);
         make.top.equalTo(cell.contentView).with.offset(32*APP_DELEGATE().autoSizeScaleY);
         make.size.equalTo(CGSizeMake(290*APP_DELEGATE().autoSizeScaleX,21*APP_DELEGATE().autoSizeScaleY));
     }];
    
    UILabel *titleLable4 = [[UILabel alloc] init];
    titleLable4.numberOfLines = 0;
    titleLable4.textAlignment = NSTextAlignmentLeft;
    titleLable4.font = viewFont3;
    titleLable4.textColor = fontHuiColor;
    [cell.contentView addSubview:titleLable4];
    titleLable4.text = @"运单号:202513837272";
    
    [titleLable4 makeConstraints:^(MASConstraintMaker *make)
     {
         make.left.equalTo(cell.contentView).with.offset(15*APP_DELEGATE().autoSizeScaleX);
         make.top.equalTo(cell.contentView).with.offset(52*APP_DELEGATE().autoSizeScaleY);
         make.size.equalTo(CGSizeMake(290*APP_DELEGATE().autoSizeScaleX,21*APP_DELEGATE().autoSizeScaleY));
     }];
    
    UILabel *titleLable5 = [[UILabel alloc] init];
    titleLable5.numberOfLines = 0;
    titleLable5.textAlignment = NSTextAlignmentLeft;
    titleLable5.font = viewFont3;
    titleLable5.textColor = fontHuiColor;
    [cell.contentView addSubview:titleLable5];
    titleLable5.text = @"货物编号:CKB22323233232";
    
    [titleLable5 makeConstraints:^(MASConstraintMaker *make)
     {
         make.left.equalTo(cell.contentView).with.offset(15*APP_DELEGATE().autoSizeScaleX);
         make.top.equalTo(cell.contentView).with.offset(73*APP_DELEGATE().autoSizeScaleY);
         make.size.equalTo(CGSizeMake(290*APP_DELEGATE().autoSizeScaleX,21*APP_DELEGATE().autoSizeScaleY));
     }];
    
    UILabel *titleLable6 = [[UILabel alloc] init];
    titleLable6.numberOfLines = 0;
    titleLable6.textAlignment = NSTextAlignmentLeft;
    titleLable6.font = viewFont3;
    titleLable6.textColor = fontHuiColor;
    [cell.contentView addSubview:titleLable6];
    titleLable6.text = @"开单门店:第一仓库";
    
    [titleLable6 makeConstraints:^(MASConstraintMaker *make)
     {
         make.left.equalTo(cell.contentView).with.offset(15*APP_DELEGATE().autoSizeScaleX);
         make.top.equalTo(cell.contentView).with.offset(94*APP_DELEGATE().autoSizeScaleY);
         make.size.equalTo(CGSizeMake(290*APP_DELEGATE().autoSizeScaleX,21*APP_DELEGATE().autoSizeScaleY));
     }];
    
    UILabel *titleLable7 = [[UILabel alloc] init];
    titleLable7.numberOfLines = 0;
    titleLable7.textAlignment = NSTextAlignmentLeft;
    titleLable7.font = viewFont3;
    titleLable7.textColor = fontHuiColor;
    [cell.contentView addSubview:titleLable7];
    titleLable7.text = @"发货人:小东";
    
    [titleLable7 makeConstraints:^(MASConstraintMaker *make)
     {
         make.left.equalTo(cell.contentView).with.offset(15*APP_DELEGATE().autoSizeScaleX);
         make.top.equalTo(cell.contentView).with.offset(115*APP_DELEGATE().autoSizeScaleY);
         make.size.equalTo(CGSizeMake(290*APP_DELEGATE().autoSizeScaleX,21*APP_DELEGATE().autoSizeScaleY));
     }];
    
    UILabel *titleLable8 = [[UILabel alloc] init];
    titleLable8.numberOfLines = 0;
    titleLable8.textAlignment = NSTextAlignmentLeft;
    titleLable8.font = viewFont3;
    titleLable8.textColor = fontHuiColor;
    [cell.contentView addSubview:titleLable8];
    titleLable8.text = @"收货人:小王";
    
    [titleLable8 makeConstraints:^(MASConstraintMaker *make)
     {
         make.left.equalTo(cell.contentView).with.offset(15*APP_DELEGATE().autoSizeScaleX);
         make.top.equalTo(cell.contentView).with.offset(136*APP_DELEGATE().autoSizeScaleY);
         make.size.equalTo(CGSizeMake(290*APP_DELEGATE().autoSizeScaleX,21*APP_DELEGATE().autoSizeScaleY));
     }];
    
    UILabel *titleLable9 = [[UILabel alloc] init];
    titleLable9.numberOfLines = 0;
    titleLable9.textAlignment = NSTextAlignmentLeft;
    titleLable9.font = viewFont3;
    titleLable9.textColor = fontHuiColor;
    [cell.contentView addSubview:titleLable9];
    titleLable9.text = @"收货电话:15882175162";
    
    [titleLable9 makeConstraints:^(MASConstraintMaker *make)
     {
         make.left.equalTo(cell.contentView).with.offset(15*APP_DELEGATE().autoSizeScaleX);
         make.top.equalTo(cell.contentView).with.offset(157*APP_DELEGATE().autoSizeScaleY);
         make.size.equalTo(CGSizeMake(290*APP_DELEGATE().autoSizeScaleX,21*APP_DELEGATE().autoSizeScaleY));
     }];
    
    UILabel *titleLable10 = [[UILabel alloc] init];
    titleLable10.numberOfLines = 0;
    titleLable10.textAlignment = NSTextAlignmentLeft;
    titleLable10.font = viewFont3;
    titleLable10.textColor = fontHuiColor;
    [cell.contentView addSubview:titleLable10];
    titleLable10.text = @"货物名称:沙发";
    
    [titleLable10 makeConstraints:^(MASConstraintMaker *make)
     {
         make.left.equalTo(cell.contentView).with.offset(15*APP_DELEGATE().autoSizeScaleX);
         make.top.equalTo(cell.contentView).with.offset(178*APP_DELEGATE().autoSizeScaleY);
         make.size.equalTo(CGSizeMake(290*APP_DELEGATE().autoSizeScaleX,21*APP_DELEGATE().autoSizeScaleY));
     }];
    
    UILabel *titleLable11 = [[UILabel alloc] init];
    titleLable11.numberOfLines = 0;
    titleLable11.textAlignment = NSTextAlignmentLeft;
    titleLable11.font = viewFont3;
    titleLable11.textColor = fontHuiColor;
    [cell.contentView addSubview:titleLable11];
    titleLable11.text = @"应收代收款:400.00";
    
    [titleLable11 makeConstraints:^(MASConstraintMaker *make)
     {
         make.left.equalTo(cell.contentView).with.offset(15*APP_DELEGATE().autoSizeScaleX);
         make.top.equalTo(cell.contentView).with.offset(199*APP_DELEGATE().autoSizeScaleY);
         make.size.equalTo(CGSizeMake(290*APP_DELEGATE().autoSizeScaleX,21*APP_DELEGATE().autoSizeScaleY));
     }];



    
    //取消收款
    UIButton *quxiaoBtn = [[UIButton alloc] init];
    [quxiaoBtn setTitle:@"取消收款" forState:UIControlStateNormal];
    [quxiaoBtn setTitle:@"取消收款" forState:UIControlStateHighlighted];
    [quxiaoBtn setTitleColor:fontColor forState:UIControlStateNormal];
    [quxiaoBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    [quxiaoBtn setBackgroundImage:[UIImage imageWithColor:[UIColor whiteColor] ] forState:UIControlStateNormal];
    [quxiaoBtn setBackgroundImage:[UIImage imageWithColor:lvColor] forState:UIControlStateHighlighted];
    [quxiaoBtn addTarget:self
                  action:@selector(quxiaoBtnClick:)
        forControlEvents:UIControlEventTouchUpInside];
    quxiaoBtn.titleLabel.font = viewFont3;
    [cell.contentView addSubview:quxiaoBtn];
    
    [quxiaoBtn makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(bgViewDown.mas_centerY);
        make.left.equalTo(bgViewDown).with.offset(170*APP_DELEGATE().autoSizeScaleX);
        make.size.equalTo(CGSizeMake(65*APP_DELEGATE().autoSizeScaleX, 21*APP_DELEGATE().autoSizeScaleY));
    }];
    LRViewBorderRadius(quxiaoBtn, 3, 1,  [UIColor colorWithRed:167/255.0 green:167/255.0 blue:167/255.0 alpha:1]);
    
    //收款
    UIButton *shoukuanBtn = [[UIButton alloc] init];
    [shoukuanBtn setTitle:@"收款" forState:UIControlStateNormal];
    [shoukuanBtn setTitle:@"收款" forState:UIControlStateHighlighted];
    [shoukuanBtn setTitleColor:fontColor forState:UIControlStateNormal];
    [shoukuanBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    [shoukuanBtn setBackgroundImage:[UIImage imageWithColor:[UIColor whiteColor] ] forState:UIControlStateNormal];
    [shoukuanBtn setBackgroundImage:[UIImage imageWithColor:lvColor] forState:UIControlStateHighlighted];
    [shoukuanBtn addTarget:self
                  action:@selector(shoukuanBtnClick:)
        forControlEvents:UIControlEventTouchUpInside];
    shoukuanBtn.titleLabel.font = viewFont3;
    [cell.contentView addSubview:shoukuanBtn];
    
    [shoukuanBtn makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(bgViewDown.mas_centerY);
        make.left.equalTo(quxiaoBtn.mas_right).with.offset(11*APP_DELEGATE().autoSizeScaleX);
        make.size.equalTo(CGSizeMake(65*APP_DELEGATE().autoSizeScaleX, 21*APP_DELEGATE().autoSizeScaleY));
    }];
    LRViewBorderRadius(shoukuanBtn, 3, 1,  [UIColor colorWithRed:167/255.0 green:167/255.0 blue:167/255.0 alpha:1]);
    
    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)segmentedControlChangedValue:(HMSegmentedControl *)segmentedControl {
    NSLog(@"Selected index %ld (via UIControlEventValueChanged)", (long)segmentedControl.selectedSegmentIndex);
}

- (void)quxiaoBtnClick:(UIButton *)sender
{
    NSLog(@"区销售款");
   
}

- (void)shoukuanBtnClick:(UIButton *)sender
{
    NSLog(@"收款");
    ReceiptViewController *vc = [[ReceiptViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
   
}



@end
