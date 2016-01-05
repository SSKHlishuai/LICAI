
//
//  Defaultdefine.h
//  WCProject
//
//  Created by mc on 15/7/21.
//  Copyright (c) 2015年 mc. All rights reserved.
//

#ifndef WCProject_Defaultdefine_h
#define WCProject_Defaultdefine_h

//frame
#define FRAME(a,b,c,d) CGRectMake(a,b,c,d)
#define NavaStatusHeight    64.f
#define KTabbarHeight       49.f
#define StatusBarHeight     20.f
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
#define kScreenWidth [UIScreen mainScreen].bounds.size.width

#define ScaleIphone kScreenWidth/320.f

//颜色
#define HexRGBA(rgbValue,al) [UIColor colorWithRed:((float)((rgbValue&0xFF0000)>>16))/255.0 green:((float)((rgbValue&0xFF00)>>8))/255.0 blue:((float)(rgbValue&0xFF))/255.0 alpha:al]
#define HexRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue&0xFF0000)>>16))/255.0 green:((float)((rgbValue&0xFF00)>>8))/255.0 blue:((float)(rgbValue&0xFF))/255.0 alpha:1.0]
#define COLOR_VAULE(vaule)[UIColor colorWithRed:vaule/255.0 green:vaule/255.0 blue:vaule/255.0 alpha:1.0]
#define COLOR_DIFFERENT_VAULE(a,b,c)[UIColor colorWithRed:a/255.0 green:b/255.0 blue:c/255.0 alpha:1.0]


//加载图片
#define LOADIMAGE(file,ext) [UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:file ofType:ext]]
#define BLACK_GROUND_IMAGE(name)[UIColor colorWithPatternImage:[UIImage imageNamed:name]]
#define IMAGE_NAMED(name) [UIImage imageNamed:name]

#define PayColor HexRGB(0xf97088)
#define IncomeColor HexRGB(0x199cf8)
//字体

#define Label_font(fontSize) [UIFont systemFontOfSize:fontSize]

#define SYSTEM_FONT(fontSize) [UIFont fontWithName:@"Heiti SC" size:fontSize]

#define APP_STYLE_COLOR HexRGB(0x7cb745)

#define Input_Textfield_Height      44.f

#define Normal_Button_Height        44.f                 //通常是指类似登录按键

#define Normal_Button_Font          20.f                 //通常是指类似登录按键

#define Normal_BgColor              HexRGB(0xececec)     //通常类似登录页面的背景色

#define Normal_Placeholder_Color    HexRGB(0xc9caca)     //通常指textfield/view 的提示颜色

#define Normal_Border_Color         HexRGB(0xc9caca)     //通常指border边界线的颜色

#define Normal_TV_Cornerradio           15.f

#define DDICT(key) [dict objectForKey:key]

#define DICT(key)  [NSString stringWithFormat:@"%@",DDICT(key)?DDICT(key):@""]

#define WCDict(key) [OCUtils dictionaryValue:dict forKey:key]

#define WCNOStringDict(key) [OCUtils dictionaryNotString:dict forKey:key]

#define  NSUSERDEFAULTS(userDetaults) NSUserDefaults *userDetaults = [NSUserDefaults standardUserDefaults];

#define ManTag      @"false"
#define WomanTag    @"true"

#define YEAR_SECONDS  365*24*60*60


#pragma mark - personal  key 


#define Loginer_login       @"islogin"
#define Login_NO            @"no"
#define Login_YES           @"yes"
#define Loginer_nickname    @"nickname"
#define Loginer_age         @"age"
#define Loginer_birthday    @"birthday"
#define Loginer_headurl     @"headurl"
#define Loginer_mood        @"mood"
#define Loginer_profileurl  @"profileUrl"
#define Loginer_gender      @"gender"


#endif
