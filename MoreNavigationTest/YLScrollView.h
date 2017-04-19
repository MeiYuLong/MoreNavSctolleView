//
//  YLScrollView.h
//  MoreNavigationTest
//
//  Created by 梅玉龙 on 2017/4/19.
//  Copyright © 2017年 梅玉龙. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YLScrollView : UIScrollView<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,strong)NSArray *tableViewArray;//tableView的个数
@property (nonatomic,strong)NSMutableArray *tableViewData;//tableView的数据源

- (instancetype)initWithFrame:(CGRect)frame withViewArray:(NSArray *)viewArray;

@end
