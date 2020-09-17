import tkinter as tk
import os
import time

def capture():
    os.system("python3 faceApp.py")
def train():
    os.system("python3 trainer.py")
def detect():
    os.system("python3 detector.py")

print("Welcome To Program!!!")
main2=tk.Tk()
main2.title("NOTICE!!!")
label=tk.Label(main2,text="NOTICE:In Detect Menu,Press q when Finished to save names...\nClose This Window To Proceed!!!")
label.pack()
main=tk.Tk()
main.title("Facial Attendence System:GUI-Version")
btn1=tk.Button(main,text="Capture Faces",bg="green",activebackground="blue",bd=5,fg="white",activeforeground="white",height="3",width="25",font=("aerial",12),command=capture)
btn1.pack()
btn2=tk.Button(main,text="Train The Program",bg="orange",activebackground="blue",bd=5,fg="white",activeforeground="white",height="3",width="25",font=("aerial",12),command=train)
btn2.pack()
btn3=tk.Button(main,text="Detect Faces",bg="gray",activebackground="blue",bd=5,fg="white",activeforeground="white",height="3",width="25",font=("aerial",12),command=detect)
btn3.pack()
main.mainloop()
