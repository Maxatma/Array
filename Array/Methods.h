//
//  Methods.h
//  Array
//
//  Created by Запорожченко Александр Михайлович on 30.04.14.
//  Copyright (c) 2014 IDS Outsource. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <stdio.h>

@interface Methods : NSObject

-(void)getArrayFromPath:(NSString*)path;
-(void)sortArray;
-(void)deleteMidItems;
-(void)saveArrayToPath:(NSString*)path;
-(void)showArray;
-(void)createFile:(NSString*)path withSize:(int)size;
-(void)arrayFree;

@end
