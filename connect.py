#Can automatically logging into CUHK, CUHKa or Hostel Ethernet
#Prerequisite: python3, requests module 
import requests

#User config
username='s11550xxxxx'
password=''

#Check Internet type and whether it's time to connect
def toLogin():
	global net
	i=requests.session()
	try:
		r=i.get("http://www.cuhk.edu.hk",verify=False,allow_redirects=False)
		#In Ethernet, it will use 302 redirection to let you log in
		#In CUHK or CUHKa Wifi, it will use 200 response and HTML to redirect you to log in page
		if (r.status_code == 302 and 'https://securelogin.net.cuhk.edu.hk' in r.headers['Location']):
			net='hostel'#Ethernet in hostel
			return True
		elif (r.status_code == 200 and "<meta http-equiv='refresh' content='1; url=http://www.cuhk.edu.hk/&arubalp=" in r.text):
			net='wlan'#wifi
			return True
		else:
			return False
	except:
		print("Exception occur. Maybe you are not connected to Internet physically.")
		return False

#Initialize
net=''
payload={'user':username,'password':password,'cmd':'authenticate','Login':'Log+In'}
#Connect to Ethernet
if toLogin(): #Physcially connected to Internet and redirection detected
	i=requests.session()
	if password == '' or 'xxxxx' in username:
		print('Incorrect username or password.')
	elif net=='':
		print('Unknown Internet type.')
	elif net=='hostel':
		result=i.post('http://securelogin.net.cuhk.edu.hk/cgi-bin/login', data=payload)
	elif net=='wlan':
		result=i.post('http://securelogin.wlan.cuhk.edu.hk/cgi-bin/login', data=payload)
#Now you've logged into CU network
