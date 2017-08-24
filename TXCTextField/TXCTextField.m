//
//  TXCTextField.m
//  XinPeiWeiYingXiao
//
//  Created by 张雄 on 2017/7/3.
//  Copyright © 2017年 张天雄. All rights reserved.
//

#import "TXCTextField.h"
#define TXCColor(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
@implementation TXCTextField
{
    NSString * _aPlaceholder;
    UIFont   * _placeholderFont;
    UIColor  * _placeholderColor;
    UIColor  * _cursorColor;
    TXPlaceholderAlignment _placeholderAlignment;
    CGFloat    _margin;
}
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self configure];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder]) {
        [self configure];
    }
    return self;
}
//通过xib创建
-(void)awakeFromNib{
    [super awakeFromNib];
    [self configure];
}
/*设置描述字体*/
- (void)setPlaceholderFont:(UIFont*)placeholderFont{
    _placeholderFont = placeholderFont;
    [self setValue:_placeholderFont forKeyPath:@"_placeholderLabel.font"];
}
/*设置描述颜色*/
- (void)setPlaceholderColor:(UIColor*)placeholderColor{
    _placeholderColor = placeholderColor;
     [self setValue:_placeholderColor forKeyPath:@"_placeholderLabel.textColor"];
}
/*光标颜色*/
- (void)setCursorColor:(UIColor*)cursorColor{
    _cursorColor = cursorColor;
    self.tintColor = _cursorColor;
}
/*设置描述对齐方式*/
- (void)setPlaceholderAlignment:(TXPlaceholderAlignment)placeholderAlignment{
    _placeholderAlignment=placeholderAlignment;
    [self placeholderRectForBounds:self.bounds];
}
/*配置*/
- (void)configure{
    self.font = [UIFont systemFontOfSize:14];
    _margin = 5.0;
    [self setPlaceholderFont:[UIFont systemFontOfSize:14]];
    [self setPlaceholderColor:TXCColor(211, 211, 215, 1)];
    [self setCursorColor:TXCColor(69, 111, 238,1)];
    [self setPlaceholderAlignment:TXPlaceholderAlignmentLeft];
    // 不成为第一响应者
    [self resignFirstResponder];
    [self addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    self.delegate=self;
}
/*当前文本框聚焦时就会调用*/
- (BOOL)becomeFirstResponder{
    // 修改占位文字颜色
    [self setPlaceholderColor:_placeholderColor];
    return [super becomeFirstResponder];
}
/*当前文本框失去焦点时就会调用*/
- (BOOL)resignFirstResponder{
    // 修改占位文字颜色
    [self setPlaceholderColor:_placeholderColor];
    return [super resignFirstResponder];
}
/*控制placeHolder的位置*/
-(CGRect)placeholderRectForBounds:(CGRect)bounds{
    CGFloat viewW=bounds.size.width;
    CGFloat viewH=bounds.size.height;
    CGFloat placeholderLabelY=bounds.origin.y;
    NSDictionary * dic = @{NSFontAttributeName:_placeholderFont};
    CGSize size = [_aPlaceholder boundingRectWithSize:CGSizeMake(viewW-_margin*2, viewH) options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil].size;
    CGFloat placeholderLabelX=_margin;
    if (_placeholderAlignment==TXPlaceholderAlignmentCenter) {
        placeholderLabelX=(viewW-size.width)/2;
    }else if (_placeholderAlignment==TXPlaceholderAlignmentRight){
        placeholderLabelX=viewW-size.width-_margin;
    }
    CGRect inset = CGRectMake(placeholderLabelX,placeholderLabelY , viewW,bounds.size.height);
    return inset;
}
- (void)setPlaceholder:(NSString *)placeholder{
    [super setPlaceholder:placeholder];
    _aPlaceholder=placeholder;
}
/*控制显示文本的位置*/
-(CGRect)textRectForBounds:(CGRect)bounds{
    CGRect inset = CGRectMake(bounds.origin.x+_margin, bounds.origin.y, bounds.size.width-_margin, bounds.size.height);
    return inset;
}
/*控制编辑文本的位置*/
-(CGRect)editingRectForBounds:(CGRect)bounds{
    CGRect inset = CGRectMake(bounds.origin.x+_margin, bounds.origin.y, bounds.size.width-_margin, bounds.size.height);
    return inset;
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
@end
