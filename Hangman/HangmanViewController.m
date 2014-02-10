//
//  HangmanViewController.m
//  Hangman
//
//  Created by Class Account on 10/23/13.
//  Copyright (c) 2013 UC Berkeley. All rights reserved.
//

#import "HangmanViewController.h"

@interface HangmanViewController ()

@end

@implementation HangmanViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    over = NO;
    model = [[HangmanModel alloc] init];
    [self updateWord];
    [self updateImage];
}

- (void)updateWord
{
    [_guessedLetters setText:[[model wordSoFar] componentsJoinedByString:@" "]];
}

- (void)updateImage
{
    [_hangmanImage setImage:[model updateImage]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_hangmanImage release];
    [_guessedLetters release];
    [_guess release];
    [super dealloc];
}
- (IBAction)guessButtonPressed:(id)sender {
    if (over){
        return;
    }
    if ([[_guess text] length] > 1) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"One Letter Only" message:@"Please enter only one letter" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alert show];
    }
    else{
        if ([model guessLetter:[_guess text]]) {
            [self updateWord];
            if ([model playerHasWon])
            {
                over = YES;
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"You Win!" message:@"You have won." delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
                [alert show];
            }
        }
        else{
            [self updateImage];
            if ([model playerHasLost])
            {
                over = YES;
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"You Lose!" message:@"You have lost." delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
                [alert show];
            }
        }
    
    }
    [_guess setText:@""];
}

- (IBAction)newWordButtonPressed:(id)sender {
    over = NO;
    model = [[HangmanModel alloc] init];
    [self updateWord];
    [self updateImage];
    [_guess setText:@""];
}
@end
