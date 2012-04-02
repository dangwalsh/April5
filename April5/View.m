//
//  View.m
//  April5
//
//  Created by Daniel Walsh on 4/1/12.
//  Copyright (c) 2012 Walsh walsh Studio. All rights reserved.
//

#import "View.h"

@implementation View

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    CGRect bounds = self.bounds;
    CGFloat radius = .01 * bounds.size.width; 
    CGFloat diameter = 2 * radius;
    CGFloat xtrans = 0.0;
    CGFloat ytrans = 0.0;
    CGFloat xdim = bounds.size.width/diameter;
    CGFloat ydim = bounds.size.height/diameter;
    
    
    for(int i = 0; i <= xdim; ++i){
        
        if(i>0)
            xtrans += (diameter);
        
        for (int j = 0; j <= ydim; ++j){
            
            if(j>0)
                ytrans += (diameter);
            
            CGRect r = CGRectMake(
                          xtrans, 
                          ytrans, 
                          diameter, 
                          diameter
                          );
    
            CGContextRef c = UIGraphicsGetCurrentContext();
    
            //CGContextTranslateCTM(c, xtrans, ytrans);
            //CGContextScaleCTM(c, 1, 1);
    
            CGContextBeginPath(c);
            CGContextAddEllipseInRect(c, r);
            CGContextSetRGBFillColor(c, ytrans/bounds.size.height, xtrans/bounds.size.width, 1.0, 1.0);
            CGContextFillPath(c);
            
            UIFont *font = [UIFont systemFontOfSize: 60];
            NSString *s = NSLocalizedString(@"Greeting", @"displayed with drawAtPoint:");
            CGPoint point = CGPointMake(50.0, 200.0);
            [s drawAtPoint: point withFont: font];
        }
        ytrans = 0;
    }
}


@end
