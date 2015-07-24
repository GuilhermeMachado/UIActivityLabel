//
//  UIActivityLabel.m
//  arremateFacil
//
//  Created by Guilherme Machado on 24/07/15.
//  Copyright (c) 2015 G2M. All rights reserved.
//

#import "UIActivityLabel.h"

@interface UIActivityLabel ()

@property (nonatomic) UIColor *activityColor;
@property (nonatomic) CGPoint activityLocation;

@end

@implementation UIActivityLabel

-(void)awakeFromNib {

    self.activityColor = [UIColor blackColor];
    self.activityLocation = CGPointMake(self.bounds.size.width/2, self.bounds.size.height/2);
    
    self.activityIndicatorView = [UIActivityIndicatorView new];
    self.activityIndicatorView.color = self.activityColor;
    self.activityIndicatorView.center = self.activityLocation;
    
    [self addSubview:self.activityIndicatorView];
    
}

-(void)start {
    
    [self.activityIndicatorView startAnimating];
    
}

-(void)stop {
    
    [self.activityIndicatorView stopAnimating];
    
}

-(void)emptyTextAndStart {
    
    if ([self.text length] != 0) {
        self.text = nil;
    }
    
    [self.activityIndicatorView startAnimating];
    
}

+(void)startCollection:(NSArray *)collection {
    
    for (UIActivityLabel *label in collection) {
        
        [label start];
        
    }

}

+(void)stopCollection:(NSArray *)collection {

    for (UIActivityLabel *label in collection) {
        
        [label stop];
        
    }

}

+(void)emptyTextAndStartCollection:(NSArray *)collection {
    
    for (UIActivityLabel *label in collection) {
        
        if ([label.text length] != 0) {
            label.text = nil;
        }
        
        [label start];
        
    }

}

-(void)setActivityViewColor:(UIColor *)color {

    self.activityColor = color;
    
}

-(void)setActivityViewLocation:(CGPoint)location {
    
    self.activityLocation = location;
    
}

@end
