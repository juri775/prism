import urllib, sys, os, re, time
import xbmcaddon, xbmcplugin, xbmcgui, xbmc
if sys.version_info < (2, 7):
    import simplejson
else:
    import json as simplejson


# Plugin constants
__addonname__ = "MgWicardd"
__addonid__   = "plugin.program.MgWicardd"
__addon__     = xbmcaddon.Addon(id=__addonid__)
__language__  = __addon__.getLocalizedString
__cwd__       = xbmc.translatePath( __addon__.getAddonInfo('path') )
__profile__   = xbmc.translatePath( __addon__.getAddonInfo('profile') )
__icondir__   = os.path.join( __cwd__,'resources','icons' )

# Shared resources
BASE_RESOURCE_PATH = os.path.join( __cwd__, 'resources', 'lib' )
sys.path.append (BASE_RESOURCE_PATH)

AUTO_START = __addon__.getSetting('AutomaticStart')



def CheckRunningStatus( ) :
	print 'CheckRunningStatus'
	if  os.path.exists( '/var/lib/softcam/running' ) :
		return True
	else :
		return False



"""
def EnableSPOFTCAM( aEnable ) :
	if aEnable == True :
		print '---------- Start ----------------' 
		ret = xbmcgui.Dialog().ok( __addonname__ , __language__(30001).encode('utf8') )
		
	else :
		print '---------- Stop ----------------'
		ret = xbmcgui.Dialog().ok( __addonname__ , __language__(30002).encode('utf8') )
"""



def ShowSettingDialog( ) :
	print '---------- Show Setting Dialog ----------------' 
	print 'cwd=%s' %__cwd__


	menuList = []
     	cmd = 'chmod 775 '+os.path.join( __cwd__,'*.sh' )
	print 'cmd=%s' %cmd
	os.system ( cmd )

	running = CheckRunningStatus( )

	print 'isrunning=%d' %running

	if running == True :
		menuList.append( "Stop")
		menuList.append( "Restart")
		menuList.append( "Remove")
		menuList.append( "Wicardd")
		menuList.append( "Mgcamd")
		menuList.append( "SoftCam.Key update")
		
		dialog = xbmcgui.Dialog( )
		selectIndex = dialog.select(  'Select Menu', menuList )

		
		print 'selectIndex=%d' %selectIndex
		
		if selectIndex == 0 :
			cmd = os.path.join( __cwd__,'stop.sh' )
			print 'cmd=%s' %cmd
			os.system( cmd )
		elif selectIndex == 1 :
			cmd = os.path.join( __cwd__,'restart.sh' )
			print 'cmd=%s' %cmd			
			os.system( cmd )
		elif selectIndex == 2 :
			cmd = os.path.join( __cwd__,'remove.sh' )
			print 'cmd=%s' %cmd			
			os.system( cmd )

		elif selectIndex == 3 :
			selectCardserver = xbmcgui.Dialog( ).select(  'Wicardd',['None','wicardd', 'backup wicardd conf', 'restore backup','backup wicardd', 'wicardd' ]  )
                        if selectCardserver == 0:
                        	os.system("ln -sf /etc/init.d/cardserver.None /etc/init.d/cardserver")
                        	cmd = os.path.join( __cwd__,'restart.sh' )
				os.system( cmd )
                        elif selectCardserver == 1:
                        	os.system("ln -sf /etc/init.d/cardserver.wicardd /etc/init.d/cardserver")
                        	cmd = os.path.join( __cwd__,'restart.sh' )
                        	#xbmcgui.Dialog().ok( 'SoftcamKey update' , __language__(30003).encode('utf8') )
				os.system( cmd )
                        elif selectCardserver == 2:
                        	os.system("cp /usr/local/tuxbox/config/wicardd/wicardd.conf /config/wicardd.conf")
                        	cmd = os.path.join( __cwd__,'restart.sh' )
				os.system( cmd )
                        elif selectCardserver == 3:
                        	os.system("cp  /config/wicardd.conf /usr/local/tuxbox/config/wicardd/wicardd.conf")
                        	cmd = os.path.join( __cwd__,'restart.sh' )
				os.system( cmd )
                        elif selectCardserver == 4:
                        	os.system("cp /usr/local/tuxbox/config/wicardd/wicardd.conf /config/wicardd.conf")
                        	cmd = os.path.join( __cwd__,'restart.sh' )
				os.system( cmd )
                        elif selectCardserver == 5:
                        	os.system("ln -sf /etc/init.d/cardserver.wicardd /etc/init.d/cardserver")
                        	cmd = os.path.join( __cwd__,'restart.sh' )
				os.system( cmd )
		elif selectIndex == 4 :
			selectCardserver = xbmcgui.Dialog( ).select(  'Mgcamd',['None','mgcamd', 'backup mgcamd conf', 'restore backup' ]  )
                        if selectCardserver == 0:
                        	os.system("ln -sf /etc/init.d/cardserver.None /etc/init.d/cardserver")
                        	cmd = os.path.join( __cwd__,'restart.sh' )
				os.system( cmd )
                        elif selectCardserver == 1:
                        	os.system("ln -sf /etc/init.d/cardserver.mgcamd /etc/init.d/cardserver")
                        	cmd = os.path.join( __cwd__,'restart.sh' )
				os.system( cmd )
			elif selectCardserver == 2:
                        	os.system("cp /var/keys/newcamd.list /config/newcamd.list")
                        	cmd = os.path.join( __cwd__,'restart.sh' )
				os.system( cmd )
			elif selectCardserver == 3:
                        	os.system("cp /config/newcamd.list /var/keys/newcamd.list")
                        	cmd = os.path.join( __cwd__,'restart.sh' )
				os.system( cmd )

		elif selectIndex == 5 :
			os.system('/usr/local/sbin/reload.sh' )
			xbmcgui.Dialog().ok( 'SoftcamKey update' , __language__(30003).encode('utf8') )

	else :
		menuList.append( "Start")
		menuList.append( "Remove")
		dialog = xbmcgui.Dialog( )

		selectIndex = dialog.select(  'Select Menu', menuList )

		print 'selectIndex=%d' %selectIndex

		if selectIndex == 0 :
			cmd = os.path.join( __cwd__,'start.sh' )
			print 'cmd=%s' %cmd			
			os.system( cmd )
		elif selectIndex == 1 :
			cmd = os.path.join( __cwd__,'remove.sh' )
			print 'cmd=%s' %cmd			
			os.system(  cmd )		

		#__addon__.openSettings()



if __name__ == '__main__' :
	print 'SOFTCAM TEST'
	ShowSettingDialog( )


