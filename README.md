# nameless-wrapper
Shell wrapper for the nameless entropy fraud detection API

### Install instructions for Mac OS X 

There are no depdencies on a mac install. 

1) create folder 'nameless'

2) navigate to the folder 

3) download nameless.zip (in the folder)

4) unzip the package (in the folder) 

5) run setup.sh (from command line) or setup.sh... (from finder) 

This will set everything up and you can use nameless by opening a new shell window. 

### How to use 

You can do three different things with the nameless-wrapper: 

##### 1) get the result for a single referrer

    nameless domain.com

The output will look like this: 

 n a m e l e s s
 
 Average Entropy (n=4) : 90.7
 
 Monthly Inventory (1000s) : 6470745
 
 Revenue Potential ($) : 1941223.5
 
 Buy Rating : good

##### 2) get the result for many refererrers 

    nameless list 

NOTE: When you are using the list option, nameless-wrapper looks for a file 'nameless.txt' with a list of domains in it. 

The list output looks like this: 

  skyboard-onvasortir.com 	 86 	 386013000 	 115803  moderate
  prime-site-1.com 	 90 	 896442000 	 268932 	 good
  mobilefoodblog.com 	 65 	 242646000 	 72793 	 critical
  tallgreendesign.com 	 65 	 242646000 	 72793 	 critical
  
  ##### 3) save output to a file 
  
      nameless list > file.txt
