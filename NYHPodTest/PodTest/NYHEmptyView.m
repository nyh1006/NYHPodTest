//
//  NYHEmptyView.m
//  NYHPodTest
//
//  Created by greenspiderios on 2019/6/19.
//  Copyright © 2019 NYH. All rights reserved.
//

#import "NYHEmptyView.h"


@interface NYHEmptyView ()

@end


@implementation NYHEmptyView

#pragma mark - 单例
static NYHEmptyView * emptyView = nil;
+ (instancetype)sharedEmptyView
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        emptyView = [[self alloc] init];
    });
    return emptyView;
}


+ (NYHEmptyView *)nyh_emptyView
{
    NYHEmptyView *emptyView = [[NYHEmptyView alloc] init];
    emptyView.backgroundColor = [UIColor whiteColor];
    return emptyView;
}


- (void)setDataType:(NYHDataType)dataType
{
    _dataType = dataType;

    // 清除子视图
    for (UIView *subView in [self subviews]) {
        [subView removeFromSuperview];
    }

    [self setupBaseView];
}

// 加载 bundle 文件 https://www.cnblogs.com/lsh1234/p/6534419.html
- (void)setupBaseView
{
    NSArray *hintImgs = @[@"refresh_no_data", @"refresh_no_network", @"refresh_request_error"];
    NSArray *hintContents = @[@"空空如也", @"网络连接异常,请重新检查网络", @"请求失败,请稍后重试"];
    NSArray *hintBtnTitles = @[@"点击刷新", @"点击刷新", @"点击刷新"];

    // 图标
    UIImageView *hintImgView = [[UIImageView alloc] init];
    hintImgView.image = [self imageNamed:hintImgs[_dataType] ofBundle:@"NYHResource.bundle"];
    [self addSubview:hintImgView];

    // 提示内容
    UILabel *hintLabel = [[UILabel alloc] init];
    hintLabel.text = hintContents[_dataType];
    hintLabel.textAlignment = NSTextAlignmentCenter;
    hintLabel.font = [UIFont systemFontOfSize:15.0f];
    hintLabel.textColor = [UIColor blueColor];
    [self addSubview:hintLabel];

    // 提示按钮
    UIButton *hintBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [hintBtn setTitle:hintBtnTitles[_dataType] forState:UIControlStateNormal];
    [hintBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    hintBtn.titleLabel.font = [UIFont systemFontOfSize:15.0f];
    hintBtn.layer.cornerRadius = 5.0f;
    hintBtn.layer.masksToBounds = YES;
    hintBtn.layer.borderColor = [UIColor blueColor].CGColor;
    hintBtn.layer.borderWidth = 1.0f;
    [hintBtn addTarget:self action:@selector(hintBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:hintBtn];


    hintImgView.bounds = CGRectMake(0, 0, 200, 200);
    CGPoint hintImgViewCenter = CGPointMake(self.center.x, self.center.y - 100);
    hintImgView.center = hintImgViewCenter;
    
    
    hintLabel.bounds = CGRectMake(0, 0, self.bounds.size.width, 20);
    CGPoint hintLabelCenter = CGPointMake(self.center.x, self.center.y + 20);
    hintLabel.center = hintLabelCenter;


    hintBtn.bounds = CGRectMake(0, 0, 160, 40);
    CGPoint hintBtnCenter = CGPointMake(self.center.x, self.center.y + 80);
    hintBtn.center = hintBtnCenter;
}

// 获取 bundle 中的资源
- (UIImage *)imageNamed:(NSString *)name ofBundle:(NSString *)bundleName
{
    UIImage *image = nil;
    NSString *imageName = [NSString stringWithFormat:@"%@.png", name];
    NSString *resourcePath = [[NSBundle mainBundle] resourcePath];
    NSString *bundlePath = [resourcePath stringByAppendingPathComponent:bundleName];
    NSString *imagePath = [bundlePath stringByAppendingPathComponent:imageName];;
    image = [[UIImage alloc] initWithContentsOfFile:imagePath];
    return image;
}


#pragma mark - 刷新事件

- (void)hintBtnAction:(UIButton *)btn
{
    if (self.emptyViewHandler) {
        self.emptyViewHandler(_dataType, btn);
    }

    NSLog(@"%ld - %@", _dataType, btn);
}

- (void)dealloc
{
    NSLog(@"销毁了:%s", __FUNCTION__);
}


@end
