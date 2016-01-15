//
//  LSKeyboard.m
//  XIBDemo
//
//  Created by analysys on 16/1/6.
//  Copyright © 2016年 analysys. All rights reserved.
//

#import "LSKeyboard.h"

enum
{
    KeyboardButtonTagDelete = 99,
    KeyboardButtonTagZero,
    KeyboardButtonTagOne,
    KeyboardButtonTagTwo,
    KeyboardButtonTagThree,
    KeyboardButtonTagFour,
    KeyboardButtonTagFive,
    KeyboardButtonTagSix,
    KeyboardButtonTagSeven,
    KeyboardButtonTagEight,
    KeyboardButtonTagNine,
    KeyboardButtonTagPoint,
    KeyboardButtonTagFinish = 200,
    KeyboardButtonTagHide
};


@interface LSKeyboard ()
{
    NSMutableString *inputStr;
}
@end
@implementation LSKeyboard


-(void)awakeFromNib
{
    inputStr = [[NSMutableString alloc]init];
    [inputStr appendString:@"0"];
}


- (IBAction)buttonClick:(UIButton *)sender {
    if(sender.tag>=KeyboardButtonTagZero&&sender.tag<=KeyboardButtonTagNine)
    {
        if(sender.tag == KeyboardButtonTagZero && inputStr.length==1 &&[inputStr integerValue]==0)
        {
        }
        else
        {
            if(inputStr.length==1 && [inputStr integerValue]==0)
            {
                [inputStr replaceCharactersInRange:NSMakeRange(0, 1) withString:[NSString stringWithFormat:@"%ld",sender.tag-100]];
            }
            else
            {
                [inputStr appendFormat:@"%ld",sender.tag-100];

            }

        }

    }
    else if(sender.tag == KeyboardButtonTagPoint)
    {
        NSRange range = [inputStr rangeOfString:@"."];
        if(range.location == NSNotFound)
        {
            [inputStr appendFormat:@"."];

        }
        else
        {
            
        }
    }
    else if(sender.tag == KeyboardButtonTagDelete)
    {
        if(inputStr.length>1)
        {
            [inputStr deleteCharactersInRange:NSMakeRange(inputStr.length-1, 1)];
            
            if([inputStr hasSuffix:@"."])
            {
                [inputStr deleteCharactersInRange:NSMakeRange(inputStr.length-1, 1)];
                
            }

        }
        else if(inputStr.length == 1)
        {
            [inputStr deleteCharactersInRange:NSMakeRange(inputStr.length-1, 1)];
            [inputStr appendString:@"0"];

        }
        
        else
        {
        }
        
    }
    else if(sender.tag == KeyboardButtonTagFinish)//finish
    {
       if([self.lskeyboardDelegate respondsToSelector:@selector(didFinish)])
       {
           [self.lskeyboardDelegate didFinish];
       }
    }
    else if(sender.tag == KeyboardButtonTagHide)
    {
        if([self.lskeyboardDelegate respondsToSelector:@selector(hideKeyboard)])
        {
            [self.lskeyboardDelegate hideKeyboard];
        }
    }
    
    if([self.lskeyboardDelegate respondsToSelector:@selector(changeNumber:)])
    {
        [self.lskeyboardDelegate changeNumber:inputStr];
    }
    
}



@end
