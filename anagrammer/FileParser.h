//
//  FileParser.h
//  anagrammer
//
//  Created by Chris O'Malley on 10/21/13.
//  Copyright (c) 2013 chriso. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FileParser : NSObject

+ (BOOL)doesFileExistAtPath:(NSString *)path;
+ (NSArray*)linesForFileAtPath:(NSString*)path error:(NSError**)error;

@end
