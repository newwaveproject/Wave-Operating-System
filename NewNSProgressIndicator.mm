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
#import <Foundation/NSAutoreleasePool.h>
#import <Foundation/NSRunLoop.h>
#import <Foundation/NSThread.h>
#import <Foundation/NSTimer.h>
#import "AppKit/NSApplication.h"
#import "AppKit/NSProgressIndicator.h"
#import "AppKit/NSGraphics.h"
#import "AppKit/NSImage.h"
#import "AppKit/NSWindow.h"
#import "GNUstepGUI/GSTheme.h"
#import "GNUstepGUI/GSNibLoading.h"

/*Here we add Libsyllable inherited headers */

#import "atheos/types.h"
#import "util/looper.h"
#import "util/message.h"
#import "util/shortcutkey.h"
#import "gui/button.h"
#import "gui/window.h"
#import "gui/font.h"
#import "macros.h"

@implementation NsProgressIndicator:NSobject

/**internal*/
class ProgressBar::Private {
	public:
    float		m_vProgress;
    orientation	m_eOrientation;
};


/**
 * \par Description:
 *	The os::ProgressBar's Constructor.
 * \param cFrame - The size and position of the os::ProgressBar
 * \param cName - The name of the os::ProgressBar.
 * \param nOrientation - The position of the ScrollBar(use os::VERTICAL or os::HORIZONTAL)
 * \param nResizeMask - Determines what way the ScrollBar will follow the rest of the window.  Default is CF_FOLLOW_LEFT|CF_FOLLOW_TOP.
 * \param nFlags      - Default is WID_WILL_DRAW | WID_CLEAR_BACKGROUND 
 * \author	Kurt Skauen

@end


@Interface

ProgressBar::ProgressBar( const Rect & cFrame, const String & cName, orientation eOrientation, uint32 nResizeMask, uint32 nFlags ) : View( cFrame, cName, nResizeMask, nFlags )
{
	m = new Private;
	m->m_vProgress = 0.0f;
	m->m_eOrientation = eOrientation;
}

ProgressBar::~ProgressBar()
{
	delete m;
}

/**
 * \par Description:
 *	SetProgress sets current progress.  This number should be between 0 and 1 inclusive
 * \param vValue - float to the current progress value.  Should be a value between 0 and 1 inclusive
 * \sa GetProgress()
 * \author	Kurt Skauen
 *****************************************************************************/
void ProgressBar::SetProgress( float vValue )
{
	m->m_vProgress = vValue;
	Invalidate();
	Flush();
}


/**
 * \par Description:
 *	GetProgress gets current progress.  
 * \param vValue - float to the current progress value (should be a num between 0 and 1 inclusive)
 * \sa SetProgress()
 * \author	Kurt Skauen
 *****************************************************************************/
float ProgressBar::GetProgress() const
{
	return ( m->m_vProgress );
}


//see os::View
void ProgressBar::AttachedToWindow()
{
	View *pcParent = GetParent();

	if( pcParent != NULL )
	{
		SetBgColor( pcParent->GetBgColor() );
	}
	else
	{
		SetBgColor( get_default_color( COL_NORMAL ) );
	}
}

//see os::View
void ProgressBar::Paint( const Rect & cUpdateRect )
{
	//get normalized bounds
	//bounds to floor
	//draw frame with those bounds
	Rect cBounds = GetNormalizedBounds();
	cBounds.Floor();

	//set the fgcolor to black
	//then fill the whole rect with black
	SetFgColor(0,0,0);
	FillRect(cBounds);

	//now lets set the appropriate color
	if (HasFocus())
		SetFgColor(get_default_color(COL_FOCUS));
	else
		SetFgColor(get_default_color(COL_ICON_SELECTED));


	//lets create the bar length
	//then make it look correct
	float vBarLength = ( m->m_eOrientation == HORIZONTAL ) ? cBounds.Width() : cBounds.Height(  );
	vBarLength = ceil( ( vBarLength - 3.0f ) * m->m_vProgress );  //bar length becomes the ceil of the (bar length - 3) * progress

	Rect cBarFrame = cBounds;
	cBarFrame.Resize( 1.0f, 1.0f, -1.0f, -1.0f );
	Rect cRestFrame = cBarFrame;

	if( vBarLength < 1.0f ) //so if bar length is not valid
	{
		FillRect( cRestFrame, GetBgColor() );
	}
	else
	{

		//lets calculate the correct bar length

		if( m->m_eOrientation == HORIZONTAL )
		{
			cBarFrame.right = cBarFrame.left + vBarLength;
			if( cBarFrame.right > cBounds.right - 2.0f )
			{
				cBarFrame.right = cBounds.right - 2.0f;
			}
			cRestFrame.left = cBarFrame.right + 1.0f;
		}
		else
		{
			cBarFrame.top = cBarFrame.bottom - vBarLength;
			if( cBarFrame.right < cBounds.right + 2.0f )
			{
				cBarFrame.top = cBounds.top + 2.0f;
			}
			cRestFrame.bottom = cBarFrame.top - 1.0f;
		}

		//if bar length is valid
		if( vBarLength >= 1.0f )
		{
			FillRect( cBarFrame, GetFgColor() );
		}

		//if the rest of the frame is valid
		if( cRestFrame.IsValid() )
		{
			FillRect( cRestFrame, GetBgColor() );
		}
	}
}

//see os::View
Point ProgressBar::GetPreferredSize( bool bLargest ) const
{
	/***********FIX ME*************/
	font_height sHeight;

	GetFontHeight( &sHeight );
	float vHeight = sHeight.ascender + sHeight.descender + sHeight.line_gap;
	Point cSize( vHeight * 3, vHeight + 4 );

	if( bLargest )
	{
		cSize.x = 100000.0f;
	}
	return ( cSize );
}

//see os::View
void ProgressBar::FrameSized( const Point & cDelta )
{
	Rect cBounds( GetBounds() );
	bool bNeedFlush = false;

	//test to make sure there is a damaged area
	if( ( m->m_eOrientation == HORIZONTAL && cDelta.x != 0.0f ) || ( m->m_eOrientation == VERTICAL && cDelta.y != 0.0f ) )
	{
		//if damaged, invalidate and set to flush
		Rect cDamage = cBounds;

		cDamage.Resize( 2.0f, 2.0f, -2.0f, -2.0f );
		Invalidate( cDamage );
		bNeedFlush = true;
	}

	//damaged.x????
	if( cDelta.x != 0.0f )
	{
		//invalidate, and set to flush
		Rect cDamage = cBounds;

		cDamage.left = cDamage.right - std::max( 4.0f, cDelta.x + 3.0f );
		Invalidate( cDamage );
		bNeedFlush = true;
	}

	//damaged.y????
	if( cDelta.y != 0.0f )
	{
		//invalidate, and set to flush
		Rect cDamage = cBounds;

		cDamage.top = cDamage.bottom - std::max( 3.0f, cDelta.y + 2.0f );
		Invalidate( cDamage );
		bNeedFlush = true;
	}

	//if need flush, then flush
	if( bNeedFlush )
	{
		Flush();
	}
}

void ProgressBar::__PB_reserved1__()
{
}

void ProgressBar::__PB_reserved2__()
{
}

void ProgressBar::__PB_reserved3__()
{
}

void ProgressBar::__PB_reserved4__()
{
}

void ProgressBar::__PB_reserved5__()
{
}


@end

@implementation NSProgressIndicator (GNUstepExtensions)

@end


