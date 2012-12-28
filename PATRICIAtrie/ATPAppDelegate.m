//    Copyright 2012 Andrii Titov
//
//    Licensed under the Apache License, Version 2.0 (the "License");
//    you may not use this file except in compliance with the License.
//    You may obtain a copy of the License at
//
//    http://www.apache.org/licenses/LICENSE-2.0
//
//    Unless required by applicable law or agreed to in writing, software
//    distributed under the License is distributed on an "AS IS" BASIS,
//    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//    See the License for the specific language governing permissions and
//    limitations under the License.

#import "ATPAppDelegate.h"
#import "ATDPTrie.h"

@implementation ATPAppDelegate

@synthesize label, textField;

@synthesize window = _window;

- (void)dealloc
{
    [trieTester release];
    [super dealloc];
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
    trieTester = [[ATDPTrie alloc] init];
}

-(IBAction)addWord:(id)sender {
    [trieTester insertWord:self.textField.stringValue];
}

-(IBAction)deleteWord:(id)sender {
    [trieTester deleteWord:self.textField.stringValue];
}

-(IBAction)lookUpWord:(id)sender {
    NSString *value;
    if ([trieTester lookupWord:self.textField.stringValue]) {
        value = @"YES";
    }
    else {
        value = @"NO";
    }
    self.label.stringValue = value;
}

-(IBAction)saveTrie:(id)sender {
    NSSavePanel *saveDlg =[NSSavePanel savePanel];
    saveDlg.canCreateDirectories = YES;
    if ([saveDlg runModal] == NSOKButton) {
        [trieTester saveTrieToFile:[[saveDlg URL] path]];
    }
}

-(IBAction)loadTrie:(id)sender {
    NSOpenPanel *openPanel = [NSOpenPanel openPanel];
    openPanel.canChooseDirectories = NO;
    openPanel.canChooseFiles = YES;
    if ([openPanel runModal] == NSOKButton) {
        [trieTester loadFromFile:[[openPanel URL] path]];
    }
}

@end
