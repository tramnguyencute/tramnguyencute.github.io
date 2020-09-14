---
layout: post
title: "Bash Script"
meta-title: "Bash Script cơ bản"
subtitle: "...Phần 1: Lịch sử hình thành"
bigimg:
  - "/img/2020-09-09-bash-script/anh-bia.png"
image: /img/2020-09-09-bash-script/anh-bia.png
tags: [bash, script, unix]
# gh-repo: bangnguyendev/SmartClock
# gh-badge: [star, watch, fork, follow]
comments: true
---
----------------------------------------------------------------------------
**`Bash`** là một **Unix shell** và ngôn ngữ dòng lệnh được viết bởi Brian Fox cho Dự án GNU như là một `phần mềm` thay thế `miễn phí cho Bourne shell`. Được phát hành lần đầu tiên vào năm 1989, nó đã được phân phối rộng rãi như là login shell mặc định cho hầu hết các bản phân phối Linux và macOS. Một phiên bản cũng có sẵn cho Windows 10. Nó cũng là user shell mặc định trong Solaris 11.

`Bash là một bộ xử lý dòng lệnh thường chạy trong cửa sổ văn bản nơi người dùng gõ các lệnh thực thi. Bash cũng có thể đọc và thực thi các lệnh từ một file, được gọi là shell script.` Giống như tất cả Unix shell, nó hỗ trợ tên file toàn cục (khớp ký tự đại diện), <kbd>piping</kbd>, <kbd>here documents</kbd>, <kbd>command substitution</kbd>, biến, và cấu trúc điều khiển để kiểm tra điều kiện và vòng lặp. `Các từ khóa, cú pháp và các tính năng cơ bản khác của ngôn ngữ đều được sao chép từ sh.` Các tính năng khác, ví dụ, lịch sử, được sao chép từ csh và ksh. Bash là một shell tương thích POSIX, nhưng có một số phần mở rộng.

Tên của BASH shell là viết tắt của **B**ourne-**a**gain **sh**ell, một cách chơi chữ với tên của Bourne shell.

![industrial4.0](/img/2020-09-09-bash-script/shellshock-bug.jpg "shellshock-bug"){: .center-block :}
Một lỗ hổng bảo mật trong Bash có từ phiên bản 1.03 (tháng 8/1989), được đặt tên là Shellshock, được phát hiện vào đầu tháng 9 năm 2014 và nhanh chóng dẫn đến một loạt các cuộc tấn công trên Internet. Các bản vá để sửa lỗi đã được cung cấp ngay sau khi lỗi được tìm thấy.

Vào tháng 6 năm 2019, Apple đã thông báo rằng macOS Catalina (10.15) sẽ sử dụng Zsh làm shell mặc định, thay thế Bash.

`Brian Fox bắt đầu lập trình Bash ngày 10/1/1988 sau khi Richard Stallman trở nên không hài lòng với sự thiếu tiến bộ của nhà phát triển trước đó.` Stallman và Free Software Foundation (FSF) xem một shell miễn phí có thể chạy các shell script hiện có nên mang tính chiến lược đối với một hệ thống hoàn toàn tự do được xây dựng từ mã BSD và GNU, đây là một trong số ít các dự án mà họ tự tài trợ, với Fox đảm nhận công việc của một nhân viên của FSF. `Fox phát hành bản beta của Bash, phiên bản.99 ngày 8/6/1989 và vẫn là người duy trì chính cho đến khoảng giữa năm 1992 and mid-1994, khi ông ấy bị sa thải khỏi FSF và trách nhiệm của ông đã được chuyển sang một người đóng góp sớm khác, Chet Ramey.`

Từ đó, `Bash trở thành shell phổ biến nhất trong cộng đồng Linux`, trở thành shell tương tác mặc định trên các bản phân phối khác nhau của hệ đièu hành này (mặc dù Almquist shell có thể là scripting shell mặc định) và trên macOS của Apple. `Bash cũng được port đến Microsoft Windows được phân phối cùng Cygwin và MinGW, tới DOS bởi dự án DJGPP, đến Novell NetWare và tới Android thông qua các ứng dụng mô phỏng thiết bị đầu cuối khác nhau.`


Tháng 9/2014, Stéphane Chazelas, một chuyên gia về Unix/Linux, phát hiện một lỗi bảo mật trong chương trình. Lỗi này, lần đầu tiên được tiết lộ vào ngày 24 tháng 9, được đặt tên là Shellshock và gán các số CVE-2014-6271, CVE-2014-6277 và CVE-2014-7169. Lỗi này được coi là nghiêm trọng, vì các tập lệnh CGI sử dụng Bash có thể dễ bị tấn công, cho phép thực thi mã tùy ý. Lỗi này có liên quan đến cách Bash định nghĩa hàm cho các lớp con thông qua các biến môi trường.

*Refer to:*

*https://vi.wikipedia.org/wiki/Bash*
