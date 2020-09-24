---
layout: post
title: "Bash Script"
meta-title: "Using Bash Shell for Windows"
subtitle: "...Phần 2: Using Bash Shell for Windows"
bigimg:
  - "/img/2020-09-09-bash-script/anh-bia.png"
image: /img/2020-09-09-bash-script/anh-bia.png
tags: [bash, script, unix]
# gh-repo: bangnguyendev/SmartClock
# gh-badge: [star, watch, fork, follow]
comments: true
---
----------------------------------------------------------------------------
Command ls được dùng để xem nội dung thư mục. Mặc định là command này sẽ hiển thị danh sách file trong thư mục hiện tại.
Có nhiều phiên bản để dùng với lệnh **ls **như sau:
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

Link tải [**`Git BASH.`**](https://git-scm.com/)
