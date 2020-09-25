---
layout: post
title: "Bash Script: Zip multiple folders"
meta-title: "Using Bash Shell for Windows"
subtitle: "...Phần 2: Tạo script auto zip nhiều folder"
bigimg:
  - "/img/2020-09-09-bash-script/anh-bia.png"
image: /img/2020-09-09-bash-script/anh-bia.png
tags: [bash, script, unix, maxdepth, mindepth, Zip multiple folders]
# gh-repo: bangnguyendev/SmartClock
# gh-badge: [star, watch, fork, follow]
comments: true
---
Câu lệnh `find` trong Linux được dùng để tìm kiếm tập tin và thư mục dựa trên các điều kiện đầu vào khác nhau. Tương tự như câu lệnh ls thì câu lệnh `find` cũng là một trong những câu lệnh được sử dụng phổ biến trên Linux.

{% highlight bash linenos %}
$ find [-H] [-L] [-P] [-D debugopts] [-Olevel] [path...] [expression]
{% endhighlight %}

Trong đó:

-   Tuỳ chọn `-P` (là tuỳ chọn mặc định): không tìm kiếm các tập tin hay thư mục lối tắt liên kết tới tập tin hay thư mục khác (hay còn gọi là symbolic link).
-   Tuỳ chọn `-L` (là tuỳ chọn mặc định): tìm kiếm tất cả các tập tin hay thư mục bao gồm các lối tắt liên kết tới tập tin hay thư mục khác.
-   Tuỳ chọn `-H`: không tìm kiếm các tập tin hay thư mục lối tắt liên kết tới tập tin hay thư mục khác trừ khi xử lý đối số truyền vào câu lệnh.
-   Tuỳ chọn `-D` (Debug Options): quy định các tuỳ chọn giúp gỡ rối.
-   Tuỳ chọn `-O` (level): sử dụng khi muốn tối ưu tốc độ của câu lệnh.

Ở bài viết này, lệnh `find` dùng để tìm kiếm các file có định dạng **UT_001, UT_678, UT_XXX,** ... sau khi tìm xong thì đưa output vào file list_folder. Dùng kết hợp `for do done` & `7z` để nén các thư mục đó lại.

{: .box-note}
**Lưu ý**: Hệ điều hành (mình chạy Win 10) của các bạn cần phải có 7z. <br>
    [Link tải 7z, và nhớ chọn phiên bản phù hợp.](https://www.7-zip.org/download.html)<br>
    `7z` và `zip` đều sử dụng được, nhưng đối với các thư mục bên trong có chứa các tệp tin `name file` thuộc dạng `long path` thì `zip` sẽ không nén được.

<div class="post-img-post">
    <img src="/img/2020-09-09-bash-script-2/tao_file_UT.png">
</div>

**Source code:**
{% highlight bash linenos %}
#!/bin/bash -x
find -maxdepth 1 -mindepth 1 -type d -name "UT_[0-9][0-9][0-9]*"  > list_folder

for file in `cat list_folder`
do
	echo -e "\e[30;48;5;82m $file \e[0m"

	7z a $file.zip $file

done 

rm -rf list_folder
read -n 1 -r -s -p $'Press enter to exit...\n'
{% endhighlight %}

Tạo file `auto_zip.sh` với nội dung code như trên rồi chạy bash:
<div class="post-img-post">
    <img src="/img/2020-09-09-bash-script-2/file_7z_bash.png">
</div>

Kết quả sau khi chạy script chỉ nén những file cần thiết, những file khác như *ABC_XXX* sẽ không ảnh hưởng tới. 
<div class="post-img-post">
    <img src="/img/2020-09-09-bash-script-2/output_7z.png">
</div>


Link tải [**`Git BASH.`**](https://git-scm.com/)

<svg viewBox="0 0 900 200">

  <!-- Symbol -->
  <symbol id="s-text">
    <text text-anchor="middle"
          x="50%" y="50%" dy=".35em">
      Hi, I'm Bang
    </text>
  </symbol>  

  <!-- Duplicate symbols -->
  <use xlink:href="#s-text" class="text"
      ></use>
  <use xlink:href="#s-text" class="text"
      ></use>
  <use xlink:href="#s-text" class="text"
      ></use>
  <use xlink:href="#s-text" class="text"
      ></use>
  <use xlink:href="#s-text" class="text"
      ></use>
</svg>


