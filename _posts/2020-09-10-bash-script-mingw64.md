---
layout: post
title: "Bash Script"
meta-title: "Using Bash Shell for Windows"
subtitle: "...Phần 2: Using Bash Shell for Windows"
bigimg:
  - "/img/2020-09-09-bash-script/anh-bia.png"
image: /img/2020-09-09-bash-script/anh-bia.png
tags: [bash, script, unix, maxdepth, mindepth]
# gh-repo: bangnguyendev/SmartClock
# gh-badge: [star, watch, fork, follow]
comments: true
---
Command `ls` được dùng để xem nội dung thư mục. Mặc định là command này sẽ hiển thị danh sách file trong thư mục hiện tại.

Có nhiều phiên bản để dùng với lệnh **`ls`** như sau:
-   **ls -R** liệt kê các file bao gồm cả các thư mục phụ bên trong
-   **ls -a** liệt kê những file ẩn
-   **ls -al** liệt kê tất cả file và thư mục với thông tin chi tiết như phân quyền, kích thước, chủ sở hữu, vân vân.

Sắp xếp file theo thời gian:

{% highlight bash linenos %}
ls -lt
{% endhighlight %}

<div class="post-img-post">
    <img src="/img/2020-09-09-bash-script-2/lenh_ls_lt.png">
</div>

Câu lệnh `find` trong Linux được dùng để tìm kiếm tập tin và thư mục dựa trên các điều kiện đầu vào khác nhau. Tương tự như câu lệnh ls thì câu lệnh find cũng là một trong những câu lệnh được sử dụng phổ biến trên Linux.

Ở ví dụ này, lệnh `find` dùng để tìm kiếm các file có định dạng **UT_001, UT_678, UT_XXX,** ... sau khi tìm xong thì đưa output vào file list_folder. Dùng kết hợp `for do done` & `7z` để nén các thư mục đó lại.

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


