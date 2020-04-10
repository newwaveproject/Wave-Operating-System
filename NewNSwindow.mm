#import <Foundation/NSCharacterSet.h>
#import <Foundation/NSCharacterSet.h>
#import "AppKit/NSApplication.h"
#import "AppKit/NSButton.h"
#import "AppKit/NSButtonCell.h"
#import "AppKit/NSEvent.h"
#import "AppKit/NSWindow.h"
#import "config.h"
#import <Foundation/NSArray.h>
#import <Foundation/NSAttributedString.h>
#import <Foundation/NSDebug.h>
#import <Foundation/NSException.h>
#import <Foundation/NSLock.h>
#import <Foundation/NSString.h>
#import <Foundation/NSValue.h>
#import "AppKit/AppKitExceptions.h"
#import "AppKit/NSApplication.h"
#import "AppKit/NSBezierPath.h"
#import "AppKit/NSButtonCell.h"
#import "AppKit/NSButton.h"
#import "AppKit/NSColor.h"
#import "AppKit/NSEvent.h"
#import "AppKit/NSFont.h"
#import "AppKit/NSGraphics.h"
#import "AppKit/NSImage.h"
#import "AppKit/NSSound.h"
#import "AppKit/NSStringDrawing.h"
#import "AppKit/NSWindow.h"
#import "GNUstepGUI/GSTheme.h"
#import "GNUstepGUI/GSNibLoading.h"
#import "GSGuiPrivate.h"
#import "AppKit/NSApplication.h"
#import "AppKit/NSButton.h"
#import "AppKit/NSButtonCell.h"
#import "AppKit/NSEvent.h"
#import "AppKit/NSWindow.h"
#import <Foundation/NSArray.h>
#import <Foundation/NSDebug.h>
#import <Foundation/NSRunLoop.h>
#import <Foundation/NSScanner.h>
#import <Foundation/NSAutoreleasePool.h>
#import <Foundation/NSString.h>
#import <Foundation/NSCoder.h>
#import <Foundation/NSArray.h>
#import <Foundation/NSEnumerator.h>
#import <Foundation/NSGeometry.h>
#import <Foundation/NSNotification.h>
#import <Foundation/NSValue.h>
#import <Foundation/NSException.h>
#import <Foundation/NSSet.h>
#import <Foundation/NSLock.h>
#import <Foundation/NSUserDefaults.h>
#import <Foundation/NSUndoManager.h>

#import "AppKit/NSAnimation.h"
#import "AppKit/NSApplication.h"
#import "AppKit/NSButton.h"
#import "AppKit/NSButtonCell.h"
#import "AppKit/NSCachedImageRep.h"
#import "AppKit/NSColor.h"
#import "AppKit/NSColorList.h"
#import "AppKit/NSCursor.h"
#import "AppKit/NSDocumentController.h"
#import "AppKit/NSDocument.h"
#import "AppKit/NSDragging.h"
#import "AppKit/NSEvent.h"
#import "AppKit/NSFont.h"
#import "AppKit/NSGraphics.h"
#import "AppKit/NSHelpManager.h"
#import "AppKit/NSKeyValueBinding.h"
#import "AppKit/NSImage.h"
#import "AppKit/NSMenu.h"
#import "AppKit/NSPasteboard.h"
#import "AppKit/NSScreen.h"
#import "AppKit/NSTextField.h"
#import "AppKit/NSTextFieldCell.h"
#import "AppKit/NSView.h"
#import "AppKit/NSWindow.h"
#import "AppKit/NSWindowController.h"
#import "AppKit/PSOperators.h"

#import "GNUstepGUI/GSTheme.h"
#import "GNUstepGUI/GSTrackingRect.h"
#import "GNUstepGUI/GSDisplayServer.h"
#import "GNUstepGUI/GSWindowDecorationView.h"
#import "GSBindingHelpers.h"
#import "GSGuiPrivate.h"
#import "GSToolTips.h"
#import "GSIconManager.h"
#import "NSToolbarFrameworkPrivate.h"
#import "NSViewPrivate.h"

/*Here we add Libsyllable inherited headers */

#import "atheos/types.h"
#import "util/looper.h"
#import "util/message.h"
#import "util/shortcutkey.h"
#import "gui/button.h"
#import "gui/window.h"
#import "gui/font.h"
#import "macros.h"

@interface NSObject (DragInfoBackend)
- (void) dragImage: (NSImage*)anImage
                at: (NSPoint)screenLocation
            offset: (NSSize)initialOffset
             event: (NSEvent*)event
        pasteboard: (NSPasteboard*)pboard
            source: (id)sourceObject
         slideBack: (BOOL)slideFlag;
- (void) postDragEvent: (NSEvent*)event;
@end

@interface NSView (MoveToWindow)

@end

@interface NSScreen (PrivateMethods)

@end

@interface NSApplication(Inactive)

@end

@interface GSWindowAnimationDelegate : NSObject

@end

@implementation GSWindowAnimationDelegate

@end

@interface NSWindow (GNUstepPrivate)

@end

@implementation NSWindow (GNUstepPrivate)

@end

@interface NSMiniWindow : NSWindow

@end

@implementation NSMiniWindow

@end

@interface NSMiniWindowView : NSView

@end

@implementation NSMiniWindowView

@end

@implementation NSWindow

/*Main wrapping code goes here. It looks like it involves / wrappes the whole thing..*/

/*Class Variables*/

static SEL        ccSel;
static SEL        ctSel;
static IMP        ccImp;
static IMP        ctImp;
static Class      responderClass;
static Class      viewClass;
static NSMutableSet *autosaveNames;
static NSMapTable *windowmaps = NULL;
static NSMapTable *windowUndoManagers = NULL;
static NSNotificationCenter *nc = nil;

@end

@implementation NSWindow (Menu)

- (void) setMenu: (NSMenu *)menu
{
  // Do theme specific logic...
  [[GSTheme theme] setMenu: menu forWindow: self];

  if([self menu] != menu)
    [super setMenu: menu];
}

@end









