//
//  PARNotebookViewController.m
//  Everpobre
//
//  Created by Pablo Parejo Camacho on 22/5/15.
//  Copyright (c) 2015 Pablo Parejo Camacho. All rights reserved.
//

#import "PARNotebookViewController.h"
#import "PARNotesViewController.h"
#import "Notebook.h"

#define CELL_ID @"NOTEBOOK_CELL"
#define DID_SELECT_ROW @"SHOW_NOTES"

@interface PARNotebookViewController ()

@end

@implementation PARNotebookViewController


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
    Notebook *notebook = [self.fetchedResultsController objectAtIndexPath:indexPath];
    cell.textLabel.text = notebook.title;
    
    cell.detailTextLabel.text = [NSString stringWithFormat:@"Contains %d notes", notebook.notes.count];
    return cell;
}
- (IBAction)newNotebook:(id)sender {
    
    UIAlertController *notebookDialog = [UIAlertController alertControllerWithTitle:@"New Notebook"
                                                                            message:@"Please, insert notebook name"
                                                                     preferredStyle:UIAlertControllerStyleAlert];
    
    [notebookDialog addAction:[UIAlertAction actionWithTitle:@"Create" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        UITextField *titleTextField = notebookDialog.textFields.firstObject;
        [Notebook notebookWithContext:self.fetchedResultsController.managedObjectContext title:titleTextField.text];
    }]];

    [notebookDialog addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
        [notebookDialog dismissViewControllerAnimated:YES completion:nil];
    }]];
    
    [notebookDialog addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        textField.placeholder = @"Notebook name";
    }];
    
    [self presentViewController:notebookDialog animated:YES completion:nil];
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:DID_SELECT_ROW]) {
        PARNotesViewController *vc = (PARNotesViewController *)segue.destinationViewController;
        NSIndexPath *selectedIndexPath = [self.tableView indexPathForSelectedRow];
        Notebook *selectedNotebook = [self.fetchedResultsController objectAtIndexPath:selectedIndexPath];
        [vc setNotebook:selectedNotebook];
    }
}

@end
