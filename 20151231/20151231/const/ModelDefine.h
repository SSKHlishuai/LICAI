//
//  ModelDefine.h
//  WCProject
//
//  Created by mc on 15/8/10.
//  Copyright (c) 2015年 mc. All rights reserved.
//

#ifndef WCProject_ModelDefine_h
#define WCProject_ModelDefine_h


#define Master_Man      1
#define Master_Woman    2



//发布中的单位类型，天，半天，时，场，单
typedef enum{
    
    PriceTypeDay = 0,
    PriceTypeHalfday,
    PriceTypeHour,
    PriceTypeChang,
    PriceTypeDan
    
}PriceType;



typedef enum{
    ServiceFilterTypeUndeal = 0,
    ServiceFilterTypeDealing,
    ServiceFilterTypeFinished
}ServiceFilterType;



#endif
