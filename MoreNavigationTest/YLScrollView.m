//
//  YLScrollView.m
//  MoreNavigationTest
//
//  Created by 梅玉龙 on 2017/4/19.
//  Copyright © 2017年 梅玉龙. All rights reserved.
//

#import "YLScrollView.h"
#define ScreenW [UIScreen mainScreen].bounds.size.width
#define ScreenH [UIScreen mainScreen].bounds.size.height

@implementation YLScrollView


- (instancetype)initWithFrame:(CGRect)frame withViewArray:(NSArray *)viewArray{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor grayColor];
        self.contentSize = CGSizeMake(ScreenW*viewArray.count, self.frame.size.height);
        self.pagingEnabled = YES;
        [self createUI:viewArray];
    }
    return self;
}

- (void)createUI:(NSArray *)array{
    
    for (int i =0; i<array.count; i++) {
        
        self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0+ScreenW*i, 0, ScreenW, self.frame.size.height) style:UITableViewStylePlain];
        self.tableView.tag = 100+i;
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        [self addSubview:self.tableView];
    }
}
#pragma mark --------tableView delelgate datasource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 15;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"第%ld个tableView  第%ld个cell",tableView.tag,indexPath.row];
    return cell;
}


@end
