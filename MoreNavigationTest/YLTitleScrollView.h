//
//  YLTitleScrollView.h
//  MoreNavigationTest
//
//  Created by 梅玉龙 on 2017/4/19.
//  Copyright © 2017年 梅玉龙. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TitleButtonClickDelegate <NSObject>

- (void)clickTitleButton:(int)buttonTag;
//- (void)scrollViewToTitleButton:(UIButton *)button;

@end

@interface YLTitleScrollView : UIScrollView<UIScrollViewDelegate>
@property (nonatomic,strong)UIButton *button;
@property (nonatomic,strong)NSArray *buttonArray;//tableView的个数
@property (nonatomic,strong)UIView *titleView;//滑动条
@property (nonatomic,weak)id <TitleButtonClickDelegate>clickDelegate;

- (instancetype)initWithFrame:(CGRect)frame withViewArray:(NSArray *)viewArray;
- (void)toJumpButton:(UIButton *)button;

@end
