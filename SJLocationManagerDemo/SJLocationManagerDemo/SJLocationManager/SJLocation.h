//
//  SJLocation.h
//  SJLocationManager
//
//  Created by YF on 2017/12/11.
//  Copyright © 2017年 YF. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface SJLocation : NSObject

// 经度
@property (nonatomic, copy) NSString *longitudeStr;
// 纬度
@property (nonatomic, copy) NSString *latitudeStr;
// 时间戳
@property (nonatomic, copy) NSString *timeStampStr;

@end
