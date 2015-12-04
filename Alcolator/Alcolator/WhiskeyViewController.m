//
//  WhiskeyViewController.m
//  Alcolator
//
//  Created by eric beasley on 11/30/15.
//  Copyright © 2015 eric j beasley. All rights reserved.
//

#import "WhiskeyViewController.h"

@interface WhiskeyViewController ()

@end

@implementation WhiskeyViewController
- (void)buttonPressed:(UIButton *)sender {
    [self.beerPercentTextField resignFirstResponder];
    
    int numberOfBeers = self.beerCountSlider.value;
    int ouncesInOneBeerGlass = 12;
    
    float alcoholPercentageOfBeer = [self.beerPercentTextField.text floatValue]/100;
    float ouncesOfAlcoholPerBeer = ouncesInOneBeerGlass * alcoholPercentageOfBeer;
    float ouncesOfAlcoholTotal = ouncesOfAlcoholPerBeer * numberOfBeers;
    
    float ouncesInOneWhiskeyGlass = 1;
    float alcoholPercentageOfWhiskey = 0.4;
    
    float ouncesOfAlcoholPerWhiskeyGlass = ouncesInOneWhiskeyGlass * alcoholPercentageOfWhiskey;
    float numberOfWhiskeyGlassesForEquivalentAlcoholAmount = ouncesOfAlcoholTotal/ ouncesOfAlcoholPerWhiskeyGlass;
    
    NSString *beerText;
    
    if (numberOfBeers == 1) {
         beerText = NSLocalizedString(@"beer", @"singular beer");
     } else {
         beerText = NSLocalizedString(@"beers", @"plural of beer");
     }
     
     NSString *whiskeyText;
     
     if (numberOfWhiskeyGlassesForEquivalentAlcoholAmount == 1) {
         whiskeyText = NSLocalizedString(@"shot", @"singular shot");
     } else {
         whiskeyText = NSLocalizedString(@"shots", @"plural of shot");
     }
     NSString *resultText = [NSString stringWithFormat:NSLocalizedString(@"%d %@ (with %.2f%% alcohol) contains as much alcohol as %.1f %@ of whiskey.", nil), numberOfBeers, beerText, [self.beerPercentTextField.text floatValue], numberOfWhiskeyGlassesForEquivalentAlcoholAmount, whiskeyText];
     self.resultLabel.text = resultText;
    [self.tabBarItem setBadgeValue:[NSString stringWithFormat:@"%d", (int)roundf(numberOfWhiskeyGlassesForEquivalentAlcoholAmount)]];

}

@end
