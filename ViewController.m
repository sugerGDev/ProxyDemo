//
//  ViewController.m
//  ProxyDemo
//
//  Created by suger on 2018/10/18.
//  Copyright © 2018 maimaimai Co.,Ltd. All rights reserved.
//

#import "ViewController.h"
#import "BluetoothSDK.h"
#import <CoreBluetooth/CoreBluetooth.h>

@interface ViewController ()<CBCentralManagerDelegate>
@property (nonatomic, strong)CBCentralManager *manager;
@end

@implementation ViewController
- (void)dealloc {
    [BluetoothSDK .sharedInstance destoryProxy];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    NSLog(@"------ 这是一个 NSProxy 实例，请查看TODO注解------ ");
    
    //TODO: 不管上层如何设置此时设置代理无所谓
    self.manager = [[CBCentralManager alloc] initWithDelegate:self queue:nil];

    //TODO: 此时只要告诉SDK 上层在哪儿设置过代理
    [BluetoothSDK.sharedInstance proxyCentralManager:self.manager delegate:self];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)centralManagerDidUpdateState:(CBCentralManager *)central {
    NSLog(@"这是应用层 -centralManagerDidUpdateState: %@",central);
}

@end
