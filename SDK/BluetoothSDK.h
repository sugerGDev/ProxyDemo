//
// Created by suger on 2018/10/18.
// Copyright (c) 2018 maimaimai Co.,Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreBluetooth/CoreBluetooth.h>


@interface BluetoothSDK : NSObject

+ (instancetype)sharedInstance;
- (void)proxyCentralManager:(CBCentralManager *)manger delegate:(id<CBCentralManagerDelegate>)delegate;
- (void)destoryProxy;

@end
