@ECHO OFF

COLOR A

ECHO -------------------------------------------------------------------------
ECHO                   ** Creating Textures XBT File... **
ECHO -------------------------------------------------------------------------

ECHO.
REM main textures
START /B /WAIT TexturePacker -dupecheck -input media\ -output media\Textures.xbt
START /B /WAIT TexturePacker -dupecheck -input media\ -output media\PackedXBTThemeAbuse.xbt
START /B /WAIT TexturePacker -dupecheck -input themes\Roundedge\ -output media\Roundedge.xbt
ECHO.

ECHO.
ECHO.

ECHO -------------------------------------------------------------------------
ECHO        ** XBT build complete - scroll up to check for errors. **
ECHO -------------------------------------------------------------------------

PAUSE > NUL