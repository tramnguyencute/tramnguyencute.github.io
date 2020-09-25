---
layout: post
title: "Bash Script: Copy multiple files"
meta-title: "Using Bash Shell for Windows"
subtitle: "...Phần 3: Copy file chung teamplate"
bigimg:
  - "/img/2020-09-09-bash-script/anh-bia.png"
image: /img/2020-09-09-bash-script/anh-bia.png
tags: [bash, script, unix, maxdepth, mindepth, copy multiple files]
# gh-repo: bangnguyendev/SmartClock
# gh-badge: [star, watch, fork, follow]
comments: true
---
**Ở bài viết này**, chúng ta sẽ tham khảo đoạn script ngắn giúp cho việc **lọc file cần check** từ cấu trúc thư mục lớn.
Ta sẽ có hàng loạt thư mục, chúng đều chứa **file excel** với format name `TD_XXXXXX.xlsm` (line #26), việc **nhảy ra nhảy vào** để check file đó rất mất thời gian.
<div class="post-img-post">
    <img src="/img/2020-09-25-bash-script-copy-file/hinh_dong_chay_thu_muc.gif">
</div>

**Cấu trúc thư mục:**

{% highlight bash linenos %}
\---MT_070_Psa_MTC_Info
    +---Delivery
    |   +---TestEnvironment
    |   |   \---Psa_MTC_Info
    |   |       |   Project_Psa_MTC_Info_Save.xml
    |   |       |   PSLBuildInfo.xml
    |   |       |
    |   |       +---AscetPrj
    |   |       |       Psa_MTC_Info.exp
    |   |       |
    |   |       +---AscetPrjAxl
    |   |       |       AscetPrjAxl.axl
    |   |       |
    |   |       +---AscetPrjExp
    |   |       |       Psa_MTC_Info.exp
    |   |       |       TCS_CM_Sometimes.exp
    |   |       |       TM_Psa_MTC_Info_Calc.exp
    |   |       |
    |   |       +---Documents
    |   |       |       CustomerLibrary.htm
    |   |       |       Old_Project_Psa_MTC_Info_Save.xml
    |   |       |       Psa_MTC_Info_1.gif
    |   |       |       'TD_Psa_MTC_Info_MT_070.xlsm'
    |   |       |       TM_Psa_MTC_Info_Calc.plt
.... 
{% endhighlight %}

**Source code:**
{% highlight bash linenos %}
#!/bin/bash -x
find . -type f -name 'TD_*.xlsm' > list
cat list
mkdir -p OUTPUT_EXCEL
echo Tao thu muc OUTPUT_EXCEL
for i in `cat list`
do 
	cp $i ./OUTPUT_EXCEL
	echo Copy $i
done
rm -rf list
{% endhighlight %}

Tạo file `copy_excel_TD.sh` với nội dung code như trên rồi chạy bash:
<div class="post-img-post">
    <img src="/img/2020-09-25-bash-script-copy-file/ls_folder.png">
</div>

Kết quả là chúng ta sẽ có thư mục OUTPUT_EXCEL chứa hết những file excel cần check.
<div class="post-img-post">
    <img src="/img/2020-09-25-bash-script-copy-file/output_excel.png">
</div>

{: .box-note}
Chúng ta có thể thay đổi cú pháp tìm kiếm file `find . -type f -name 'TD_*.xlsm'` bằng một bộ lọc khác phù hợp với cái cần tìm.


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


