//
//  Utils.m
//  WCProject
//
//  Created by mc on 15/7/27.
//  Copyright (c) 2015年 mc. All rights reserved.
//

#import "Utils.h"

@implementation UILabel (init)

+(UILabel*)labelWithFrame:(CGRect)rect withTitle:(NSString *)myTitle withBackground:(UIColor *)bgcolor withtextColor:(UIColor *)textColor withFont:(UIFont *)textFont withAlignment:(NSTextAlignment)textAlignment
{
    UILabel *label = [[UILabel alloc]initWithFrame:rect];
    label.text = myTitle;
    label.backgroundColor = bgcolor;
    label.textColor = textColor;
    label.font = textFont;
    label.textAlignment = textAlignment;
    return label;
}


@end

@implementation UIButton (init)

#pragma mark - UIButton

+(UIButton*)buttonWithFrame:(CGRect)rect withType:(UIButtonType)buttonType withBackground:(UIColor *)bgcolor
{
    UIButton *button = [UIButton buttonWithType:buttonType];
    button.frame = rect;
    button.backgroundColor = bgcolor;
    return button;
}


+(UIButton*)buttonWithFrame:(CGRect)rect withType:(UIButtonType)buttonType withBackground:(UIColor *)bgcolor withImage:(UIImage *)norImage withHighImage:(UIImage *)highImage
{
    UIButton *button = [UIButton buttonWithFrame:rect withType:buttonType withBackground:bgcolor];
    [button setImage:norImage forState:UIControlStateNormal];
    [button setImage:highImage forState:UIControlStateHighlighted];
    return button;
}

+(UIButton*)buttonWithFrame:(CGRect)rect withType:(UIButtonType)buttonType withBackground:(UIColor *)bgcolor withTitle:(NSString *)title withTitleColor:(UIColor *)titleColor withFont:(UIFont *)titleFont
{
    UIButton *button = [UIButton buttonWithFrame:rect withType:buttonType withBackground:bgcolor];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:titleColor forState:UIControlStateNormal];
    button.titleLabel.font = titleFont;
    return button;
}

@end

@implementation UIView (init)





#pragma mark - UIView

+(UIView*)viewWithFrame:(CGRect)rect withBackground:(UIColor *)bgcolor
{
    UIView* view = [[UIView alloc]initWithFrame:rect];
    view.backgroundColor = bgcolor;
    return view;
}
+(UIView*)getLineY:(CGFloat)y withWidth:(CGFloat)width
{
    UIView *view = [UIView viewWithFrame:FRAME((kScreenWidth-width)/2.f, y, width, 0.5f) withBackground:HexRGB(0xb3b3b3)];
    return view;
    
}
+(UIView*)getLineY:(CGFloat)y withWidth:(CGFloat)width withColor:(UIColor *)bgcolor
{
    UIView *view = [UIView viewWithFrame:FRAME((kScreenWidth-width)/2.f, y, width, 0.5f) withBackground:bgcolor];
    return view;
}

+(UIView*)getVerticalLineWithX:(CGFloat)x WithY:(CGFloat)y withHeight:(CGFloat)height
{
    UIView *view = [UIView viewWithFrame:FRAME(x, y, 0.5f, height) withBackground:HexRGB(0xb3b3b3)];
    return view;

}

+(UIView*)getVerticalLineWithX:(CGFloat)x WithY:(CGFloat)y withHeight:(CGFloat)height withColor:(UIColor *)bgcolor
{
    UIView *view = [UIView viewWithFrame:FRAME(x, y, 0.5f, height) withBackground:bgcolor];
    return view;
}


@end


@implementation UIImageView (init)



#pragma mark - UIImageView
+(UIImageView*)imageviewWithFrame:(CGRect)rect
{
    UIImageView *imageview = [[UIImageView alloc]initWithFrame:rect];
    imageview.contentMode = UIViewContentModeScaleAspectFill;
    imageview.clipsToBounds = YES;
    return imageview;
}
+(UIImageView*)imageviewWithFrame:(CGRect)rect withImage:(UIImage *)theImage
{
    UIImageView *imageview = [[UIImageView alloc]initWithFrame:rect];
    imageview.image = theImage;
    imageview.contentMode = UIViewContentModeScaleAspectFit;
    return imageview;
}

@end

@implementation UIScrollView(utils)


#pragma mark - UIScrollView

+(UIScrollView*)scrollWithFrame:(CGRect)rect withBackground:(UIColor*)bgcolor
{
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:rect];
    scrollView.backgroundColor = bgcolor;
    return scrollView;
}

@end

@implementation UITableView (init)



#pragma mark - UITableView
+(UITableView*)tableViewWithFrame:(CGRect)rect withTableStyle:(UITableViewStyle)tableStyle withBackground:(UIColor*)bgcolor
{
    UITableView *tableview = [[UITableView alloc]initWithFrame:rect style:tableStyle];
    tableview.backgroundColor = bgcolor;
    return tableview;
}





@end

@implementation UITextField(init)
#pragma mark - UITextField
+(UITextField*)textfieldWithFrame:(CGRect)rect withBorderStyle:(UITextBorderStyle)borderStyle withBackground:(UIColor *)bgcolor withTextColor:(UIColor *)textcolor withPlaceholder:(NSString *)placeholder withkeybordStyle:(UIKeyboardType)keybordType withTitle:(NSString *)title withIsClear:(UITextFieldViewMode)clearmode withFont:(UIFont *)textfont withTextaligment:(NSTextAlignment)textAlignment
{
    UITextField *textfield = [[UITextField alloc]initWithFrame:rect];
    textfield.borderStyle = borderStyle;
    textfield.backgroundColor = bgcolor;
    textfield.textColor = textcolor;
    textfield.keyboardType = keybordType;
    textfield.placeholder = placeholder;
    textfield.text = title;
    textfield.clearButtonMode = clearmode;
    textfield.font = textfont;
    textfield.textAlignment = textAlignment;
    return textfield;
}
+(UITextField*)textfieldWithFrame:(CGRect)rect withTextColor:(UIColor *)textcolor withPlaceholder:(NSString *)placeholder withFont:(UIFont *)textfont
{
    UITextField *textfield = [[UITextField alloc]initWithFrame:rect];
    textfield.textColor =textcolor;
    textfield.font = textfont;
    textfield.borderStyle = UITextBorderStyleNone;
    NSMutableParagraphStyle *par = [[NSMutableParagraphStyle alloc]init];
    NSDictionary *dict = @{NSFontAttributeName:SYSTEM_FONT(13.f),NSParagraphStyleAttributeName:par,NSForegroundColorAttributeName:Normal_Placeholder_Color};
    
    NSMutableAttributedString *attrstr = [[NSMutableAttributedString alloc]initWithString:placeholder attributes:dict];
    textfield.attributedPlaceholder = attrstr;
    UIView *leftview = [UIView viewWithFrame:FRAME(0, 0, 10, 10) withBackground:[UIColor clearColor]];
    textfield.leftView = leftview;
    textfield.leftViewMode = UITextFieldViewModeAlways;
    
    return textfield;

}



@end
