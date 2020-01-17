---
layout: post
title: Smart Clock
meta-title: "Smart Clock"
subtitle: ...và hướng dẫn chi tiết
bigimg:
  - "/img/2020-01-17-smart-clock/anh-bia-baiviet.jpg" : "Đồng hồ"
image: /img/2020-01-17-smart-clock/anh-bia-baiviet.jpg
tags: [đồng hồ, smart, watch, clock, alarm, thingspeak, esp8266]
comments: true
---
<!-- Font chữ bự chà bá -->
<h1 class="text-center">Tản mạn dạo đầu tí nha!</h1>
<div class="spacer"></div>

Hưm... Xin chào mọi người. Có lẽ đây là bài viết đầu tiên mình viết về việc chia sẽ làm một cái gì đó...hoặc có thể coi là bài blog đầu tiên :3

Ở bài viết này mình sẽ hướng dẫn chi tiết và lí giải tuần tự mọi thứ kể từ khi mình bắt đầu làm nó. Ở thời buổi 4.0 như bây giờ việc mua 1 cái đồng hồ có tính năng tương tự hoặc hay ho hơn thé chỉ với giá thành không hề cao là đã sở hữu nó rồi. Thế nên bài viết này chi mang tính chất trao đổi kiến thức, kinh nghiệm khi đam mê làm đồ chơi handmade thôu nhé!

<!-- Font chữ bự chà bá -->
<h1 class="text-center">Vào công việc nào...!</h1>
<div class="spacer"></div>

### **Việc đầu tiên các bạn cần chuẩn bị:**
  - **Phần cứng:**
    - Board ESP266 **Wesmod D1 mini** (Sơ đồ nguyên lí đây [nhấn vô đây cơ](img\2020-01-17-smart-clock\sch_d1_mini_v3.0.0.pdf)).
    - Một cộng cáp **Micro USB connection** để nạp code nha! Mình lấy cáp sạc điện thoại Samsung nạp luôn, nhưng nhớ là chuẩn micro nha... ~~Type-C~~ là ngéo luôn á :3
    - **Lcd 20x04**.
    - Mạch chuyển đổi **I2c** cho màn hình LCD2004.
    - Mica dày 3mm (có hay không củng không quan trọng, các bạn cứ chạy ra tiệm nào nhận cắt mica rồi đưa bản vẽ ra, họ cân tất cả. Có một số cửa hàng cắt mica khá ngon mình sẽ đính kèm địa chỉ cuối bài viết hoặc tìm gg "Mica Sinh Viên" - nếu bạn ở tpHCM nhé).
    - **Buzzer** 5-12v (hoặc loa liếc gì đấy tùy vào kỹ năng chơi điện của các bạn.).
    - Một vài cộng dây đực cái, cái đực, vv. (nối để test mạch hoạt động).
    - Nguồn cung cấp cho ESP266 Wemod D1 (5v-2A, dư dòng tí mình sử dụng trong các mục đích khác).
  - **Phần mềm:**
    - **VS code** (khuyên dùng vì tiện nhiều thứ hơn IDE Arduino không hổ trợ).
    - IDE Arduino.
    - Driver giao tiếp giả lập port **CH340**.
    - Android Studio.

  - **Ngôn ngữ lập trình:**
    - Chắc chắc là **C/C++** là không thể thiếu sót rầu nhé.
    - Một chút tẹo tẹo về **Java** để chơi app Android. (Đọc hiểu củng đơn giản lắm - chỉ easy so với ứng dụng mình làm thôu nhé).
    - Một chút kiến thức về debug, vị trí đặt lệnh kiểm tra giá trị này nọ...

  - 

## Giới thiệu chút về Wemos D1 mini mà mình sẽ sử dụng nhé!
![esp8266](img\2020-01-17-smart-clock\wemos-d1-mini-500x500.jpg){: .center-block :}
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

### Pin
![pinout_esp8266](img\2020-01-17-smart-clock\wemosD1Mini.jpg){: .center-block :}
----------------------------------------------------

| Pin | Function | ESP-8266 Pin |
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

{% highlight c linenos %}
#include <stdio.h>
int main() {
   // printf() displays the string inside quotation
   printf("Hello, World!");
   return 0;
}
{% endhighlight %}

## Boxes
You can add notification, warning and error boxes like this:

### Notification

{: .box-note}
**Note:** This is a notification box.

### Warning

{: .box-warning}
**Warning:** This is a warning box.

### Error

{: .box-error}
**Error:** This is an error box.
