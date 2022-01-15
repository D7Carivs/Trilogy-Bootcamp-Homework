#Step 1:

cd /03-student
mkdir Lucky_Duck_Investigations
cd Lucky_Duck_Investigations
mkdir Roulette_Loss_Investigation
cd Roulette_Loss_Investigation
mkdir Player_Analysis
mkdir Dealer_Analysis
mkdir Player_Dealer_Correlation
cd Player_Analyst
touch Notes_Player_Analyst
cd ../
cd Dealer_Analyst
touch Notes_Dealer_Analyst
cd ../
cd Player_Dealer_Correlation
touch Notes_Player_Dealer_Correlation



#Step 2:

cd /03-student/Lucky_Duck_Investigations/Roulette_Loss_Investigation/Player_Analysis/Roulette_Player_WinLoss_0310

mv 0310_win_loss_player_data 0312_win_loss_player_data 0315_win_loss_player_data /03-student/Lucky_Duck_Investigations/Roulette_Loss_Investigation/Player_Analysis

cd /03-student/Lucky_Duck_Investigations/Roulette_Loss_Investigation/Dealer_Analysis

mv 0310_Dealer_schedule 0312_Dealer_schedule 0315_Dealer_schedule /03-student/Lucky_Duck_Investigations/Roulette_Loss_Investigation/Dealer_Anal



#Step 3:

##Player Analysis

cd ../
cd Player_Analysis

grep '-' 0310_win_loss_player_data > Roulette_Losses
grep '-' 0312_win_loss_player_data >> Roulette_Losses
grep '-' 0315_win_loss_player_data >> Roulette_Losses

4: In analyzing the data for Player_Analysis it was determined the losses occured on March 10,12,15 at 5am, 8am, 2 pm, 8pm, and 11pm. 
Their was one common player Mylie Schmidt, which they were there 13 times > Notes_Player_Aanalysis

##Dealer Analysis

cd:/
cd /03-student/Lucky_Duck_Investigations/Roulette_Loss_Investigation/Dealer_Analysis

nano Notes_Dealer_Analysis.txt

#Notes_Dealer_Analysis.txt

#!/bin/bash

grep '05:00:00 AM\|08:00:00 AM\|02:00:00 PM\|08:00:00 PM\|11:00:00 PM' 0310_Dealer_schedule | awk '{ print $5, $6 }' > Dealers_working_during_losses_0310.txt

#!/bin/bash

grep '05:00:00 AM\|08:00:00 AM\|02:00:00 PM\|08:00:00 PM\|11:00:00 PM' 0312_Dealer_schedule | awk '{ print $5, $6 }' > Dealers_working_during_losses_0312.txt 

#!/bin/bash

grep '05:00:00 AM\|08:00:00 AM\|02:00:00 PM\|08:00:00 PM\|11:00:00 PM' 0315_Dealer_schedule | awk '{ print $5, $6 }' > Dealers_working_during_losses_0315.txt 

cat After analyzing the Dealer_working_during_losses data, It was determined Billy Jones was working 20 times when the Major losses occured. > Notes_Dealer_Analysis

cd ../
ls
cd Player_Dealer_Correlation

cat It was determined during the analysis that Dealer Billy Jones was colluding with Mylie Schmidt to scam Lucky Duck.
Both parties were the only ones to be present during every one of the major losses at 5am, 8am, 2pm, 8pm and 11pm on March 10, 12, and 15. > Notes_Player_Dealer_Correlation

##Scripting Tasks

cd ../
ls
cd Dealer_Analysis
nano roulette_dealer_finder_by_time.sh
#!/bin/bash

# this script is used to find the roulette dealer by a specific time
# argument 1 enter in  full time "hh:mm:ss am or pm"
# second argument enter 4 digit date "0312_Dealer_schedule"


grep '05:00:00 AM' 0310_Dealer_schedule | awk '{ print $5, $6 }'

control x 
y enter
enter 
sh roulette_dealer_finder_by_time.sh

##Bonus

nano roulette_dealer_finder_by_time_and_game.sh

#!/bin/bash

# this script is used to find the roulette dealer by a specific time
# argument 1 enter in  full time "hh:mm:ss am or pm"
# second argument enter 4 digit date "0312_Dealer_schedule"
# the output (print3,4,5,6,7,8) columns are black jack, roulette, Texas holdem


grep '05:00:00 AM' 0310_Dealer_schedule | awk '{ print $3, $4, $5, $6, $7, $8 }'

control x 
y enter
enter
sh roulette_dealer_finder_by_time_and_game.sh


























