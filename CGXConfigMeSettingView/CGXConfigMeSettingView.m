//
//  CGXConfigMeSettingView.m
//  CGXConfigMeSettingView
//
//  Created by 曹贵鑫 on 2017/11/20.
//  Copyright © 2017年 曹贵鑫. All rights reserved.
//

#import "CGXConfigMeSettingView.h"
#import "CGXConfigMeSettingCell.h"
#import "CGXConfigMeSettingManager.h"
#import "CGXConfigMeSettingModel.h"
#import "CGXConfigMeSettingItemModel.h"
#define CGXConfigMeSettingBG   [UIColor colorWithWhite:0.93 alpha:1]

@interface CGXConfigMeSettingView ()<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate>
{
    CGRect rect;
    CGFloat viewW;
    CGFloat viewH;
    NSIndexPath *selectIndexPath;
}


@end

@implementation CGXConfigMeSettingView

- (instancetype)initWithFrame:(CGRect)frame WithManager:(CGXConfigMeSettingManager *)manager
{
    self = [super initWithFrame:frame];
    if (self) {
        rect = frame;
        viewW = frame.size.width;
        viewH = frame.size.height;
        self.manager = manager;
        
        [self loadTableView];
        
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(adjustFrame:) name:UIKeyboardWillShowNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(hideKeyboard:) name:UIKeyboardWillHideNotification object:nil];
        
        
        UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(keyboardHide)];
        //设置成NO表示当前控件响应后会传播到其他控件上，默认为YES。
        tapGestureRecognizer.cancelsTouchesInView = NO;
        //将触摸事件添加到view上
        [self.tableView addGestureRecognizer:tapGestureRecognizer];
        
    }
    return self;
}
- (void)keyboardHide
{
    [[[UIApplication sharedApplication] keyWindow] endEditing:YES];
}
- (void)hideKeyboard:(NSNotification *)notification{
    self.tableView.contentInset = UIEdgeInsetsZero;
}
- (void)adjustFrame:(NSNotification *)notification{
    NSDictionary *info = [notification userInfo];
    CGSize keyboardSize = [[info objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].size;
    
    int y = keyboardSize.height;
     self.tableView.contentInset = UIEdgeInsetsMake(0, 0, y, 0);
}


- (void)loadTableView
{
    if (self.manager.tableViewStyle == CGXConfigMeSettingManagerTableViewStylePlain) {
        self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, viewW, viewH) style:UITableViewStylePlain];
    } else{
        self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, viewW, viewH) style:UITableViewStyleGrouped];
    }
    self.tableView.separatorStyle =  UITableViewCellSeparatorStyleNone;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.rowHeight = 100;
    self.tableView.backgroundColor = CGXConfigMeSettingBG;
    [self.tableView registerClass:[CGXConfigMeSettingCell class] forCellReuseIdentifier:@"CGXConfigMeSettingCell"];
    [self addSubview:self.tableView];
    
    self.tableView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
    
    if (self.headerView) {
        self.tableView.tableHeaderView = self.headerView;
    }
    if (self.footerView) {
        self.tableView.tableFooterView = self.footerView;
    }
}

- (UIViewController*)viewController:(UIView *)view {
    for (UIView* next = [view superview]; next; next = next.superview) {
        UIResponder* nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UINavigationController class]] || [nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController*)nextResponder;
        }
    }
    return nil;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.manager.modelArray.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    CGXConfigMeSettingModel *model = self.manager.modelArray[section];
    return model.itemArray.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGXConfigMeSettingModel *sectionModel = self.manager.modelArray[indexPath.section];
    CGXConfigMeSettingItemModel *itemModel = sectionModel.itemArray[indexPath.row];
    if (itemModel.rowHeight) {
        return itemModel.rowHeight;
    }
    return 44;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    CGXConfigMeSettingModel *sectionModel = self.manager.modelArray[section];
    if (sectionModel.sectionHeaderHeight) {
        return sectionModel.sectionHeaderHeight;
    }
    return 0.01;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    CGXConfigMeSettingModel *sectionModel = self.manager.modelArray[section];
    if (sectionModel.sectionFooterHeight) {
        return sectionModel.sectionFooterHeight;
    }
    return 10;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    CGXConfigMeSettingModel *sectionModel = self.manager.modelArray[section];
    UIView *view = [UIView new];
    if (sectionModel.sectionHeaderHeight) {
        view.frame=CGRectMake(0, 0, viewW, sectionModel.sectionHeaderHeight);
    } else{
        view.frame=CGRectMake(0, 0, viewW, 0.01);
    }
    view.backgroundColor = self.manager.headerInSectionBG;
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(cgxConfigMeSettingShowHeaderView:InSection:TView:Model:)]){
        [self.delegate cgxConfigMeSettingShowHeaderView:self InSection:section TView:view Model:sectionModel];
    }
    return view;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    CGXConfigMeSettingModel *sectionModel = self.manager.modelArray[section];
    UIView *view = [UIView new];
    if (sectionModel.sectionFooterHeight) {
        view.frame=CGRectMake(0, 0, viewW, sectionModel.sectionFooterHeight);
    } else{
        view.frame=CGRectMake(0, 0, viewW, 0.01);
    }
    view.backgroundColor = self.manager.footerInSectionBG;
    if (self.delegate && [self.delegate respondsToSelector:@selector(cgxConfigMeSettingShowFooterView:InSection:TView:Model:)]){
        [self.delegate cgxConfigMeSettingShowFooterView:self InSection:section TView:view Model:sectionModel];
    }
    return view;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    CGXConfigMeSettingModel *sectionModel = self.manager.modelArray[indexPath.section];
    CGXConfigMeSettingItemModel *itemModel = sectionModel.itemArray[indexPath.row];
    
    CGXConfigMeSettingCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CGXConfigMeSettingCell" forIndexPath:indexPath];
    cell.accessoryType = UITableViewCellAccessoryNone;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    //判断有无下划线
    if (sectionModel.itemArray.count<indexPath.row-1) {
        itemModel.isLineView = NO;
    }
    
    [cell showInfoCell:itemModel CellStyle:self.manager];
    
    __weak typeof(itemModel) itemmModelSelf = itemModel;
    itemModel.switchValueChanged = ^(BOOL isOn, CGXConfigMeSettingItemModel *model) {
        NSLog(@"isOn  %d--%@" , isOn,model);
        if (self.delegate && [self.delegate respondsToSelector:@selector(cgxConfigMeSettingSelectSwitchCellView:AtIndexPath:ItemModel:SwitchIsOn:)]) {
            [self.delegate cgxConfigMeSettingSelectSwitchCellView:self AtIndexPath:indexPath ItemModel:itemmModelSelf SwitchIsOn:isOn];
        }
    };
    
    itemModel.textValueChanged = ^(NSString *text, CGXConfigMeSettingItemModel *model) {
        NSLog(@"text  %@--%@" , text,model);
        if (self.delegate && [self.delegate respondsToSelector:@selector(cgxConfigMeSettingSelectTextViewCellView:AtIndexPath:ItemModel:)]) {
            [self.delegate cgxConfigMeSettingSelectTextViewCellView:self AtIndexPath:indexPath ItemModel:itemmModelSelf];
        }
    };
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (selectIndexPath) {
        [[[UIApplication sharedApplication] keyWindow] endEditing:YES];
    }

    selectIndexPath = indexPath;

    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];

    CGXConfigMeSettingModel *sectionModel = self.manager.modelArray[indexPath.section];
    CGXConfigMeSettingItemModel *itemmModel = sectionModel.itemArray[indexPath.row];

    if (self.delegate && [self.delegate respondsToSelector:@selector(cgxConfigMeSettingSelectCellView:AtIndexPath:Model:ItemModel:)]) {
        [self.delegate cgxConfigMeSettingSelectCellView:self AtIndexPath:indexPath Model:sectionModel ItemModel:itemmModel];
    }
}

//一个section刷新
- (void)cgxReloadSections:(NSIndexPath *)indexPath
{


    NSIndexSet *indexSetA = [[NSIndexSet alloc]initWithIndex:indexPath.section];    //刷新第3段

    [self.tableView reloadSections:indexSetA withRowAnimation:UITableViewRowAnimationAutomatic];
}
//一个cell刷新
- (void)cgxReloadRow:(NSIndexPath *)indexPath
{

    NSIndexPath *indexPathA = [NSIndexPath indexPathForRow:indexPath.row inSection:indexPath.section]; //刷新第0段第2行
    [self.tableView reloadRowsAtIndexPaths:[NSArray arrayWithObjects:indexPathA,nil] withRowAnimation:UITableViewRowAnimationNone];
}

-(void)dealloc {
    //移除通知
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
