//
//  SJLocationManager.h
//  SJLocationManager
//
//  Created by YF on 2017/12/11.
//  Copyright © 2017年 YF. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SJLocation.h"

@interface SJLocationManager : NSObject

- (void)getSJLocation:(void(^)(SJLocation *location, CLLocationManager *manager))handler failure:(void(^)(NSError *error, CLLocationManager *manager))failure;

@end
