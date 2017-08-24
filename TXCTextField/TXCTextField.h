//
//  TXCTextField.h
//  XinPeiWeiYingXiao
//
//  Created by 张雄 on 2017/7/3.
//  Copyright © 2017年 张天雄. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TXCTextField;
/*TextField改变*/
typedef void (^TXTextFieldDidChange)(TXCTextField * textField);
/*第一响应*/
typedef BOOL (^TXFirstResponder)(TXCTextField * textField);
/*描述Alignment*/
typedef NS_ENUM(NSInteger,TXPlaceholderAlignment){
    TXPlaceholderAlignmentLeft   = 0,//居左
    TXPlaceholderAlignmentCenter = 1,//居中
    TXPlaceholderAlignmentRight  = 2,//居右
};
@interface TXCTextField : UITextField<UITextFieldDelegate>
/*设置描述字体*/
- (void)setPlaceholderFont:(UIFont*)placeholderFont;
/*设置描述颜色*/
- (void)setPlaceholderColor:(UIColor*)placeholderColor;
/*光标颜色*/
- (void)setCursorColor:(UIColor*)cursorColor;
/*设置描述对齐方式*/
- (void)setPlaceholderAlignment:(TXPlaceholderAlignment)placeholderAlignment;
/*TextField改变*/
@property (nonatomic,copy)TXTextFieldDidChange  textFieldDidChange;
/*第一响应*/
@property (nonatomic,copy)TXFirstResponder firstResponderHandler;

@end
