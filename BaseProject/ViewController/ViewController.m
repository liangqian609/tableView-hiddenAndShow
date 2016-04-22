//
//  ViewController.m
//  BaseProject
//
//  Created by iOS开发本-(梁乾) on 16/4/19.
//  Copyright © 2016年 tarena. All rights reserved.
//
#import "ViewController.h"
#import "LQCellTableViewCell.h"
#import "TestDataModel.h"
#import "SectionView.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataSource;
@property (nonatomic, strong) NSMutableArray *sectionViewArray;


@end

@implementation ViewController

#pragma mark ---懒加载控件---
- (UITableView *)tableView {
    if(_tableView == nil) {
        //设置tableView的frame
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(widhtFor10, heightFor30, self.view.bounds.size.width - widhtFor10*2, self.view.bounds.size.height - heightFor30)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        //设置cell之间的线条
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.backgroundColor = [UIColor clearColor];
        [self.view addSubview:_tableView];
    }
    return _tableView;
}

- (NSMutableArray *)dataSource {
    if(_dataSource == nil) {
        _dataSource = [[NSMutableArray alloc] init];
        //创建假数据源
        for (int i = 0; i < 10; i++) {
            [_dataSource addObject:[TestDataModel demoData]];
        }
    }
    return _dataSource;
}

- (NSMutableArray *)sectionViewArray {
    if(_sectionViewArray == nil) {
        _sectionViewArray = [[NSMutableArray alloc] init];
    }
    return _sectionViewArray;
}

#pragma mark ---View生命周期---
- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.hidden = NO;
}

#pragma  mark ---tableViewDelegate---

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//刷新的主要控制逻辑
/*
 1.表格初始化的时候会调用这个方法，这时候self.sectionViewArray.count 数组中没有数据，所以会默认第一分区有数据，其他分区没有数据。
 
 2.当被点击了刷新后会调用这个方法，这时候self.sectionViewArray.count 数组中已有数据，需循环找到相应的分区在数组中保存的对象，然后检查隐藏状态，用于判断是需要显示数据还是要隐藏cell。
 
 */
    
    if (self.sectionViewArray.count != 0) {

        SectionView* tempView = nil;
//        //这里用循环可以防止数组越界崩溃，不能直接用self.sectionViewArray[section]
        for (int i = 0; i < self.sectionViewArray.count; i++) {
//            //如果循环到和section的数值相等，则是需要响应隐藏和展开的View
            if (i == section) {
                tempView = self.sectionViewArray[section];
                if (tempView.isUnfoldOrHidden == YES) {
                    return self.dataSource.count;
                }else{
                    return 0;
                }
            }
        }
            }else{
        if (section == 0) {
           return self.dataSource.count;
        }else{
           return 0;
        }

    }
    return 0;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LQCellTableViewCell* cell = [LQCellTableViewCell cellWithInstanceTableView:tableView];
    
    [cell cellLoadDataWith:self.dataSource[indexPath.row]];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return heightFor100;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return heightFor30;
}

-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
/*
 1.表格初始化的时候self.sectionViewArray.count 中没有数据，for循环没有给headView附上值，会创建headView的对象，并添加到self.sectionViewArray数组中
 
 2.表格刷新后会调用这个方法，self.sectionViewArray.count 中有数据，这时候找到相对于的分区上的VIew。然后直接返回这个View ，不能这里一定要加 headView == nil  这个断言，不然又新建一个headView了，就不是原来分区上的那个headView对象了。
 
 */
    
    SectionView* headView = nil;
    for (int i = 0; i < self.sectionViewArray.count; i++) {
        if (section == i) {
             headView = self.sectionViewArray[i];
        }
    }
    
    if (headView == nil) {
        headView = [[SectionView alloc] initWithFrame:CGRectMake(0, 0, ScreenW - widhtFor10*2, heightFor30)];
        headView.backgroundColor = RGBCOLOR(247, 247, 247);

        UIButton* sectionBtn = [[UIButton alloc] init];

        if (section == 0) {
            headView.isUnfoldOrHidden = YES;
            [sectionBtn setTitle:@"内容展示" forState:UIControlStateNormal];
            [sectionBtn setImage:[UIImage imageNamed:@"down"] forState:UIControlStateNormal];
        }else{
            headView.isUnfoldOrHidden = NO;
            [sectionBtn setTitle:@"内容隐藏" forState:UIControlStateNormal];
            [sectionBtn setImage:[UIImage imageNamed:@"top"] forState:UIControlStateNormal];
        }
        [sectionBtn addTarget:self action:@selector(clickSectionBtn:) forControlEvents:UIControlEventTouchUpInside];
        //这里将Btn和View的tag都设为section，为后面知道是那个分区需要响应做铺垫
        sectionBtn.tag = section;
        
        [sectionBtn setImageEdgeInsets:UIEdgeInsetsMake(0, ScreenW - widhtFor30*2,0, 0)];
        [sectionBtn setTitleColor:RGBCOLOR(60, 60, 60) forState:UIControlStateNormal];
        [headView addSubview:sectionBtn];
        [sectionBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
        [self.sectionViewArray addObject:headView];
    }
    NSLog(@"headView = %p",headView);
        return headView;
}

-(void)clickSectionBtn:(UIButton*)button
{
//点击分区上的按钮后做改变按钮的title和image已经隐藏状态和刷新分区
    SectionView* tempView = (SectionView*)button.superview;
    NSLog(@"tempView = %p",tempView);
    if (tempView.isUnfoldOrHidden == YES) {
        [button setTitle:@"内容隐藏" forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:@"top"] forState:UIControlStateNormal];
        tempView.isUnfoldOrHidden = NO;

        //这里UITableViewRowAnimationRight  这个参数决定了cell的刷新方式，有接近10种可以更换
        [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:button.tag]  withRowAnimation:UITableViewRowAnimationTop];
        
    }else{
        [button setTitle:@"内容展示" forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:@"down"] forState:UIControlStateNormal];
        tempView.isUnfoldOrHidden = YES;

        [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:button.tag]  withRowAnimation:UITableViewRowAnimationTop];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/







@end
