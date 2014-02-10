//
//  HangmanModel.h
//  Hangman
//
//  Created by Class Account on 10/23/13.
//  Copyright (c) 2013 UC Berkeley. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HangmanWords.h"

@interface HangmanModel : NSObject
{
    int guesses;
    int correctGuesses;
    NSString *word;
    HangmanWords *words;
    NSMutableArray *guessed;
    UIImage *image;
}

-(BOOL) guessLetter: (NSString*) letter;
-(BOOL) playerHasLost;
-(BOOL) playerHasWon;
-(NSMutableArray*) wordSoFar;
-(UIImage*) updateImage;

@end
