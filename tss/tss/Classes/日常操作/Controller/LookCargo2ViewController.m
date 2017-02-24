//
//  LookCargo2ViewController.m
//  tss
//
//  Created by admin on 17/2/20.
//  Copyright © 2017年 com.yunlaila. All rights reserved.
//

#import "LookCargo2ViewController.h"

@interface LookCargo2ViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    
}

@property (nonatomic ,strong) UITableView *tableView;
@property (nonatomic ,strong) HMSegmentedControl *segmentedControl;
@end

@implementation LookCargo2ViewController

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
    self.title = @"查看货量详情";
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
        _segmentedControl = [[HMSegmentedControl alloc] initWithSectionTitles:@[@"线路货量",  @"门店货量"]];
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
        make.top.equalTo(self.view).with.offset(50*APP_DELEGATE().autoSizeScaleY);
        make.left.equalTo(self.view).with.offset(0);
        make.bottom.equalTo(self.view).with.offset(0*APP_DELEGATE().autoSizeScaleY);
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
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 30*APP_DELEGATE().autoSizeScaleY;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(0*APP_DELEGATE().autoSizeScaleX, 0, 320*APP_DELEGATE().autoSizeScaleX, 30*APP_DELEGATE().autoSizeScaleY)];
    bgView.backgroundColor = [UIColor colorWithRed:214/255.0 green:214/255.0 blue:214/255.0 alpha:1];
    
    
    UILabel *titleLable1 = [[UILabel alloc] init];
    titleLable1.numberOfLines = 0;
    titleLable1.textAlignment = NSTextAlignmentCenter;
    titleLable1.font = viewFont3;
    titleLable1.textColor = fontColor;
    [bgView addSubview:titleLable1];
    titleLable1.text = @"日期";
    
    [titleLable1 makeConstraints:^(MASConstraintMaker *make)
     {
         make.left.equalTo(bgView).with.offset(0);
         make.width.equalTo(bgView).multipliedBy(0.3333f);
         make.centerY.equalTo(bgView.mas_centerY);
     }];
    
    UILabel *titleLable2 = [[UILabel alloc] init];
    titleLable2.numberOfLines = 0;
    titleLable2.textAlignment = NSTextAlignmentCenter;
    titleLable2.font = viewFont3;
    titleLable2.textColor = fontColor;
    [bgView addSubview:titleLable2];
    titleLable2.text = @"门店";
    
    [titleLable2 makeConstraints:^(MASConstraintMaker *make)
     {
         make.left.equalTo(titleLable1.mas_right).with.offset(0);
         make.width.equalTo(bgView).multipliedBy(0.3333f);
         make.centerY.equalTo(bgView.mas_centerY);
     }];
    
    UILabel *titleLable3 = [[UILabel alloc] init];
    titleLable3.numberOfLines = 0;
    titleLable3.textAlignment = NSTextAlignmentCenter;
    titleLable3.font = viewFont3;
    titleLable3.textColor = fontColor;
    [bgView addSubview:titleLable3];
    titleLable3.text = @"货量";
    
    [titleLable3 makeConstraints:^(MASConstraintMaker *make)
     {
         make.left.equalTo(titleLable2.mas_right).with.offset(0);
         make.width.equalTo(bgView).multipliedBy(0.3333f);
         make.centerY.equalTo(bgView.mas_centerY);
     }];
    
    
    return bgView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 46*APP_DELEGATE().autoSizeScaleY;
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
    
    UILabel *titleLable1 = [[UILabel alloc] init];
    titleLable1.numberOfLines = 0;
    titleLable1.textAlignment = NSTextAlignmentCenter;
    titleLable1.font = viewFont3;
    titleLable1.textColor = fontColor;
    [cell.contentView addSubview:titleLable1];
    titleLable1.text = @"日期";
    
    [titleLable1 makeConstraints:^(MASConstraintMaker *make)
     {
         make.left.equalTo(cell.contentView).with.offset(0);
         make.width.equalTo(cell.contentView).multipliedBy(0.3333f);
         make.centerY.equalTo(cell.contentView.mas_centerY);
     }];
    
    UILabel *titleLable2 = [[UILabel alloc] init];
    titleLable2.numberOfLines = 0;
    titleLable2.textAlignment = NSTextAlignmentCenter;
    titleLable2.font = viewFont3;
    titleLable2.textColor = fontColor;
    [cell.contentView addSubview:titleLable2];
    titleLable2.text = @"门店";
    
    [titleLable2 makeConstraints:^(MASConstraintMaker *make)
     {
         make.left.equalTo(titleLable1.mas_right).with.offset(0);
         make.width.equalTo(cell.contentView).multipliedBy(0.3333f);
         make.centerY.equalTo(cell.contentView.mas_centerY);
     }];
    
    UILabel *titleLable3 = [[UILabel alloc] init];
    titleLable3.numberOfLines = 0;
    titleLable3.textAlignment = NSTextAlignmentCenter;
    titleLable3.font = viewFont3;
    titleLable3.textColor = fontColor;
    [cell.contentView addSubview:titleLable3];
    titleLable3.text = @"货量";
    
    [titleLable3 makeConstraints:^(MASConstraintMaker *make)
     {
         make.left.equalTo(titleLable2.mas_right).with.offset(0);
         make.width.equalTo(cell.contentView).multipliedBy(0.3333f);
         make.centerY.equalTo(cell.contentView.mas_centerY);
     }];
    
    UIView *fgx1 = [[UIView alloc] init];
    fgx1.backgroundColor = bgViewColor;
    [cell.contentView addSubview:fgx1];
    
    [fgx1 makeConstraints:^(MASConstraintMaker *make)
     {
         make.left.equalTo(cell.contentView.mas_left).with.offset(0);
         make.bottom.equalTo(cell.contentView).with.offset(-1);
         make.size.equalTo(CGSizeMake(320*APP_DELEGATE().autoSizeScaleX, 1));
     }];
    
    UIView *fgx2 = [[UIView alloc] init];
    fgx2.backgroundColor = bgViewColor;
    [cell.contentView addSubview:fgx2];
    
    [fgx2 makeConstraints:^(MASConstraintMaker *make)
     {
         make.left.equalTo(titleLable1.right).with.offset(1);
         make.size.equalTo(CGSizeMake(1, 46*APP_DELEGATE().autoSizeScaleY));
     }];
    
    UIView *fgx3 = [[UIView alloc] init];
    fgx3.backgroundColor = bgViewColor;
    [cell.contentView addSubview:fgx3];
    
    [fgx3 makeConstraints:^(MASConstraintMaker *make)
     {
         make.left.equalTo(titleLable2.right).with.offset(1);
         make.size.equalTo(CGSizeMake(1, 46*APP_DELEGATE().autoSizeScaleY));
     }];
    return cell;
}
- (void)segmentedControlChangedValue:(HMSegmentedControl *)segmentedControl {
    NSLog(@"Selected index %ld (via UIControlEventValueChanged)", (long)segmentedControl.selectedSegmentIndex);
}
@end
