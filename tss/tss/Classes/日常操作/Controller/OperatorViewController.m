//
//  OperatorViewController.m
//  tss
//
//  Created by admin on 17/2/14.
//  Copyright © 2017年 com.yunlaila. All rights reserved.
//

#import "OperatorViewController.h"
#import "SDCycleScrollView.h"
#import "ImageTextButton.h"
#import "SendCarViewController.h"
#import "LookCargo1ViewController.h"
#import "ReimburseViewController.h"
#import "CarManageViewController.h"
#import "DriverManageViewController.h"
#import "StevedoreManageViewController.h"
#import "AgencyViewController.h"
#import "Rotate1ViewController.h"
@interface OperatorViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,SDCycleScrollViewDelegate>
{
   
    NSMutableArray *imagesURLStrings;
    NSMutableArray *anniuDatas;
}

@property (nonatomic,strong) UICollectionView *collectionView;
@property (nonatomic ,strong) SDCycleScrollView *cycleScrollView;
@end

@implementation OperatorViewController
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        imagesURLStrings = [[NSMutableArray alloc] init];
        [imagesURLStrings removeAllObjects];
          [imagesURLStrings addObject:[UIImage imageNamed:@"zhuye_banner2"]];
          [imagesURLStrings addObject:[UIImage imageNamed:@"zhuye_banner1"]];
          [imagesURLStrings addObject:[UIImage imageNamed:@"zhuye_banner3"]];
       
        
        anniuDatas = [[NSMutableArray alloc] init];
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
        NSDictionary *threedict7 = @{
                                     @"orderId" :[NSString stringWithFormat:@"%d",7] ,
                                     @"name" :@"车辆管理" ,
                                     @"image" : @"rccz_cheliangguanli",
                                     };
        NSDictionary *threedict8 = @{
                                     @"orderId" :[NSString stringWithFormat:@"%d",8] ,
                                     @"name" :@"司机管理" ,
                                     @"image" : @"rccz_sijiguanli",
                                     };
        NSDictionary *threedict9 = @{
                                     @"orderId" :[NSString stringWithFormat:@"%d",9] ,
                                     @"name" :@"装卸工管理" ,
                                     @"image" : @"rccz_zhuangxiegong",
                                     };
        NSDictionary *threedict10 = @{
                                     @"orderId" :[NSString stringWithFormat:@"%d",10] ,
                                     @"name" :@"转货运费" ,
                                     @"image" : @"rccz_feiyongqueren",
                                     };
        
        
        [anniuDatas addObject:threedict1];
        [anniuDatas addObject:threedict2];
        [anniuDatas addObject:threedict3];
        [anniuDatas addObject:threedict4];
        [anniuDatas addObject:threedict5];
         [anniuDatas addObject:threedict6];
        [anniuDatas addObject:threedict7];
        [anniuDatas addObject:threedict8];
        [anniuDatas addObject:threedict9];
        [anniuDatas addObject:threedict10];

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
   
}

- (void)initView
{
    [self.view addSubview:self.collectionView];
    
    [_collectionView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).with.offset(0);
        make.left.equalTo(self.view).with.offset(0);
        make.bottom.equalTo(self.view).with.offset(0);
        make.right.equalTo(self.view).with.offset(0);
    }];
    
    [_collectionView reloadData];
}

- (UICollectionView *)collectionView
{
    if(!_collectionView)
    {
        UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc] init];
        [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
        flowLayout.headerReferenceSize = CGSizeMake(320*APP_DELEGATE().autoSizeScaleX,30*APP_DELEGATE().autoSizeScaleY);//头部
        
        _collectionView  = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
        _collectionView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"CollectionViewIdentifier"];
        [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"ReusableView"];
        [_collectionView setBackgroundColor:bgViewColor];
        _collectionView.alwaysBounceVertical = YES;
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
    }
    return _collectionView;
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
        
        //    [imagesURLStrings addObject:[UIImage imageNamed:@"zhuye_banner2"]];
        //    [imagesURLStrings addObject:[UIImage imageNamed:@"zhuye_banner1"]];
        //    [imagesURLStrings addObject:[UIImage imageNamed:@"zhuye_banner3"]];
        _cycleScrollView.localizationImagesGroup = imagesURLStrings;
        _cycleScrollView.autoScrollTimeInterval = 4;
        
    }
    return _cycleScrollView;
}


#pragma mark - collectionView代理
//定义每个UICollectionView 的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0)
    {
        return CGSizeMake(320*APP_DELEGATE().autoSizeScaleX, 100*APP_DELEGATE().autoSizeScaleY);
    }
    else
    {
       return CGSizeMake(79*APP_DELEGATE().autoSizeScaleX, 79*APP_DELEGATE().autoSizeScaleY);
    }
   
}

//定义每个UICollectionView 的 margin
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(1, 1, 1, 1);
    
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    if (section==0)
    {
        return CGSizeMake(0, 0);
    }
    else
    {
        return CGSizeMake(320*APP_DELEGATE().autoSizeScaleX, 40*APP_DELEGATE().autoSizeScaleY);
    }
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section
{
    return CGSizeMake(0, 0);
}

#pragma mark - collection数据源代理
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 2;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (section==0)
    {
        return 1;
    }
    else
    {
        return [anniuDatas count];
    }
    
}

//头部显示的内容
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:
                                            UICollectionElementKindSectionHeader withReuseIdentifier:@"ReusableView" forIndexPath:indexPath];
    
    UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(0*APP_DELEGATE().autoSizeScaleX, 0, 320*APP_DELEGATE().autoSizeScaleX, 40*APP_DELEGATE().autoSizeScaleY)];
    bgView.backgroundColor = bgViewColor;
    
    UIView *baiView = [[UIView alloc] init];
    baiView.backgroundColor = [UIColor whiteColor];
    [bgView addSubview:baiView];
    
    [baiView makeConstraints:^(MASConstraintMaker *make)
     {
         make.top.equalTo(bgView).with.offset(10);
         make.left.equalTo(bgView).with.offset(0);
         make.bottom.equalTo(bgView).with.offset(0);
         make.right.equalTo(bgView).with.offset(0);
     }];
    
    
    UILabel *titleLable1 = [[UILabel alloc] init];
    titleLable1.numberOfLines = 0;
    titleLable1.textAlignment = NSTextAlignmentLeft;
    titleLable1.font = viewFont3;
    titleLable1.textColor = fontColor;
    titleLable1.backgroundColor = [UIColor whiteColor];
    titleLable1.text = @"常用应用";
    [baiView addSubview:titleLable1];
    
    [titleLable1 makeConstraints:^(MASConstraintMaker *make)
     {
         make.centerY.equalTo(baiView.mas_centerY);
         make.left.equalTo(baiView.mas_left).with.offset(10);
     }];

    [headerView addSubview:bgView];//头部广告栏
    return headerView;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    UICollectionViewCell* cell =  [collectionView dequeueReusableCellWithReuseIdentifier:@"CollectionViewIdentifier" forIndexPath:indexPath];
    
    for (UIView* view in [cell.contentView subviews])
    {
        [view removeFromSuperview];
    }
    
    cell.contentView.backgroundColor = [UIColor whiteColor];
    
    if (indexPath.section==0)
    {
        [cell.contentView addSubview:self.cycleScrollView];
        [self.cycleScrollView makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(cell.contentView);
            make.size.equalTo(cell.contentView);
        }];
    }
    else
    {

        cell.contentView.backgroundColor = bgViewColor;
        
        NSDictionary *info = [anniuDatas objectAtIndex:indexPath.row];
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",[info objectForKey:@"image"]]];
        NSString *title = [NSString stringWithFormat:@"%@",[info objectForKey:@"name"]];
        
        ImageTextButton *shouhuoButton = [[ImageTextButton alloc] initWithFrame:CGRectMake(1, 1, 78*APP_DELEGATE().autoSizeScaleX, 78*APP_DELEGATE().autoSizeScaleY)
                                                                          image:image
                                                                          title:title];
        shouhuoButton.tag = indexPath.row;
        shouhuoButton.buttonTitleWithImageAlignment = UIButtonTitleWithImageAlignmentUp;
        [shouhuoButton addTarget:self action:@selector(anniuClick:) forControlEvents:UIControlEventTouchUpInside];
        [cell.contentView addSubview:shouhuoButton];
    }
    
    
    
    
    return cell;
}

- (void)anniuClick:(UIButton *) sender
{
    NSDictionary *info = [anniuDatas objectAtIndex:sender.tag];
    NSLog(@"AAA:%@",info);
    
    if ([[info objectForKey:@"orderId"] intValue]==1)
    {
        LookCargo1ViewController *vc = [[LookCargo1ViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
    else if ([[info objectForKey:@"orderId"] intValue]==4)
    {
        AgencyViewController *vc = [[AgencyViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }

    
    else if ([[info objectForKey:@"orderId"] intValue]==5)
    {
        SendCarViewController *vc = [[SendCarViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
    else if([[info objectForKey:@"orderId"] intValue]==6)
    {
        ReimburseViewController *vc = [[ReimburseViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
    else if([[info objectForKey:@"orderId"] intValue]==7)
    {
        CarManageViewController *vc = [[CarManageViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
    else if([[info objectForKey:@"orderId"] intValue]==8)
    {
        DriverManageViewController *vc = [[DriverManageViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
    else if([[info objectForKey:@"orderId"] intValue]==9)
    {
        StevedoreManageViewController *vc = [[StevedoreManageViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
    else if([[info objectForKey:@"orderId"] intValue]==10)
    {
        Rotate1ViewController *vc = [[Rotate1ViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }

    
        
 
}

-(void)buttonClick:(UIButton *)sender
{
//    NSLog(@"点击了网络：%@",[wangluoDatas objectAtIndex:sender.tag-10000]);
}


@end
