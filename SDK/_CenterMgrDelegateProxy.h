//
// Created by suger on 2018/10/18.
// Copyright (c) 2018 maimaimai Co.,Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreBluetooth/CoreBluetooth.h>

// TODO: 该类属于私有类，可以不用在SDK 公开，在打包SDK的时候，可以设置下
@interface _CenterMgrDelegateProxy : NSProxy <CBCentralManagerDelegate>{
    __weak id<CBCentralManagerDelegate> _target;
}
@property (nonatomic, weak, readonly)id<CBCentralManagerDelegate> target;

- (instancetype)initWithTarget:(id<CBCentralManagerDelegate>)target;
@end
