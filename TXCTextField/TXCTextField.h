//
//  TXCTextField.h
//  TXCTextField
//
//  Created by 张雄 on 2017/11/8.
//  Copyright © 2017年 张雄. All rights reserved.
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
@interface TXCTextField : UITextField
/*描述字体*/
@property (nonatomic,strong)UIFont  * placeholderFont;
/*描述颜色*/
@property (nonatomic,strong)UIColor * placeholderColor;
/*光标颜色*/
@property (nonatomic,strong)UIColor * cursorColor;
/*描述间距*/
@property (nonatomic,assign)CGFloat placeholderSpacing;
/*左侧文本填充宽度*/
@property (nonatomic,assign)CGFloat textFieldLeftPaddingWidth;
/*描述对齐方式*/
@property (nonatomic,assign)TXPlaceholderAlignment placeholderAlignment;
/*TextField改变*/
@property (nonatomic,copy)TXTextFieldDidChange  textFieldDidChange;
/*第一响应*/
@property (nonatomic,copy)TXFirstResponder firstResponderHandler;
@end
