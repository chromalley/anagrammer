//
//  NSSStringTests.m
//  anagrammer
//
//  Created by Chris O'Malley on 10/27/13.
//  Copyright (c) 2013 chriso. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSString+Characters.h"
#import "NSString+Replacement.h"

@interface NSSStringTests : XCTestCase

@end

@implementation NSSStringTests

- (void)setUp
{
    [super setUp];
    // Put setup code here; it will be run once, before the first test case.
}

- (void)tearDown
{
    // Put teardown code here; it will be run once, after the last test case.
    [super tearDown];
}

- (void)testStringCharacterSet
{
    NSString* stringToTest = @"aaaaabbbbc";
    
    NSSet* setOfCharacters = [stringToTest setOfCharacters];
    
    NSUInteger length = [setOfCharacters count];
    BOOL hasProperContent = [setOfCharacters containsObject:@"a"] &&
    [setOfCharacters containsObject:@"b"] &&
    [setOfCharacters containsObject:@"c"];
    
    XCTAssert((length == 3) && hasProperContent, @"Character set is invalid");
}

-(void)testFirstOcurrenceReplace{
    
    NSString* stringToTest = @"aabc";
    
    NSString* modifiedString = [stringToTest stringByReplacingFirstOccurrencesOfString:@"a" withString:@""];
    
    XCTAssert([modifiedString isEqualToString:@"abc"], @"String replacement failed");
    
}

@end
