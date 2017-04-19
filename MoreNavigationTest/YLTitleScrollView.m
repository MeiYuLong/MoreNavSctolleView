//
//  YLTitleScrollView.m
//  MoreNavigationTest
//
//  Created by 梅玉龙 on 2017/4/19.
//  Copyright © 2017年 梅玉龙. All rights reserved.
//

#import "YLTitleScrollView.h"

#define ScreenW [UIScreen mainScreen].bounds.size.width
@implementation YLTitleScrollView{
    UIButton *_selectedButton;
}

- (instancetype)initWithFrame:(CGRect)frame withViewArray:(NSArray *)viewArray{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor grayColor];
        self.contentSize = CGSizeMake(80*viewArray.count, self.frame.size.height);
        self.pagingEnabled = YES;
        [self createUI:viewArray];
        
    }
    return self;
}

- (void)createUI:(NSArray *)array{
    
    self.delegate = self;
    
    for (int i =0; i<array.count; i++) {
        
        self.button = [[UIButton alloc]initWithFrame:CGRectMake(0+80*i, 0, 80, self.frame.size.height-2)];
        self.button.backgroundColor = [UIColor whiteColor];
        self.button.tag = 100+i;
        [self.button setTitle:array[i] forState:UIControlStateNormal];
        [self.button setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
        [self.button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self.button addTarget:self action:@selector(changeView:) forControlEvents:UIControlEventTouchUpInside];
        if (self.button.tag == 100) {
            
            self.button.selected = YES;
            _selectedButton = self.button;
        }
        [self addSubview:self.button];
    }
    self.titleView = [[UIView alloc]initWithFrame:CGRectMake(0, self.frame.size.height-2, 80, 2)];
    self.titleView.backgroundColor = [UIColor redColor];
    [self addSubview:self.titleView];
}
- (void)changeView:(UIButton *)button{
    _selectedButton.selected = NO;
    button.selected = !button.selected;
    _selectedButton = button;
    [UIView animateWithDuration:0.2 animations:^{
        CGFloat x = button.frame.origin.x;
        [self.titleView setFrame:CGRectMake(x, 39, 80, 1)]
        ;
    }];
    int tag = (int)button.tag - 100;
    //点击button传值
    [self.clickDelegate clickTitleButton:tag];
    
//    self.contentOffset = CGPointMake(tag *80, 0);
}

- (void)toJumpButton:(UIButton *)button{
    _selectedButton.selected = NO;
    button.selected = !button.selected;
    
    _selectedButton = button;
    
    [UIView animateWithDuration:0.1 animations:^{
        CGFloat x = button.frame.origin.x;
        [self.titleView setFrame:CGRectMake(x, 39, 80, 1)]
        ;
    }];
  
    int tag = (int)button.tag - 100;
    
    CGFloat change = button.frame.origin.x+80;
    
    if (change >ScreenW) {
        self.contentOffset = CGPointMake(change-ScreenW, 0);
    }
    
    if(tag == 0){
        self.contentOffset = CGPointMake(0, 0);

    }

}

@end
