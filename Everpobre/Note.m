//
//  Note.m
//  Everpobre
//
//  Created by Pablo Parejo Camacho on 8/5/15.
//  Copyright (c) 2015 Pablo Parejo Camacho. All rights reserved.
//

#import "Note.h"


@implementation Note

+ (instancetype) noteWithContext:(NSManagedObjectContext *)context title:(NSString *)title text:(NSString *)text{
    Note *note = [NSEntityDescription insertNewObjectForEntityForName:NSStringFromClass(self.class) inManagedObjectContext:context];
    
    note.title = title;
    note.text = text;
    note.creationDate = [NSDate date];
    return note;
}

@end
