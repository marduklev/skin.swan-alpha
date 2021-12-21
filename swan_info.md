# skin.swan-alpha
<img src='./resources/fanart.jpg'>

[git hub link skin.swan-alpha](https://github.com/marduklev/skin.swan-alpha)


##  Credits for some currently used Textures belongs to
- @'Phil65' (skin.estuary) (default[foo].pngs's, some backgroundpatterns)
- @'Marcelveldt' , @'mgonzales71' (resource.images.backgroundoverlays.basic)
- some icons taken from https://materialdesignicons.com/
- some backgroundimages taken from [unsplash.com](https://unsplash.com/) (image creators are credited in the filename)

##  Addon Dependencies & Supported Addons
**dependencies**
 *  resource.images.skin.swan" version="1.0.01"/>
 *  [script.embuary.helper ](https://forum.kodi.tv/showthread.php?tid=345471)
 *  resource.images.studios.coloured
 *  resource.images.studios.white
 *  resource.images.weathericons.outline-hd
 *  resource.images.languageflags.colour
 *  script.embuary.helper
 
**supported**
 *  [script.embuary.info](https://forum.kodi.tv/showthread.php?tid=346034)
 *  [plugin.video.themoviedb.helper](https://forum.kodi.tv/showthread.php?tid=345847)
 *  [service.upnext](https://forum.kodi.tv/showthread.php?tid=336747) - UNDONE
 *   WIP	~~Resource Addon For Actor Thumbs (used in ... ) (resource.images.moviedirectorthumbs) https://forum.kodi.tv/showthread.php?tid=342720~~
 *  [script.artwork.beef](https://forum.kodi.tv/showthread.php?tid=258886)
 *  [script.cu.lrclyrics](https://forum.kodi.tv/showthread.php?tid=147340)

##  LOCAL TRAILER (if trailer not scraped or trailerpath is set in .nfo )
 * the skin checks if a tv show trailer exists on item focus
 >  the naming convention should be
 >  *tvshowtitle*-trailer.mp4
 >  and should be placed in the corresponding tv show root folder
 
##   YOUTUBE LOOKUPS
 > this skins uses several windows where **you tube** lookups will be performed, if you dislike such lookups/container content you can disable them
those are currently
-  tv show info viewtype (view id 58) **trailers** - disable youtube trailer via menucontrol
-  dialogvideoinfo **sountdtrack** ; **title search** - disable youtube trailer in skinsettings
-  search **searchterm** - disable youtube trailer in skinsettings
> you may will also need an [own Youtube API key](https://github.com/anxdpanic/plugin.video.youtube/wiki/Personal-API-Keys) to get those results if wished

##  TEXTURE THEMES
  *  you can choose between **2 themes (default & rounded )** the usual way
     > *choose a theme in the interface settings*
  *  rounded theme is a little bit special, 
      if you not use colors for the item tag bg panel the **widget/item artwork get rounded corners**
      if you use item tag bg panel colors the **rounded corners will be applied to the top of the widget/item artwork and to the bottom of a tag bg panel**
   
   
   PLACE IMG EXAMPLE HERE

##  COLORS / COLOR THEMES
  *  There are 2 ways to choose Colorthemes.
      *  The skins comes with prefefined Color Themes which can be choosen the usual way.
     > *choose a color theme in the interface settings*
  
      *  The 2nd Method require  *script.skin.helper.colorpicker* and *script.skin.helper.skinbackup*
 
     > You can edit nearly every color used by the skin
     in the __Custom Color Section__ and build your own Themes using the **Backup/Restore funtction**
 

     > if not already installed the skin will install it by going to the custom color section and toggle the "*use custom color*" setting on
     
     > ~~a live window to show off the color changes in a preview window is in progress~~
 
##  BACKGROUNDBUILING
The Backgroundbuilding is built up as follows,

**__Layer 1__**
  *  fullscreen Background , 
  *  Custom Color can be set
  *  Area is mostly not visible, nor noticable , but if you prefer transparence colors/ images on other layers it'll become important

**__Layer 2 / Artwork Layer__**
  *  can be a custom image (which is also the fallback image if fanart setting is enabled nut no artwork is found)
  *optional : show fanart artwork image - background artwork setting section*
  *optional : show rotating extra fanart - background artwork setting section*
  *optional : prefer animated fanart if available*
  
     > NOTE: [music check this link](https://kodi.wiki/view/Music_artwork)   and   [movie check this link](https://kodi.wiki/view/Movie_artwork) and adjust your *advancedsetting.xml* bar.
     
     > NOTE: i recommend using [artwork beef addon](https://forum.kodi.tv/showthread.php?tid=258886), which is also supported in the skin (musicinfo,videoinfo,settings section)
  
  *  there are 2 options HOW color (background layer2 color ) will be applied here 
 	 ** a) try to tint the image itself, not recommended if using 'show fanart'
  	** b) use 80% transparence image which is tinted instead and will lay over Layer 2 (1st diffusor )
      > can be enabled in *skinsettings : background* section
  *  optional blur artwork background is possible via _script.embuary.helper_ which is a skin dependencie.
     Just possible Media Windows (videos,music)
     *you can set strongness/blurring radius in embuary helper addon settings*
  *  you can animate your Layer 2 background image which uses a slide animation to bring in some movement to the background

  * color will be spplied directly on that layer

**__Layer 3 (optional)__**  *( CAN BE DISABLED IF SET COLOR TO NONE, or set alpha 00 )*
  * can be a custom image ( its supposed as a 2nd diffusor )
  * color will be spplied directly on that layer
 
...PUT PICTURE EXAPLE 1 HERE (TINT)
...PUT PICTURE EXAPLE 1 HERE  (80% DIFFUSOR)

 >  **special case spotlight style media windows**
 > That windows use its own colors which also be set in the custom color section
 
 ...PUT IMAGE EXAMPLE HERE

##  MUSIC HUB
Is a special Music Media Window , from here you can navigate trough every Library Content of your Music & Musicvideos without leaving that window ( if wished so )
 * it has a unique filter method in the top bar
 * easy navigation via menubar on the left
 * if music is playing you'll also able to have the current playlist visible by click on thebplaylist button in the top bar or navigate on right (from there you can also manipulate the playlist)
 
 ADD VIDEO HERE

> NOTE: 
	- default select action (when item is supposed to be played and not for navigation ) can be choosen by user (add to playlist as next title and play (default) - or just add to playlist as next title in playlist - related to songs,albums,genre items)
	- playlist manipulation can be done via my playlist.context menu addon ( move focused item up/down, delete focused item) - just bring up contextmenu and choose wished action

## SEARCH FEATURE
 *  the skin comes with a own search window which is available in the icon premenu and/or menu-panel in media windows
 *  can be used as custom main menu entry
>  each container content can be en/disabled within the skinsettings section
  
## VIDEO INFO DIALOG
 *  consists of 3 Pages
     *  click up to show additional info
     *  click down to navigate trough some content containers
>  by click on a cast member you can decide if you wanna do a local search or tmdb search ( requires embuary info addon )

>  by default the skin overrides the common select action when click on movie or tv show item in a container,
>  which means that you go to the info dialog for that item
>  you can disble this behaviour in the L I B R A R Y skinsetting section in the videoinfo subsection

   
>  by focus a cast member you'll get a list with movies and tv shows from your library

>  the skin looks if a soundtrack exists in your music library for the movie/show and if wished do a youtube lookup for a soundtrack which xan be played

>  each container content can be en/disabled within the skinsettings section
 
>  you can scroll trough some artwork and can go to fullscreen slideshow by click on the artwork.
    there are 2 ways from where those images are loaded which can be selected within the skinsettings
        1. **RECOMMENDED** : show scrapped artwork which respects the definitions from your **advancedsettings.xml**
        2. show content of extrafanart folder which should be place in the item art folder (depreciated method for storing)
 
 
 > https://forum.kodi.tv/showthread.php?tid=337089
 > https://kodi.wiki/view/Advancedsettings.xml#Extra_artwork
 
##  MUSIC INFO DIALOG
 *  you can play albums, songs or musicvideos from your library for the current artist without leaving

>  you can scroll trough some artwork and can go to fullscreen slideshow by click on the artwork.

>  the skin looks if booklet artwork exists
    **this require a images with naming of booklet1,booklet2,booklet3  ...**
    in the album folder. You'll also need to define them in the **advancedsettings.xml**

>  the _similiar artists/albums_ , _top 4 list_ ,  _youtube_  , _amazon prime music_ containes can be en/disabled within the skinsettings section
  
>  https://kodi.wiki/view/Advancedsettings.xml#Music_library_extra_artwork
 
##  Header Bar

 ...PUT IMAGE EXAMPLE HERE

  * always visible in media / settings windows
  * optional : hide background in Media Windows
  * optional : custom background texture can be choosen
  * choose which info you like to show/hide (profile switcher, weather info , time , date )
  
##  Footer Bar

 ...PUT IMAGE EXAMPLE HERE
 
  * just visible in media windows
  * can be disabled per view type
      >   e.g. show it on list view(50) and hide it on square panel view(53¿)
  * you can choose which info should be shown globally (rating(s) , media flags )
      > __NOTE : special ratings need to be scraped__
      
      >  each rating can be en/disabled seperatly
          if your interested in metacritic, rotten tomato ratings you'll need an [omdb api key](http://www.omdbapi.com/) and the [universal movie scrapper](https://kodi.wiki/view/Add-on:Universal_Movie_Scraper) or a scrapper which is able to scrape those
      

##  START UP / PROFILE LOGIN
   *  you can choose in which window kodi should start
   
   *  if Profile Login enabled you are able to define the Background Image , beside the usual way you can enable the profile login within the Startup Setting Section 
   - ...PUT IMAGE EXAMPLE HERE
   

##  HOME LAYOUTS
*  you can choose between 4 different Layouts
   
 **spotlight**
       - choose artwort position ( left, right)
       - choose text alignment ( left, center , right )

 
 img
 
  **Just Widgets**
 
 img
 
  **Just Main Menu Tiles**
 
 img
 
  **MIND OF SOMETHING**
 
 img
 
 
 >  choose custom colors / background image / background overlay image ( see backgroundbuilding )
 
##  HOME MENU ITEMS
 *  you can define up to 25 mainmenu items and define their used artwork / attributes seperatly via shortcut section
       - name
       - icon
       - fanart (currently used as background image)
      
	  * by default items are supposed to activate specific TARGET ( = windows )  and if set open the window in the specific PATH ( = the path for that window)
	  * optional you can also define and perform [KODI executebuiltin functions](https://kodi.wiki/view/List_of_built-in_functions)

* by pressing menu button / m key they icon bar gets focused , click left there to slide out the menu panel
* you can en/disable a profile switcher at the top


##  HOME WIDGETS
 *  you can define up to 99 widgets and define their layouts / attributes seperatly
       - name
       - layout (landscape , poster , circle , square , banner )
       - tags ( visible / hidden )
       - sort order
       - sort direction
       - limit items (default is 0 ; no limit )
       - show extended item info ( plot , genre, flags ) if not using Spotlight Home Layout

       - there is a attribute "is section" when set it to true you'll get tiny tiles which are supposed to used for **sections like genre,year or root list entrys from the library** you can set a custom tile image and icon/text color globally for all widgets which use that attribute


   >  you can enable "show title" in the widget Heading which counts globally for all widgets
 
   >  **WIP = means in mind** alignment of widget heading can be left , center , right
   
##  SHUTDOWN MENU
 *  choose which items you like to show / hide
 *  in Media Windows you're able to blur the item backgroudpanel
 
 ... PUT 1 IMG as comparison (blur vs default)

##  MEDIA WINDOWS MENU / MENUBAR
 * there is a customizable icon bar (hide/show options) in media windows for quick navigation
    * there is will be an option to focus that control bar by pressing menu / m key
    * if click left the menu panel will slide out which offers more options
 
 * menu panel is the default section which slides out and gain focus by press _menu / m key_
    *  container setting
    *  navigation settings (can be en/disabled)
    *  view type specific settings

 * if a media container can be filtered you can easily do a quick filter or advanced filter
     * there ~~is~~ will be an option to focus the filter button by pressing menu / m key


##  OSD / VIDEOPLAYBACK
 * OSD-Controls has optional autoclose : disable osd with timeout by click at playback controls (0 - 9 seconds) - can be set in Skinsettings Section
 * OSD-Info will fade out after 5 seconds idle time (not optional at current state ) when playback gets paused

 * when OSD Controls have focus - if click up : you'll focus the OSD SeekSlider Control,to move forward / back with left right
 * when OSD Controls have focus - if click down : you'll open the videofullscreeninfo window which shows some additional info (cast, media Flags, discart) , video will paused on opening 

 * if OSD active and press 'i' key 'Action(info)' - you'll toggle the osd info / Show Plot On/Off
 * if OSD is not active and press 'i' key 'Action(info)' - you'll Open the videofullscreeninfo window

## section
## section
## section
 
