//
//  NSString+String.h
//  SwiftCategory


#import <Foundation/Foundation.h>

@interface NSString (String)

-(NSString *) reverseString;
-(NSString *) stringFromAscii:(int)ascii;
-(UInt32) asciiValue:(UInt32) index;
-(NSString *) characterAtIndex:(UInt32) index;
-(NSString *) getOnlyDigit;
-(NSString *) getLast10Digit;

+(int) asciiValue:(int) index fromString:(NSString *)str;

@end
