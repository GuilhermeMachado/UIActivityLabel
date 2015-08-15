//
//  UIActivityLabel.m
//  arremateFacil
//
//  Created by Guilherme Machado on 24/07/15.
//  Copyright (c) 2015 G2M. All rights reserved.
//

#import "UIActivityLabel.h"

@interface UIActivityLabel ()

@property (nonatomic) UIActivityIndicatorView *activityIndicatorView;

@property (nonatomic) NSArray *activityPositionCenterConstraints;
@property (nonatomic) NSArray *activityPositionLeftConstraints;
@property (nonatomic) NSArray *activityPositionRightConstraints;

@property (nonatomic) NSLayoutConstraint *xCenterConstraint;
@property (nonatomic) NSLayoutConstraint *yCenterConstraint;
@property (nonatomic) NSLayoutConstraint *leftConstraint;
@property (nonatomic) NSLayoutConstraint *rightConstraint;


@end

@implementation UIActivityLabel

-(void)awakeFromNib {
    
    self.activityIndicatorView = [UIActivityIndicatorView new];
    self.activityIndicatorView.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:self.activityIndicatorView];
    
    self.xCenterConstraint = [NSLayoutConstraint constraintWithItem:self.activityIndicatorView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0];
    self.yCenterConstraint = [NSLayoutConstraint constraintWithItem:self.activityIndicatorView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0];
    self.activityPositionCenterConstraints = @[self.xCenterConstraint,self.yCenterConstraint];

    self.leftConstraint = [NSLayoutConstraint constraintWithItem:self.activityIndicatorView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0];
    self.activityPositionLeftConstraints = @[self.leftConstraint,self.yCenterConstraint];

    self.rightConstraint = [NSLayoutConstraint constraintWithItem:self.activityIndicatorView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeRight multiplier:1.0 constant:0];
    self.activityPositionRightConstraints = @[self.rightConstraint,self.yCenterConstraint];

    
    [self setActivityPosition:ActivityPositionCenter];
    [self setActivityViewColor:[UIColor blackColor]];
    
}

-(void)setActivityViewColor:(UIColor *)color {
    
    self.activityIndicatorView.color = color;
    
}

-(void)setActivityPosition:(enum ActivityPosition)position {
    
    for (NSLayoutConstraint *constraint in self.activityPositionCenterConstraints) {
        if ([self.constraints containsObject:constraint]) {
            [self removeConstraint:constraint];
        }
    }
    
    for (NSLayoutConstraint *constraint in self.activityPositionLeftConstraints) {
        if ([self.constraints containsObject:constraint]) {
            [self removeConstraint:constraint];
        }
    }
    
    for (NSLayoutConstraint *constraint in self.activityPositionRightConstraints) {
        if ([self.constraints containsObject:constraint]) {
            [self removeConstraint:constraint];
        }
    }
    
    
    switch (position) {
            
        case ActivityPositionCenter:
            
            [self addConstraints:self.activityPositionCenterConstraints];
            
            break;
            
        case ActivityPositionLeft:
            
            [self addConstraints:self.activityPositionLeftConstraints];
            
            break;
            
        case ActivityPositionRight:
            
            [self addConstraints:self.activityPositionRightConstraints];
            
            break;
            
        default:
            break;
    }
    
    
}

-(void)setAutomaticColor {
    
    self.activityIndicatorView.color = self.textColor;
    
}

+(void)setAutomaticColorForCollection:(NSArray *)collection {
    
    for (UIActivityLabel *label in collection) {
        
        label.activityIndicatorView.color = label.textColor;
        
    }
}

-(void)start {
    
    [self.activityIndicatorView startAnimating];
    
}

-(void)stop {
    
    [self.activityIndicatorView stopAnimating];
    
}

-(void)clearTextAndStart {
    
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

+(void)clearTextAndStartCollection:(NSArray *)collection {
    
    for (UIActivityLabel *label in collection) {
        
        if ([label.text length] != 0) {
            label.text = nil;
        }
        
        [label start];
        
    }
    
}

-(void)setText:(NSString *)text {
    
    [super setText:text];
    
    if (self.automaticStop) {
        [self stop];
    }
    
}

@end
