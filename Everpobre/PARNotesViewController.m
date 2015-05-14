//
//  PARNotesViewController.m
//  Everpobre
//
//  Created by Pablo Parejo Camacho on 8/5/15.
//  Copyright (c) 2015 Pablo Parejo Camacho. All rights reserved.
//

#import "PARNotesViewController.h"
#import "Note.h"
#import "PARNoteViewController.h"
#import "AppDelegate.h"
#define CELL_ID @"NoteCell"

#define SEGUE_PRESENT_NOTE @"SHOW_NOTE"
#define SEGUE_NEW_NOTE @"NEW_NOTE"

@interface PARNotesViewController ()

@end

@implementation PARNotesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CELL_ID];
    Note *note = [self.fetchedResultsController objectAtIndexPath:indexPath];
    cell.textLabel.text = note.title;
    
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
    
    cell.detailTextLabel.text = [dateFormatter stringFromDate:note.creationDate];
    return cell;
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:SEGUE_PRESENT_NOTE]) {
        PARNoteViewController *noteVC = (PARNoteViewController *) segue.destinationViewController;
        NSIndexPath *selectedIndexPath = [self.tableView indexPathForSelectedRow];
        Note *selectedNote = [self.fetchedResultsController objectAtIndexPath:selectedIndexPath];
        
        [noteVC setNote:selectedNote];
    }else if([segue.identifier isEqualToString:SEGUE_NEW_NOTE]){
        PARNoteViewController *noteVC = (PARNoteViewController *) segue.destinationViewController;
        AppDelegate *appDelegate = [[UIApplication sharedApplication]delegate];
        Note *newNote = [Note noteWithContext:appDelegate.managedObjectContext title:@"" text:@""];

        [noteVC setNote:newNote];
    }
}

@end
