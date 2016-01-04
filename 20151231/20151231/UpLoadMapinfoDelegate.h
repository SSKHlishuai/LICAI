//
//  UpLoadMapinfoDelegate.h
//  WCProject
//
//  Created by mc on 15/8/19.
//  Copyright (c) 2015年 mc. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <CoreLocation/CoreLocation.h>


@protocol UpLoadMapinfoDelegate <NSObject>

-(void)loadCLLocationCoordinate2D:(CLLocationCoordinate2D)pt withAddress:(NSString*)address;

@end
