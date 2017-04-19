//
//  ViewController.m
//  MoreNavigationTest
//
//  Created by 梅玉龙 on 2017/4/14.
//  Copyright © 2017年 梅玉龙. All rights reserved.
//

#import "ViewController.h"
#import "YLScrollView.h"
#import "YLTitleScrollView.h"

#define ScreenW [UIScreen mainScreen].bounds.size.width
#define ScreenH [UIScreen mainScreen].bounds.size.height

@interface ViewController ()<UIScrollViewDelegate,TitleButtonClickDelegate>
@property (nonatomic,strong)YLScrollView *scrollView;//主界面滑动视图
@property (nonatomic,strong)YLTitleScrollView *titleScrollView;//title滑动视图

@end

@implementation ViewController{
    
    CGFloat _offSet;//偏移量比例
    CGFloat _startContentOffSet;
    CGFloat _willEndContentOffset;
    CGFloat _endContentOffset;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createUI];
}
- (void)createUI{
    self.view.backgroundColor = [UIColor grayColor];
    
    NSArray *titleArray = @[@"推荐",@"热点",@"电视剧",@"电影",@"动漫",@"美女",@"111",@"222",@"333"];
    
    self.scrollView = [[YLScrollView alloc]initWithFrame:CGRectMake(0, 70, ScreenW, ScreenH-70) withViewArray:titleArray];
    self.scrollView.delegate =self;
    self.scrollView.tag = 1000;
    [self.view addSubview:self.scrollView];
    
    self.titleScrollView = [[YLTitleScrollView alloc]initWithFrame:CGRectMake(0, 20, ScreenW, 40) withViewArray:titleArray];
    self.titleScrollView.tag = 1001;
    self.titleScrollView.delegate = self;
    self.titleScrollView.clickDelegate = self;
    [self.view addSubview:self.titleScrollView];
}

#pragma mark --titleView的按钮点击事件
- (void)clickTitleButton:(int)buttonTag{
    [self.scrollView setContentOffset:CGPointMake(ScreenW*buttonTag, 0) animated:NO];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{//减速结束后  跳转按钮
    NSLog(@" scrollViewDidEndDecelerating--scrollView.contentOffset.x   %f",scrollView.contentOffset.x);
    if (scrollView.tag == 1000) {
        int i = scrollView.contentOffset.x/ScreenW;
        NSLog(@"------%d",i);
        UIButton *button = [self.titleScrollView viewWithTag:100+i];
        [self.titleScrollView toJumpButton:button];
         }
}



@end
