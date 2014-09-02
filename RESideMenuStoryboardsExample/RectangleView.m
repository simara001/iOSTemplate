//
//  RectangleView.m
//  iOSTemplate
//
//  Created by miguelicious on 8/24/14.
//  Copyright (c) 2014 Roman Efimov. All rights reserved.
//

#import "RectangleView.h"

@implementation RectangleView {
    __strong UIColor *rectFillColor;
    __strong UIColor *rectStrokeColor;
    int strokesWidth;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self setBackgroundColor:[UIColor clearColor]];
    }
    return self;
}

-(void)setFillColor:(UIColor *)fillColor strokeColor:(UIColor *)strokeColor andStrokeWidth:(int)strokeWidth {
    rectFillColor = fillColor;
    rectStrokeColor = strokeColor;
    strokesWidth = strokeWidth;
}

- (void)drawRect:(CGRect)rect {
    
    UIBezierPath *rectanglePath = [UIBezierPath bezierPathWithRect: CGRectMake(strokesWidth, strokesWidth, self.frame.size.width - (strokesWidth*2), self.frame.size.height - (strokesWidth*2))];
    [rectFillColor setFill];
    [rectanglePath fill];
    
    [rectStrokeColor setStroke];
    rectanglePath.lineWidth = strokesWidth;
    [rectanglePath stroke];
}


@end
