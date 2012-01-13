/* 
Copyright 2011 Hardcoded Software (http://www.hardcoded.net)

This software is licensed under the "BSD" License as described in the "LICENSE" file, 
which should be included with this package. The terms are also available at 
http://www.hardcoded.net/licenses/bsd_license
*/

#import "ProblemDialog.h"
#import "Utils.h"

@implementation ProblemDialog
- (id)init
{
    self = [super initWithWindowNibName:@"ProblemDialog"];
    [self window]; //So the detailsTable is initialized.
    model = [[PyProblemDialog alloc] initWithModel:findHackishModel(@"problem_dialog")];
    problemTable = [[HSTable2 alloc] initWithPyRef:[model problemTable] tableView:problemTableView];
    [self initializeColumns];
    [model connect];
    [[problemTable model] connect];
    return self;
}

- (void)dealloc
{
    [[problemTable model] disconnect];
    [model disconnect];
    [problemTable release];
    [model release];
    [super dealloc];
}

- (void)initializeColumns
{
    HSColumnDef defs[] = {
        {@"path", 202, 40, 0, NO, nil},
        {@"msg", 228, 40, 0, NO, nil},
        nil
    };
    [[problemTable columns] initializeColumns:defs];
}

- (IBAction)revealSelected:(id)sender
{
    [model revealSelected];
}
@end