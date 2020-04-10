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
#import "config.h"
#import <Foundation/NSCoder.h>
#import <Foundation/NSArray.h>
#import <Foundation/NSCharacterSet.h>
#import <Foundation/NSDebug.h>
#import <Foundation/NSException.h>
#import <Foundation/NSProcessInfo.h>
#import <Foundation/NSString.h>
#import <Foundation/NSNotification.h>
#import <Foundation/NSNotificationQueue.h>
#import <Foundation/NSRunLoop.h>
#import <Foundation/NSUserDefaults.h>
#import <Foundation/NSValue.h>

#import "AppKit/NSMatrix.h"
#import "AppKit/NSApplication.h"
#import "AppKit/NSWindow.h"
#import "AppKit/NSEvent.h"
#import "AppKit/NSFont.h"
#import "AppKit/NSImage.h"
#import "AppKit/NSMenu.h"
#import "AppKit/NSMenuItem.h"
#import "AppKit/NSMenuView.h"
#import "AppKit/NSPanel.h"
#import "AppKit/NSPopUpButton.h"
#import "AppKit/NSPopUpButtonCell.h"
#import "AppKit/NSScreen.h"
#import "AppKit/NSAttributedString.h"

#import "GSGuiPrivate.h"
#import "NSDocumentFrameworkPrivate.h"
#import "GNUstepGUI/GSTheme.h"


/*Here we add Libsyllable inherited headers */

#import "atheos/types.h"
#import "util/looper.h"
#import "util/message.h"
#import "util/shortcutkey.h"
#import "gui/button.h"
#import "gui/window.h"
#import "gui/font.h"
#import "macros.h"

@interface NSMenuPanel : NSPanel

@end

@interface NSMenuView (GNUstepPrivate)

@end

@interface	NSMenu (GNUstepPrivate)

@end

@implementation NSMenuPanel

@end

@implementation	NSMenu (GNUstepPrivate)

@end

@implementation NSMenu

@end

@implementation NSMenu (GNUstepExtra)

@end


@implementation NsMenu:NSobject

using namespace os;

Bitmap *CheckMenu::s_pcCheckBitmap = NULL;

#define CHECK_W 10
#define CHECK_H 10

static uint8 nCheckData[] = {
	0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff,
	0x00, 0x00, 0x00, 0x00,
	0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff,
	0x00, 0x00, 0x00, 0x00,
	0x00, 0x00, 0x00, 0x00,
	0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff,
	0x00, 0x00, 0x00, 0x00,
	0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff,
	0x00, 0x00, 0x00, 0x00,
	0x00, 0x00, 0x00, 0x00,
	0x00, 0x00, 0x00, 0xff,
	0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff,
	0x00, 0x00, 0x00, 0x00,
	0x00, 0x00, 0x00, 0x00,
	0xff, 0xff, 0xff, 0xff,
	0x00, 0x00, 0x00, 0x00,
	0x00, 0x00, 0x00, 0x00,
	0x00, 0x00, 0x00, 0x00,
	0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff,
	0x00, 0x00, 0x00, 0x00,
	0x00, 0x00, 0x00, 0x00,
	0x00, 0x00, 0x00, 0x00,
	0x00, 0x00, 0x00, 0x00,
	0x00, 0x00, 0x00, 0x00,
	0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff,
	0x00, 0x00, 0x00, 0x00,
	0x00, 0x00, 0x00, 0x00,
	0x00, 0x00, 0x00, 0x00,
	0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff,
	0x00, 0x00, 0x00, 0x00,
	0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff,
	0xff, 0xff, 0xff, 0xff
};

@end


@Interface

CheckMenu::CheckMenu( const String& cLabel, Message * pcMsg, bool bChecked )
:MenuItem( cLabel, pcMsg )
{
	m_Highlighted = false;
	m_Enabled = true;
	m_IsChecked = bChecked;
	m_bIsSelectable = true;

	if( s_pcCheckBitmap == NULL )
	{
		Rect cCheckBitmapRect;

		cCheckBitmapRect.left = 0;
		cCheckBitmapRect.top = 0;
		cCheckBitmapRect.right = CHECK_W;
		cCheckBitmapRect.bottom = CHECK_H;

		s_pcCheckBitmap = new Bitmap( (int)cCheckBitmapRect.Width(), (int)cCheckBitmapRect.Height(  ), CS_RGBA32, Bitmap::SHARE_FRAMEBUFFER );
		memcpy( s_pcCheckBitmap->LockRaster(), nCheckData, ( unsigned int )( cCheckBitmapRect.Width(  ) * cCheckBitmapRect.Height(  ) * 4 ) );
	}
}

//----------------------------------------------------------------------------
// NAME:
// DESC:
// NOTE:
// SEE ALSO:
//----------------------------------------------------------------------------

CheckMenu::CheckMenu( Menu * pcMenu, Message * pcMsg, bool bChecked )
:MenuItem( pcMenu, pcMsg )
{
	m_Highlighted = false;
	m_Enabled = true;
	m_IsChecked = bChecked;
	m_bIsSelectable = true;

	if( s_pcCheckBitmap == NULL )
	{
		Rect cCheckBitmapRect;

		cCheckBitmapRect.left = 0;
		cCheckBitmapRect.top = 0;
		cCheckBitmapRect.right = CHECK_W;
		cCheckBitmapRect.bottom = CHECK_H;

		s_pcCheckBitmap = new Bitmap( (int)cCheckBitmapRect.Width(), (int)cCheckBitmapRect.Height(  ), CS_RGBA32, Bitmap::SHARE_FRAMEBUFFER );
		memcpy( s_pcCheckBitmap->LockRaster(), nCheckData, ( unsigned int )( cCheckBitmapRect.Width(  ) * cCheckBitmapRect.Height(  ) * 4 ) );
	}
}

//----------------------------------------------------------------------------
// NAME:
// DESC:
// NOTE:
// SEE ALSO:
//----------------------------------------------------------------------------

CheckMenu::~CheckMenu()
{
}

//----------------------------------------------------------------------------
// NAME:
// DESC:
// NOTE:
// SEE ALSO:
//----------------------------------------------------------------------------

void CheckMenu::Draw()
{
	Menu *pcMenu = GetSuperMenu();

	if( pcMenu == NULL )
	{
		return;
	}

	const String& cLabel = GetLabel();

	Rect cFrame = GetFrame();

	font_height sHeight;

	pcMenu->GetFontHeight( &sHeight );

	if( m_Highlighted )
	{
		pcMenu->SetFgColor( get_default_color( COL_SEL_MENU_BACKGROUND ) );
	}
	else
	{
		pcMenu->SetFgColor( get_default_color( COL_MENU_BACKGROUND ) );
	}

	pcMenu->FillRect( GetFrame() );

	if( m_Highlighted )
	{
		pcMenu->SetFgColor( get_default_color( COL_SEL_MENU_TEXT ) );
		pcMenu->SetBgColor( get_default_color( COL_SEL_MENU_BACKGROUND ) );
	}
	else
	{
		pcMenu->SetFgColor( get_default_color( COL_MENU_TEXT ) );
		pcMenu->SetBgColor( get_default_color( COL_MENU_BACKGROUND ) );
	}

	float vCharHeight = sHeight.ascender + sHeight.descender + sHeight.line_gap;
	float y = cFrame.top + ( cFrame.Height() + 1.0f ) / 2 - vCharHeight / 2 + sHeight.ascender + sHeight.line_gap * 0.5f;

	pcMenu->DrawString( Point( cFrame.left + 16, y ), cLabel );

	// If the menu is checked, draw the checkmark glyph on the right of the label
	if( m_IsChecked )
	{
		Rect cSourceRect = s_pcCheckBitmap->GetBounds();
		Rect cTargetRect;
		Rect cFrame = GetFrame();

		cTargetRect = cSourceRect.Bounds() + Point( cFrame.left + 2.0f, cFrame.top + ( cFrame.Height(  ) / 2 ) - 5.0f );

		pcMenu->SetDrawingMode( DM_OVER );
		pcMenu->DrawBitmap( s_pcCheckBitmap, cSourceRect, cTargetRect );
		pcMenu->SetDrawingMode( DM_COPY );
	}
}

//----------------------------------------------------------------------------
// NAME:
// DESC:
// NOTE:
// SEE ALSO:
//----------------------------------------------------------------------------

void CheckMenu::SetHighlighted( bool bHighlighted )
{
	m_Highlighted = bHighlighted;
	MenuItem::SetHighlighted( bHighlighted );
}

//----------------------------------------------------------------------------
// NAME:
// DESC:
// NOTE:
// SEE ALSO:
//----------------------------------------------------------------------------

Point CheckMenu::GetContentSize() const
{
	Menu *pcMenu = GetSuperMenu();

	if( pcMenu != NULL )
	{
		font_height sHeight;

		pcMenu->GetFontHeight( &sHeight );

		return ( Point( pcMenu->GetStringWidth( GetLabel() ) + 16, sHeight.ascender + sHeight.descender + sHeight.line_gap ) );
	}

	return ( Point( 0.0f, 0.0f ) );
}

/** Find out if the menu is currently selected
 * \par Description:
 *	Find out if a menu is checked
 * \return
 * true if the menu is checked, false if the menu is unchecked
 * \sa void SetChecked(bool bChecked)
 * \author Kristian Van Der Vliet (vanders@blueyonder.co.uk)
 *****************************************************************************/

bool CheckMenu::IsChecked() const
{
	return ( m_IsChecked );
}

/** Check or uncheck a menu
 * \par Description:
 *	Set a menu as checked, or uncheck a checked menu
 * \param bChecked - True to check the menu, or false to uncheck
 * \sa bool IsChecked( )
 * \author Kristian Van Der Vliet (vanders@blueyonder.co.uk)
 *****************************************************************************/

void CheckMenu::SetChecked( bool bChecked )
{
	m_IsChecked = bChecked;
}

//----------------------------------------------------------------------------
// NAME:
// DESC:
// NOTE:
// SEE ALSO:
//----------------------------------------------------------------------------

bool CheckMenu::Invoked( Message * pcMessage )
{
	if( m_IsChecked )
		m_IsChecked = false;
	else
		m_IsChecked = true;

	pcMessage->AddBool( "status", m_IsChecked );
	return true;
}


bool CheckMenu::IsSelectable() const
{
	return m_bIsSelectable;
}


@end