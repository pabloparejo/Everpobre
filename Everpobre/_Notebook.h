// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Notebook.h instead.

#import <CoreData/CoreData.h>

extern const struct NotebookAttributes {
	__unsafe_unretained NSString *creationDate;
	__unsafe_unretained NSString *title;
} NotebookAttributes;

extern const struct NotebookRelationships {
	__unsafe_unretained NSString *notes;
} NotebookRelationships;

@class Note;

@interface NotebookID : NSManagedObjectID {}
@end

@interface _Notebook : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) NotebookID* objectID;

@property (nonatomic, strong) NSDate* creationDate;

//- (BOOL)validateCreationDate:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* title;

//- (BOOL)validateTitle:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSSet *notes;

- (NSMutableSet*)notesSet;

@end

@interface _Notebook (NotesCoreDataGeneratedAccessors)
- (void)addNotes:(NSSet*)value_;
- (void)removeNotes:(NSSet*)value_;
- (void)addNotesObject:(Note*)value_;
- (void)removeNotesObject:(Note*)value_;

@end

@interface _Notebook (CoreDataGeneratedPrimitiveAccessors)

- (NSDate*)primitiveCreationDate;
- (void)setPrimitiveCreationDate:(NSDate*)value;

- (NSString*)primitiveTitle;
- (void)setPrimitiveTitle:(NSString*)value;

- (NSMutableSet*)primitiveNotes;
- (void)setPrimitiveNotes:(NSMutableSet*)value;

@end
