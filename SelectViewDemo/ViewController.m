//
//  ViewController.m
//  SelectViewDemo
//
//  Created by LanSha on 2017/8/8.
//  Copyright © 2017年 LanSha. All rights reserved.
//

#import "ViewController.h"
#import "SelectView.h"

@interface ViewController ()<NY_SelectViewDelegate>
@property (nonatomic, strong) SelectView *selectView;
@property (nonatomic, copy) NSArray *dataArr;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
//    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.automaticallyAdjustsScrollViewInsets = NO;
    _dataArr = @[@{@"name":@"全部",@"count":@"50"},
                 @{@"name":@"零食",@"count":@"10"},
                 @{@"name":@"生鲜",@"count":@"10"},
                 @{@"name":@"手机",@"count":@"10"},
                 @{@"name":@"服饰",@"count":@"10"},
                 @{@"name":@"玩具",@"count":@"10"}];
    [self.view addSubview:self.selectView];
}
#pragma mark NY_SelectViewDelegate
-(void)selectItme:(SelectView *)selectView withIndex:(NSInteger)index{
    //index代表选中的品类，0是全部。
    if (index == 0) {
        NSLog(@"分类中的全部");
    }else{
        NSLog(@"分类中的其他");
    }
}
-(void)selectTopButton:(SelectView *)selectView withIndex:(NSInteger)index withButtonType:(ButtonClickType)type1{
    //价格
    if (index == 102&&type1) {
        switch (type1) {
            case ButtonClickTypeNormal:
                //正常价格
            {
                NSLog(@"上边按钮的正常价格");
            }
                break;
            case ButtonClickTypeUp:
                //价格升序排列
            {
                NSLog(@"上边按钮的价格升序排列");
            }
                break;
            case ButtonClickTypeDown:
                //价格降序排列
            {
                NSLog(@"上边按钮的价格降序排列");
            }
                break;
            default:
                break;
        }
    }else if (index == 100){//综合
        NSLog(@"上边按钮的综合");
    }else if (index == 101){//促销
        NSLog(@"上边按钮的促销");
    }else{//全部
        NSLog(@"上边按钮的全部");
    }
}
#pragma mark 懒加载
-(SelectView *)selectView{
    if (!_selectView) {
        
        _selectView = [[SelectView alloc]initWithFrame:CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, 40) withArr:nil];
        _selectView.delegate = self;
    }
    _selectView.selectItmeArr = _dataArr;
    return _selectView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
