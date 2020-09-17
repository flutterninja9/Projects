import csv
import cv2
import numpy as np
import time
import sqlite3

var=sqlite3.connect("Database/attendence.sql")
var.execute("CREATE TABLE IF NOT EXISTS attendence6 (ind int,name text,p text)") #1-PRESENT AND 0 ABSENT
cursor=var.cursor()
date=time.localtime()
faceDetect=cv2.CascadeClassifier('haarcascade_frontalface_default.xml')
cam=cv2.VideoCapture(0)
reco=[]
rec=cv2.face.LBPHFaceRecognizer_create()
rec.read('recognizer/trainingData.yml')
ipd=0
font=cv2.FONT_HERSHEY_SIMPLEX
with open('Database/attendence.csv', 'a+') as csvfile:
            filewriter = csv.writer(csvfile, delimiter=',',quotechar='|', quoting=csv.QUOTE_MINIMAL)
            filewriter.writerow([str(date.tm_mday)+"/"+str(date.tm_mon)+"/"+str(date.tm_year)])
while(True):
    ret,img=cam.read()
    gray=cv2.cvtColor(img,cv2.COLOR_BGR2GRAY)
    faces=faceDetect.detectMultiScale(gray,1.3,5)
    for x,y,w,h in faces:
        cv2.rectangle(img,(x,y),(x+w,y+h),(0,0,255),2)
        ipd,conf=rec.predict(gray[y:y+h,x:x+w])
        if ipd==1:
            ipd="Anirudh"
            var.execute("INSERT INTO attendence6 (ind,name,p) VALUES (1,'Anirudh','Present')")
        elif ipd==2:
            ipd="Rohit"
            var.execute("INSERT INTO attendence6 (ind,name,p) VALUES (2,'Rohit','Present')")
        elif ipd==3:
            ipd="Obama"
            var.execute("INSERT INTO attendence6 (ind,name,p) VALUES (3,'Obama','Present')")
        if ipd==4:
            ipd="Aadarsh"
            var.execute("INSERT INTO attendence6 (ind,name,p) VALUES (4,'Aadarsh','Present')")
        if ipd==5:
            ipd="Shivam"
            var.execute("INSERT INTO attendence6 (ind,name,p) VALUES (5,'Shivam','Present')")
        if ipd==6:
            ipd="VK sIR"
        if ipd==7:
            ipd="AS sIR"      
            var.execute("INSERT INTO attendence6 (ind,name,p) VALUES (7,'AS Sir','Present')")
        if ipd==8:
            ipd="Deepak"      
            var.execute("INSERT INTO attendence6 (ind,name,p) VALUES (7,'Deepak','Present')")
        cv2.putText(img,str(ipd),(x,y+h),font,1,(0,255,0),2,cv2.LINE_AA)
    cv2.imshow("Face",img)
    if cv2.waitKey(1) & 0xFF==ord('q'):
        break
new=cursor.execute("SELECT DISTINCT name FROM attendence6")
for i in new:
    for keys in i:
        new_key=keys
        print(keys)
    with open('Database/attendence.csv', 'a+') as csvfile:
            filewriter = csv.writer(csvfile, delimiter=',',quotechar='|', quoting=csv.QUOTE_MINIMAL)
            filewriter.writerow([keys])
print("Written Successfully!!!")
var.close()        
cam.release()
cv2.destroyAllWindows()
