# Wyze_v3_OpenIPC
Wyze v3 OpenIPC install

Git Clone https://github.com/themactep/device-wyze-v3

Repalce sdcard1.sh with this one, then follow this

I could not get this to work - https://github.com/themactep/device-wyze-v3/tree/master, the .sh scripts would run with errors. Partd gave an error so here is what I did to get OpenIPC on the wyze cam V3 with the realtek wifi chip.

Open the Cam and take out the board - https://www.youtube.com/watch?v=jm4wze_HY78

Get yourself one of these - https://www.amazon.com/ABSOK-CH341A-Programmer-Module-Adapter/dp/B08HH6CPVF/ref=sr_1_1_sspa?crid=1A4N2T8UI3HQ7&dib=eyJ2IjoiMSJ9.17RbOaEuTLcq8x91h2Fa2vzSSi0ZzlTxxvM7G4eDqoSj8eS6EzZmNIyOwkduaDtQaboK8wN1OYSiipJ1DQb-719kx77BDxPh5sk0_W1UAv5OrzhvbmDnsNtZomBG-GG-OB6mRrteax-88tjWdtClkO7PqQGGrIggFU_XxqQES8JAjZH2Xn44vJrdHHXBA4_USBXdlkhflOMnlAMsjGNnLvUIsOyHqedqwI1lIMCP4oY.GvluV0S1qbrJxS3Dhzpw7zAKYzLMJLlhDrvjY9XjcX4&dib_tag=se&keywords=spi+chip+programmer&qid=1708359239&sprefix=spi+chip+progr%2Caps%2C329&sr=8-1-spons&sp_csd=d2lkZ2V0TmFtZT1zcF9hdGY&psc=1

Once the cam is out of the houseing connect the claw to the eprom. Put the red wire on pin 1 identifed by the dot on the chip 
![uart-flash](https://github.com/freshfitz/Wyze_v3_OpenIPC/assets/7000841/0fd8f51c-ecc7-4aee-9e0a-6cfa680368c1)


Download neoprogrammer and set chip to whichever is on the board mine is

![image](https://github.com/freshfitz/Wyze_v3_OpenIPC/assets/7000841/475927b5-5b3a-4835-8cd1-89386de182bc)

Make a backup of the Wyze firmware, in neoprgarmmer<br />
click the read chip icon<br />
File Save<br />
Save .bin and store it somewhere safe if you want to go back to the wyze firmware.

Go here - https://openipc.org/cameras/vendors/ingenic/socs/t31x Select NOR16 and download .bin file

Go back to your neopgrammer<br />
Select the Erase IC icon(***MAKE SURE YOU HAVE A .bin BACKUP****)<br />
File -> Open<br />
Open .bin you just downloaded<br />
Click Write IC<br />

Make sure you have one of these - https://www.amazon.com/Serial-Adapter-Signal-Prolific-Windows/dp/B07R8BQYW1/ref=sr_1_6?crid=2XKOY0WQO8UXM&dib=eyJ2IjoiMSJ9.eprdgCSnyC_zHrP5bQpAg9b4tIZvoQXdtWdkItJajHk7JjftKr1tLlAsXqexnZ_MpY0Y8psTrc_b9DsVeHAhf9VgP_hG7PIgojKALfAzmVp_sD06wtrDp0QbTRm5HPhAM-m_KtS5K3c-kDmNeeJEsYkfQl6ncIL7nIX5PTYDQWfQA3ntt5sOwePpIbS57lCf-i9jJx5OiD0GmXwgE5bfOFdPyYUSQ9TY3_f_kK7Zdd0.3oKMDFMUnrgiqt3spL6XgwNwy8NKanLwqog5LLMkhB8&dib_tag=se&keywords=usb+to+ttl&qid=1708359627&sprefix=usb+to+ttl%2Caps%2C100&sr=8-6

Connect this to the GRND, TX and RX pins<br />
Open Putty<br />
Set to Serial, Com port, and <br />
![image](https://github.com/freshfitz/Wyze_v3_OpenIPC/assets/7000841/0c55b0a2-d98f-4eca-85a7-7c0b98838362)

Boot Wyze cam with putty you will see Kernel Panic VFS can't mount rootfs(**** WHAT EVER YOU DO, DO NOT PANIC*****)<br />

Press CTRL-C while cam is booting and you'll get a prompt type in run setnor16m

OPENIPC# run setnor16m<br />
press enter<br />
Cam will reboot to a login prompt<br />
admin<br />
12345

Now you have OPENIPC installed but probably no wifi<br />
Download these files from git and put them on an sd card<br>
Inser SD card in camera SD card slot<br>
run df -h<br>
you should see the SD card partition /mnt/mmcblk0p1<br>
Run the redacted sdcards2.sh I made
root@openipc-t31: sh /mnt/mmcblk0p1/sdcards/sdcard2.sh -d /mnt/mmcblk0p1<br>
or cd to the dir cd /mnt/mmcblk0p1/sdcards<br>
then sh sdcard2.sh -d /mnt/mmcblk0p1<br>
After that is finsihed to root<br/>
cd /<br/>
sh install.sh<br/>
modprobe 8189fd<br/>
ifup wlan0<br/>

You should get an IP address not on the wlan<br>
visit http://CAM IP ADDRESS:85n<br>
n<br>
You should get OPenIPC login page








