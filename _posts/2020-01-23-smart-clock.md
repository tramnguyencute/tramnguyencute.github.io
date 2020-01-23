---
layout: post
title: "Smart Clock"
meta-title: "Smart Clock"
subtitle: "...Phần 2: Triển khai code cơ bản"
bigimg:
  - "/img/2020-01-17-smart-clock/anh-bia-baiviet.jpg"
image: /img/2020-01-17-smart-clock/anh-bia-baiviet.jpg
tags: [đồng hồ, smart, watch, clock, alarm, thingspeak, esp8266]
gh-repo: bangnguyendev/SmartClock
gh-badge: [star, watch, fork, follow]
comments: true
---
----------------------------------------------------------------------------
Ở bài viết này, chúng ta sẽ làm việc với code sau khi các bạn đã cài đặt các phần mềm và chuẩn bị những phần cứng ở [**`Phần 1`**](https://bangnguyendev.github.io/2020-01-17-smart-clock/ "Phần 1: Giới thiệu dự án")

Repo các bạn có thể nhấn vào các Button Github ở đầu bài để Clone Repo về máy tính cá nhân. Nếu máy các bạn không hiện ra thì có thể [nhấn ở đây để](https://github.com/bangnguyendev/SmartClock/ "Smart Clock") truy cập Repo.

{: .box-note}
**Khuyên dùng**: Sử dụng `Git` (GitHub Desktop, GitLab), `TortoiseGit` để lưu trữ & Clone Repo về.


### Đảm bảo kết nối wifi dễ dàng cho thiết bị (ở đây là đồng hồ)
Không riêng gì dự án này, ở một số dự án IoT nếu muốn thiết bị của chúng ta linh động hơn trong kết nối Wifi thì giải pháp được đề cập đến là `SmartConfig` (xem lại phần 1 chúng ta đã giới thiệu).
  - Đầu tiên chúng ta cần 1 cái `smartphone` (máy tính bảng gì củng được) để cài ứng dụng `Smartconfig`.
    - `Android`:
    - `IOS`:
    - Cài trước đi nha, hướng dẫn sử dụng sau.
  - Vào code, chúng ta làm theo quy trình sau: 
  ![Lưu Đồ Giải Thuật](/img/2020-01-23-smart-clock/SSID_PASS_EEPROM_Diagram.png)
    - Bước 1. Thiết bị sẽ khởi động.
    - Bước 2. Quá trình đọc ssid và pass wifi sẽ được lấy trong bộ nhớ EEPROM (với Wemos D1 mini mới mua về thì bước đọc bộ nhớ này sẽ cho ra kết quả rỗng - kết quả rỗng thì bước đăng nhập wifi sẽ không được - Wemos D1 mini sẽ vào `bước 4`).
    - Bước 3. Sử dụng ssid và pass vừa đọc ra để kết nối wifi.
    - Bước 4. Nếu trong thời gian quy định mà việc kết nối vẫn không thành công thì sẽ nhảy vào quá trình `Smartconfig`.
    - Bước 5. Timeout Smartconfig chúng ta đặt ra là 100 giây (các bạn muốn bao nhiêu giây thì chỉnh lại, riêng mình thấy 100s là hợp lí sau bao nhiêu lần thử nghiệm).
    - Bước 6. Trong thời gian 100 giây chúng ta mở ứng dụng trên điện thoại, lúc này màn hình giao diện sẽ yêu cầu chúng ta nhập ssid và pass cho Wemos D1 mini lấy data kết nối, nếu kết nối thành công thì ssid và pass sẽ được lưu vào EEPROM.
    - Bước 7. Nếu không thành công sau 100 giây thiết bị sẽ khởi động lại và bắt đầu quy trình đầu tiên.


### 

### 


------------------------------------------------------------

Cơ bản là đã `giới thiệu` sơ bộ những `linh kiện` và `kiến thức` cần thiết sử dụng `trong project` này rồi.

{: .box-note}
**Note:** **`Phần 2`** mình sẽ đào vào `logic code` của mình. Hẹn gặp lại ở phần tiếp theo **`(Feb - 2020)`**!

