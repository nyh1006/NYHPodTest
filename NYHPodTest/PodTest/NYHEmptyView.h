//
//  NYHEmptyView.h
//  NYHPodTest
//
//  Created by greenspiderios on 2019/6/19.
//  Copyright © 2019 NYH. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/**
 数据加载类型
 
 - NYHNoDataType: 没有数据
 - NYHNoNetworkType: 没有网络
 - NYHRequestErrorType: 请求失败
 */
typedef enum : NSInteger {
    NYHNoDataType,
    NYHNoNetworkType,
    NYHRequestErrorType,
} NYHDataType;

typedef void(^NYHEmptyViewHandler)(NYHDataType dataType, UIButton * btn);


@interface NYHEmptyView : UIView

@property (nonatomic, assign) NYHDataType dataType;

@property (nonatomic, copy) NYHEmptyViewHandler emptyViewHandler;


+ (instancetype)sharedEmptyView;

+ (NYHEmptyView *)nyh_emptyView;


@end

NS_ASSUME_NONNULL_END
