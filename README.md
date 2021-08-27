# change_motd.sh

## Info
### English
This script automatically changes the motd file of ircd-hybrid server every day.

Modify to suit your server environment before installing it.

#### Modifiable variables

<b>motd_dir</b>: directory path where motd file exists. the default is /etc/ircd-hybrid. <br>
<b>server_name</b>: server name <br>
<b>server_admin</b>: server administrator nickname <br>
<b>admin_email</b>: server administrator emil address <br>
<b>arts</b>: list of ascii arts to be changed daily <br>
<b>comments</b>: list of comments to be changed daily <br>

### Korean
ircd-hybrid 서버의 motd 파일을 매일 자동으로 변경하는 스크립트입니다.

자신의 서버 환경에 맞게 수정하여 사용하세요.

#### 수정 가능한 변수

<b>motd_dir</b>: motd 파일이 존재하는 디렉터리. 기본값은 /etc/ircd-hybrid 입니다. <br>
<b>server_name</b>: 서버 이름 <br>
<b>server_admin</b>: 서버 관리자 닉네임 <br>
<b>admin_email</b>: 서버 관리자 이메일 주소 <br>
<b>arts</b>: 매일 변경될 아스키 아트 목록 <br>
<b>comments</b>: 매일 변경될 한줄문구 <br>

## Install crontab

```
01 00 * * * change_motd.sh
```

## screenshot

![motd](https://user-images.githubusercontent.com/75349747/130984540-ac5e5b57-14ac-4a94-a85f-7bcf5d3c5bc4.PNG)
![motd2](https://user-images.githubusercontent.com/75349747/130985715-8a679e8a-354e-4acb-98ab-30d71f1eafa3.PNG)

<br>
(Kiwi IRC client)
