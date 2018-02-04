//
//  ViewController.m
//  CGXConfigMeSettingViewDemo
//
//  Created by 曹贵鑫 on 2018/2/3.
//  Copyright © 2018年 曹贵鑫. All rights reserved.
//

#import "ViewController.h"
#import "CGXConfigMeSettingMacro.h"
@interface ViewController ()<CGXConfigMeSettingViewDelegate>

@property (nonatomic , strong) CGXConfigMeSettingManager *manager;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.automaticallyAdjustsScrollViewInsets = NO;
    CGXConfigMeSettingView *settingView = [[CGXConfigMeSettingView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height-64-49) WithManager:self.manager];
    settingView.delegate = self;
    [self.view addSubview:settingView];
    
    settingView.headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 150)];
    
    //      settingView.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 150)];
}

- (CGXConfigMeSettingManager *)manager
{
    if (!_manager) {
        _manager = [[CGXConfigMeSettingManager alloc] initWithType:CGXConfigMeSettingManagerTableViewStyleGrouped];
        
        NSArray *imar2 = @[@"ABSelfListIconMyQuestion",
                           @"ABSelfListIconMyQuestion",
                           @"ABSelfListIconMyQuestion",
                           @"ABSelfListIconMyQuestion",
                           @"ABSelfListIconMyQuestion",
                           @"ABSelfListIconMyQuestion",
                           @"ABSelfListIconMyQuestion",
                           @"ABSelfListIconMyQuestion",
                           ];
        
        NSMutableArray *arr2 = [NSMutableArray array];
        
        for (int i = 0; i<imar2.count; i++) {
            CGXConfigMeSettingItemModel *model = [CGXConfigMeSettingItemModel new];
            model.rowHeight = 50;
            if (i >4) {
                model.funcNameImage = [UIImage imageNamed:imar2[i]];
            }
            
            model.funcName =  @"我的";
            [arr2 addObject:model];
        }
        
        
        NSMutableArray *arr1 = [NSMutableArray array];
        
        for (int i = 0; i<imar2.count; i++) {
            CGXConfigMeSettingItemModel *model = [CGXConfigMeSettingItemModel new];
            model.rowHeight = 50;
            model.funcNameImage = [UIImage imageNamed:imar2[i]];
            model.funcName =  @"我的";
            //            if (i==1) {
            //                 NSMutableAttributedString *string = [[NSMutableAttributedString alloc] init];
            //                    [string appendAttributedString:[[NSAttributedString alloc] initWithString:@"哈哈哈哈哈哈"]];
            //                model.attributedSrting = string;
            //                //                 model.isArrow = YES;
            //            }
            if (i == 2) {
                
                model.isOn = YES;
                model.isArrow = YES;
            }
            if ( i == 3) {
                model.headerImage =[UIImage imageNamed:@"AB6MeAddPhotoBtnAiBa"];
            }
            if (i == 4) {
                model.detailImage = [UIImage imageNamed:@"ABSelfIconVIP"];
                model.detailText = @"会员会员";
            }
            if (i == 5) {
                model.detailText = @"会员会员";
            }
            if (i == 6) {
                model.detailImage = [UIImage imageNamed:@"ABSelfIconVIP"];
            }
            
            if (i==7) {
                model.placeholder = @"哈哈哈哈哈哈";
                //                 model.isArrow = YES;
            }
            
            [arr1 addObject:model];
        }
        
        NSMutableArray *itemAry = [NSMutableArray arrayWithObjects:arr2,arr1, nil];
        NSMutableArray *dataArray = [NSMutableArray array];
        for (int i = 0; i<itemAry.count; i++) {
            CGXConfigMeSettingModel *model = [CGXConfigMeSettingModel new];
            model.itemArray = itemAry[i];
            //            model.sectionFooterHeight = 0.01;
            //            model.sectionHeaderHeight = 40;
            
            NSString *aaa = [NSString stringWithFormat:@"第%d",i];
            model.sectionHeaderArray = @[aaa];
            [dataArray addObject:model];
        }
        _manager.modelArray = dataArray;
        
        
    }
    return _manager;
}
- (void)cgxConfigMeSettingShowHeaderView:(CGXConfigMeSettingView *)pView InSection:(NSInteger)section TView:(UIView *)tView Model:(CGXConfigMeSettingModel *)model
{
    //    [tView addSubview:[self sectionHeadView]];
    
    //    NSMutableArray *aaa = model.sectionHeaderArray;
    //
    //    tView.backgroundColor = [UIColor orangeColor];
    //    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(20, 0, 100, 40)];
    //    [tView addSubview:label];
    //
    //    label.text = aaa[0];
    //
    //    UILabel *labei2 = [[UILabel alloc] initWithFrame:CGRectMake(150, 0, 100, 40)];
    //    [tView addSubview:labei2];
    //    labei2.text = @"湿度大时";
    
    
}


- (void)cgxConfigMeSettingShowFooterView:(CGXConfigMeSettingView *)pView InSection:(NSInteger)section TView:(UIView *)tView Model:(CGXConfigMeSettingModel *)model
{
    
}
- (void)cgxConfigMeSettingSelectTextViewCellView:(CGXConfigMeSettingView *)pView AtIndexPath:(NSIndexPath *)indexPath ItemModel:(CGXConfigMeSettingItemModel *)itemModel
{
    NSLog(@"text:%@--%@--%@",pView,indexPath,itemModel);
}

- (void)cgxConfigMeSettingSelectSwitchCellView:(CGXConfigMeSettingView *)pView AtIndexPath:(NSIndexPath *)indexPath ItemModel:(CGXConfigMeSettingItemModel *)itemModel SwitchIsOn:(BOOL)isOn
{
    NSLog(@"switch:%@--%@--%@---%d",pView,indexPath,itemModel,isOn);
}

- (void)cgxConfigMeSettingSelectCellView:(CGXConfigMeSettingView *)pView AtIndexPath:(NSIndexPath *)indexPath Model:(CGXConfigMeSettingModel *)model ItemModel:(CGXConfigMeSettingItemModel *)itemModel
{
    NSLog(@"itemModel:%@--%@--%@---%@",pView,indexPath,model,itemModel);
}


@end
