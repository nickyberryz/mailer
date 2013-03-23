# encoding: utf-8

class Form < ActiveRecord::Base
 attr_accessible :amount_of_people, :because, :date_to_reserve, :email, :finish_time, :institution, :name, :position, :require_tool, :roomname, :roomtype, :start_time, :subject, :surname, :tel

  validates :position,  :presence => true 
  validates :name,  :presence => true, :length => { :minimum => 3 }
  validates :surname,  :presence => true, :length => { :minimum => 3 }
  validates :institution,  :presence => true
  validates :tel,  :presence => true
  validates :roomtype,  :presence => true
  validates :roomname,  :presence => true
  validates :date_to_reserve,  :presence => true
  validates :start_time,  :presence => true
  validates :finish_time,  :presence => true
  validates :because,  :presence => true
  validates :subject,  :presence => true
  validates :amount_of_people,  :presence => true

  validates :email,  :presence => true

  def self.create_html_temp(data)
    fileHtml = File.new("./public/temp_pdf.html", "w+")
    
    if data.class == Form
      fileHtml.puts '<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="printpdf.css" rel="stylesheet" type="text/css">  
</head>
<body>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

<img alt="logo" src="images/Engtu.jpg">
<br>
<br>
<br>
<br>
<div id="printpdf">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<center><h1>แบบฟอร์มการขอใช้ห้อง คณะวิศวกรรมศาสตร์</h1></center>
<br>
<br>
<br>
<br>
<br>
<br>
<p>สถานะ : '+ data.position+'</p>
<br>
<br>
<br>
<br>
<p>ชื่อจริง : '+data.name+' </p>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<p>นามสกุล : '+data.surname+' </p>
<br>
<br>
<br>
<br>
<p>Email : '+data.email+' </p>
<br>
<br>
<br>
<br>
<p>สังกัด : '+data.institution+' </p>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<br>
<br>
<br>
<br>
<p>เบอร์โทรศัพท์ : '+data.tel+' </p> 
<br>
<br>
<br>
<br>
<br>
<p>มีความประสงค์จะขอใช้ : </p>
<p>'+data.roomtype+'</p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<p>ห้อง ENGR : '+data.roomname+' </p>
<br>
<br>
<br>
<br>
<br>
<p>ในวันที่: '+data.date_to_reserve.to_s+' </p>
<p>เวลา&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:
'+data.start_time+' น.&nbsp;&nbsp;&nbsp;ถึงเวลา : '+data.finish_time+'  น.</p>
<br>
<br>
<br>
<br>
<br>
<p>เพื่อใช้ใน &nbsp;&nbsp;&nbsp;: '+data.because+' </p>
<br>
<br>
<br>
<br>
<br>
<p>วิชา/เรื่อง : '+data.subject+'</p>
<br>
<br>
<br>
<br>
<br>
<p>ผู้เข้าร่วมประชุม/สัมนา/ฟังบรรยาย จำนวน:&nbsp;&nbsp;&nbsp; '+data.amount_of_people.to_s+'  คน</p>
<br>
<br>
<br>
<br>
<p>**********************************************************************************************************************************************************</p>
<br>
<br>
<br>
<br>
<b><p>อุปกรณ์โสตฯ ที่ต้องการ</p></b>
<br>
<br>
<br>
<br>
<p>'+data.require_tool+'</p>

'  
    else
      data.each_with_index do |d,i|
        fileHtml.puts '<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="printpdf.css" rel="stylesheet" type="text/css">  
</head>
<body>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

<img alt="logo" src="images/Engtu.jpg">
<br>
<br>
<br>
<br>
<div id="printpdf">

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<h1>แบบฟอร์มการขอใช้ห้อง คณะวิศวกรรมศาสตร์</h1>
<br>
<br>
<br>
<br>
<br>
<br>
<p>สถานะ : '+ data[i]["position"]+'</p>
<br>
<br>
<br>
<br>
<p>ชื่อจริง : '+data[i]["name"]+' </p>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<p>นามสกุล : '+data[i]["surname"]+' </p>
<br>
<br>
<br>
<br>
<p>Email : '+data[i]["email"]+' </p>
<br>
<br>
<br>
<br>
<p>สังกัด : '+data[i]["institution"]+' </p>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<br>
<br>
<br>
<br>
<p>เบอร์โทรศัพท์ : '+data[i]["tel"]+' </p>
<br>
<br>
<br>
<br>
<br>
<p>มีความประสงค์จะขอใช้ : </p>
<p>'+data[i]["roomtype"]+'</p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<p>ห้อง ENGR : '+data[i]["roomname"]+' </p>
<br>
<br>
<br>
<br>
<br>
<p>ในวันที่: '+data[i]["date_to_reserve"].to_s+' </p>
<p>เวลา&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:
'+data[i]["start_time"]+' น.&nbsp;&nbsp;&nbsp;ถึงเวลา : '+data[i]["finish_time"]+'  น.</p>
<br>
<br>
<br>
<br>
<br>
<p>เพื่อใช้ใน &nbsp;&nbsp;&nbsp;: '+data[i]["because"]+' </p>
<br>
<br>
<br>
<br>
<br>
<p>วิชา/เรื่อง : '+data[i]["subject"]+'</p>
<br>
<br>
<br>
<br>
<br>
<p>ผู้เข้าร่วมประชุม/สัมนา/ฟังบรรยาย จำนวน:&nbsp;&nbsp;&nbsp; '+data[i]["amount_of_people"].to_s+'  คน</p>
<br>
<br>
<br>
<br>
<p>**********************************************************************************************************************************************************</p>
<br>
<br>
<br>
<br>
<b><p>อุปกรณ์โสตฯ ที่ต้องการ</p></b>
<br>
<br>
<br>
<br>
<p>'+data[i]["require_tool"]+'</p>

'  
        fileHtml.puts '<br><br><br><br><br><br><br><br><br><br>'
      end
    end
    fileHtml.puts '</div>
</body>
</html>'

    fileHtml.close()
    return fileHtml
  end
  

  def self.create_email_pdf(form)
    fileHtml = File.new("./public/email_pdf.html", "w+")
    fileHtml.puts '<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="printpdf.css" rel="stylesheet" type="text/css">  
</head>
<body>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;


<div id="printpdf">
<h1 align ="left"> แบบฟอร์มตอบรับการจองห้อง คณะวิศวกรรมศาสตร์ </h1>
<br>
<br>
<br>
<br>
<p>ชื่อผู้ขอใช้ : '+ form.name + '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'+form.surname+' </p>
<br>
<br>
<br>
<br>
<p> ตำแหน่ง : '+form.position+' หน่วยงาน : '+form.institution+' </p>
<br>
<br>
<br>
<br>
<p> ประเภทห้องที่ขอใช้ : '+form.roomtype+'  ชื่อห้องที่ขอใช้ : '+form.roomname+'    </p> 
<br>
<br>
<br>
<br>
<p> วันที่ขอใช้ '+form.date_to_reserve.to_s+' เวลา '+form.start_time+' ถึง '+form.finish_time+' </p>
<br>
<br>
<br>
<br>
<p align="center" > ลงชื่อ : ................................ </p>
<br>
<br>
<h6 align= "center"> วันที่ : ................................</h6>
<br>
<br>
<br>
<h6 align = "center"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;( เจ้าหน้าที่หน่วยโสต ) </h6>
<br>
<br>
<br>
<h6 align = "left"> หมายเหตุ ( &nbsp;&nbsp;)แม่บ้าน ( &nbsp;&nbsp;)รปภ . การเปิด-ปิด และดูแลความเรียบร้อย </h6>


</div>
</body>
</html>'
    fileHtml.close();
    kit = PDFKit.new(File.new('./public/email_pdf.html'))
      PDFKit.configure do |config|
        config.default_options = {
          :encoding=>"UTF-8",
          :page_size=>"A4",
          :print_media_type => true
       }
      end
      kit.to_file("./public/emailpdf.pdf")
      File.delete('./public/email_pdf.html')
    return './public/emailpdf.pdf'
  end
end
