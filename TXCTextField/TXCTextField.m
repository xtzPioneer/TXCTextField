//
//  TXCTextField.m
//  TXCTextField
//
//  Created by 张雄 on 2017/11/8.
//  Copyright © 2017年 张雄. All rights reserved.
//

#import "TXCTextField.h"
/*描述系统默认字体大小*/
#define SYSTE_DEFAULT_PLACEHOLDERFONT  [UIFont systemFontOfSize:17]
/*描述系统默认字体颜色*/
#define SYSTE_DEFAULT_PLACEHOLDERCOLOR [UIColor colorWithRed:0 green:0 blue:0.0980392 alpha:0.22]
/*光标系统默认颜色*/
#define SYSTE_DEFAULT_CURSORCOLOR      [UIColor colorWithRed:0 green:0.478431 blue:1 alpha:1];
@interface TXCTextField ()<UITextFieldDelegate>
@property (nonatomic,copy)NSString * aPlaceholder;
@end
@implementation TXCTextField

-(instancetype)init{
    if (self = [super init]) {
        [self initializationData];
    }
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self initializationData];
    }
    return self;
}
- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder]) {
        [self initializationData];
    }
    return self;
}
/*通过xib创建*/
-(void)awakeFromNib{
    [super awakeFromNib];
    [self initializationData];
}
/*初始化数据*/
- (void)initializationData{
    //描述系统默认字体大小
    self.placeholderFont=SYSTE_DEFAULT_PLACEHOLDERFONT;
    //描述系统默认字体颜色
    self.placeholderColor=SYSTE_DEFAULT_PLACEHOLDERCOLOR;
    //光标系统默认颜色
    self.cursorColor=SYSTE_DEFAULT_CURSORCOLOR;
    //设置代理
    self.delegate=self;
    //描述间距
    self.placeholderSpacing=5.0;
    //左侧文本填充宽度
    self.textFieldLeftPaddingWidth=5.0;
    //描述左对齐
    self.placeholderAlignment=TXPlaceholderAlignmentLeft;
    //不成为第一响应者
    [self resignFirstResponder];
    //代理方法
    [self addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
}
/*设置描述*/
- (void)setPlaceholder:(NSString *)placeholder{
    [super setPlaceholder:placeholder];
    self.aPlaceholder=placeholder;
}
/*描述字体*/
- (void)setPlaceholderFont:(UIFont *)placeholderFont{
    _placeholderFont=placeholderFont;
    [self setValue:_placeholderFont forKeyPath:@"_placeholderLabel.font"];
}
/*描述颜色*/
- (void)setPlaceholderColor:(UIColor *)placeholderColor{
    _placeholderColor=placeholderColor;
    [self setValue:_placeholderColor forKeyPath:@"_placeholderLabel.textColor"];
}
/*光标颜色*/
- (void)setCursorColor:(UIColor *)cursorColor{
    _cursorColor=cursorColor;
    self.tintColor=_cursorColor;
}
/*描述对齐方式*/
- (void)setPlaceholderAlignment:(TXPlaceholderAlignment)placeholderAlignment{
    _placeholderAlignment=placeholderAlignment;
}
/*TextField改变*/
- (void)textFieldDidChange:(TXCTextField*)textField{
    if (self.textFieldDidChange) {
        self.textFieldDidChange(self);
    }
}
/*第一响应*/
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    if (self.firstResponderHandler) {
        return self.firstResponderHandler(self);;
    }
    return YES;
}
/*当前文本框聚焦时就会调用*/
- (BOOL)becomeFirstResponder{
    //修改占位文字颜色
    [self setPlaceholderColor:self.placeholderColor];
    return [super becomeFirstResponder];
}
/*当前文本框失去焦点时就会调用*/
- (BOOL)resignFirstResponder{
    //修改占位文字颜色
    [self setPlaceholderColor:self.placeholderColor];
    return [super resignFirstResponder];
}
/*布局子视图*/
- (void)layoutSubviews{
    [super layoutSubviews];
    [self setupPlaceholderLabelFrame];
}
/*设置PlaceholderLabel框架*/
- (void)setupPlaceholderLabelFrame{
    CGFloat width=self.frame.size.width;
    CGFloat height=self.frame.size.height;
    //获取系统描述Label
    UILabel * placeholderLabel=[self valueForKeyPath:@"_placeholderLabel"];
    //计算描述大小
    NSDictionary * dic=@{NSFontAttributeName:self.placeholderFont};
    CGSize size=[self.aPlaceholder boundingRectWithSize:CGSizeMake(width-self.placeholderSpacing*2.0,height) options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil].size;
    CGFloat placeholderLabelX=0.0;
    CGFloat placeholderLabelY=(height-size.height)/2.0;
    CGFloat placeholderLabelW=size.width;
    CGFloat placeholderLabelH=size.height;
    //描述对齐方式
    if (self.placeholderAlignment==TXPlaceholderAlignmentLeft) {
        placeholderLabelX=self.placeholderSpacing;
    }else if (self.placeholderAlignment==TXPlaceholderAlignmentCenter){
        placeholderLabelX=(width-size.width)/2.0;
    }else{
        placeholderLabelX=width-size.width-self.placeholderSpacing;
    }
    placeholderLabel.frame=CGRectMake(placeholderLabelX, placeholderLabelY, placeholderLabelW, placeholderLabelH);
}
/*左侧文本填充宽度*/
- (void)setTextFieldLeftPaddingWidth:(CGFloat)textFieldLeftPaddingWidth{
    _textFieldLeftPaddingWidth=textFieldLeftPaddingWidth;
    CGRect frame=self.frame;
    frame.size.width=_textFieldLeftPaddingWidth;
    UIView *leftview=[[UIView alloc] initWithFrame:frame];
    self.leftViewMode=UITextFieldViewModeAlways;
    self.leftView=leftview;
}
/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

@end
