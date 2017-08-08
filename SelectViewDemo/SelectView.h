//
//  SelectView.h
//  SelectViewDemo
//
//  Created by LanSha on 2017/8/8.
//  Copyright © 2017年 LanSha. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SelectView;

typedef NS_ENUM(NSInteger,ButtonClickType){
    ButtonClickTypeNormal = 0,
    ButtonClickTypeUp = 1,
    ButtonClickTypeDown = 2,
};

@protocol NY_SelectViewDelegate <NSObject>

@optional
//选中最上方的按钮的点击事件
- (void)selectTopButton:(SelectView *)selectView withIndex:(NSInteger)index withButtonType:(ButtonClickType )type;
//选中分类中按钮的点击事件
- (void)selectItme:(SelectView *)selectView withIndex:(NSInteger)index;

@end



@interface SelectView : UIView

@property (nonatomic, weak) id<NY_SelectViewDelegate>delegate;
//默认选中，默认是第一个
@property (nonatomic, assign) int defaultSelectIndex;

//默认选中项，默认是第一个
@property (nonatomic, assign) int defaultSelectItmeIndex;
//设置可选项数组
@property (nonatomic, copy) NSArray *selectItmeArr;

- (instancetype)initWithFrame:(CGRect)frame withArr:(NSArray *)arr;
@end
