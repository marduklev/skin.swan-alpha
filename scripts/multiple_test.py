import xbmc

def main():
    # xbmc.executebuiltin(function, block). 
    # https://github.com/xbmc/xbmc/tree/master/xbmc/interfaces/builtins
    
    
    # use enhaced method to run your script,
    # RunScript(*path*/*scriptfilename*.py)
    # e.g  RunScript(special://skin/scripts/multiple_test.py)
    
    xbmc.executebuiltin('notification(action1:, performed)')
    xbmc.executebuiltin('notification(action2:, performed)')    
    xbmc.executebuiltin('notification(action3:, performed)')    
    xbmc.executebuiltin('notification(action4:, performed)')    
    xbmc.executebuiltin('notification(action5:, performed)')    
    
    
if __name__ == '__main__':
    main()
