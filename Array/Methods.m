//
//  Methods.m
//  Array
//
//  Created by Запорожченко Александр Михайлович on 30.04.14.
//  Copyright (c) 2014 IDS Outsource. All rights reserved.
//

#import "Methods.h"

@implementation Methods
{
    int *x;
    int arraySize;
}

-(id)init
{
    self=[super init];
    return self;
}

-(void) getArrayFromPath:(NSString*)path
{
    //[self arrayFree];
    
    const char *pathchar = [path cStringUsingEncoding:[NSString defaultCStringEncoding]];
    FILE *file = fopen(pathchar , "r");
  
    fseek(file, 0, SEEK_END); // seek to end of file
    int size = (int)ftell(file)/4; // int size 4 byte
    arraySize=size;
    
    x= (int *)malloc(sizeof(int)*arraySize);
    
    fseek(file, 0L, SEEK_SET);
   if ( fread(x, arraySize ,size, file))
   {
       NSLog(@"Reading done");
   }
    
    fclose(file);
}

-(void)sortArray
{
    for(int i = 0; i <arraySize; i++)
    {
       int imin=i;
        for (int j=i; j<arraySize;j++ )
        {
            int min= *(x+i);
            if (*(x+j)<min)
            {
               int buf=*(x+imin);
                *(x+imin)=*(x+j);
                *(x+j)=buf;
            }
            
        }
       
    }
    
}

-(void)deleteMidItems
{
    
//    int item=arraySize/2-1;
//    for(int i = item; i <arraySize-3; i++)
//    {
//        *(x+i)=*(x+i+3);
//    }
//    
    arraySize=arraySize-3;
    memmove(x,x+3,arraySize);
    
}

-(void)saveArrayToPath:(NSString*)path
{
    const char *pathchar = [path cStringUsingEncoding:[NSString defaultCStringEncoding]];
    FILE *file = fopen(pathchar , "w");
    
    if (fwrite(x, sizeof(int),arraySize, file))
    {
        NSLog(@"Writing done");
    }
    fclose(file);
}



#pragma mark -

-(void)showArray
{
    for(int i = 0; i <arraySize; i++)
    {
        NSLog(@"Array [%i]:%i",i,*(x+i));
    }
}

-(void)createFile:(NSString*)path withSize:(int)size
{
    
    [self createArrayWithSize:size];
    
    for(int i = 0; i < arraySize; i++)
    {
        *(x+i) = rand()%100;
    }
    
    [self saveArrayToPath:path];
}

-(void)createArrayWithSize:(int)size
{
    arraySize = size;
    x= (int *)malloc(sizeof(int)*size);
}

-(void)arrayFree
{
//    
//    if(x != NULL)
//    {
//        for(int i=0; i<arraySize; i++)
//            free(x+i);
//    }

    free(x);
}

-(void)dealloc
{
    [self arrayFree];
    [super dealloc];
}

@end
