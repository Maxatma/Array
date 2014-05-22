//
//  main.m
//  Array
//
//  Created by Запорожченко Александр Михайлович on 30.04.14.
//  Copyright (c) 2014 IDS Outsource. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Methods.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool
    {
        
        Methods *m=[Methods new];
        NSString *fileName=@"array";
        NSFileManager *fm  =[NSFileManager defaultManager];
        NSString* currentPath = [fm currentDirectoryPath];
        NSString *path = [currentPath stringByAppendingPathComponent:fileName];
        
        NSLog(@"Path : %@",path);
        NSLog(@"Create");
        [m createFile:path withSize:20];
        [m showArray];
        
        NSLog(@"Get array");
        [m getArrayFromPath:path];
        [m showArray];
        
        NSLog(@"Sort:");
        [m sortArray];
        [m showArray];
        
        NSLog(@"Delete 3 mid items:");
        [m deleteMidItems];
        [m showArray];
        
        NSLog(@"Saving array");
        [m saveArrayToPath:path];
        [m showArray];
        
        [m arrayFree];
        NSLog(@"Get array");
        [m getArrayFromPath:path];
        [m showArray];
    
    }
    return 0;
}

