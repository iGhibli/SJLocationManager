//
//  ViewController.m
//  SJLocationManagerDemo
//
//  Created by YF on 2017/12/11.
//  Copyright © 2017年 iGhibli. All rights reserved.
//

#import "ViewController.h"
#import "SJLocationManager.h"

@interface ViewController ()
@property (nonatomic, strong) SJLocationManager *manager;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *BT = [[UIButton alloc] init];
    [BT setTitle:@"GetLocation" forState:UIControlStateNormal];
    [BT setBackgroundColor:[UIColor redColor]];
    [BT addTarget:self action:@selector(getAddressBook) forControlEvents:UIControlEventTouchUpInside];
    BT.bounds = CGRectMake(0, 0, 150, 60);
    BT.center = CGPointMake([UIScreen mainScreen].bounds.size.width / 2, [UIScreen mainScreen].bounds.size.height / 2);
    [self.view addSubview:BT];
}

- (void)getAddressBook {
    self.manager = [[SJLocationManager alloc] init];
    [self.manager getSJLocation:^(SJLocation *location, CLLocationManager *manager) {
        // 若只需要获取一次位置，在此添加 [manager stopUpdatingLocation]; 即可。
        
        NSLog(@"---%@---%@---%@", location.longitudeStr, location.latitudeStr, location.timeStampStr);
        NSLog(@"---%@", manager);
    } failure:^(NSError *error, CLLocationManager *manager) {
        NSLog(@"---error--- %@", error);
        NSLog(@"---%@", manager);
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
