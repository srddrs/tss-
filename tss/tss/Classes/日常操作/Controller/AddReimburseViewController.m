//
//  AddReimburseViewController.m
//  tss
//
//  Created by admin on 17/2/20.
//  Copyright © 2017年 com.yunlaila. All rights reserved.
//

#import "AddReimburseViewController.h"

@interface AddReimburseViewController ()<UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate,UIActionSheetDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>
{
    NSMutableArray *photos;
}
@property (nonatomic ,strong) UITableView *tableView;

@property (nonatomic, strong) UITextField *baoxiaokemuText;  //报销科目
@property (nonatomic, strong) UITextField *dangqianliuchenText;  //当前流程
@property (nonatomic, strong) UITextField *xiayibuText;  //下一步
@property (nonatomic, strong) UITextField *chulirenText;  //处理人
@property (nonatomic, strong) UITextField *baoxiaojineText;  //报销金额
@property (nonatomic, strong) UITextField *beizhuText;  //备注
@end

@implementation AddReimburseViewController
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

- (UITextField *)chulirenText
{
    if (!_chulirenText)
    {
        
        _chulirenText = [[UITextField alloc] init];
        _chulirenText.backgroundColor = [UIColor whiteColor];
        _chulirenText.clearButtonMode = UITextFieldViewModeWhileEditing;
        _chulirenText.borderStyle = UITextBorderStyleNone;
        _chulirenText.delegate = self;
        _chulirenText.placeholder = @"请选择";
        _chulirenText.returnKeyType = UIReturnKeyDone;
        _chulirenText.keyboardType = UIKeyboardTypeDefault;
        _chulirenText.font = viewFont3;
        _chulirenText.textColor = lvColor;
        _chulirenText.enabled = NO;
    }
    return _chulirenText;
}

- (UITextField *)baoxiaojineText
{
    if (!_baoxiaojineText)
    {
        
        _baoxiaojineText = [[UITextField alloc] init];
        _baoxiaojineText.backgroundColor = [UIColor whiteColor];
        _baoxiaojineText.clearButtonMode = UITextFieldViewModeWhileEditing;
        _baoxiaojineText.borderStyle = UITextBorderStyleNone;
        _baoxiaojineText.delegate = self;
        _baoxiaojineText.placeholder = @"请输入报销金额";
        _baoxiaojineText.returnKeyType = UIReturnKeyDone;
        _baoxiaojineText.keyboardType = UIKeyboardTypeDefault;
        _baoxiaojineText.font = viewFont3;
        _baoxiaojineText.textColor = lvColor;
    }
    return _baoxiaojineText;
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
        _beizhuText.placeholder = @"请输入备注";
        _beizhuText.returnKeyType = UIReturnKeyDone;
        _beizhuText.keyboardType = UIKeyboardTypeDefault;
        _beizhuText.font = viewFont3;
        _beizhuText.textColor = lvColor;
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
    return 8;
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
    if(indexPath.row==7)
    {
        return 100*APP_DELEGATE().autoSizeScaleY;
    }
    else if(indexPath.row==6)
    {
        return 125*APP_DELEGATE().autoSizeScaleY;
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
             make.size.equalTo(CGSizeMake(55*APP_DELEGATE().autoSizeScaleX,46*APP_DELEGATE().autoSizeScaleY));
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
             make.size.equalTo(CGSizeMake(55*APP_DELEGATE().autoSizeScaleX,46*APP_DELEGATE().autoSizeScaleY));
         }];
        
        
        [cell.contentView addSubview:self.dangqianliuchenText];
        [self.dangqianliuchenText makeConstraints:^(MASConstraintMaker *make)
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
             make.size.equalTo(CGSizeMake(55*APP_DELEGATE().autoSizeScaleX,46*APP_DELEGATE().autoSizeScaleY));
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
             make.size.equalTo(CGSizeMake(55*APP_DELEGATE().autoSizeScaleX,46*APP_DELEGATE().autoSizeScaleY));
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
        titleLable.text = @"处理人";
        
        [titleLable makeConstraints:^(MASConstraintMaker *make)
         {
             make.left.equalTo(cell.contentView).with.offset(15*APP_DELEGATE().autoSizeScaleX);
             make.size.equalTo(CGSizeMake(55*APP_DELEGATE().autoSizeScaleX,46*APP_DELEGATE().autoSizeScaleY));
         }];
        
        
        [cell.contentView addSubview:self.chulirenText];
        [self.chulirenText makeConstraints:^(MASConstraintMaker *make)
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
        titleLable.text = @"报销金额";
        
        [titleLable makeConstraints:^(MASConstraintMaker *make)
         {
             make.left.equalTo(cell.contentView).with.offset(15*APP_DELEGATE().autoSizeScaleX);
             make.size.equalTo(CGSizeMake(55*APP_DELEGATE().autoSizeScaleX,46*APP_DELEGATE().autoSizeScaleY));
         }];
        
        
        [cell.contentView addSubview:self.baoxiaojineText];
        [self.baoxiaojineText makeConstraints:^(MASConstraintMaker *make)
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
        titleLable.text = @"备注";
        
        [titleLable makeConstraints:^(MASConstraintMaker *make)
         {
             make.left.equalTo(cell.contentView).with.offset(15*APP_DELEGATE().autoSizeScaleX);
             make.size.equalTo(CGSizeMake(55*APP_DELEGATE().autoSizeScaleX,46*APP_DELEGATE().autoSizeScaleY));
         }];
        
        
        [cell.contentView addSubview:self.beizhuText];
        [self.beizhuText makeConstraints:^(MASConstraintMaker *make)
         {
             make.left.equalTo(titleLable.mas_right).with.offset(5*APP_DELEGATE().autoSizeScaleX);
             make.centerY.equalTo(cell.contentView.mas_centerY);
             make.size.equalTo(CGSizeMake(215*APP_DELEGATE().autoSizeScaleX,40*APP_DELEGATE().autoSizeScaleY));
         }];
    }
    else  if(indexPath.row==6)
    {
        fgx1.hidden = YES;
        UILabel *titleLable = [[UILabel alloc] init];
        titleLable.numberOfLines = 0;
        titleLable.textAlignment = NSTextAlignmentLeft;
        titleLable.font = viewFont3;
        titleLable.textColor = fontColor;
        [cell.contentView addSubview:titleLable];
        titleLable.text = @"上传图片凭证(最多5张)";
        
        [titleLable makeConstraints:^(MASConstraintMaker *make)
         {
             make.left.equalTo(cell.contentView).with.offset(15*APP_DELEGATE().autoSizeScaleX);
             make.size.equalTo(CGSizeMake(200*APP_DELEGATE().autoSizeScaleX,46*APP_DELEGATE().autoSizeScaleY));
         }];
        
        int leftValue = 10*APP_DELEGATE().autoSizeScaleX;
        int topValue = 45*APP_DELEGATE().autoSizeScaleY;
        
        int width = 50*APP_DELEGATE().autoSizeScaleX;
        int heigh = 50*APP_DELEGATE().autoSizeScaleY;
        
        for(int i = 0; i < photos.count ;i++)
        {
            NSString *filePath = [photos objectAtIndex:i];
            UIImage *image = [UIImage imageWithContentsOfFile:filePath];
            UIImageView *tupianView = [[UIImageView alloc] init];
            tupianView.image = image;

            tupianView.tag = i+1000;
            [cell.contentView addSubview:tupianView];
            
            tupianView.userInteractionEnabled = YES;
            UITapGestureRecognizer *tapGr = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageButtonClick:)];
            tapGr.cancelsTouchesInView = YES;
            [tupianView addGestureRecognizer:tapGr];
            
            
            [tupianView makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(cell.contentView).with.offset(leftValue);
                make.top.equalTo(cell.contentView).with.offset(topValue);
                make.size.equalTo(CGSizeMake(width, heigh));
            }];
            
            leftValue = leftValue + 60*APP_DELEGATE().autoSizeScaleX;
        }
        if (photos.count<5)
        {
            UIButton *moneyButton = [[UIButton alloc] init];
            [moneyButton setBackgroundImage:[UIImage imageWithName:@"bx_jiatupian"] forState:UIControlStateNormal];
            [moneyButton setBackgroundImage:[UIImage imageWithName:@"bx_jiatupian"] forState:UIControlStateHighlighted];
            [moneyButton addTarget:self
                            action:@selector(moneyButtonClick:)
                  forControlEvents:UIControlEventTouchUpInside];
            moneyButton.tag = 999;
            [cell.contentView addSubview:moneyButton];
            
            [moneyButton makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(cell.contentView).with.offset(leftValue);
                make.top.equalTo(cell.contentView).with.offset(topValue);
                make.size.equalTo(CGSizeMake(width, heigh));
            }];

        }

    }
    else if(indexPath.row==7)
    {
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

- (void)imageButtonClick:(UITapGestureRecognizer*)tapGr
{
     NSLog(@"看大图和取消");
    UIActionSheet *actionSheet = [[UIActionSheet alloc] init];
    [actionSheet addButtonWithTitle:@"看大图"];
    [actionSheet addButtonWithTitle:@"删除"];
    [actionSheet addButtonWithTitle:@"取消"];
    actionSheet.destructiveButtonIndex = actionSheet.numberOfButtons - 1;
    actionSheet.tag = tapGr.view.tag;
    actionSheet.delegate = self;
    [actionSheet showInView:self.view];
}
- (void)moneyButtonClick:(UIButton *) sender
{
    NSLog(@"照片上传");
    UIActionSheet *actionSheet = [[UIActionSheet alloc] init];
    [actionSheet addButtonWithTitle:@"拍照"];
    [actionSheet addButtonWithTitle:@"从相册选择"];
    [actionSheet addButtonWithTitle:@"取消"];
    actionSheet.destructiveButtonIndex = actionSheet.numberOfButtons - 1;
    actionSheet.tag = 999;
    actionSheet.delegate = self;
    [actionSheet showInView:self.view];
}

- (void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    if (actionSheet.tag==999)
    {
        UIImagePickerController *pickVC = [[UIImagePickerController alloc] init];
        pickVC.delegate = self;
        if(buttonIndex==0)
        {
            BOOL cameraAvailable = [UIImagePickerController isCameraDeviceAvailable:
                                    UIImagePickerControllerCameraDeviceRear];
            
            if (cameraAvailable==YES) {
                pickVC.sourceType = UIImagePickerControllerSourceTypeCamera;
                [self presentViewController:pickVC animated:YES completion:^{
                    
                }];
            }
            else
            {
                [UIAlertView showAlert:@"沒有摄像头" cancelButton:@"知道了"];
            }
            
        }
        else if(buttonIndex==1)
        {
            pickVC.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
            [self presentViewController:pickVC animated:YES completion:^{
                
            }];
        }

    }
    //看大图
    else
    {
        if(buttonIndex==0)
        {
            NSLog(@"看大图");
            NSMutableArray *shujus = [[NSMutableArray alloc] init];
            MJPhoto *photo = [[MJPhoto alloc] init];
            NSString *filePath = [photos objectAtIndex:actionSheet.tag-1000];
            photo.image = [UIImage imageWithContentsOfFile:filePath];

   
            
            UITableViewCell *cell = [self.tableView  cellForRowAtIndexPath:[NSIndexPath indexPathForRow:6 inSection:0]];
            
            for (UIImageView *view in [cell.contentView subviews])
            {
                if (view.tag==actionSheet.tag)
                {
                     photo.srcImageView = view; // 来源于哪个UIImageView
                    [shujus addObject:photo];
                }
            }
            
            // 2.显示相册
            MJPhotoBrowser *browser = [[MJPhotoBrowser alloc] init];
            browser.currentPhotoIndex = actionSheet.tag; // 弹出相册时显示的第一张图片是？
            browser.photos = shujus; // 设置所有的图片
            [browser show];
            
        }
        else if(buttonIndex==1)
        {
            NSLog(@"删除");
            [photos removeObjectAtIndex:actionSheet.tag-1000];
            [self.tableView reloadData];
        }

    }
    
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    NSString *type = [info objectForKey:UIImagePickerControllerMediaType];
    if ([type isEqualToString:@"public.image"]) {
        UIImage* image=[info objectForKey:UIImagePickerControllerOriginalImage];
//        UIImageOrientation imageOrientation=image.imageOrientation;
        // 原始图片可以根据照相时的角度来显示，但UIImage无法判定，于是出现获取的图片会向左转９０度的现象。
        // 以下为调整图片角度的部分
        UIGraphicsBeginImageContext(image.size);
        [image drawInRect:CGRectMake(0, 0, image.size.width, image.size.height)];
        image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
//         [photos addObject:image];
//        [_tableView reloadData];
        // 调整图片角度完毕
        //        }
        [picker dismissViewControllerAnimated:NO completion:^{
            
            // 可以在上传时使用当前的系统事件作为文件名
            NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
            formatter.dateFormat = @"yyyyMMddHHmmss";
            NSString *str = [formatter stringFromDate:[NSDate date]];
            NSString *fileName = [NSString stringWithFormat:@"%@.png", str];
            
            NSData *imageData = UIImageJPEGRepresentation(image, 0.1);
            NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES);
            NSString *filePath = [[paths objectAtIndex:0] stringByAppendingPathComponent:fileName];   // 保存文件的名称
            [imageData writeToFile:filePath atomically:YES];
            [photos addObject:filePath];
            [_tableView reloadData];
            //            NSMutableDictionary *paramDic1 = [[NSMutableDictionary alloc] initWithObjectsAndKeys:
            //                                              filePath,@"file",
            //                                              nil];
            //
            //            [self createRequest:uploadURL param:paramDic1 withRequestType:uploadType];
            
        }];
    }
    
    
}

@end
