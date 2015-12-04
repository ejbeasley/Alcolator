//
//  ViewController.m
//  Alcolator
//
//  Created by eric beasley on 11/27/15.
//  Copyright © 2015 eric j beasley. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)textFieldDidChange:(UITextField *)sender {
    NSString *enteredText = sender.text;
    float enteredNumber = [enteredText floatValue];
    if (enteredNumber == 0) {
        sender.text = nil;
    }
}

- (IBAction)sliderValueChanged:(UISlider *)sender {
    NSLog(@"slider value has changed to %f", sender.value);
    [self.beerPercentTextField resignFirstResponder];
}

- (IBAction)buttonPressed:(id)sender {
    [self.beerPercentTextField resignFirstResponder];
    
    //calculate how much alcohol is in those beers
    int numberOfBeers = self.beerCountSlider.value;
    int ouncesInOneBeerGlass = 12; //assume all beers are 12oz
    float alcoholPercentageOfBeer = [self.beerPercentTextField.text floatValue] / 100;
    float ouncesOfAlcoholPerBeer = ouncesInOneBeerGlass * alcoholPercentageOfBeer;
    float ouncesOfAlcoholTotal = ouncesOfAlcoholPerBeer * numberOfBeers;
    
    //calculate the equivalent amount of wine
    float ouncesInOneWineGlass = 5; //wine glasses usually hold 5oz
    float alcoholPercentageOfWine = .13; //13% if average
    float ouncesOfAlcoholPerWineGlass = ouncesInOneWineGlass * alcoholPercentageOfWine;
    float numberOfWineGlassesForEquivalentAlcoholAmount = ouncesOfAlcoholTotal / ouncesOfAlcoholPerWineGlass;
    
    //declare whether to use "beer"/"beers" and "glass"/"glasses"
    NSString *beerText;
    if (numberOfBeers ==1) {
        beerText = NSLocalizedString(@"beer", @"singular beer");
    } else {
        beerText = NSLocalizedString(@"beers", @"plural of beer");
    }
    NSString *wineText;
    if (numberOfWineGlassesForEquivalentAlcoholAmount == 1) {
        wineText = NSLocalizedString(@"glass", @"singular glass");
    } else {
        wineText = NSLocalizedString(@"glasses", @"plural of glass");
    }
    
    //generate the result text and display it in the label
    NSString *resultText = [NSString stringWithFormat:NSLocalizedString(
        @"%d %@ (with %.2f%% alcohol) contains as much alcohol as %.1f %@ of wine.", nil),
                            numberOfBeers, beerText, [self.beerPercentTextField.text floatValue], numberOfWineGlassesForEquivalentAlcoholAmount, wineText];
    self.resultLabel.text = resultText;
    [self.tabBarItem setBadgeValue:[NSString stringWithFormat:@"%d", (int)roundf(numberOfWineGlassesForEquivalentAlcoholAmount)]];

}

- (IBAction)tapGestureDidFire:(UITapGestureRecognizer *)sender {
    [self.beerPercentTextField resignFirstResponder];
}

@end
