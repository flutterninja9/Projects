                                                -:FACE-ATTENDENCE SYSTEM:CLI-VERSION:-
                                                      //DOCUMENTATION//

[+]Setting Up The Environment:-
The Main Librariey used in this program is OpenCv and The language is python.
So first up, for using the program you will have to set up the environment so that the program can easily run...

[+]Things Needed:-
1.Python 3 or Python 2 Interpreter As per your choice because we have options for the language.
2.Opencv library installed installed in there fllowed with numpy(coz. used as sub-library).
   ->INSTALLATIONOF PYTHON:-
     Google it as per the version you want and for Debian based OS it comes Pre-Installed



   ->INSTALLATION OF OPENCV:-
     1.Debian Based OS:-
         Use The PiP Command:-
            pip install python3-opencv numpy          
     2.Windows:-
         Just Download The (.whl) file and easily install by pip for windows.
3.A WebCam(Ovious).
4.And you are ready to go!!! 


[+]Modules Used:-
1.faceApp.py:-It will capture a certain area(i.e:where it will find thge face of the user) and change it to Grayscale and store for furthur use.
              Our Focus should be that how much datasets (images) we want to enter here because after this module we would be training our program according to the datasets.
              So we can simply say that here The datasets(images) per user would be directly proportional to the accuracy of the program.

2.trainer.py:-Its Work is to simply generate a training data file based on the given images so that by the use of that program we can
              Ideentify faces.

3.detector.py:-It is the root program which which detect the faces of the persons based on the training_data file and put their names
               in the attendence.csv file and also for security reasons we will have backup of that data inside a sql file also.


[+]Most Optimized Way Of Taking Datasets:-
   *Take 100 images in Daylight(bright).
   *Take 100 images in A Bit Dim Light.
   *Try That User Gives All of its face poses.
   *Make use of proper angles.

[+]Structure Of Program:-

    ->Database
      ->attendence.csv
      ->attendence.sqlite
    ->dataSet
      ->(containes captured images)
    ->recognizer
      ->trainingData.yml
    ->faceApp.py
    ->detector.py
    ->trainer.py

[NOTE]:-All Of The Above Mentioned Files/Folders Must Be Present For The Proper Working Of The Program.

[+]USAGE:-
    1.Set Up The Working Directory with all of the above mentioned folders and files.
    2.Open faceApp.py and enter user id whose faceData you want to capture.
    3.Open trainer.py and it will automatically do the work needed.
    4.Open faceApp.py and see it working!!!
    5.When Done!!! just press "q" on any where in the main window to send the names into attedence.csv and attemdence.sqlite.
 

[+]FEATURES THAT MIGHT COME IN FUTURE:-
    1.Enabled to enter userid alongwith other details too....
    2.Whole software in GUI Version.
    3.Realtime sharing of csv files on the server.

[+]ABOUT:-
    
    Done In Favour of the teachers and students!!!

   
  