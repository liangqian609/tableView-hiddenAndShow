//
//  UIScrollView+Refresh.m
//  BaseProject
//
//  Created by tarena on 15/12/16.
//  Copyright © 2015年 tarena. All rights reserved.
//

#import "UIScrollView+Refresh.h"

@implementation UIScrollView (Refresh)

/** 添加头部刷新 */
- (void)addHeaderRefresh:(MJRefreshComponentRefreshingBlock)refreshBlock{
    self.header =[MJRefreshNormalHeader headerWithRefreshingBlock:refreshBlock];
}
/** 开始头部刷新 */
- (void)beginHeaderRefresh{
    [self.header beginRefreshing];
}
/** 结束头部刷新 */
- (void)endHeaderRefresh{
    [self.header endRefreshing];
}
/** 添加脚部刷新 */
- (void)addFooterRefresh:(MJRefreshComponentRefreshingBlock)refreshBlock{
    self.footer=[MJRefreshAutoNormalFooter footerWithRefreshingBlock:refreshBlock];
}
/** 开始脚部刷新 */
- (void)beginFooterRefresh{
    [self.footer beginRefreshing];
}
/** 结束脚部刷新 */
- (void)endFooterRefresh{
    [self.footer endRefreshing];
}

@end













