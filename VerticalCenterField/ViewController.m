#import "ViewController.h"
#import "VerticalCenterCell.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
        
    // Do any additional setup after loading the view.
    [self addTextField];
}

- (void)addTextField{
    NSTextField *field = [[NSTextField alloc] init];
    
    field.frame = NSMakeRect(self.view.bounds.size.width/2-60, 50, 120, 40);
    VerticalCenterCell *cell = [[VerticalCenterCell alloc] init];
    cell.stringValue = @"";
    cell.placeholderString = @"I'm from code";
    cell.editable = YES;
    cell.scrollable = YES;
    cell.bordered = YES;    // MUST enable this!
    cell.alignment = NSTextAlignmentCenter;
    
    field.cell = cell;
    
    [self.view addSubview:field];
}

@end
