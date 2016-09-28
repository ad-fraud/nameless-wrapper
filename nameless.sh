#!/bin/bash
	if [ $1 == "list" ]; then
		echo -e " "
		echo -e "DOMAIN \t \t ENTROPY INVENTORY \t REVENUE \t RATING"
		echo -e "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -"
		PROGRAM=$(pwd)
		while read DOMAIN
			do
				rm nameless.bash
				API=(http://163.117.166.185:8000/api/referrer)
				curl -s "$API"/"$DOMAIN"/ | tr ',' '\n' | sed 's/\":/=/' | tr -d '"' | tr -d '{}' | sed 's/^/nameless_/' | tr '[a-z]' '[A-Z]' > nameless.bash
		
				source nameless.bash	
		
				ENTROPY=$(echo -e "scale=0; ($NAMELESS_SCORE_151112 + $NAMELESS_SCORE_151119 + $NAMELESS_SCORE_151126 + $NAMELESS_SCORE_151202) / 4" | bc | cut -d. -f1)
				INVENTORY=$(echo -e "scale=0; ($NAMELESS_TOTAL_151112 + $NAMELESS_TOTAL_151119 + $NAMELESS_TOTAL_151126 + $NAMELESS_TOTAL_151202) / 4 * 100 * 30" | bc | cut -d. -f1)
				REVENUE=$(echo -e "scale=0; ($NAMELESS_TOTAL_151112 + $NAMELESS_TOTAL_151119 + $NAMELESS_TOTAL_151126 + $NAMELESS_TOTAL_151202) / 4 * 100 * 30 / 1000 * 0.2 * 1.5" | bc | cut -d. -f1)
			
				if [ $ENTROPY -ge 90 ]; then
					RATING=good
				elif [ $ENTROPY -ge 80 ]; then
					RATING=moderate
				elif [ $ENTROPY -ge 70 ]; then
					RATING=poor
				elif [ $ENTROPY -le 70 ]; then
					RATING=critical
				fi
				
				if [ -z $ENTROPY ]; then
					echo -e "$DOMAIN -- NO INFO AVAILABLE"
				else
					echo -e "$DOMAIN \t $ENTROPY \t $INVENTORY \t $REVENUE \t $RATING"
				fi

			done <"$PROGRAM"/nameless.txt
			echo -e " "

		elif [ -z $1 ]; then
				echo -e "USAGE: ./nameless.sh domain.com" 
			else
				DOMAIN=$1
				API=(http://163.117.166.185:8000/api/referrer)

				curl -s "$API"/"$DOMAIN"/ | tr ',' '\n' | sed 's/\":/=/' | tr -d '"' | tr -d '{}' | sed 's/^/nameless_/' | tr '[a-z]' '[A-Z]' > nameless.bash

				source nameless.bash
				
				echo -e " "
				echo -e " n a m e l e s s"
				echo -e " "
				echo -e "scale=1; ($NAMELESS_SCORE_151112 + $NAMELESS_SCORE_151119 + $NAMELESS_SCORE_151126 + $NAMELESS_SCORE_151202) / 4" | bc | sed 's/^/\ Average\ Entropy\ (n=4)\ :\ /'
				echo -e "scale=0; ($NAMELESS_TOTAL_151112 + $NAMELESS_TOTAL_151119 + $NAMELESS_TOTAL_151126 + $NAMELESS_TOTAL_151202) / 4 * 100 * 30 / 1000" | bc | sed 's/^/\ Monthly\ Inventory\ (1000s)\ :\ /'
				echo -e "scale=0; ($NAMELESS_TOTAL_151112 + $NAMELESS_TOTAL_151119 + $NAMELESS_TOTAL_151126 + $NAMELESS_TOTAL_151202) / 4 * 100 * 30 / 1000 * 0.2 * 1.5" | bc | sed 's/^/\ Revenue\ Potential\ ($)\ :\ /'
				echo -e " "

				ENTROPY=$(echo -e "scale=1; ($NAMELESS_SCORE_151112 + $NAMELESS_SCORE_151119 + $NAMELESS_SCORE_151126 + $NAMELESS_SCORE_151202) / 4" | bc | cut -d. -f1)
				INVENTORY=$(echo -e "scale=0; ($NAMELESS_TOTAL_151112 + $NAMELESS_TOTAL_151119 + $NAMELESS_TOTAL_151126 + $NAMELESS_TOTAL_151202) / 4 * 100 * 30 / 1000" | bc | cut -d. -f1)
				REVENUE=$(echo -e "scale=0; ($NAMELESS_TOTAL_151112 + $NAMELESS_TOTAL_151119 + $NAMELESS_TOTAL_151126 + $NAMELESS_TOTAL_151202) / 4 * 100 * 30 / 1000 * 0.2 * 1.5" | bc | cut -d. -f1)


				if [ $ENTROPY -ge 90 ]; then
					RATING=good
				elif [ $ENTROPY -ge 80 ]; then
					RATING=moderate
				elif [ $ENTROPY -ge 70 ]; then
					RATING=poor
				elif [ $ENTROPY -le 70 ]; then
					RATING=critical
				fi

				echo $RATING | sed 's/^/\ Buy\ Rating\ :\ /'
				echo -e " "

			fi

			rm nameless.bash
