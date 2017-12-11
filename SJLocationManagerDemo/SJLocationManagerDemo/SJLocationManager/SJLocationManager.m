//
//  SJLocationManager.m
//  SJLocationManager
//
//  Created by YF on 2017/12/11.
//  Copyright © 2017年 YF. All rights reserved.
//

#import "SJLocationManager.h"

@interface SJLocationManager ()<CLLocationManagerDelegate>
@property (nonatomic, strong) CLLocationManager *locationManager;
@property (nonatomic, copy) void(^handlerBlock)(SJLocation *location, CLLocationManager *manager);
@property (nonatomic, copy) void(^failureBlock)(NSError *error, CLLocationManager *manager);

@end

@implementation SJLocationManager

#pragma mark - Public
- (void)getSJLocation:(void (^)(SJLocation *, CLLocationManager *))handler failure:(void (^)(NSError *, CLLocationManager *))failure {
    [self.locationManager startUpdatingLocation];
    if (handler) {
        self.handlerBlock = handler;
    }
    if (failure) {
        self.failureBlock = failure;
    }
}

#pragma mark - Location delegate
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
    
    // 获取新的位置
    CLLocation * newLocation = locations.lastObject;
    // 创建自定义模型
    SJLocation *location = [[SJLocation alloc] init];
    // 存储经度
    location.longitudeStr = [NSString stringWithFormat:@"%f", newLocation.coordinate.longitude];
    // 存储纬度
    location.latitudeStr = [NSString stringWithFormat:@"%f", newLocation.coordinate.latitude];
    // 存储定位时间
    NSTimeInterval interval = [newLocation.timestamp timeIntervalSince1970];
    NSString *timestamp = [NSString stringWithFormat:@"%f", interval];
    location.timeStampStr = timestamp;
    
    if (self.handlerBlock) {
        self.handlerBlock(location, manager);
    }
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    if (self.failureBlock) {
        self.failureBlock(error, manager);
    }
}

#pragma mark - Setter and Getter
- (CLLocationManager *)locationManager {
    if (!_locationManager) {
        _locationManager = [[CLLocationManager alloc] init];
        _locationManager.delegate = self;
        // 设置定位精确度
        _locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        // 设置过滤器为100米
        _locationManager.distanceFilter = 100.f;
        // 取得定位权限，两种权限: requestAlwaysAuthorization、requestWhenInUseAuthorization
        [_locationManager requestWhenInUseAuthorization];// iOS8以上版本使用。
    }
    return _locationManager;
}

@end
