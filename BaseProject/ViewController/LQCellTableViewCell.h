//
//  LQCellTableViewCell.h
//  testDemo
//
//  Created by iOS开发本-(梁乾) on 16/4/19.
//  Copyright © 2016年 SIBAT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LQCellTableViewCell : UITableViewCell
//实例化一个Cell
+(instancetype)cellWithInstanceTableView:(UITableView*)tableView;

-(void)cellLoadDataWith:(id)data;

@end
