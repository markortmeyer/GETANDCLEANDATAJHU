# **CodeBook.md**
\



The [tidy data set](https://github.com/markortmeyer/GETANDCLEANDATAJHU/tidy_data.txt) for this analysis, contains a set of summary values used to describe how human motion can be captured using the accelerometer and gyroscope present in a Samsung Galaxy S smartphone.

Produced by [run_analysis.R]((https://github.com/markortmeyer/GETANDCLEANDATAJHU/run_analysis.R), the tidy dataset consists of a matrix of values 180 rows x 81 columns.  Rows represent single participants performing single activities, providing 79 unique data parameters chosen to characterize motion.

* Column 1:  "Participant_ID", numeric type integer , range 1-30
* Column 2:  "Particiant_Activity", character type, "Walking", "WalkingUpStairs", "WalkingDownStairs", "Sitting", "Standing", "Lying"
* Column 3-80:  measured parameter values, numeric type double

### **Parameter Name Key**

The first parameter value in column 3, "BodyAccelerationmeanXAxis", can be deciphered as a sum of parts:

* "Body" refers to a value relative to the state of the paticipant's body
* "Acceleration" refers to the rate of change in velocity
* "mean" refers to an average value
* "XAxis" refers to one of the three principle spatial axes, X, Y, Z

Taken as a whole, "BodyAccelerationmeanXAxis" is understood to be the "mean acceleration of the participant's body, along the X axis of spatial dimension.

Meaning for all compound parameter names may be translated from the following dictionary:

* **mean** refers to arithmetic mean
* **std** refers to standard deviation
* **FFT** refers to Fast Fourier Transform 
* **Body** refers to participant's body
* **Gravity** refers to "due to gravitational force"
* **Acceleration** refers to the rate of change in velocity 
* **AngularVelocity** refers to speed through an arc of motion
* **Magnitude** refers to scalar quantity without direction
* **Jerk** is derived from a combination of linear and angular motion
* **XAxis, YAxis, ZAxis** refers to the linear dimension of consideration

