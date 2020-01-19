---
layout: post
title: Smart Clock
meta-title: "Smart Clock"
subtitle: ...và hướng dẫn chi tiết (Phần 1)
bigimg:
  - "/img/2020-01-17-smart-clock/anh-bia-baiviet.jpg" : "Đồng hồ"
image: /img/2020-01-17-smart-clock/anh-bia-baiviet.jpg
tags: [đồng hồ, smart, watch, clock, alarm, thingspeak, esp8266]
comments: true
gh-repo: bangnguyendev/SmartClock
gh-badge: [star, follow, fork]
---
# Phần 1: Giới thiệu chút chơi
<!-- Font chữ bự chà bá -->
<h1 class="text-center">Tản mạn dạo đầu tí nha!</h1>
Hưm... Xin chào mọi người. Có lẽ đây là bài viết đầu tiên mình viết về việc chia sẽ làm một cái gì đó...hoặc có thể coi là bài blog đầu tiên :3

Ở bài viết này mình sẽ **hướng dẫn chi tiết** và lí giải tuần tự mọi thứ kể từ khi mình bắt đầu làm nó. Ở thời buổi 4.0 như bây giờ việc mua 1 cái đồng hồ có tính năng tương tự hoặc hay ho hơn thé chỉ với giá thành không hề cao là đã sở hữu nó rồi. Thế nên **bài viết** này chi mang **tính chất trao đổi kiến thức**, **kinh nghiệm** khi đam mê làm đồ chơi handmade thôu nhé!

----------------------------------------------------------------------------
<!-- Font chữ bự chà bá -->
<h1 class="text-center">Vào công việc nào...!</h1>
<div class="spacer"></div>

## Việc đầu tiên các bạn cần chuẩn bị:
  - **Phần cứng:**
    - Board ESP266 **Wemos D1 mini** (Sơ đồ nguyên lí đây [nhấn vô đây cơ](img/2020-01-17-smart-clock/sch_d1_mini_v3.0.0.pdf)).
    - Một cộng cáp **Micro USB connection** để nạp code nha! Mình lấy cáp sạc điện thoại Samsung nạp luôn, nhưng nhớ là chuẩn **Micro USB** nha... ~~Type-C~~ là ngéo luôn á nha mọi người.
    - **Lcd 20x04**.
    - Mạch chuyển đổi **I2C** cho màn hình LCD2004.
    - Mica dày 3mm (có hay không củng không quan trọng, các bạn cứ chạy ra tiệm nào nhận cắt mica rồi đưa bản vẽ ra, họ cân tất cả. Có một số cửa hàng cắt mica khá ngon mình sẽ đính kèm địa chỉ cuối bài viết hoặc tìm gg "**Mica Sinh Viên**" - nếu bạn ở *thành phố Hồ Chí Minh* nhé).
    - **Buzzer** 5-12v (hoặc loa liếc gì đấy tùy vào kỹ năng chơi điện của các bạn.).
    - Một vài **cọng dây đực cái, cái đực, dây điện** (nối để test mạch hoạt động), vv...
    - Nguồn cung cấp cho ESP266 Wemod D1 (**Nguồn 5v-2A**, dư dòng tí mình sử dụng trong các mục đích khác).
  - **Phần mềm:**
    - **[VS code](https://code.visualstudio.com/download)** (khuyên dùng vì tiện nhiều thứ hơn IDE Arduino không hổ trợ).
    - **[IDE Arduino](https://www.arduino.cc/en/main/software)**.
    - Driver giao tiếp giả lập port **[CH340](https://sparks.gogo.co.nz/ch340.html)**.
    - **[Android Studio](https://developer.android.com/studio)**.

  - **Ngôn ngữ lập trình:**
    - Chắc chắc là **C/C++** là không thể thiếu sót rầu nhé.
    - Một chút tẹo tẹo về **Java** để chơi app Android. (Đọc hiểu củng đơn giản lắm - chỉ easy so với ứng dụng mình làm thôu nhé).
    - Một chút kiến thức về debug, vị trí đặt lệnh kiểm tra giá trị này nọ...

  - **Vài thứ linh tinh:**
    - Đọc hiểu được **HTTP Methods GET vs POST**.
    - Cáu trúc dữ liệu **[JavaScript Object Notation](https://vi.wikipedia.org/wiki/JSON)** (thường được viết tắt là **JSON**).
    - ... đại loại như đam mê kiểu **"Em yêu khoa học:3"**.

## Giới thiệu chút về Wemos D1 mini mà mình sẽ sử dụng nhé!
![esp8266](/img/2020-01-17-smart-clock/wemos-d1-mini-500x500.jpg){: .center-block :}
### Technical specs
----------------------------------------------------------------------------

| Microcontroller | ESP-8266EX |
| --- | --- |
| Operating Voltage | 3.3V |
| Digital I/O Pins | 11 |
| Analog Input Pins | 1(Max input: 3.2V) |
| Clock Speed | 80MHz/160MHz |
| Flash | 4M bytes |
| Length | 34.2mm |
| Width | 25.6mm |
| Weight | 3g |

![pinout_esp8266](/img/2020-01-17-smart-clock/wemosD1Mini.jpg){: .center-block :}
### Pin
----------------------------------------------------

| **Pin** | **Function** | **ESP-8266 Pin** |
| --- | --- | --- |
| TX | TXD | TXD |
| RX | RXD | RXD |
| A0 | Analog input, max 3.3V input | A0 |
| D0 | IO | GPIO16 |
| D1 | IO, SCL | GPIO5 |
| D2 | IO, SDA | GPIO4 |
| D3 | IO, 10k Pull-up | GPIO0 |
| D4 | IO, 10k Pull-up, BUILTIN_LED | GPIO2 |
| D5 | IO, SCK | GPIO14 |
| D6 | IO, MISO | GPIO12 |
| D7 | IO, MOSI | GPIO13 |
| D8 | IO, 10k Pull-down, SS | GPIO15 |
| G | Ground | GND |
| 5V | 5V | - |
| 3V3 | 3.3V | 3.3V |
| RST | Reset | RST |

{: .box-warning}
**Warning:** Tất cả các **pin IO** của bé nó đều sài **3.3v** nha!

## Mục tiêu & tính năng của project này:
  - Một cái **đồng hồ thời gian thực** trang trí phòng ngon lành. Độ chính xác của giờ lấy từ **pool.ntp.org** đem lại độ chính xác tin cậy cho người dùng.
  - Thấy được **nhiệt độ**, **độ ẩm** không khí của địa phương (set mode tới 5 vị trí địa lí muốn lấy dữ liệu thời tiết với độ tin cậy từ **https://openweathermap.org/api**)
  - Với khả năng **kết nối mạng không dây nhanh gọn** được hổ trợ bởi nhà sản xuất ESP32 & ESP8266.
  - Củng có **báo thức** luôn (set báo thức từ phím cứng trên đồng hồ hoặc smartphone luôn).
  - **Cá nhân hóa** được nè (thẩm mĩ tí khúc khắc lazer mica các bạn sẽ có sản phẩm toẹt vời).
  - **Đèn ngủ** cũng được nữa, đêm nó củng sang sáng lắm... **đèn ngủ siêu tiết kiệm điện** á nha.

## Hướng đi & giải pháp nào?
### Thời gian
----------------------------------------------------
Việc đầu tiên, đã là cái đồng hồ thì điều quan trọng là phải **xem được giờ** nè. Xem được giờ mà phải **chính xác** luôn.

----------------------------------------------------
![lcd2004](https://www.makerguides.com/wp-content/uploads/2019/02/I2C-LCD-1024x683.jpg "Màn hình LCD thường dùng trong các dự án IoT nhỏ."){: .center-block :}

Từ đó chúng ta thấy **"xem được giờ"** tức là phải có cái gì đó nhìn trực quan được. Có nhiều sự lựa chọn cho việc đó như **LCD 20x04**, **LCD Graphic**, **LCD Oled**... Và mình chọn **LCD 20x04** vì nó khá dễ sử dụng với bộ thư viện tràn lan trên Github và các diễn đàn IoT.

----------------------------------------------------
![ds1307](/img/2020-01-17-smart-clock/RTC_DS1307_PIN_Diagram.png "Sơ đồ DS1307"){: .center-block :}

Tiếp theo là việc lựa chọn **nguồn cung cấp thời gian**? RTC **DS1307**? Nó thì mình củng đã từng sử dụng qua rồi... Việc cấu hình khá vất vả, phụ thuộc vào viên pin Backup, **độ chính xác không cao** (thạch anh và **vị trí đặt thạch anh** trên mạch như thế nào củng ảnh hưởng đến sai số thời gian - và việc này làm chúng ta **code bù trừ thời gian** thêm phức tạp), vân vân mấy mây...

----------------------------------------------------
<h2 class="text-center"> Đến với 4.0 và pool.ntp.org </h2>

![ntp](https://upload.wikimedia.org/wikipedia/commons/thumb/c/c9/Network_Time_Protocol_servers_and_clients.svg/525px-Network_Time_Protocol_servers_and_clients.svg.png "Mũi tên vàng là kết nối trực tiếp; mũi tên đỏ là kết nối thông qua mạng."){: .center-block :}

Mình đã nhận ra một điều là với thời đại 4.0 như bây giờ cái việc nhà nhà có internet, người người có internet thì tại sao mình sử dụng nó để **lấy giờ giống như các thiết bị di động** nhỉ? Sau khi tìm hiểu trên các diễn đàn IoT trong nước củng như nước ngoài, mình đã thu thập được một vài kiến thức về [cách thức hoạt động](https://vi.wikipedia.org/wiki/NTP "NTP (Network Time Protocol - Giao thức đồng bộ thời gian mạng)") và lấy dữ liệu giờ từ trang **https://www.pool.ntp.org/zone/vn**.

----------------------------------------------------
### MCU - Smartconfig - Kết nối mạng
<h2 class="text-center"> ESP8266 Wemos D1 mini </h2>

Để lấy được giờ từ internet thì **MCU** của chúng ta phải **có khả năng kết nối internet** (hoặc là kết nối không dây hoặc là có dây). Mình sử dụng **ESP8266 Wemos D1 mini** như đã giới thiệu ở trên.
Thứ khiến mình băn khoăn ở đây chính là **vấn đề kết nối mạng** cho em nó. Đối với một số bạn thì dòng code này có vẻ rất quen thuộc:

{% highlight c linenos %}
#include <ESP8266WiFi.h>

const char* ssid = "********";
const char* password = "********";
void setup(void)
{
  Serial.begin(115200);
  Serial.println();

  Serial.printf("Connecting to %s \n", ssid);
  WiFi.begin(ssid, password);
  WiFi.config(staticIP, gateway, subnet);
  while (WiFi.status() != WL_CONNECTED)
  {
    delay(500);
    Serial.print(".");
  }
  Serial.println();
  Serial.print("Connected, IP address: ");
  Serial.println(WiFi.localIP());
}

void loop() {}
{% endhighlight %}

**Nếu sử dụng kiểu này**, sản phẩm của chúng ta khi đóng hộp sẽ **sử dụng cố định một tên SSID & PASS** duy nhất rất **bất tiện trọng quá trình sử dụng** khi chuyển nhà, đổi tên mạng Wifi, vv... Mỗi lần như vậy **chúng ta phải nạp lại code để cập nhật ssid và password mới** cho ESP8266 (hoặc là phải đổi tên của modun Wifi thành ssid và pass như chúng ta đã cấu hình trong code).

Vậy thứ **chúng ta cần** là một cái đồng hồ có **khả năng kết nối wifi và thay đổi wifi**. Giải pháp được mình tìm thấy chính là [**Smartconfig**](https://docs.espressif.com/projects/esp-idf/en/latest/api-reference/network/esp_smartconfig.html).

>**Smartconfig** là một khái niệm được nhắc đến khi khi muốn cấu hình thông tin cho thiết bị WiFi kết nối nhanh chóng đến Internet nhất từ người dùng bằng chính thiết bị (điện thoại) của họ.
  - Dễ dàng cấu hình wifi cho ESP8266 thông qua smartphone.
  - Không cần phải nạp lại code để cấu hình
  - Có thể dùng Smartconfig để cấu hình nhiều thiết bị một lúc 

![smartconfig](/img/2020-01-17-smart-clock/smart-config.gif "Quy trình hoạt động Smartconfig")

### EEPROM - bộ nhớ backup lưu trữ data

Với việc sử dụng **Smartconfig** thì chúng ta cần một** vùng nhớ lưu ssid và pass** phòng khi **reset** đồng hồ hoặc **mất điện** vì lí do nào đó.

{% highlight c linenos %}
#include <ESP8266WiFi.h>
#include <Wire.h>
#include <EEPROM.h>
void setup()
{
	/* Initialize eeprom */
	EEPROM.begin(512);
	Serial.println(" ");
	Serial.println("Lay gio bao thuc:");
	hen_gio = EEPROM.read(index_eeprom_hengio);
	Serial.print("hen_gio: ");
	Serial.println(EEPROM.read(index_eeprom_hengio));
	hen_phut = EEPROM.read(index_eeprom_henphut);
	Serial.print("hen_phut: ");
	Serial.println(EEPROM.read(index_eeprom_henphut));
	value_Location_EEPROM = EEPROM.read(index_eeprom_location_eeprom);
	Serial.print("value_Location_EEPROM: ");
	Serial.println(EEPROM.read(index_eeprom_location_eeprom));
}
...
{% endhighlight %}

>Như các bạn đã thấy trong trích đoạn code trên mình sử dụng EEPROM để lưu một số giá trị cho chức năng **báo thức**, vị trí địa lí, ssid & pass wifi.

# Cơ bản là đã giới thiệu sơ bộ những linh kiện và kiến thức cần thiết sử dụng trong project này rồi. ở Phần 2 mình sẽ đào vào logic code của mình. Hẹn gặp lại ở phần tiếp theo!