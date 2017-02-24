//
//  IQActionSheetPickerView.m
// https://github.com/hackiftekhar/IQActionSheetPickerView
// Copyright (c) 2013-14 Iftekhar Qurashi.
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.


#import "IQActionSheetPickerView.h"
#import <QuartzCore/QuartzCore.h>
#import "IQActionSheetViewController.h"

@interface IQActionSheetPickerView ()<UIPickerViewDataSource,UIPickerViewDelegate,UITableViewDelegate,UITableViewDataSource>
{
    UIPickerView    *_pickerView;
    UIDatePicker    *_datePicker;
    UITableView     *_tableView;
    UIToolbar       *_actionToolbar;
    UILabel         *_titleLabel;
    
    IQActionSheetViewController *_actionSheetController;
    
    NSMutableArray *addressSelectArray;
}

@end

@implementation IQActionSheetPickerView

@synthesize actionSheetPickerStyle  = _actionSheetPickerStyle;
@synthesize titlesForComponenets    = _titlesForComponenets;
@synthesize widthsForComponents     = _widthsForComponents;
@synthesize isRangePickerView       = _isRangePickerView;
@synthesize delegate                = _delegate;
@synthesize date                    = _date;
-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (instancetype)initWithTitle:(NSString *)title delegate:(id<IQActionSheetPickerViewDelegate>)delegate
{
    self = [super init];
    
    _banks = [[NSMutableArray alloc] init];
    addressSelectArray = [[NSMutableArray alloc] init];
    
    if (self)
    {
        //UIToolbar
        {
            _actionToolbar = [[UIToolbar alloc] init];
            _actionToolbar.barStyle = UIBarStyleDefault;
            [_actionToolbar sizeToFit];
            
            CGRect toolbarFrame = _actionToolbar.frame;
            toolbarFrame.size.height = 44;
            _actionToolbar.frame = toolbarFrame;
            
            NSMutableArray *items = [[NSMutableArray alloc] init];
            
            UIBarButtonItem *cancelButton = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStyleDone target:self action:@selector(pickerCancelClicked:)];
            [cancelButton setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:viewFont1,NSFontAttributeName, nil] forState:UIControlStateNormal];
            [cancelButton setTintColor:fontColor];
            [items addObject:cancelButton];
            
            //  Create a fake button to maintain flexibleSpace between cancelButton and titleLabel.(Otherwise the titleLabel will lean to the left）
            UIBarButtonItem *leftNilButton =[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
            [items addObject:leftNilButton];
            
            //  Create a title label to show on toolBar for the title you need.
            _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, _actionToolbar.frame.size.width-66-57.0-16, 44)];
            _titleLabel.font = titleFont1;
            _titleLabel.textColor = [UIColor blackColor];
            [_titleLabel setBackgroundColor:[UIColor clearColor]];
            [_titleLabel setTextAlignment:NSTextAlignmentCenter];
            [_titleLabel setText:title];
            [_titleLabel setAutoresizingMask:UIViewAutoresizingFlexibleWidth];
            
            UIBarButtonItem *titlebutton = [[UIBarButtonItem alloc] initWithCustomView:_titleLabel];
            titlebutton.enabled = NO;
            [items addObject:titlebutton];
            
            
            //  Create a fake button to maintain flexibleSpace between doneButton and nilButton. (Actually it moves done button to right side.
            UIBarButtonItem *rightNilButton =[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
            [items addObject:rightNilButton];
            
            //  Create a done button to show on keyboard to resign it. Adding a selector to resign it.
            UIBarButtonItem *doneButton =[[UIBarButtonItem alloc] initWithTitle:@"完成" style:UIBarButtonItemStyleDone target:self action:@selector(pickerDoneClicked:)];
            [doneButton setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:viewFont1,NSFontAttributeName, nil] forState:UIControlStateNormal];
            [doneButton setTintColor:fontColor];
            [items addObject:doneButton];
            
            //  Adding button to toolBar.
            [_actionToolbar setItems:items];
            
            [self addSubview:_actionToolbar];
        }
        
        //UIPickerView
        {
            _pickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_actionToolbar.frame) , CGRectGetWidth(_actionToolbar.frame), 216)];
            _pickerView.backgroundColor = [UIColor whiteColor];
            [_pickerView setShowsSelectionIndicator:YES];
            [_pickerView setDelegate:self];
            [_pickerView setDataSource:self];
            [self addSubview:_pickerView];
        }
        
        //UIDatePicker
        {
            _datePicker = [[UIDatePicker alloc] initWithFrame:_pickerView.frame];
            [_datePicker addTarget:self action:@selector(dateChanged:) forControlEvents:UIControlEventValueChanged];
            _datePicker.frame = _pickerView.frame;
            [_datePicker setDatePickerMode:UIDatePickerModeDate];
            [self addSubview:_datePicker];
        }
        
        //TableView
        {
            _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_actionToolbar.frame) , CGRectGetWidth(_actionToolbar.frame), 216)];
            _tableView.dataSource = self;
            _tableView.delegate = self;
            _tableView.backgroundColor = bgViewColor;
            _tableView.separatorStyle = UITableViewCellSelectionStyleNone;
            [self addSubview:_tableView];
            if (IsIOS7)
                _tableView.separatorInset = UIEdgeInsetsZero;
            
        }
        
        //Initial settings
        {
            self.backgroundColor = [UIColor colorWithWhite:1.0 alpha:0.8];
            [self setFrame:CGRectMake(0, 0, CGRectGetWidth(_pickerView.frame), CGRectGetMaxY(_pickerView.frame))];
            [self setActionSheetPickerStyle:IQActionSheetPickerStyleTextPicker];
            
            self.autoresizingMask = UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleWidth;
            _actionToolbar.autoresizingMask = UIViewAutoresizingFlexibleWidth;
            _pickerView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
            _datePicker.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        }
    }
    
    _delegate = delegate;
    
    return self;
}

-(void)setActionSheetPickerStyle:(IQActionSheetPickerStyle)actionSheetPickerStyle
{
    _actionSheetPickerStyle = actionSheetPickerStyle;
    
    switch (actionSheetPickerStyle) {
        case IQActionSheetPickerStyleTextPicker:
            [_pickerView setHidden:NO];
            [_datePicker setHidden:YES];
            [_tableView setHidden:YES];
            break;
        case IQActionSheetPickerStyleDatePicker:
            [_pickerView setHidden:YES];
            [_datePicker setHidden:NO];
            [_tableView setHidden:YES];
            [_datePicker setDatePickerMode:UIDatePickerModeDate];
            break;
        case IQActionSheetPickerStyleDateTimePicker:
            [_pickerView setHidden:YES];
            [_datePicker setHidden:NO];
            [_tableView setHidden:YES];
            [_datePicker setDatePickerMode:UIDatePickerModeDateAndTime];
            //                  [_datePicker setDatePickerMode:UIDatePickerModeTime];
            
            
            break;
        case IQActionSheetPickerStyleTimePicker:
            [_pickerView setHidden:YES];
            [_datePicker setHidden:NO];
            [_tableView setHidden:YES];
            [_datePicker setDatePickerMode:UIDatePickerModeTime];
            break;
        case IQActionSheetPickerStyleTablePicker:
            [_tableView setHidden:NO];
            [_pickerView setHidden:YES];
            [_datePicker setHidden:YES];
            break;
        default:
            break;
    }
}

/**
 *  Set Action Bar Color
 *
 *  @param barColor Custom color for toolBar
 */
-(void)setBarColor:(UIColor *)barColor{
    
    [_actionToolbar setBarTintColor:barColor];
}

/**
 *  Set Action Tool Bar Button Color
 *
 *  @param buttonColor Custom color for toolBar button
 */
-(void)setButtonColor:(UIColor *)buttonColor{
    
    [_actionToolbar setTintColor:buttonColor];
}


-(void)setBanks:(NSArray *)pbanks
{
    [_banks removeAllObjects];
    [_banks addObjectsFromArray:pbanks];
    [_tableView reloadData];
}

#pragma mark - Done/Cancel

-(void)pickerCancelClicked:(UIBarButtonItem*)barButton
{
    if ([self.delegate respondsToSelector:@selector(actionSheetPickerViewWillCancel:)])
    {
        [self.delegate actionSheetPickerViewWillCancel:self];
    }
    
    [self dismissWithCompletion:^{
        
        if ([self.delegate respondsToSelector:@selector(actionSheetPickerViewDidCancel:)])
        {
            [self.delegate actionSheetPickerViewDidCancel:self];
        }
    }];
}

-(void)pickerDoneClicked:(UIBarButtonItem*)barButton
{
    switch (_actionSheetPickerStyle)
    {
        case IQActionSheetPickerStyleTextPicker:
        {
            NSMutableArray *selectedTitles = [[NSMutableArray alloc] init];
            
            for (NSInteger component = 0; component<_pickerView.numberOfComponents; component++)
            {
                NSInteger row = [_pickerView selectedRowInComponent:component];
                
                if (row!= -1)
                {
                    [selectedTitles addObject:_titlesForComponenets[component][row]];
                }
                else
                {
                    [selectedTitles addObject:[NSNull null]];
                }
            }
            
            [self setSelectedTitles:selectedTitles];
            
            if ([self.delegate respondsToSelector:@selector(actionSheetPickerView:didSelectTitles:)])
            {
                [self.delegate actionSheetPickerView:self didSelectTitles:selectedTitles];
            }
            
        }
            break;
        case IQActionSheetPickerStyleDatePicker:
        case IQActionSheetPickerStyleDateTimePicker:
        case IQActionSheetPickerStyleTimePicker:
        {
            [self setDate:_datePicker.date];
            
            [self setSelectedTitles:@[_datePicker.date]];
            
            if ([self.delegate respondsToSelector:@selector(actionSheetPickerView:didSelectDate:)])
            {
                [self.delegate actionSheetPickerView:self didSelectDate:_datePicker.date];
            }
        }
            break;
        case IQActionSheetPickerStyleTablePicker:
        {
            if (addressSelectArray.count>0)
            {
                if ([self.delegate respondsToSelector:@selector(actionSheetPickerView:didSelectTable:)])
                {
                    NSDictionary *bank = [addressSelectArray objectAtIndex:0];
                    [self.delegate actionSheetPickerView:self didSelectTable:bank];
                }
            }
            else
            {
                [UIAlertView showAlert:@"请选择一条数据" cancelButton:@"确定"];
                return;
            }
            
        }
            break;
        default:
            break;
    }
    
    [self dismiss];
}

#pragma mark - IQActionSheetPickerStyleDatePicker / IQActionSheetPickerStyleDateTimePicker / IQActionSheetPickerStyleTimePicker

-(void)dateChanged:(UIDatePicker*)datePicker
{
    [self sendActionsForControlEvents:UIControlEventValueChanged];
}

-(void) setDate:(NSDate *)date
{
    [self setDate:date animated:NO];
}

-(void)setDate:(NSDate *)date animated:(BOOL)animated
{
    _date = date;
    if (_date != nil)   [_datePicker setDate:_date animated:animated];
}

-(void)setMinimumDate:(NSDate *)minimumDate
{
    _minimumDate = minimumDate;
    
    _datePicker.minimumDate = minimumDate;
}

-(void)setMaximumDate:(NSDate *)maximumDate
{
    _maximumDate = maximumDate;
    
    _datePicker.maximumDate = maximumDate;
}

#pragma mark - IQActionSheetPickerStyleTextPicker

-(void)reloadComponent:(NSInteger)component
{
    [_pickerView reloadComponent:component];
}

-(void)reloadAllComponents
{
    [_pickerView reloadAllComponents];
}



-(void)setSelectedTitles:(NSArray *)selectedTitles
{
    [self setSelectedTitles:selectedTitles animated:NO];
}


-(NSArray *)selectedTitles
{
    if (_actionSheetPickerStyle == IQActionSheetPickerStyleTextPicker)
    {
        NSMutableArray *selectedTitles = [[NSMutableArray alloc] init];
        
        NSUInteger totalComponent = _pickerView.numberOfComponents;
        
        for (NSInteger component = 0; component<totalComponent; component++)
        {
            NSInteger selectedRow = [_pickerView selectedRowInComponent:component];
            
            if (selectedRow == -1)
            {
                [selectedTitles addObject:[NSNull null]];
            }
            else
            {
                NSArray *items = _titlesForComponenets[component];
                
                if ([items count] > selectedRow)
                {
                    id selectTitle = items[selectedRow];
                    [selectedTitles addObject:selectTitle];
                }
                else
                {
                    [selectedTitles addObject:[NSNull null]];
                }
            }
        }
        
        return selectedTitles;
    }
    else
    {
        return nil;
    }
}

-(void)setSelectedTitles:(NSArray *)selectedTitles animated:(BOOL)animated
{
    if (_actionSheetPickerStyle == IQActionSheetPickerStyleTextPicker)
    {
        NSUInteger totalComponent = MIN(selectedTitles.count, _pickerView.numberOfComponents);
        
        for (NSInteger component = 0; component<totalComponent; component++)
        {
            NSArray *items = _titlesForComponenets[component];
            id selectTitle = selectedTitles[component];
            
            if ([items containsObject:selectTitle])
            {
                NSUInteger rowIndex = [items indexOfObject:selectTitle];
                [_pickerView selectRow:rowIndex inComponent:component animated:animated];
            }
        }
    }
}

-(void)selectIndexes:(NSArray *)indexes animated:(BOOL)animated
{
    if (_actionSheetPickerStyle == IQActionSheetPickerStyleTextPicker)
    {
        NSUInteger totalComponent = MIN(indexes.count, _pickerView.numberOfComponents);
        
        for (NSInteger component = 0; component<totalComponent; component++)
        {
            NSArray *items = _titlesForComponenets[component];
            NSUInteger selectIndex = [indexes[component] unsignedIntegerValue];
            
            if (selectIndex < items.count)
            {
                [_pickerView selectRow:selectIndex inComponent:component animated:animated];
            }
        }
    }
}


#pragma mark - UIPickerView delegate/dataSource

- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component
{
    //If having widths
    if (_widthsForComponents)
    {
        //If object isKind of NSNumber class
        if ([_widthsForComponents[component] isKindOfClass:[NSNumber class]])
        {
            CGFloat width = [_widthsForComponents[component] floatValue];
            
            //If width is 0, then calculating it's size.
            if (width == 0)
                return ((pickerView.bounds.size.width-20)-2*(_titlesForComponenets.count-1))/_titlesForComponenets.count;
            //Else returning it's width.
            else
                return width;
        }
        //Else calculating it's size.
        else
            return ((pickerView.bounds.size.width-20)-2*(_titlesForComponenets.count-1))/_titlesForComponenets.count;
    }
    //Else calculating it's size.
    else
    {
        return ((pickerView.bounds.size.width-20)-2*(_titlesForComponenets.count-1))/_titlesForComponenets.count;
    }
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return [_titlesForComponenets count];
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [_titlesForComponenets[component] count];
}

-(UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
{
    UILabel *labelText = [[UILabel alloc] init];
    labelText.font = [UIFont boldSystemFontOfSize:20.0];
    labelText.backgroundColor = [UIColor clearColor];
    [labelText setTextAlignment:NSTextAlignmentCenter];
    [labelText setText:_titlesForComponenets[component][row]];
    return labelText;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if (_isRangePickerView && pickerView.numberOfComponents == 3)
    {
        if (component == 0)
        {
            [pickerView selectRow:MAX([pickerView selectedRowInComponent:2], row) inComponent:2 animated:YES];
        }
        else if (component == 2)
        {
            [pickerView selectRow:MIN([pickerView selectedRowInComponent:0], row) inComponent:0 animated:YES];
        }
    }
    
    [self sendActionsForControlEvents:UIControlEventValueChanged];
    
    if ([self.delegate respondsToSelector:@selector(actionSheetPickerView:didChangeRow:inComponent:)]) {
        [self.delegate actionSheetPickerView:self didChangeRow:row inComponent:component];
    }
}

#pragma mark - tableView代理
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _banks.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40;
}

- (UITableViewCell*)tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath*)indexPath
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
    
    
    NSDictionary *bank = [_banks objectAtIndex:indexPath.row];
    
    
    UILabel *titleLable1 = [[UILabel alloc] initWithFrame:CGRectMake(0*APP_DELEGATE().autoSizeScaleX, 0, 320*APP_DELEGATE().autoSizeScaleX, 40*APP_DELEGATE().autoSizeScaleY)];
    titleLable1.numberOfLines = 0;
    titleLable1.textAlignment = NSTextAlignmentCenter;
    titleLable1.font = viewFont1;
    titleLable1.textColor = fontColor;
    titleLable1.text = [NSString stringWithFormat:@"%@",[bank objectForKey:@"name"]];
    
    [cell.contentView addSubview:titleLable1];
    
    // queding@2x
    UIImageView *gou = [[UIImageView alloc] initWithFrame:CGRectMake(280*APP_DELEGATE().autoSizeScaleX, 13, 20, 15)];
    gou.image = [UIImage imageNamed:@"queding"];
    [cell.contentView addSubview:gou];
    if ([addressSelectArray containsObject:bank])
    {
        gou.hidden = NO;
    }
    else
    {
        gou.hidden = YES;
    }
    
    
    UILabel *fgx = [[UILabel alloc] initWithFrame:CGRectMake(15*APP_DELEGATE().autoSizeScaleX, 39, 290*APP_DELEGATE().autoSizeScaleX, 1)];
    fgx.backgroundColor = [UIColor colorWithRed:234/255.0 green:234/255.0 blue:234/255.0 alpha:1];
    [cell.contentView addSubview:fgx];
    
    return  cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSDictionary *addressInfo = [_banks objectAtIndex:indexPath.row];
    if ([addressSelectArray containsObject:addressInfo])
    {
        [addressSelectArray removeObject:addressInfo];
        [_tableView reloadData];
    }
    else
    {
        [addressSelectArray removeAllObjects];
        [addressSelectArray addObject:addressInfo];
        [_tableView reloadData];
    }
    
}

#pragma mark - show/Hide

-(void)dismiss
{
    [_actionSheetController dismissWithCompletion:nil];
}

-(void)dismissWithCompletion:(void (^)(void))completion
{
    [_actionSheetController dismissWithCompletion:completion];
}

-(void)show
{
    [self showWithCompletion:nil];
}

-(void)showWithCompletion:(void (^)(void))completion
{
    [_pickerView reloadAllComponents];
    
    _actionSheetController = [[IQActionSheetViewController alloc] init];
    [_actionSheetController showPickerView:self completion:completion];
}


@end

