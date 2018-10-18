//
// Created by suger on 2018/10/18.
// Copyright (c) 2018 maimaimai Co.,Ltd. All rights reserved.
//

#import "_CenterMgrDelegateProxy.h"


@implementation _CenterMgrDelegateProxy
@synthesize target = _target;

#pragma mark - <NSPory>
- (instancetype)initWithTarget:(id<CBCentralManagerDelegate>)target {
   _target = target;
    return self;
}


- (id)forwardingTargetForSelector:(SEL)selector {
    return _target;
}

- (void)forwardInvocation:(NSInvocation *)invocation {
    void *null = NULL;
    [invocation setReturnValue:&null];
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)selector {
    return [NSObject instanceMethodSignatureForSelector:@selector(init)];
}

- (BOOL)respondsToSelector:(SEL)aSelector {
    return [_target respondsToSelector:aSelector];
}

- (BOOL)isEqual:(id)object {
    return [_target isEqual:object];
}

- (NSUInteger)hash {
    return [_target hash];
}

- (Class)superclass {
    return [_target superclass];
}

- (Class)class {
    return [_target class];
}

- (BOOL)isKindOfClass:(Class)aClass {
    return [_target isKindOfClass:aClass];
}

- (BOOL)isMemberOfClass:(Class)aClass {
    return [_target isMemberOfClass:aClass];
}

- (BOOL)conformsToProtocol:(Protocol *)aProtocol {
    return [_target conformsToProtocol:aProtocol];
}

- (BOOL)isProxy {
    return YES;
}

- (NSString *)description {
    return [_target description];
}

- (NSString *)debugDescription {
    return [_target debugDescription];
}

#pragma mark - <CBCentralManagerDelegate>

- (void)centralManagerDidUpdateState:(CBCentralManager *)central {

    NSLog(@"这是SDK层 -centralManagerDidUpdateState：%@",central);

    //TODO:你可以做很多，比如你可以在这里处理是归属于SDK 内部的逻辑，就不要往应用层传递
    if ([_target respondsToSelector:@selector(centralManagerDidUpdateState:)]) {
        [_target centralManagerDidUpdateState:central];
    }
}


//TODO: 以下方法都可以被拦截，因为属于 CBCentralManagerDelegate
/**
- (void)centralManager:(CBCentralManager *)central willRestoreState:(NSDictionary<NSString *, id> *)dict;


- (void)centralManager:(CBCentralManager *)central didDiscoverPeripheral:(CBPeripheral *)peripheral advertisementData:(NSDictionary<NSString *, id> *)advertisementData RSSI:(NSNumber *)RSSI;


- (void)centralManager:(CBCentralManager *)central didConnectPeripheral:(CBPeripheral *)peripheral;


- (void)centralManager:(CBCentralManager *)central didFailToConnectPeripheral:(CBPeripheral *)peripheral error:(nullable NSError *)error;
 
 
- (void)centralManager:(CBCentralManager *)central didDisconnectPeripheral:(CBPeripheral *)peripheral error:(nullable NSError *)error;
*/
@end
