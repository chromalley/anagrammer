//
//  FileParser.m
//  anagrammer
//
//  Created by Chris O'Malley on 10/21/13.
//  Copyright (c) 2013 chriso. All rights reserved.
//

#import "FileParser.h"

static NSString* const kFileParserDomain = @"FileParserDomain";

@implementation FileParser

#pragma mark - Private Methods

+(BOOL)doesFileExistAtPath:(NSString *)path{
    NSFileManager* fileManager = [[NSFileManager alloc] init];
    return [fileManager fileExistsAtPath:path];
}

+(NSArray*)linesForFileAtPath:(NSString *)path error:(NSError **)error{
    
    if (![FileParser doesFileExistAtPath:path]){
        *error = [NSError errorWithDomain: kFileParserDomain
                                     code: -100
                                 userInfo: @{NSLocalizedDescriptionKey:
                                            [NSString stringWithFormat:@"File does not exist at path %@.",path]}];
        return nil;
    }
    
    
    NSError* localError = nil;
    
    NSString* fileContents = [NSString stringWithContentsOfFile:path
                                                       encoding:NSUTF8StringEncoding
                                                          error:&localError];
    
    if (localError){
        *error = localError;
        return nil;
    }
    
    //Verify we have a valid dictionary
    NSArray* linesArray = [fileContents componentsSeparatedByCharactersInSet:
                           [NSCharacterSet characterSetWithCharactersInString:@"\n,"]];
    
    if (!linesArray || ![linesArray count]){
        *error = [NSError errorWithDomain: kFileParserDomain
                                     code: -100
                                 userInfo: @{NSLocalizedDescriptionKey:
                                             [NSString stringWithFormat:@"File at path %@ contains no content.",path]}];
        return nil;
    }
    
    return linesArray;
}

@end
