require "win32/dir"

# C:\WINNT or C:\WINDOWS
puts Dir::WINDOWS

# C:\Documents and Settings\KB9AGT\Start Menu\Programs\Administrative Tools
puts Dir::ADMINTOOLS
   
puts Dir::ADMINTOOLS

#~ The file system directory that is used to store administrative tools for an
#~ individual user. The Microsoft Management Console (MMC) will save
#~ customized consoles to this directory, and it will roam with the user.

puts Dir::COMMON_ADMINTOOLS

#~ The file system directory containing administrative tools for all users
#~ of the computer.

puts Dir::APPDATA

#~ The file system directory that serves as a common repository for
#~ application-specific data. A typical path is
#~ C:\Documents and Settings\username\Application Data.

#~ This CSIDL is supported by the redistributable Shfolder.dll for
#~ systems that do not have the Microsoft Internet Explorer 4.0
#~ integrated Shell installed.

puts Dir::COMMON_APPDATA

#~ The file system directory containing application data for all users. A
#~ typical path is C:\Documents and Settings\All Users\Application Data.

puts Dir::COMMON_DOCUMENTS

#~ The file system directory that contains documents that are common to all
#~ users. A typical paths is C:\Documents and Settings\All Users\Documents.

puts Dir::COOKIES

#~ The file system directory that serves as a common repository for Internet
#~ cookies. A typical path is C:\Documents and Settings\username\Cookies.

puts Dir::HISTORY

#~ The file system directory that serves as a common repository for Internet
#~ history items.

puts Dir::INTERNET_CACHE

#~ The file system directory that serves as a common repository for temporary
#~ Internet files. A typical path is
#~ C:\Documents and Settings\username\Local Settings\Temporary Internet Files.

puts Dir::LOCAL_APPDATA

#~ The file system directory that serves as a data repository for local
#~ (nonroaming) applications. A typical path is
#~ C:\Documents and Settings\username\Local Settings\Application Data.

puts Dir::MYPICTURES

#~ The file system directory that serves as a common repository for image
#~ files. A typical path is
#~ C:\Documents and Settings\username\My Documents\My Pictures.

puts Dir::PERSONAL

#~ The virtual folder representing the My Documents desktop item. This is
#~ equivalent to Dir::MYDOCUMENTS.

puts Dir::PROGRAM_FILES

#~ The Program Files folder. A typical path is C:\Program Files.

puts Dir::PROGRAM_FILES_COMMON

#~ A folder for components that are shared across applications. A typical path
#~ is C:\Program Files\Common.

puts Dir::SYSTEM

#~ The Windows System folder. A typical path is C:\Windows\System32.

puts Dir::WINDOWS

#~ The Windows directory or SYSROOT. This corresponds to the %windir% or
#~ %SYSTEMROOT% environment variables. A typical path is C:\Windows.

#~ The following constants may or may not be defined:

puts Dir::ALTSTARTUP
   
#~ The file system directory that corresponds to the user's nonlocalized
#~ Startup program group.

puts Dir::BITBUCKET

#~ The virtual folder containing the objects in the user's Recycle Bin.

puts Dir::CDBURN_AREA

#~ The file system directory acting as a staging area for files waiting to
#~ be written to CD.

puts Dir::COMMON_ALTSTARTUP

#~ The file system directory that corresponds to the nonlocalized Startup
#~ program group for all users.

puts Dir::COMMON_DESKTOPDIRECTORY

#~ The file system directory that contains files and folders that appear on
#~ the desktop for all users. A typical path is
#~ C:\Documents and Settings\All Users\Desktop.

puts Dir::COMMON_FAVORITES

#~ The file system directory that serves as a common repository for favorite
#~ items common to all users.

puts Dir::COMMON_MUSIC

#~ The file system directory that serves as a repository for music files
#~ common to all users.

puts Dir::COMMON_PICTURES

#~ The file system directory that serves as a repository for image files
#~ common to all users.

puts Dir::COMMON_PROGRAMS

#~ The file system directory that contains the directories for the common
#~ program groups that appear on the Start menu for all users.

puts Dir::COMMON_STARTMENU

#~ The file system directory that contains the programs and folders that
#~ appear on the Start menu for all users.

puts Dir::COMMON_STARTUP

#~ The file system directory that contains the programs that appear in the
#~ Startup folder for all users.

puts Dir::COMMON_TEMPLATES

#~ The file system directory that contains the templates that are available
#~ to all users.

puts Dir::COMMON_VIDEO

#~ The file system directory that serves as a repository for video files
#~ common to all users.

puts Dir::CONTROLS

#~ The virtual folder containing icons for the Control Panel applications.

puts Dir::DESKTOP

#~ The virtual folder representing the Windows desktop, the root of the
#~ namespace.

puts Dir::DESKTOPDIRECTORY

#~ The file system directory used to physically store file objects on the
#~ desktop (not to be confused with the desktop folder itself).

puts Dir::DRIVES

#~ The virtual folder representing My Computer, containing everything on
#~ the local computer: storage devices, printers, and Control Panel. The
#~ folder may also contain mapped network drives.

puts Dir::FAVORITES

#~ The file system directory that serves as a common repository for the
#~ user's favorite items.

puts Dir::FONTS

#~ A virtual folder containing fonts.

puts Dir::INTERNET

#~ A virtual folder representing the Internet.

puts Dir::MYDOCUMENTS

#~ The virtual folder representing the My Documents desktop item.  See also
#~ Dir::PERSONAL.

puts Dir::MYMUSIC

#~ The file system directory that serves as a common repository for music
#~ files.

puts Dir::MYVIDEO

#~ The file system directory that serves as a common repository for video
#~ files.

puts Dir::NETHOOD

#~ A file system directory containing the link objects that may exist in the
#~ My Network Places virtual folder. It is not the same as Dir::NETWORK, which
#~ represents the network namespace root.

puts Dir::NETWORK

#~ A virtual folder representing Network Neighborhood, the root of the network
#~ namespace hierarchy.

puts Dir::PRINTERS

#~ The virtual folder containing installed printers.

puts Dir::PRINTHOOD

#~ The file system directory that contains the link objects that can exist in
#~ the "Printers" virtual folder.

puts Dir::PROFILE

#~ The user's profile folder.

puts Dir::PROFILES

#~ The file system directory containing user profile folders.

puts Dir::PROGRAMS

#~ The file system directory that contains the user's program groups (which
#~ are themselves file system directories).

puts Dir::RECENT

#~ The file system directory that contains shortcuts to the user's most
#~ recently used documents.

puts Dir::SENDTO

#~ The file system directory that contains Send To menu items.

puts Dir::STARTMENU

#~ The file system directory containing Start menu items.

puts Dir::STARTUP

#~ The file system directory that corresponds to the user's Startup program
#~ group.

puts Dir::TEMPLATES

#~ The file system directory that serves as a common repository for document
#~ templates.
