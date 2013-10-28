//
//  anagrammerLib.m
//  anagrammerLib
//
//  Created by Chris O'Malley on 10/22/13.
//  Copyright (c) 2013 chriso. All rights reserved.
//

#import "anagrammerLib.h"
#import "FileParser.h"
#import "AnagramDictionary.h"

int anagrammerLibMain(int argc, const char * argv[])
{
    
    @autoreleasepool {
        
        if (argc != 3){
            NSLog(@"Usage: anagrammer [pathToDictionary] [pathToPhrases]");
            return -1;
        }
        
        NSError* error = nil;
        NSString* pathToDictionary = [NSString stringWithUTF8String:argv[1]];
        NSString* pathToPhrases = [NSString stringWithUTF8String:argv[2]];
        
        
        NSArray* words = [FileParser linesForFileAtPath:pathToDictionary error:&error];
        
        if (!words){
            NSLog(@"Error: %@ ",error.localizedDescription);
        }
        
        NSArray* phrases = [FileParser linesForFileAtPath:pathToPhrases error:&error];
        
        if (!phrases){
            NSLog(@"Error: %@ ",error.localizedDescription);
            return -1;
        }
        
        NSLog(@"Saving dictionary words...");
        
        AnagramDictionary* dictionary = [[AnagramDictionary alloc] initWithWordSet:[NSSet setWithArray:words]];
        
        NSLog(@"Processing phrases...");
        
        NSMutableArray* anagramArray = [NSMutableArray new];
        
        for (NSString* phrase in phrases){
            
            NSArray* anagrams= [dictionary anagramsForPhrase:phrase];
            
            NSLog(@"%@ = %@",phrase,[anagrams componentsJoinedByString:@","]);
            
            [anagramArray addObject:@{@"inputPhrase":phrase,
                                      @"anagrams":anagrams}];
            
        }
        
        NSDictionary* anagramListDictionary = @{@"anagramList": anagramArray};
        
        NSData* jsonData = [NSJSONSerialization dataWithJSONObject:anagramListDictionary
                                                           options:0
                                                             error:&error];
        
        if (error){
            NSLog(@"Error: Unable to format output in JSON");
        } else {
            NSLog(@"As Json:\n %@",[[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding]);
        }
        
    }
    return 0;
}