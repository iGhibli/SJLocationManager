# SJLocationManager
使用block方式实现一行代码获取用户地理位置信息（定位）。


### Usage 使用方法:

1. `iOS8.0+`先在`info.plist`中, 添加`NSLocationWhenInUseUsageDescription`或`NSLocationAlwaysUsageDescription`定位权限。
2. 获取用户位置调用如下方法：

```objc
	self.manager = [[SJLocationManager alloc] init];
	[self.manager getSJLocation:^(SJLocation *location, CLLocationManager *manager) {
		// 自己按需要自定义SJLocation位置信息Model
		// 若只需要获取一次位置，在此添加 [manager stopUpdatingLocation]; 即可。
		NSLog(@"---%@---%@---%@", location.longitudeStr, location.latitudeStr, location.timeStampStr);
		NSLog(@"---%@", manager);
	} failure:^(NSError *error, CLLocationManager *manager) {
		// 此处可根据定位失败原因判断定位定位权限问题，并提示用户打开权限
		NSLog(@"---error--- %@", error);
		NSLog(@"---%@", manager);
	}];
	
	
```