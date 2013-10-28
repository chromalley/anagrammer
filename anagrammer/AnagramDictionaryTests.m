//
//  AnagramDictionaryTests.m
//  anagrammer
//
//  Created by Chris O'Malley on 10/27/13.
//  Copyright (c) 2013 chriso. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "AnagramDictionary.h"

@interface AnagramDictionaryTests : XCTestCase

@end

@implementation AnagramDictionaryTests

- (void)setUp
{
    [super setUp];
    
}

- (void)tearDown
{
    // Put teardown code here; it will be run once, after the last test case.
    [super tearDown];
}

- (void)testOneWordInputAnagramGeneration
{
    NSArray* testWordArray = @[@"lens",
                               @"no",
                               @"on"];
    
    AnagramDictionary* anagramDictionary = [[AnagramDictionary alloc] initWithWordSet:[NSSet setWithArray:testWordArray]];
    
    NSArray* anagrams = [anagramDictionary anagramsForPhrase:@"nelson"];
    
    BOOL checkAnagrams = [anagrams containsObject:@"no lens"] &&
                         [anagrams containsObject:@"on lens"] &&
                         [anagrams containsObject:@"lens on"] &&
                         [anagrams containsObject:@"lens no"];
    
    XCTAssert(checkAnagrams, @"Anagrams were not generated successfully.");
    
    
}

- (void)testPhraseInputAnagramGeneration
{
    NSArray* testWordArray = @[@"astronomer"];
    
    AnagramDictionary* anagramDictionary = [[AnagramDictionary alloc] initWithWordSet:[NSSet setWithArray:testWordArray]];
    
    NSArray* anagrams = [anagramDictionary anagramsForPhrase:@"moon starer"];
    
    BOOL checkAnagrams = [anagrams containsObject:@"astronomer"];
    
    XCTAssert(checkAnagrams, @"Anagrams were not generated successfully.");
    
    
}


@end
