//
//  HangmanModel.m
//  Hangman
//
//  Created by Class Account on 10/23/13.
//  Copyright (c) 2013 UC Berkeley. All rights reserved.
//

#import "HangmanModel.h"

@implementation HangmanModel


- (id) init
{
    self = [super init];
    if (self){
        words = [[HangmanWords alloc] init];
        guesses = 0;
        correctGuesses = 0;
        word = words.getWord;
        guessed = [[NSMutableArray alloc] init];
        for (int i = 0; i < [word length]; i ++)
        {
            if ([word characterAtIndex:i] == ' ') {
                correctGuesses++;
                [guessed addObject:@" "];
            }
            else{
                [guessed addObject:@"_"];
            }
        }
    }
    return self;
}

- (UIImage*) updateImage
{
    NSString *imageName = @"hang_";
    imageName = [imageName stringByAppendingString:[NSString stringWithFormat:@"%i", guesses]];
    imageName = [imageName stringByAppendingString:@".gif"];    
    image = [UIImage imageNamed:imageName];
    NSLog(@"Image name is %@", imageName);
    return image;
}

- (BOOL) guessLetter: (NSString*) letter
{
    letter = [letter uppercaseString];
    BOOL inWord = NO;
    for (int i = 0; i < [word length]; i ++)
    {
        if ([word characterAtIndex:i] == [letter characterAtIndex:0]) {
            [guessed replaceObjectAtIndex:i withObject:letter];
            correctGuesses++;
            NSLog(@"The letter is in the word");
            NSLog(@"The number of correct guesses is now %d", correctGuesses);
            inWord = YES;
        }
    }
    if (inWord == NO) {
        NSLog(@"The letter is not in the word");
        guesses++;
        NSLog(@"The number of wrong guesses is now %d", guesses);
        return NO;
    }
    return YES;
}

- (NSMutableArray*) wordSoFar
{
    return guessed;
}

-(BOOL) playerHasLost
{
    return (guesses == 6);
}

-(BOOL) playerHasWon
{
    return (correctGuesses == [word length]);
}


@end
