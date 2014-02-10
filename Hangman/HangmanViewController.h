//
//  HangmanViewController.h
//  Hangman
//
//  Created by Class Account on 10/23/13.
//  Copyright (c) 2013 UC Berkeley. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HangmanModel.h"

@interface HangmanViewController : UIViewController
{
    HangmanModel *model;
    BOOL over;
}
@property (retain, nonatomic) IBOutlet UIImageView *hangmanImage;
@property (retain, nonatomic) IBOutlet UITextView *guessedLetters;
@property (retain, nonatomic) IBOutlet UITextField *guess;
- (IBAction)guessButtonPressed:(id)sender;
- (IBAction)newWordButtonPressed:(id)sender;
- (void) updateWord;
- (void) updateImage;


@end
