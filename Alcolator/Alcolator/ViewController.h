//
//  ViewController.h
//  Alcolator
//
//  Created by eric beasley on 11/27/15.
//  Copyright © 2015 eric j beasley. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *beerPercentTextField;
@property (weak, nonatomic) IBOutlet UISlider *beerCountSlider;
@property (weak, nonatomic) IBOutlet UILabel *resultLabel;

@end

