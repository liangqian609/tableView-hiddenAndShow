//
//  LQCellTableViewCell.m
//  testDemo
//
//  Created by iOS开发本-(梁乾) on 16/4/19.
//  Copyright © 2016年 SIBAT. All rights reserved.
//

#import "LQCellTableViewCell.h"
#import "TestDataModel.h"




@interface LQCellTableViewCell ()
@property (nonatomic, strong) UIImageView* stateImageView;
@property (nonatomic, strong) UILabel* paymentLabel;
@property (nonatomic, strong) UILabel* orderDateLabel;
@property (nonatomic, strong) UIImageView* backimageView;
@property (nonatomic, strong) UILabel* startAddressLabel;
@property (nonatomic, strong) UIImageView* smallImageView;
@property (nonatomic, strong) UILabel* destinationLabel;
@property (nonatomic, strong) UILabel* passTimeLabel;
@property (nonatomic, strong) UILabel* favourablePriceLabel;

@end

@implementation LQCellTableViewCell

+(instancetype)cellWithInstanceTableView:(UITableView*)tableView
{
    LQCellTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"testCell"];
#warning ToDo:这里要设置不会每个Cell都会赋值的控件的赋值为nil，防止重用。如注释，但是我这里的总共9个UI控件，我全都是能够用上的，就不需要了。
//    cell.paymentLabel.text = nil;

    if (cell == nil) {
        cell = [[LQCellTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"testCell"];
    }
    return cell;
}

-(void)cellLoadDataWith:(id)data
{
    TestDataModel* testData = (TestDataModel*)data;
    self.backimageView.image = [UIImage imageNamed:@"myOrderBackImage"];
    self.stateImageView.image = [UIImage imageNamed:@"orderStateGreen"];
    self.smallImageView.image = [UIImage imageNamed:@"lineForImage"];
    self.paymentLabel.text = testData.payment;
    self.orderDateLabel.text = testData.orderDate;
    self.startAddressLabel.text = testData.startAddress;
    self.destinationLabel.text = testData.destination;
    self.passTimeLabel.text = testData.passTime;
    self.favourablePriceLabel.text = testData.favourablePrice;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        //这里做一些Cell的控件的初始化
        [self cellConfigSubViews];
    }
    return self;
}

-(void)cellConfigSubViews
{
    UIImageView* backimageView = [[UIImageView alloc] init];
    self.backimageView = backimageView;
    [self.contentView addSubview:backimageView];
    [backimageView  mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
    
    UIImageView* stateImageView = [[UIImageView alloc] init];
    self.stateImageView = stateImageView;
    [self.contentView addSubview:stateImageView];
    [stateImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(widhtFor100, heightFor10*6));
    }];
    
    //起点
    UILabel* startAddressLabel = [[UILabel alloc] init];
    self.startAddressLabel = startAddressLabel;
    startAddressLabel.numberOfLines = 1;//行数一行
    startAddressLabel.font = kFont(14);
    [self.contentView addSubview:startAddressLabel];
    [startAddressLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(heightFor10);
        make.left.mas_equalTo(widhtFor10);
        make.height.mas_equalTo(heightFor10*1.8);
        //右边的约束需要让下一个指定
    }];
    //小图片
    UIImageView* smallImageView = [UIImageView new];
    self.smallImageView = smallImageView;
    [self.contentView addSubview:smallImageView];
    [smallImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(heightFor10*1.3);
        make.left.mas_equalTo(startAddressLabel.mas_right).mas_equalTo(widhtFor10*0.5);
        make.size.mas_equalTo(CGSizeMake(widhtFor10*2, heightFor10));
    }];
    //目的地Label
    UILabel* destinationLabel = [[UILabel alloc] init];
    self.destinationLabel = destinationLabel;
    destinationLabel.numberOfLines = 1;//行数一行
    destinationLabel.font = kFont(14);
    [self.contentView addSubview:destinationLabel];
    [destinationLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(heightFor10);
        make.left.mas_equalTo(smallImageView.mas_right).mas_equalTo(widhtFor10*0.5);
        make.height.mas_equalTo(heightFor10*1.8);
        make.right.mas_lessThanOrEqualTo(-widhtFor10*9);//距离右边父视图大于等于90像素
    }];
    
    //支付状态
    UILabel* paymentLabel = [[UILabel alloc] init];
    self.paymentLabel = paymentLabel;
    paymentLabel.textAlignment = NSTextAlignmentRight;
    paymentLabel.textColor = [UIColor whiteColor];
    paymentLabel.font = kFont(17);
    paymentLabel.numberOfLines = 1;//行数一行
    [self.contentView addSubview:paymentLabel];
    [paymentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(stateImageView.mas_centerY).mas_offset(-heightFor10);
        make.right.mas_equalTo(-widhtFor10);
        make.size.mas_equalTo(CGSizeMake(widhtFor70, heightFor10*2));
    }];
    //经过时间
    UILabel* passTimeLabel = [[UILabel alloc] init];
    self.passTimeLabel = passTimeLabel;
    passTimeLabel.font = kFont(24);
    passTimeLabel.numberOfLines = 1;
    [self.contentView addSubview:passTimeLabel];
    [passTimeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(widhtFor100, heightFor10*2.5));
        make.left.mas_equalTo(widhtFor10);
        make.top.mas_equalTo(startAddressLabel.mas_bottom).mas_equalTo(heightFor10*0.5);
    }];
    //固定View
    UIView* view = [[UIView alloc] init];
    view.backgroundColor = RGBCOLOR(250, 195, 0);
    [self.contentView addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(widhtFor10);
        make.size.mas_equalTo(CGSizeMake(widhtFor100*2, heightFor10*0.3));
        make.top.mas_equalTo(passTimeLabel.mas_bottom).mas_equalTo(heightFor10*0.5);
    }];
    
    //固定label
    UILabel* Label = [[UILabel alloc] init];
    Label.text = @"订单日期：";
    Label.font = kFont(12);
    Label.numberOfLines = 1;
    [self.contentView addSubview:Label];
    [Label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(heightFor10*2);
        make.left.mas_equalTo(passTimeLabel.mas_left).mas_offset(0);
        make.bottom.mas_equalTo(-heightFor10);
    }];
    //订单日期
    UILabel* orderDateLabel  = [[UILabel alloc] init];
    self.orderDateLabel = orderDateLabel;
    orderDateLabel.font = kFont(12);
    orderDateLabel.numberOfLines = 1;
    [self.contentView addSubview:orderDateLabel];
    [orderDateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(heightFor10*2);
        make.left.mas_equalTo(Label.mas_right).mas_equalTo(widhtFor10*2);
        make.bottom.mas_equalTo(-heightFor10);
    }];
    //元
    UILabel* rmbLabel = [UILabel new];
    rmbLabel.text = @"元";
    rmbLabel.textColor = RGBCOLOR(112, 196, 161);
    rmbLabel.font = [UIFont boldSystemFontOfSize:20];
    [self.contentView addSubview:rmbLabel];
    [rmbLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(heightFor22);
        make.right.mas_equalTo(-widhtFor10);
        make.bottom.mas_equalTo(-heightFor10);
    }];
    //价格
    UILabel* favourablePriceLabel = [[UILabel alloc] init];
    self.favourablePriceLabel = favourablePriceLabel;
    favourablePriceLabel.textColor = RGBCOLOR(112, 196, 161);
    favourablePriceLabel.font = [UIFont boldSystemFontOfSize:20];
    favourablePriceLabel.textAlignment = NSTextAlignmentRight;
    [self.contentView addSubview:favourablePriceLabel];
    [favourablePriceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(widhtFor100, heightFor22));
        make.right.mas_equalTo(rmbLabel.mas_left).mas_equalTo(0);
        make.bottom.mas_equalTo(-heightFor10);
        
    }];

}

@end
