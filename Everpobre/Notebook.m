//
//  Note.h
//  Everpobre
//
//  Created by Pablo Parejo Camacho on 8/5/15.
//  Copyright (c) 2015 Pablo Parejo Camacho. All rights reserved.
//

#import "Notebook.h"

@interface Notebook ()

// Private interface goes here.

@end

@implementation Notebook

+ (instancetype) notebookWithContext:(NSManagedObjectContext *)context title:(NSString *)title{
    Notebook *notebook = [NSEntityDescription insertNewObjectForEntityForName:NSStringFromClass(self.class) inManagedObjectContext:context];
    
    notebook.title = title;
    notebook.creationDate = [NSDate date];
    return notebook;
}

@end
