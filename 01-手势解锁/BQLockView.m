//
//  BQLockView.m
//  01-手势解锁
//
//  Created by 严必庆 on 15-5-30.
//  Copyright (c) 2015年 严必庆. All rights reserved.
//

#import "BQLockView.h"

@implementation BQLockView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];

        }
    return self;
}

-(id)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder]) {
        [self setup];
    }
    return self;

}

-(void)setup{
    for (int index = 0; index<9; index++) {
    UIButton *btn = [[UIButton alloc]init];
    btn.userInteractionEnabled = NO;
    [btn setBackgroundImage:[UIImage imageNamed:@"gesture_node_normal"] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:@"gesture_node_highlighted"] forState:UIControlStateSelected];
    [self addSubview:btn];
    }
}


-(void)layoutSubviews{
    [super layoutSubviews];
    for (int index = 0; index<self.subviews.count; index++) {
        UIButton *btn = self.subviews[index];
        int totalCols = 3;
        int totalRows = 3;
        int colNo = index % totalCols;
        int rowNo = index / totalRows;
        CGFloat btnW = 74;
        CGFloat btnH = 74;
        CGFloat margin = (self.frame.size.width - 3 * btnW) / 4;
        CGFloat btnX = margin + colNo * (btnW + margin);
        CGFloat btnY = rowNo *(btnW + margin);
        btn.frame = CGRectMake(btnX, btnY, btnW, btnH);
    }
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    CGPoint pos = [touch locationInView:self];
    for (UIButton *btn in self.subviews) {
        if (CGRectContainsPoint(btn.frame, pos)) {
            btn.selected = YES;
        }
    }
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    CGPoint pos = [touch locationInView:self];
    for (UIButton *btn in self.subviews) {
        if (CGRectContainsPoint(btn.frame, pos)) {
            btn.selected = YES;
        }
    }
    
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{

}







@end






