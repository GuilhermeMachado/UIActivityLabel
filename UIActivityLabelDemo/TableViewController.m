//
//  TableViewController.m
//  UIActivityLabelDemo
//
//  Created by Guilherme Machado on 24/07/15.
//  Copyright (c) 2015 G2M. All rights reserved.
//

#import "TableViewController.h"

#import "UIActivityLabel.h"

@interface TableViewController ()

-(IBAction)valueChanged:(UISegmentedControl *)sender;

@property (weak, nonatomic) IBOutlet UIActivityLabel *label1;

@property (strong, nonatomic) IBOutletCollection(UIActivityLabel) NSArray *labelCollection;
@property (weak, nonatomic) IBOutlet UIActivityLabel *label2;
@property (weak, nonatomic) IBOutlet UIActivityLabel *label3;
@property (weak, nonatomic) IBOutlet UIActivityLabel *label4;

@end

@implementation TableViewController

-(void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    
    [self.label2 setActivityViewColor:[UIColor orangeColor]];
    [self.label2 setActivityPosition:ActivityPositionLeft];
    
    [self.label3 setActivityViewColor:[UIColor greenColor]];

    [self.label4 setActivityViewColor:[UIColor purpleColor]];
    [self.label4 setActivityPosition:ActivityPositionRight];


}

-(IBAction)valueChanged:(UISegmentedControl *)sender {

    if (sender.tag == 1) {

        switch (sender.selectedSegmentIndex) {

            case 0:
                
                [self.label1 start];
                
                break;

            case 1:
                
                [self.label1 clearTextAndStart];
                
                break;

            case 2:

                [self.label1 stop];
                self.label1.text = @"label1";

                break;

            default:
                break;
        }
        
    }
    else {

        switch (sender.selectedSegmentIndex) {
                
            case 0:
                
                [UIActivityLabel startCollection:self.labelCollection];
                
                break;
                
            case 1:
                
                [UIActivityLabel clearTextAndStartCollection:self.labelCollection];
                
                break;
                
            case 2:
                
                [UIActivityLabel stopCollection:self.labelCollection];
                self.label2.text = @"label2";
                self.label3.text = @"label3";
                self.label4.text = @"label4";
                
                break;
                
            default:
                break;
        }

    }
}

@end
