//
//  Constants.h
//  BaseProject
//
//  Created by tarena on 15/12/16.
//  Copyright © 2015年 tarena. All rights reserved.
//

#ifndef Constants_h
#define Constants_h


#define ScreenW [UIScreen mainScreen].bounds.size.width
#define ScreenH  [UIScreen mainScreen].bounds.size.height


//以iphone 6Puls 的屏幕宽度为参考，计算出任意屏幕的10像素
#define widhtFor10 10.0 * [UIScreen mainScreen].bounds.size.width / 414
#define heightFor10  10.0 * [UIScreen mainScreen].bounds.size.height / 736
//高度22
#define heightFor22 22.0 * [UIScreen mainScreen].bounds.size.height / 736
//宽度30 和高度30
#define widhtFor30 30.0 * [UIScreen mainScreen].bounds.size.width / 414
#define heightFor30 30.0 * [UIScreen mainScreen].bounds.size.height / 736
//宽度50 和高度50
#define widhtFor50 50.0 * [UIScreen mainScreen].bounds.size.width / 414
#define heightFor50 50.0 * [UIScreen mainScreen].bounds.size.height / 736
//宽度70 和高度70
#define widhtFor70 70.0 * [UIScreen mainScreen].bounds.size.width / 414
#define heightFor70 70.0 * [UIScreen mainScreen].bounds.size.height / 736
//宽度90 和高度90
#define widhtFor90 90.0 * [UIScreen mainScreen].bounds.size.width / 414
#define heightFor90 90.0 * [UIScreen mainScreen].bounds.size.height / 736
//宽度100 和高度100
#define widhtFor100 100.0 * [UIScreen mainScreen].bounds.size.width / 414
#define heightFor100 100.0 * [UIScreen mainScreen].bounds.size.height / 736


//做演示，这里就没用字体适配了
#define kFont(x) [UIFont systemFontOfSize:x]

#define RGBCOLOR(r,g,b)     [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]

#endif /* Constants_h */
