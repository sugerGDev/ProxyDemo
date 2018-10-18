//
// Created by suger on 2018/10/18.
// Copyright (c) 2018 maimaimai Co.,Ltd. All rights reserved.
//

#import "BluetoothSDK.h"
#import "_CenterMgrDelegateProxy.h"

@interface BluetoothSDK()
@property(nonatomic, strong)CBCentralManager *manger;
@property(nonatomic, strong)_CenterMgrDelegateProxy *proxy ;

@end


@implementation BluetoothSDK {

}
+ (instancetype)sharedInstance {
    static id _sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[self alloc] init];
    });

    return _sharedInstance;
}

- (void)proxyCentralManager:(CBCentralManager *)manger  delegate:(id<CBCentralManagerDelegate>)delegate  {
  
    NSAssert([manger isKindOfClass:CBCentralManager.class], @"请检查 CBCentralManager 对象");
    NSAssert([delegate conformsToProtocol:@protocol(CBCentralManagerDelegate)],@"请检查是否实现 CBCentralManagerDelegate");
    
    self.manger = manger;
    self.proxy = [[_CenterMgrDelegateProxy alloc]initWithTarget:delegate];
    self.manger.delegate = self.proxy;
    
}

- (void)destoryProxy {

    self.manger.delegate = (id<CBCentralManagerDelegate>) self.proxy.target;
    self.manger = nil;
    self.proxy = nil;
}
@end
