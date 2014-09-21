# CODEBOOK FOR INTERPRETATION OF DATA FROM THE *RUN_ANALYSIS* SCRIPT

## SELECTION OF DATA PARAMETERS

The first column of data output from the *run_analysis* script represents the combined data in the "y-test.txt" and "y-train.txt" files.  The second column of data represents the combined data in the "subject_test.txt" and the "subject_train.txt" files.

The remaining columns of data are numerical data drawn from the "x-test.txt" and "x-train.txt" files.  The specific columns selected are those whose names, as listed in the "features.txt" file, contained *mean* or *std* in their names, thereby indicating that they are means or standard deviations of the numerical data collected.

## RENAMING OF DATA PARAMETERS

As noted above, the numerical data parameters (columns no. 3 and beyond) were assigned names in the "features.txt" files.  These names were lengthy and, as a result, were often truncated and therefore difficult to read in the output from the *run_analysis* script.  Therefore, I adopted a new naming convention that is concise and consistent.  This naming convention combines 6 elements, separated from each other by underscores.

The six elements are as follows:

Element No. 1: General type of data, defined as one of the following:
  * t = time-domain data
  * f = frequency-domain data
  * a = angular data
Element No. 2: Object of the forces measured, defined as one of the following:
  * B = body
  * G = gravity
  * BB = body body (I confess to being unsure of what this actually means, but it is in the data)
  * U = undefined
Element No. 3: Directional motion measured, defined as one of the following:
  * L = linear motion
  * A = angular (gyroscopic) motion
  * U = undefined
Element No. 4: Type of force/motion derivative, defined as one of the following:
  * A = acceleration
  * J = jerk
  * U = undefined
Element No. 5: Axial motion, defined as one of the following:
  * X = along the X-axis (linear motion) or about the X-axis (angular motion)
  * Y = along the Y-axis (linear motion) or about the Y-axis (angular motion)
  * Z = along the Z-axis (linear motion) or about the Z-axis (angular motion)
  * M = magnitude (i.e. overall motion not broken down by axial components)
Element No. 6:  Statistical measure, defined as one of the following:
  * mean = mean
  * stdev = standard deviation
  * mean_freq = mean frequency

## NAMES OF OUTPUT COLUMNS FROM *RUN_ANALYSIS* SCRIPT

Column | Classification | Name                 | Definition
  01   |   character    | activity             | Type of activity (e.g. laying, walking, standing, etc.)
  02   |    integer     | participant          | Number assigned to participant in study (ranges from 1 to 30)
  03   |    number      | t_B_L_A_X_mean       | Mean linear body acceleration along the x-axis based on time-domain data
  04   |    number      | t_B_L_A_Y_mean       | Mean linear body acceleration along the y-axis based on time-domain data
  05   |    number      | t_B_L_A_Z_mean       | Mean linear body acceleration along the z-axis based on time-domain data
  06   |    number      | t_B_L_A_X_stdev      | Standard deviation of linear body acceleration along the x-axis based on time-domain data
  07   |    number      | t_B_L_A_Y_stdev      | Standard deviation of linear body acceleration along the y-axis based on time-domain data
  08   |    number      | t_B_L_A_Z_stdev      | Standard deviation of linear body acceleration along the z-axis based on time-domain data
  09   |    number      | t_G_L_A_X_mean       | Mean linear gravity acceleration along the x-axis based on time-domain data
  10   |    number      | t_G_L_A_Y_mean       | Mean linear gravity acceleration along the y-axis based on time-domain data
  11   |    number      | t_G_L_A_Z_mean       | Mean linear gravity acceleration along the z-axis based on time-domain data
  12   |    number      | t_G_L_A_X_stdev      | Standard deviation of linear gravity acceleration along the x-axis based on time-domain data
  13   |    number      | t_G_L_A_Y_stdev      | Standard deviation of linear gravity acceleration along the y-axis based on time-domain data
  14   |    number      | t_G_L_A_Z_stdev      | Standard deviation of linear gravity acceleration along the z-axis based on time-domain data
  15   |    number      | t_B_L_J_X_mean       | Mean linear body jerk along the x-axis based on time-domain data
  16   |    number      | t_B_L_J_Y_mean       | Mean linear body jerk along the y-axis based on time-domain data
  17   |    number      | t_B_L_J_Z_mean       | Mean linear body jerk along the z-axis based on time-domain data
  18   |    number      | t_B_L_J_X_stdev      | Standard deviation of linear body jerk along the x=axis based on time-domain data
  19   |    number      | t_B_L_J_Y_stdev      | Standard deviation of linear body jerk along the y=axis based on time-domain data
  20   |    number      | t_B_L_J_Z_stdev      | Standard deviation of linear body jerk along the z=axis based on time-domain data
  21   |    number      | t_B_A_A_X_mean       | Mean of angular body acceleration about the x-axis based on time-domain data
  22   |    number      | t_B_A_A_Y_mean       | Mean of angular body acceleration about the y-axis based on time-domain data
  23   |    number      | t_B_A_A_Z_mean       | Mean of angular body acceleration about the z-axis based on time-domain data
  24   |    number      | t_B_A_A_X_stdev      | Standard deviation of angular body acceleration about the x-axis based on time-domain data
  25   |    number      | t_B_A_A_Y_stdev      | Standard deviation of angular body acceleration about the y-axis based on time-domain data
  26   |    number      | t_B_A_A_Z_stdev      | Standard deviation of angular body acceleration about the z-axis based on time-domain data
  27   |    number      | t_B_A_J_X_mean       | Mean angular body jerk about the x-axis based on time-domain data
  28   |    number      | t_B_A_J_Y_mean       | Mean angular body jerk about the y-axis based on time-domain data
  29   |    number      | t_B_A_J_Z_mean       | Mean angular body jerk about the z-axis based on time-domain data
  30   |    number      | t_B_A_J_X_stdev      | Standard deviation of angular body jerk about the x-axis based on time-domain data
  31   |    number      | t_B_A_J_Y_stdev      | Standard deviation of angular body jerk about the y-axis based on time-domain data
  32   |    number      | t_B_A_J_Z_stdev      | Standard deviation of angular body jerk about the z-axis based on time-domain data
  33   |    number      | t_B_L_A_M_mean       | Magnitude of mean linear body acceleration based on time-domain data
  34   |    number      | t_B_L_A_M_stdev      | Magnitude of standard deviation of mean linear body acceleration based on time-domain data
  35   |    number      | t_G_L_A_M_mean       | Magnitude of mean linear gravity acceleration based on time-domain data
  36   |    number      | t_G_L_A_M_stdev      | Magnitude of standard deviation of linear gravity acceleration based on time-domain data
  37   |    number      | t_B_L_J_M_mean       | Magnitude of mean linear body jerk based on time-domain data
  38   |    number      | t_B_L_J_M_stdev      | Magnitude of standard deviation of linear body jerk based on time-domain data
  39   |    number      | t_B_A_A_M_mean       | Magnitude of mean angular body acceleration based on time-domain data
  40   |    number      | t_B_A_A_M_stdev      | Magnitude of standard deviation of angular body acceleration based on time-domain data
  41   |    number      | t_B_A_J_M_mean       | Magnitude of mean angular body jerk based on time-domain data
  42   |    number      | t_B_A_J_M_stdev      | Magnitude of standard deviation of angular body jerk based on time-domain data
  43   |    number      | f_B_L_A_X_mean       | Mean linear body acceleration along the x-axis based on frequency-domain data
  44   |    number      | f_B_L_A_Y_mean       | Mean linear body acceleration along the y-axis based on frequency-domain data
  45   |    number      | f_B_L_A_Z_mean       | Mean linear body acceleration along the z-axis based on frequency-domain data
  46   |    number      | f_B_L_A_X_stdev      | Standard deviation of linear body acceleration along the x-axis based on frequency-domain data
  47   |    number      | f_B_L_A_Y_stdev      | Standard deviation of linear body acceleration along the y-axis based on frequency-domain data
  48   |    number      | f_B_L_A_Z_stdev      | Standard deviation of linear body acceleration along the z-axis based on frequency-domain data
  49   |    number      | f_B_L_A_X_mean_freq  | Mean frequency of linear body acceleration along the x-axis based on frequency-domain data
  50   |    number      | f_B_L_A_Y_mean_freq  | Mean frequency of linear body acceleration along the y-axis based on frequency-domain data
  51   |    number      | f_B_L_A_Z_mean_freq  | Mean frequency of linear body acceleration along the z-axis based on frequency-domain data
  52   |    number      | f_B_L_J_X_mean       | Mean linear body jerk along the x-axis based on frequency-domain data
  53   |    number      | f_B_L_J_Y_mean       | Mean linear body jerk along the y-axis based on frequency-domain data
  54   |    number      | f_B_L_J_Z_mean       | Mean linear body jerk along the z-axis based on frequency-domain data
  55   |    number      | f_B_L_J_X_stdev      | Standard deviation of linear body jerk along the x-axis based on frequency-domain data
  56   |    number      | f_B_L_J_Y_stdev      | Standard deviation of linear body jerk along the y-axis based on frequency-domain data
  57   |    number      | f_B_L_J_Z_stdev      | Standard deviation of linear body jerk along the z-axis based on frequency-domain data
  58   |    number      | f_B_L_J_X_mean_freq  | Mean frequency of linear body jerk along the x-axis based on frequency-domain data
  59   |    number      | f_B_L_J_Y_mean_freq  | Mean frequency of linear body jerk along the y-axis based on frequency-domain data
  60   |    number      | f_B_L_J_Z_mean_freq  | Mean frequency of linear body jerk along the z-axis based on frequency-domain data
  61   |    number      | f_B_A_A_X_mean       | Mean angular body acceleration about the x-axis based on frequency-domain data
  62   |    number      | f_B_A_A_Y_mean       | Mean angular body acceleration about the y-axis based on frequency-domain data
  63   |    number      | f_B_A_A_Z_mean       | Mean angular body acceleration about the z-axis based on frequency-domain data
  64   |    number      | f_B_A_A_X_stdev      | Standard deviation of angular body acceleration about the x-axis based on frequency-domain data
  65   |    number      | f_B_A_A_Y_stdev      | Standard deviation of angular body acceleration about the y-axis based on frequency-domain data
  66   |    number      | f_B_A_A_Z_stdev      | Standard deviation of angular body acceleration about the z-axis based on frequency-domain data
  67   |    number      | f_B_A_A_X_mean_freq  | Mean frequency of angular body acceleration about the x-axis based on frequency-domain data
  68   |    number      | f_B_A_A_Y_mean_freq  | Mean frequency of angular body acceleration about the y-axis based on frequency-domain data
  69   |    number      | f_B_A_A_Z_mean_freq  | Mean frequency of angular body acceleration about the z-axis based on frequency-domain data
  70   |    number      | f_B_L_A_M_mean       | Magnitude of mean linear body acceleration based on frequency-domain data
  71   |    number      | f_B_L_A_M_stdev      | Standard deviation of mean linear body acceleration based on frequency-domain data
  72   |    number      | f_B_L_A_M_mean_freq  | Magnitude of mean frequency of linear body acceleration based on frequency-domain data
  73   |    number      | f_BB_L_J_M_mean      | Magnitude of mean linear body body jerk based on frequency-domain data
  74   |    number      | f_BB_L_J_M_stdev     | Magnitude of standard deviation of linear body body jerk based on frequency-domain data
  75   |    number      | f_BB_L_A_M_mean_freq | Magnitude of mean frequency of linear body body acceleration based on frequency-domain data
  76   |    number      | f_BB_A_A_M_mean      | Magnitude of mean angular body body acceleration based on frequency-domain data
  77   |    number      | f_BB_A_A_M_stdev     | Magnitude of standard deviation of angular body body acceleration based on frequency-domain data
  78   |    number      | f_BB_A_A_M_mean_freq | Magnitude of mean frequency of angular body body acceleration based on frequency-domain data
  79   |    number      | f_BB_A_J_M_mean      | Magnitude of mean angular body body jerk based on frequency-domain data
  80   |    number      | f_BB_A_J_M_stdev     | Magnitude of standard deviation of angular body body jerk based on frequency-domain data
  81   |    number      | f_BB_A_J_M_mean_freq | Magnitude of mean frequency of angular body body jerk based on frequency-domain data
  82   |    number      | a_B_L_A_U_mean       | Mean of linear body acceleration based on angular data
  83   |    number      | a_B_L_J_U_mean       | Mean of linear body jerk based on angular data
  84   |    number      | a_B_A_A_U_mean       | Mean of angular body acceleration based on angular data
  85   |    number      | a_B_A_J_U_mean       | Mean of angular body jerk based on angular data
  86   |    number      | a_U_U_U_X_mean       | Mean motion along x-axis based on angular data
  87   |    number      | a_U_U_U_Y_mean       | Mean motion along y-axis based on angular data
  88   |    number      | a_U_U_U_Z_mean       | Mean motion along z-axis based on angular data
  