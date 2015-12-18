//
//  NSString+String.m
//  SwiftCategory


#import "NSString+String.h"

@implementation NSString (String)

+(int) asciiValue:(int) index fromString:(NSString *)str{
    return [str asciiValue:index];
}

-(UInt32) asciiValue:(UInt32) index{
    
    if (index < self.length) {
        char ch = [self characterAtIndex:index];
        return ch;
    }
    return 0;
}

-(NSString *) characterAtIndex:(UInt32) index{
    
    if (index < self.length) {
        
        return [NSString stringWithFormat:@"%c",[self characterAtIndex:index]];
    }
    return @"";
}

-(NSString *) stringFromAscii:(int)ascii{
    NSString *str = [NSString stringWithFormat:@"%c",ascii];
    return str;
}

-(NSString *) reverseString{
    NSMutableString *reversedString = [NSMutableString string];
    NSInteger charIndex = [self length];
    while (charIndex > 0) {
        charIndex--;
        NSRange subStrRange = NSMakeRange(charIndex, 1);
        [reversedString appendString:[self substringWithRange:subStrRange]];
    }
    return reversedString;
}

-(NSString *) getOnlyDigit{
    
    int count = (int)self.length;
    NSString *str = @"";
    for (int i=0 ; i < count ; i++){
        int ascii = [self asciiValue:i];
        
        if (ascii >= 48 && ascii <= 57) {
            str = [str stringByAppendingFormat:@"%c",ascii];
        }
    }
    return str;
}

-(NSString *) getLast10Digit{
    
    NSString *str = @"";
    
    int count = (int)self.length;
    
    if(count > 10){
     
        str = [self substringFromIndex:[self length] - 10];
    }
    
    return str;
}

@end
