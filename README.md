# Wyze_v3_OpenIPC
Wyze v3 OpenIPC install

I could not get this to work - https://github.com/themactep/device-wyze-v3/tree/master, the .sh scripts would run with errors. Partd gave an error so here is what I did to get OpenIPC on the wyze cam V3 with the realtek wifi chip.

Open the Cam and take out the board - https://www.youtube.com/watch?v=jm4wze_HY78

Get yourself one of these - https://www.amazon.com/ABSOK-CH341A-Programmer-Module-Adapter/dp/B08HH6CPVF/ref=sr_1_1_sspa?crid=1A4N2T8UI3HQ7&dib=eyJ2IjoiMSJ9.17RbOaEuTLcq8x91h2Fa2vzSSi0ZzlTxxvM7G4eDqoSj8eS6EzZmNIyOwkduaDtQaboK8wN1OYSiipJ1DQb-719kx77BDxPh5sk0_W1UAv5OrzhvbmDnsNtZomBG-GG-OB6mRrteax-88tjWdtClkO7PqQGGrIggFU_XxqQES8JAjZH2Xn44vJrdHHXBA4_USBXdlkhflOMnlAMsjGNnLvUIsOyHqedqwI1lIMCP4oY.GvluV0S1qbrJxS3Dhzpw7zAKYzLMJLlhDrvjY9XjcX4&dib_tag=se&keywords=spi+chip+programmer&qid=1708359239&sprefix=spi+chip+progr%2Caps%2C329&sr=8-1-spons&sp_csd=d2lkZ2V0TmFtZT1zcF9hdGY&psc=1

Once the cam is out of the house connect the claw to the eprom. Put the red wire on pin 1 identifed by the dot on the chip 
![uart-flash](https://github.com/freshfitz/Wyze_v3_OpenIPC/assets/7000841/0fd8f51c-ecc7-4aee-9e0a-6cfa680368c1)


Download neoprogrammer and set chip to whichever is on the board mine is
![image](https://github.com/freshfitz/Wyze_v3_OpenIPC/assets/7000841/475927b5-5b3a-4835-8cd1-89386de182bc)

Make a backup of the Wyze firmware click the read chip icon.
File Save
Save .bin and store it somewhere safe if you want to go back to the wyze firmware.

Go here - https://openipc.org/cameras/vendors/ingenic/socs/t31x Select NOR16 and download .bin file

Go back to your neopgrammer and select Erase IC
File Open
Open .bin you just downloaded
Click Write IC

Make sure you have one of these - https://www.amazon.com/Serial-Adapter-Signal-Prolific-Windows/dp/B07R8BQYW1/ref=sr_1_6?crid=2XKOY0WQO8UXM&dib=eyJ2IjoiMSJ9.eprdgCSnyC_zHrP5bQpAg9b4tIZvoQXdtWdkItJajHk7JjftKr1tLlAsXqexnZ_MpY0Y8psTrc_b9DsVeHAhf9VgP_hG7PIgojKALfAzmVp_sD06wtrDp0QbTRm5HPhAM-m_KtS5K3c-kDmNeeJEsYkfQl6ncIL7nIX5PTYDQWfQA3ntt5sOwePpIbS57lCf-i9jJx5OiD0GmXwgE5bfOFdPyYUSQ9TY3_f_kK7Zdd0.3oKMDFMUnrgiqt3spL6XgwNwy8NKanLwqog5LLMkhB8&dib_tag=se&keywords=usb+to+ttl&qid=1708359627&sprefix=usb+to+ttl%2Caps%2C100&sr=8-6

Connect this to the GRND, TX and RX pins
Open Putty
Set to Serial, Com port, and 
![image](https://github.com/freshfitz/Wyze_v3_OpenIPC/assets/7000841/0c55b0a2-d98f-4eca-85a7-7c0b98838362)

Boot Wyze cam with putton open and you should get a login prompt
admin
12345



